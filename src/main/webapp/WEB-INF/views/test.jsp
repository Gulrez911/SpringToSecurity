<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<!-- <title>Upload MultipartFile</title> -->
<title>Index</title>
<meta charset="utf-8" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="./resources/js/postrequest.js"></script>
<script src="./resources/js/getrequest.js"></script>
<!-- <script src="./resources/js/form.js"></script> -->
<style>
</style>
</head>

<body>
	<div class="container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-sm-5">
				<h3>Upload MultipartFile to FileSystem</h3>
				<form method="POST" enctype="multipart/form-data"
					id="fileUploadForm">
					<div class="form-group">
						<label class="control-label">First Name:</label><input type="text"
							name="fname" required="required" id="fname"> <label
							class="control-label">Last Name:</label><input type="text"
							name="lname" id="lname"> <label class="control-label"
							for="uploadfile">Upload File:</label> <input type="file"
							class="form-control" id="uploadfile" placeholder="Upload File"
							name="filename"></input>
					</div>
					<button type="submit" class="btn btn-default" id="btnSubmit">Upload</button>
					<button type="button" class="btn btn-default" id="btnGetFiles">Files</button>
				</form>
				<hr />
				<div id="listFiles"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

	 $("#btnSubmit").click(function(event){
		 event.preventDefault();
		    var form = $('#fileUploadForm')[0];
		    var data = new FormData(form);
		 	console.log(data)
		 	alert(data)
		 	var firstName = $("#fname").val();
		 	console.log(firstName)
		 	if(firstName == '' || firstName == null){
				notify('Info', 'First Name can not be blank');
			}
		 	else{ 
		    $.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: "fileUpload",
		        data: data,
		        processData: false, //prevent jQuery from automatically transforming the data into a query string
		        contentType: false,
		        cache: false,
		        success: (data) => {
		            $("#listFiles").text(data);
		        },
		        error: (e) => {
		            $("#listFiles").text(e.responseText);
		        }
		    });
		 	}
		 });
	</script>
</body>
</html>