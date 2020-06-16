<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HGU Dorm Overnight Stay Management - COVID19</title>

  <!-- fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital@0;1&display=swap" rel="stylesheet">

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

<script>
	function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var sval = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == sname) { sval = temp[1]; }
	    }
	    return sval;
	
	}
	new_ID = getParam('ID');
	
	function goNewIndexPage() {
	    location.href='new_index.jsp?ID='+new_ID;
	}
	
	function goMyPage() {
	    location.href='mypage.jsp?ID='+new_ID;
	}
	
	function goManagerPage() {
	    location.href='mngSignIn.jsp?ID='+new_ID;
	}
	
	function goApplyPage() {
	    location.href='apply_form.jsp?ID='+new_ID;
	}
	
	function goRegisterPage() {
	    location.href='registerLocation.jsp?ID='+new_ID;
	}
</script>

<body>
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg fixed-top" style="background-color: rgb(245,240,245); height: 4.5rem;">
    <div class="container">
      <a class="navbar-brand" href='javascript:goNewIndexPage()'><strong>HGU Dorm Overnight Management - COVID19</strong></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="#LogOutModal" data-toggle="modal" data-target="#LogOutModal">LogOut</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='javascript:goMyPage()'>MyPage</a>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link" href='javascript:goManagerPage()'>ManagerPage</a>
          </li> -->

        </ul>
      </div>
    </div>
  </nav>
  
  <%
		request.setCharacterEncoding("utf-8");
	
		String ID = request.getParameter("ID");
		String new_RC ="";
		String new_name = "";
		String new_stNum = "";
	
	
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;

		String sql = "select RC, name, st_id from Students where id = ?";
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://54.180.159.220/SE";

			conn = DriverManager.getConnection(url, "hgu", "handong0");
			System.out.println("연결 성공");

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			rs.next();
			new_RC = rs.getString("RC");
			new_name = rs.getString("name");
			new_stNum = rs.getString("st_id");
			
			try {
		if (rs != null) {
			rs.close();
		}
			} catch (Exception e) {
		e.printStackTrace();
			}
			try {
		if (pstmt != null) {
			pstmt.close();
		}
			} catch (Exception e) {
		e.printStackTrace();
			}
			try {
		if (conn != null) {
			conn.close();
		}
			} catch (Exception e) {
		e.printStackTrace();
			}


		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		} finally {
			try {
		if (conn != null && !conn.isClosed()) {
			conn.close();
		}
			} catch (SQLException e) {
		e.printStackTrace();
			}
		}
  %>


  <!-- Features Section -->
  <div class="row">
    <div class="col-lg-6" style="margin-top:3rem; padding:2.5rem">
      <div class="row">
        <div class="col-lg-5" style="margin-left:3rem">
          <h2>Welcome,<br> <text id='userName'>User Name</text>&nbsp:)</h2>
        </div>
        <div class="col-lg-6">
          <ul>
            <li>
            	<p>Student Number : <text id='stNum'></text></p>
            </li>
            <li>
              	<p>RC : <text id='RC'></text> </p>
            </li>

          </ul>
        </div>
      </div>
      <br>
      <ul>
        <ul>
          <li>
            <p>Apply for an overnight stay</p>
          </li>
          <button onclick="location.href='javascript:goApplyPage()'" type="button" class="btn btn-default"
            style="margin-left:0.8rem" href="apply.jsp"><img src="img/apply.jpg" width="95rem" height="95rem"> <span
              class="glyphicon glyphicon-share-alt"></span></button>
        </ul>
        <br><br>
        <ul>
          <li>
            <p>Register for your location</p>
          </li>
          <button onclick="location.href='javascript:goRegisterPage()'" type="button" class="btn btn-default"><img
              src="img/location.png" width="90rem" height="90rem"> <span
              class="glyphicon glyphicon-share-alt"></span></button>
        </ul>

      </ul>
    </div>
    <div class="col-lg-6" style="margin-top:3rem; padding:2.5rem">
      <div>
        <h2 class="text-center">COVID19 Status - Pohang</h2>
        <br>
        <em>
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
      </div><!-- 포항시 End -->
    </div>
  </div>
  <!-- /.row -->

  <hr>


  <!-- The Modal -->
  <div class="modal" id="LogOutModal" name="LogOutModal">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
      <div class="modal-content" style="margin-top: 5rem">

        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title ">Log out <button type="button" class="close" data-dismiss="modal"
              style="height: 5rem; margin-left: 18rem; position: fixed;">x</button></h1>


        </div>

        <!-- Modal body -->
        <div class="modal-body">

          <a class="text-left" style="color: gray; font-size: 1.3rem">
            Are you sure to log out?
          </a>

        </div>

        <!-- Modal footer -->
        <div class="modal-footer text-center">
          <button type="button" onclick="location.href='index.jsp'" class="btn btn-primary"
            data-dismiss="modal">Sure</button>
        </div>

      </div>
    </div>
  </div>
  
  <script>
  	var RC = "<%=new_RC%>";
  	var userName = "<%=new_name%>";
  	var stNum = "<%=new_stNum%>";
  	
  	$(function() {
    	$("#RC").text(RC);
    	$("#userName").text(userName);
    	$("#stNum").text(stNum);
  	});
  </script>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 2020 <br>Software Engineering Team 2</p>
    </div>

    <!-- /.container -->
  </footer>

  <script>
    $(document).ready(function () {
      refreshPage();
    });

    function refreshPage() {

      $.ajax({
        url: "https://atec114.pohang.go.kr/COVID-19/covid-19.php",
        type: 'POST',
        dataType: "json",
        success: function (data) {
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
            var tempStr = ", " + hour + ":" + ('0' + min).slice(-2) + tempStr;

            var update_str = "Data last updated : " + year + ". " + month + ". " + day + tempStr;
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

    $(document).ready(function () {
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
      var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);


      var result = results === null ? "G" : decodeURIComponent(results[1].replace(/\+/g, " "));

      return result;
    }

  </script>
  

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>