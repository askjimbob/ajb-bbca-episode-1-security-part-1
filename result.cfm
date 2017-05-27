<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Results</title>
   
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
 
<body>

	<cfscript>

		// mock a set of url and form keys for encryption
		// keyrings are usually stored safely and injected into
		// a handler/controller/model as needed for encryption
		keyrings = {
			url = {
				key = 'Pm4LlhAk2+9fWBrXPGpSSQ==', //generateSecretKey( 'AES' )
				alg = 'AES/CBC/PKCS5Padding',
				enc = 'HEX'
			},
			form = {
				key = 'LpY1uaZDz7Pk/QkLRT6Shg==', //generateSecretKey( 'BLOWFISH' )
				alg = 'BLOWFISH/CBC/PKCS5Padding',
				enc = 'HEX'
			}
		}

		// mock hashing the paramter names 
		// this is usually done inside the handler/controller 
		// and passed to the view for rendering of hashed parameter names
		hashedParams = { 
			url = {
				userIdHash = 'v' & hash( 'userId', 'SHA-256', 'utf-8', 42 ),
				formatHash = 'v' & hash( 'format', 'SHA-256', 'utf-8', 24 ),
				startDateHash = 'v' & hash( 'startDate', 'SHA-256', 'utf-8', 96 ),
				endDateHash = 'v' & hash( 'endDate', 'SHA-256', 'utf-8', 69 )
			},
			form = {
				userIdHash = 'f' & hash( 'userId', 'SHA-384', 'utf-8', 57 ),
			}
		}

		// initialize a struct to hold results of hashed and/or 
		// encrypted parameters
		results = {};

		// loop through the possible hased URL parameters
		for( key in hashedParams.url ) {
			// check if this URL parameter exists in the URL struct
			if( URL.keyExists( hashedParams.url[ key ] ) ) {
				// it does, try to
				try {
					// decrypt the value of the hashed variable
					// and set it in the results struct
					results[ key ] = decrypt( URL[ hashedParams.url[ key ] ], keyrings.url.key, keyrings.url.alg, keyrings.url.enc );
				// catch any errors (e.g. not encrypted)
				} catch( any e ) {
					// set the results struct to the value passed in (non encrypted values)
					results[ key ] = URL[ hashedParams.url[ key ] ];
				}
			}
		}

		// do the same as above, but for FORM variables instead of URL parameters
		for( key in hashedParams.form ) {
			if( FORM.keyExists( hashedParams.form[ key ] ) ) {
				try {
					results[ key ] = decrypt( FORM[ hashedParams.form[ key ] ], keyrings.form.key, keyrings.form.alg, keyrings.form.enc );
				} catch( any e ) {
					results[ key ] = FORM[ hashedParams.form[ key ] ];
				}
			}
		}

	</cfscript>

	<div id="wrapper" class="container-fluid">

		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">Results</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<cfscript>
					if( CGI.PATH_INFO.len() ) {
						writeOutput( '<h4>PATH : #CGI.PATH_INFO#</h4>' );
					} 
					if( CGI.QUERY_STRING.len() ) {
						writeOutput( '<h4>QUERY: #CGI.QUERY_STRING#</h4>' );
					}
					if( URL.keyArray().len() ) {
						writeOutput( '<h4>URL</h4><ol>' );
						for( key in URL.keyArray() ) {
							writeOutput( '<li>#key# = #URL[ key ]#</li>' );
						}
						writeOutput( '</ol>' );
					}
					if( FORM.keyArray().len() ) {
						writeOutput( '<h4>FORM</h4><ol>' );
						for( key in FORM.keyArray() ) {
							writeOutput( '<li>#key# = #FORM[ key ]#</li>' );
						}
						writeOutput( '</ol>' );
					}
					if( results.len() ) {
						writeOutput( '<h4>Results</h4><ol>' );
						for( key in results ) {
							writeOutput( '<li>#key# = #results[ key ]#</li>' );
						}
						writeOutput( '</ol>' );
					}
				</cfscript>
			</div>
		</div>

	</div>
	<!--- /#wrapper --->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>