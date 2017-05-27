<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Encryption Example</title>
   
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.min.css" rel="stylesheet">

</head>
 
<body>

	<cfscript>

		// mock the input from the request context in an MVC 
		// framework (FW/1, ColdBox, etc.)
		rc = {
			userId = '3820F9C3-7422-4CB5-B83A-D42E7DF10E2D',
			format = 'pdf',
			startDate = dateFormat( dateAdd( 'd', -30, now() ), 'mm-dd-yyyy' ),
			endDate = dateFormat( now(), 'mm-dd-yyyy' )
		}

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

		// mock encrypting the request context values 
		// this is usually done inside the handler/controller 
		// and passed to the view for rendering of encryped values
		encValues = {
			url = {
				userId = encrypt( rc.userId, keyrings.url.key, keyrings.url.alg, keyrings.url.enc ),
				format = encrypt( rc.format, keyrings.url.key, keyrings.url.alg, keyrings.url.enc ),
				startDate = encrypt( rc.startDate, keyrings.url.key, keyrings.url.alg, keyrings.url.enc ),
				endDate = encrypt( rc.endDate, keyrings.url.key, keyrings.url.alg, keyrings.url.enc )
			},
			form = {
				userId = encrypt( rc.userId, keyrings.form.key, keyrings.form.alg, keyrings.form.enc ),
			}
		}

	</cfscript>

	<cfoutput>
		<div id="wrapper" class="container-fluid">

			<div class="row">
				<div class="col-md-12">
					<h1 class="page-header">Encryption Example</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">&nbsp;</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<h3>Query String Format URL Example</h3>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<a href="result.cfm?userId=#encValues.url.userId#" class="btn btn-primary btn-block">View Profile</a>
				</div>
				<div class="col-md-3">
					<a href="result.cfm?userId=#encValues.url.userId#" class="btn btn-primary btn-block">Edit Profile</a>
				</div>
				<div class="col-md-6">
					<a href="result.cfm?userId=#encValues.url.userId#&amp;format=#encValues.url.format#&amp;startDate=#encValues.url.startDate#&amp;endDate=#encValues.url.endDate#" class="btn btn-primary btn-block">Threads (last 30 days)</a>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">&nbsp;</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<h3>Path Format URL Example</h3>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<a href="result.cfm/userId/#encValues.url.userId#" class="btn btn-primary btn-block">View Profile</a>
				</div>
				<div class="col-md-3">
					<a href="result.cfm/userId/#encValues.url.userId#" class="btn btn-primary btn-block">Edit Profile</a>
				</div>
				<div class="col-md-6">
					<a href="result.cfm/userId/#encValues.url.userId#/format/#encValues.url.format#/startDate/#encValues.url.startDate#/endDate/#encValues.url.endDate#" class="btn btn-primary btn-block">Threads (last 30 days)</a>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">&nbsp;</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<h3>FORM Example</h3>
				</div>
			</div>

			<form action="result.cfm" method="POST">
				<div class="row">
					<div class="col-md-12">
						<input type="hidden" name="userId" value="#encValues.form.userId#">

						<div class="form-group">
							<label for="format">
								Output Format
							</label>
							<select name="format" class="form-control" id="format" required>
								<option value="">Select Format</option>
								<option value="pdf">PDF</option>
								<option value="html">HTML</option>
								<option value="xml">XML</option>
								<option value="json">JSON</option>
							</select>
							<div class="help-block with-errors">Select an output format.</div>
						</div>
						<div class="form-group">
							<label for="startDate">
								Start Date
							</label>
							<input type="text" name="startDate" class="form-control datepicker" id="startDate" value="#dateFormat( dateAdd( 'd', -30, now() ), 'mm-dd-yyyy' )#">
							<div class="help-block with-errors">Choose or enter the start date in mm-dd-yyyy format.</div>
						</div>
						<div class="form-group">
							<label for="endDate">
								End Date
							</label>
							<input type="text" name="endDate" class="form-control datepicker" id="endDate" value="#dateFormat( now(), 'mm-dd-yyyy' )#">
							<div class="help-block with-errors">Choose or enter the end date in mm-dd-yyyy format.</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<input type="submit" name="btnSubmit" value="Get Threads" class="btn btn-success btn-lg">
					</div>
				</div>
			</form>

		</div>
		<!--- /#wrapper --->
	</cfoutput>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
	<script>
		$(document).ready( function() {
			$('.datepicker').datepicker({
				format: 'mm-dd-yyyy',
				autoclose: true
			});
		});
	</script>

</body>

</html>