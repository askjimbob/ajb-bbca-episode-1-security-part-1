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
							writeOutput( '<li>#key# = #URL[ key ]#</li>');
						}
						writeOutput( '</ol>' );
					}
					if( FORM.keyArray().len() ) {
						writeOutput( '<h4>FORM</h4><ol>' );
						for( key in FORM.keyArray() ) {
							writeOutput( '<li>#key# = #FORM[ key ]#</li>');
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