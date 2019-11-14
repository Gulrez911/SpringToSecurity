<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css"> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<!-- <script type="text/javascript" src="./resources/js/sweetalert.js"></script> -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
<!-- <link href="./resources/js/sweetalert.css" rel="stylesheet" /> -->
<link href="./resources/js/sweet.css" rel="stylesheet" />
</head>
<style> 
  body { 
	background-color: aliceblue;
	font-family: Times New Roman", Georgia, serif;
	text-align: center;
}
p,button,h2 {
  font-family: "Times New Roman", Times, serif;
}
/* 
 button { 
 	background-color: cadetblue; 
 	color: whitesmoke; 
 	border: 0; 
 	-webkit-box-shadow: none; 
 	box-shadow: none; 
 	font-size: 18px; 
 	font-weight: 500; 
 	border-radius: 7px; 
 	padding: 15px 35px; 
 	cursor: pointer; 
 	white-space: nowrap; 
 	margin: 10px; 
 } 

img {
	width: 200px;
}

input[type="text"] {
	padding: 12px 20px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-sizing: border-box;
}

h1 {
	border-bottom: solid 2px grey;
}

#success {
	background: green;
}

#error {
	background: red;
}

#warning {
	background: coral;
}

#info {
	background: cornflowerblue;
}

#question {
	background: grey;
} */
</style>
<body>
<div class="container">
	<button class="btn btn-primary" id="success">Success</button>
	<button class="btn btn-primary" id="try1">Try Ajax</button>
	<button class="btn btn-primary" id="try2">Custom Position</button>
		<button class="btn btn-primary" id="try3">Corner Position</button>
			<button class="btn btn-primary" id="try4" onclick="call('Hello')">Message</button>
</div>	 
<script type="text/javascript">
$(document).on('click', '#success', function(e) {
	swal({
		  title: "Sweet!",
		  text: "Here's a custom image.",
		  imageUrl: 'https://lipis.github.io/bootstrap-sweetalert/assets/thumbs-up.jpg'
		});
			
});

$(document).on('click','#try1',function(e){
	swal({
		  title: "Are you sure?",
		  text: "You will not be able to recover this imaginary file!",
		  type: "warning",
		  html: 'You can use <b>bold text</b>, ' +
			    '<a href="//sweetalert2.github.io">links</a> ' +
			    'and other HTML tags',
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "Yes, delete it!",
		  cancelButtonText: "No, cancel plx!",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm) {
		  if (isConfirm) {
		    swal("Deleted!", "Your imaginary file has been deleted.", "success");
		  } else {
		    swal("Cancelled", "Your imaginary file is safe :)", "error");
		  }
		});
});

$(document).on('click','#try2',function(e){
	swal({
// 		  position: 'top-end',
// 		  type: 'success',
// 		  title: 'Your work has been saved',
// 		  showConfirmButton: false,
// 		  timer: 1500
		 	title: "Some Title",
		 	 html: "<a href='#' style='color:blue;font-style: italic;'>Some Html</a>",
		    width: '800px'
		})
});

$(document).on('click','#try3',function(e){
	swal({
			position: 'top-end',
			  type: 'success',
		  title: 'Your work has been saved',
		  showConfirmButton: false,
		  timer: 1500
		})
});

function call(val){
// 	alert(val)
	swal({
	  position: 'top-end',
	  type: 'success',
	  title: val,
	  showConfirmButton: false,
	  timer: 1500
	})
}

</script>
</body>
</html>
