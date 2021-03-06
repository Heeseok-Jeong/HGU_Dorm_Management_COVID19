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
					<li class="nav-item">
           				 <a class="nav-link" href="stSignIn.jsp">SignIn</a>
          			</li>
					<li class="nav-item">
						<a class="nav-link" onclick="javascript:alert('Sign in please')" href="index.jsp">MyPage</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="mngSignIn.jsp">ManagerPage</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Features Section -->
	<div class="row">
		<div class="col-lg-6" style="margin-top: 3rem; padding: 2.5rem">
			<h2>Sign in, then you can use the system!</h2>
			<br>
			
					<br>
							<ul>
				<ul>
					<li>
						<p>Apply for an overnight stay</p>
					</li>
					<button onclick="javascript:alert('Sign in please')" type="button"
										class="btn btn-default" style="margin-left: 0.8rem"
										href="apply_form.jsp">
						<img src="img/apply.jpg" width="95rem" height="95rem"> <span
											class="glyphicon glyphicon-share-alt"></span>
					</button>
				</ul>
				<br>
				<br>
				<ul>
					<li>
						<p>Register for your location</p>
					</li>
					<button onclick="javascript:alert('Sign in please')" type="button"
										class="btn btn-default">
						<img src="img/location.png" width="90rem" height="90rem"> <span
											class="glyphicon glyphicon-share-alt"></span>
					</button>
				</ul>
			</ul>
		
						</div>
		<div class="col-lg-6" style="margin-top: 3rem; padding: 2.5rem">
			<div>
				<h2 class="text-center">COVID19 Status - Pohang</h2>
				<br> <em>
					<p id="ph_date"></p>
				</em>
				<div>
					<ul>
						<li>
							<p>Confirmed cases</p>
							<p id="p1" class="case">-</p>
						</li>
						<li>
							<p>Deaths</p>
							<p id="p1_2" class="case">-</p>
						</li>
						<li>
							<p>Completely cured</p>
							<p id="p1_3" class="case">-</p>
						</li>
						<li>
							<p>Inspected</p>
							<p id="p1_4" class="case">-</p>
						</li>
						<li>
							<p>Quarantined</p>
							<p id="p1_5" class="case">-</p>
						</li>
					</ul>
				</div>
			</div>
			<!-- 포항시 End -->
		</div>
	</div>
	<!-- /.row -->

	<hr>



	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">
				Copyright &copy; 2020 <br>Software Engineering Team 2
			</p>
		</div>

		<!-- /.container -->
	</footer>

	<script>
		$(document).ready(function() {
			refreshPage();
		});

		function refreshPage() {

			$.ajax({
				url : "https://atec114.pohang.go.kr/COVID-19/covid-19.php",
				type : 'POST',
				dataType : "json",
				success : function(data) {
					if (data.result != "error") {
						var update_dt_ph = data.result.cv_latest_dt_ph;

						var year = update_dt_ph.substr(0, 4);
						var month = update_dt_ph.substr(5, 2);
						var day = update_dt_ph.substr(8, 2);

						var hour = update_dt_ph.substr(11, 2);
						var tempStr = "";
						if (hour < 12) {
							tempStr = "AM";
						} else {
							tempStr = "PM";
						}
						if (hour != 12) {
							hour = hour % 12;
						}
						var min = update_dt_ph.substr(14, 2);
						var tempStr = ", " + hour + ":" + ('0' + min).slice(-2)
								+ tempStr;

						var update_str = "Data last updated : " + year + ". "
								+ month + ". " + day + tempStr;
						$("#ph_date").text(update_str);

						var p1 = data.result.cv_ph1; //포항 확진자
						var p1_2 = data.result.cv_ph12;
						var p1_3 = data.result.cv_ph8;
						var p1_4 = data.result.cv_ph9;
						var p1_5 = data.result.cv_ph5;

						$("#p1").text(numberWithCommas(p1));
						$("#p1_2").text(numberWithCommas(p1_2));
						$("#p1_3").text(numberWithCommas(p1_3));
						$("#p1_4").text(numberWithCommas(p1_4));
						$("#p1_5").text(numberWithCommas(p1_5));
					}
				}
			});
		}
		function goManagePage() {

			alert("권한이 없습니다.");

		}

		function showBtn() {
			$("a.adm_btn").css("visibility", "visible");
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		$(document).ready(function() {
			var tabNo = fnGetParameterByName("tabNo");
			if (tabNo != null && tabNo != "G" && tabNo != "") {
				goTab(tabNo);
			}
		});

		function goTab(tabNo) {
			var obj = $($("#a" + tabNo).attr("href"));
			$("#gnb ul li").removeClass("active");
			$($("#a" + tabNo)).parent().addClass("active");
			$(".tab_contents").hide();
			obj.show();
		}

		function fnGetParameterByName(name) {

			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);

			var result = results === null ? "G" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));

			return result;
		}
	</script>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>