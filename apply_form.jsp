<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- jquery UI CDN -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- 언어 별 CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>
    <!-- Date 라이브러리 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

    <!-- fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital@0;1&display=swap" rel="stylesheet">

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
	

    <!--calendar-->
    <link href='./style/fullcalendar.min.css' rel='stylesheet' />
    <link href='./style/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <link href='./style/popup.css' rel='stylesheet' />
    <link href='./style/form-popup.css' rel='stylesheet' />
    <link href='./style/mini-calendar.css' rel='stylesheet' />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.2/handlebars.min.js"></script>
    <script src='./js/lib/jquery.min.js'></script>
    <!-- Latest compiled and minified CSS -->
    <link href='./style/bootstrap.min.css' rel='stylesheet'>
    <!-- Optional theme -->
   <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> --> 

    <!--calendar-->
    <script type="text/javascript" src="./js/init.js"></script>
    <script type="text/javascript" src="./js/lib/util.js"></script>
    <script type="text/javascript" src="./js/view/schedule/schedule-display.js"></script>
    <script type="text/javascript" src="./js/view/calendar/calendar.js"></script>
    <script type="text/javascript" src="./js/view/calendar/button.js"></script>
    <script type="text/javascript" src="./js/view/calendar/mini-calendar.js"></script>
    <!--calendar-->


    <script src="./src/my_index.js"></script>

    <script type="text/javascript">
    $(document).ready(function() {
      $('#contact_form').bootstrapValidator({
          // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
          feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
              first_name: {
                  validators: {
                          stringLength: {
                          min: 2,
                      },
                          notEmpty: {
                          message: 'Please enter your First Name'
                      }
                  }
              },
               last_name: {
                  validators: {
                       stringLength: {
                          min: 2,
                      },
                      notEmpty: {
                          message: 'Please enter your Last Name'
                      }
                  }
              },
         user_name: {
                  validators: {
                       stringLength: {
                          min: 8,
                      },
                      notEmpty: {
                          message: 'Please enter your Username'
                      }
                  }
              },
         user_password: {
                  validators: {
                       stringLength: {
                          min: 8,
                      },
                      notEmpty: {
                          message: 'Please enter your Password'
                      }
                  }
              },
        confirm_password: {
                  validators: {
                       stringLength: {
                          min: 8,
                      },
                      notEmpty: {
                          message: 'Please confirm your Password'
                      }
                  }
              },
              email: {
                  validators: {
                      notEmpty: {
                          message: 'Please enter your Email Address'
                      },
                      emailAddress: {
                          message: 'Please enter a valid Email Address'
                      }
                  }
              },
              contact_no: {
                  validators: {
                    stringLength: {
                          min: 12,
                          max: 12,
                      notEmpty: {
                          message: 'Please enter your Contact No.'
                       }
                  }
              },
         department: {
                  validators: {
                      notEmpty: {
                          message: 'Please select your Department/Office'
                      }
                  }
              },
                  }
              }
          })
          .on('success.form.bv', function(e) {
              $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                  $('#contact_form').data('bootstrapValidator').resetForm();

              // Prevent form submission
              e.preventDefault();

              // Get the form instance
              var $form = $(e.target);

              // Get the BootstrapValidator instance
              var bv = $form.data('bootstrapValidator');

              // Use Ajax to submit form data
              $.post($form.attr('action'), $form.serialize(), function(result) {
                  console.log(result);
              }, 'json');
          });
      });

      $(function() {
              //모든 datepicker에 대한 공통 옵션 설정
              $.datepicker.setDefaults({
                  dateFormat: 'yy-mm-dd' //Input Display Format 변경
                  ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                  ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                  ,changeYear: true //콤보박스에서 년 선택 가능
                  ,changeMonth: true //콤보박스에서 월 선택 가능
                  ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                  ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                  ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                  ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
                  ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                  ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                  ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                  ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                  ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                  ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                  ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
              });

              //input을 datepicker로 선언
              $("#datepicker").datepicker();
              $("#datepicker2").datepicker();

              //From의 초기값을 오늘 날짜로 설정
              $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
              //To의 초기값을 내일로 설정
              $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
          });

          

    </script>
    
    <script>

		function goApplyPage() {
		    location.href='apply.jsp?ID='+ID;
		}
    </script>
    
    <style media="screen">
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

      body{
      	padding:0;
      	height:100%;
        font-family: 'Open Sans', sans-serif;
      }
      .fixed-top{
      	padding:50px;
      }
      .ml-auto{
      	padding:150px;
      }
      .nav-item{
      	padding:30px;
      }
      .box{
        margin: 10px;
      }
     
      .column{
        float:left;
        padding:10px;
      }
      .side{
        width:40%;
      }
      .middle{
        width:60%;
        padding:10px; 
      }

      #success_message{ display: none;}

      #calendar {
  			margin: 0 auto 0 14px;
  		}

  		button {
  			border: 0;
  			outline: 0;
  		}

  		#scheduleButton {
  			background:#2caa22;
  			cursor: pointer;
  		}
  		#scheduleButton:hover {
  			background: rgba(44, 186, 34, 0.2);
  		}
  		#scheduleButton:hover .scheduleButton {
  			background: none;
  			color:#2caa22;
  		}
  		.fc-day-number {
  			color: #7c8a95;
  		}
  		.fc-sun, .fc-sun a {
  			color: #BA392F;
  		}
  		.fc-sun a:hover {
  			color: #7F2720;
  			text-decoration: none;
  		}
  		.fc-sat, .fc-sat a {
  			color: #4354BA;
  		}
  		.fc-sat a:hover {
  			color: #2E3A7F;
  			text-decoration: none;
  		}
  		.fc-widget-content {
  			cursor:context-menu;
  		}
  		.inputStyle{
  			background-color: LightGray;
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
	
	function goThisPage() {
	    location.href='new_index.jsp?ID='+new_ID;
	}
	
	function goMyPage() {
	    location.href='mypage.jsp?ID='+new_ID;
	}
	
	function goManagerPage() {
	    location.href='manager_page.jsp?ID='+new_ID;
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
      <a class="navbar-brand" href='javascript:goThisPage()'><strong>HGU Dorm Overnight Management - COVID19</strong></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
   
          <li class="nav-item">
            <a class="nav-link" href='javascript:goMyPage()'>MyPage</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='javascript:goManagerPage()'>ManagerPage</a>
          </li>

        </ul>
      </div>
    </div>
  </nav>

<div class="box">
  
  <%
		request.setCharacterEncoding("utf-8");
	
		String ID = request.getParameter("ID");
		String new_RC ="";
		String new_name = "";
		String new_stNum = "";
	
	
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;

		String sql = "select ID,RC, name, st_id from Students where id = ?";
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
  
      <div class="box wrapper">
        <h2>Register Overnight</h2>
        <p>It is time for all citizens to be <b>careful</b> in Corona. If you really feel like you need to stay out, please write down the reasons for your application.</p>
        
        <p>If the manager sees the reason and permits it, it will be approved for the overnight, and if it is not approved, it will not be approved for the overnight.</p>
        <hr/>
        <div class="containers">
          <div class="column side" >

                          		<div class="container form-group schedule">
                          			<form id="forms" action="location.href='javascript:goApplyPage()'" method=post>
                          				<div class="schedule">
                          					<h1 style="display:inline">registration table</h1>
                          				</div>
                          				<hr class="scheduleLine"/>
                          				<div class="schedule">
                          					
                          					<p>Name : <text id='userName'></text> </p>
                          					<p>Student # : <text id='stNum'></text> </p>
                          					<p>RC : <text id='RC' name='RC'></text> </p>
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
                          				
                          				<hr/>
                          				<div class="schedule">
                          					<div class="inline schedule">
                          						<label>FROM</label>
                          						<!-- submit button 클릭후 전단되는 value 형식 YYYY-MM-DDTHH:MM -->
			                                      <input type="date" name="datepicker" class="timeInput" id="datepicker">
			                                
                          					</div>
                          				</div>
                          				<div class="schedule">
                          					<div class="schedule">
                          						<label>Locate:</label>
                          						<input id="place" type="text" class="form-control textInput" placeholder="position input">
                          					</div>
                          					<label>Reason:</label>
                          					<textarea id="desc" name="reason" class="form-control textInput" rows="5" placeholder="Explain the reason for the overnight"></textarea>
                          				</div>
                          				<div class="schedule">
                          					<button id="submit" type="submit" class="fc-button fc-state-default">Register</button>
                          					<button id="cancel" type="button" class="fc-button fc-state-default">Cancel</button>
                          				</div>
                          			</form>
                              </div>
                              
          </div>

          <div class="column middle">
                <!--Calendar-->
                <div id="calendar" class="fc fc-unthemed fc-ltr">
                  <div class="fc-toolbar fc-header-toolbar">
                    <div class="fc-left">
                      <div class="fc-button-group">
                        <button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left"><span class="fc-icon fc-icon-left-single-arrow"></span></button>
                        <button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right"><span class="fc-icon fc-icon-right-single-arrow"></span></button>
                      </div>
                      <button type="button" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right">today</button>
                    </div>
                    <div class="fc-center">
                      <h2></h2></div>
                    <div class="fc-clear"></div>
                  </div>
                  <div class="fc-view-container">
                    <div class="fc-view fc-month-view fc-basic-view">
                      <table>
                        <thead class="fc-head">
                          <tr>
                            <td class="fc-head-container fc-widget-header">
                              <div class="fc-row fc-widget-header">
                                <table>
                                  <thead>
                                    <tr>
                                      <th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th>
                                      <th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th>
                                      <th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th>
                                      <th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th>
                                      <th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th>
                                      <th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th>
                                      <th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th>
                                    </tr>
                                  </thead>
                                </table>
                              </div>
                            </td>
                          </tr>
                        </thead>
                        <tbody class="fc-body">
                          <tr>
                            <td class="fc-widget-content">
                              <div class="fc-scroller fc-day-grid-container" style="overflow: hidden; height: 200px;">
                                <div class="fc-day-grid fc-unselectable">
                                  <div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
                                    <div class="fc-bg">
                                      <table>
                                        <tbody>
                                          <tr>
                                            <td class="fc-day fc-widget-content fc-sun"></td>
                                            <td class="fc-day fc-widget-content fc-mon"></td>
                                            <td class="fc-day fc-widget-content fc-tue"></td>
                                            <td class="fc-day fc-widget-content fc-wed"></td>
                                            <td class="fc-day fc-widget-content fc-thu"></td>
                                            <td class="fc-day fc-widget-content fc-fri"></td>
                                            <td class="fc-day fc-widget-content fc-sat"></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                    <div class="fc-content-skeleton">
                                      <table>
                                        <thead>
                                          <tr>
                                            <td class="fc-day-top fc-sun">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-mon">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-tue">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-wed">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-thu">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-fri">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-sat">
                                              <a class="fc-day-number"></a>
                                            </td>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
                                    <div class="fc-bg">
                                      <table>
                                        <tbody>
                                          <tr>
                                            <td class="fc-day fc-widget-content fc-sun"></td>
                                            <td class="fc-day fc-widget-content fc-mon"></td>
                                            <td class="fc-day fc-widget-content fc-tue"></td>
                                            <td class="fc-day fc-widget-content fc-wed"></td>
                                            <td class="fc-day fc-widget-content fc-thu"></td>
                                            <td class="fc-day fc-widget-content fc-fri"></td>
                                            <td class="fc-day fc-widget-content fc-sat"></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                    <div class="fc-content-skeleton">
                                      <table>
                                        <thead>
                                          <tr>
                                            <td class="fc-day-top fc-sun">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-mon">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-tue">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-wed">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-thu">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-fri">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-sat">
                                              <a class="fc-day-number"></a>
                                            </td>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
                                    <div class="fc-bg">
                                      <table>
                                        <tbody>
                                          <tr>
                                            <td class="fc-day fc-widget-content fc-sun"></td>
                                            <td class="fc-day fc-widget-content fc-mon"></td>
                                            <td class="fc-day fc-widget-content fc-tue"></td>
                                            <td class="fc-day fc-widget-content fc-wed"></td>
                                            <td class="fc-day fc-widget-content fc-thu"></td>
                                            <td class="fc-day fc-widget-content fc-fri"></td>
                                            <td class="fc-day fc-widget-content fc-sat"></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                    <div class="fc-content-skeleton">
                                      <table>
                                        <thead>
                                          <tr>
                                            <td class="fc-day-top fc-sun">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-mon">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-tue">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-wed">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-thu">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-fri">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-sat">
                                              <a class="fc-day-number"></a>
                                            </td>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
                                    <div class="fc-bg">
                                      <table>
                                        <tbody>
                                          <tr>
                                            <td class="fc-day fc-widget-content fc-sun"></td>
                                            <td class="fc-day fc-widget-content fc-mon"></td>
                                            <td class="fc-day fc-widget-content fc-tue"></td>
                                            <td class="fc-day fc-widget-content fc-wed"></td>
                                            <td class="fc-day fc-widget-content fc-thu"></td>
                                            <td class="fc-day fc-widget-content fc-fri"></td>
                                            <td class="fc-day fc-widget-content fc-sat"></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                    <div class="fc-content-skeleton">
                                      <table>
                                        <thead>
                                          <tr>
                                            <td class="fc-day-top fc-sun">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-mon">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-tue">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-wed">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-thu">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-fri">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-sat">
                                              <a class="fc-day-number"></a>
                                            </td>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
                                    <div class="fc-bg">
                                      <table>
                                        <tbody>
                                          <tr>
                                            <td class="fc-day fc-widget-content fc-sun"></td>
                                            <td class="fc-day fc-widget-content fc-mon"></td>
                                            <td class="fc-day fc-widget-content fc-tue"></td>
                                            <td class="fc-day fc-widget-content fc-wed"></td>
                                            <td class="fc-day fc-widget-content fc-thu"></td>
                                            <td class="fc-day fc-widget-content fc-fri"></td>
                                            <td class="fc-day fc-widget-content fc-sat"></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                    <div class="fc-content-skeleton">
                                      <table>
                                        <thead>
                                          <tr>
                                            <td class="fc-day-top fc-sun">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-mon">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-tue">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-wed">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-thu">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-fri">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-sat">
                                              <a class="fc-day-number"></a>
                                            </td>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 112px;">
                                    <div class="fc-bg">
                                      <table>
                                        <tbody>
                                          <tr>
                                            <td class="fc-day fc-widget-content fc-sun"></td>
                                            <td class="fc-day fc-widget-content fc-mon"></td>
                                            <td class="fc-day fc-widget-content fc-tue"></td>
                                            <td class="fc-day fc-widget-content fc-wed"></td>
                                            <td class="fc-day fc-widget-content fc-thu"></td>
                                            <td class="fc-day fc-widget-content fc-fri"></td>
                                            <td class="fc-day fc-widget-content fc-sat"></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                    <div class="fc-content-skeleton">
                                      <table>
                                        <thead>
                                          <tr>
                                            <td class="fc-day-top fc-sun">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-mon">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-tue">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-wed">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-thu">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-fri">
                                              <a class="fc-day-number"></a>
                                            </td>
                                            <td class="fc-day-top fc-sat">
                                              <a class="fc-day-number"></a>
                                            </td>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
          </div>

        </div><!-- /.container -->
      </div>
    </div>


    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="/__/firebase/7.14.4/firebase-app.js"></script>

    <!-- TODO: Add SDKs for Firebase products that you want to use
        https://firebase.google.com/docs/web/setup#available-libraries -->
    <script src="/__/firebase/7.14.4/firebase-analytics.js"></script>

    <!-- Initialize Firebase -->
    <script src="/__/firebase/init.js"></script>

</body>
</html>