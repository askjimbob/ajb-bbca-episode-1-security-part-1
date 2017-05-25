<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>AJB - BBCA - Security Part One</title>
   
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
 
<body>

	<cfscript>

		rc = {
			userId = createGuid(),
			format = 'pdf',
			startDate = dateFormat( dateAdd( 'd', -30, now() ), 'mm-dd-yyyy' ),
			endDate = dateFormat( now(), 'mm-dd-yyyy' )
		}

	</cfscript>

	<div id="wrapper" class="container-fluid">

		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">AJB - BBCA - Security Part One</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">
				<a href="basic_example.cfm" class="btn btn-primary btn-block" target="_blank">Basic Example</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<a href="guid_example.cfm" class="btn btn-primary btn-block" target="_blank">GUID Example</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<a href="obfuscation_example.cfm" class="btn btn-primary btn-block" target="_blank">Obfuscation Example</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<a href="encryption_example.cfm" class="btn btn-primary btn-block" target="_blank">Encryption Example</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<a href="combined_example.cfm" class="btn btn-primary btn-block" target="_blank">Combined Example</a>
			</div>
		</div>

	</div>
	<!--- /#wrapper --->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>