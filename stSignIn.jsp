<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HGU Dorm Overnight Stay Management - COVID19</title>

<!-- fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital@0;1&display=swap"
	rel="stylesheet">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<style>
p.case {
	font-size: 1.3rem;
	color: rgb(90, 90, 90)
}

body {
	font-family: 'Open Sans', sans-serif;
}

.flex-container {
	width: 100%;
	height: 100vh;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
}
</style>

</head>

<body>
	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg fixed-top"
		style="background-color: rgb(245, 240, 245); height: 4.5rem;">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"><strong>HGU
					Dorm Overnight Management - COVID19</strong></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="stSignIn.jsp">SignIn</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						onclick="javascript:alert('Sign in please')" href="index.jsp">MyPage</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="mngSignIn.jsp">ManagerPage</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Features Section -->
	<div class="flex-container">
		<div>
			<i><h5 class='text-center'>Input your Hisnet ID and Password!</h2></i>
			<h6 class='text-center'>for Students</h2>
			<br>
			<div style='margin:0 auto;'> 
				<form action='checkStSignIn.jsp' method='post'>
					<table>
						<tr>
							<th colspan='2'></th>
						</tr>
						<tr>
							<td>ID</ID>
							<td><input type='text' name='ID' /></td>
						</tr>
						<tr>
							<td>Password</ID>
							<td><input type='password' name='Password' /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="Sign In" /></td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>





		

		<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>