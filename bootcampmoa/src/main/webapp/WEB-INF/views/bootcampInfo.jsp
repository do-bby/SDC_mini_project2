<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.ReviewVO,vo.MemberVO,vo.BootcampVO,java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>부트모아 - 부트캠프 리뷰 리스트</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/bootcampmoa/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/bootcampmoa/resources/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid d-none d-lg-block">
        <div class="row align-items-center py-4 px-xl-5">
            <div class="col-lg-3">
                <a href="/bootcampmoa/bootmoaMain" class="text-decoration-none">
                    <h1 class="m-0"><span class="text-primary">B</span>ootMoA</h1>
                </a>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-map-marker-alt text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Our Office</h6>
                        <small>서울특별시 서초구 효령로 335</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-envelope text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Email Us</h6>
                        <small>bootmoa@gmail.com</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-phone text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Call Us</h6>
                        <small>+012 345 6789</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 67px; padding: 0 30px;">
                    <h5 class="text-primary m-0"><i class="fa fa-book-open mr-2"></i>Subjects</h5>
                    <i class="fa fa-angle-down text-primary"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 9;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Web Design <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="" class="dropdown-item">HTML</a>
                                <a href="" class="dropdown-item">CSS</a>
                                <a href="" class="dropdown-item">jQuery</a>
                            </div>
                        </div>
                        <a href="" class="nav-item nav-link">Apps Design</a>
                        <a href="" class="nav-item nav-link">Marketing</a>
                        <a href="" class="nav-item nav-link">Research</a>
                        <a href="" class="nav-item nav-link">SEO</a>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0"><span class="text-primary">B</span>ootMoA</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav py-0">
                            <a href="/bootcampmoa/bootmoaMain" class="nav-item nav-link active">홈</a>
                            <a href="/bootcampmoa/bootcampListAll" class="nav-item nav-link">부트캠프 리스트 </a>
                            <a href="/bootcampmoa/bootcampSearch" class="nav-item nav-link">부트캠프 검색</a>
                            <a href="/bootcampmoa/bootcampInsertRequest" class="nav-item nav-link">등록요청</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">마이페이지</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="blog.html" class="dropdown-item">회원정보 수정</a>
                                    <a href="single.html" class="dropdown-item">etc</a>
                                </div>
                            </div>
                        </div>
                        <a class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block" href="/bootcampmoa/memberLogin">Login Now</a>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Header Start -->
    <div class="container-fluid page-header" style="margin-bottom: 90px;">
        <div class="container">
            <div class="d-flex flex-column justify-content-center" style="min-height: 300px">
                <h3 class="display-4 text-white text-uppercase">${bvo.academy }</h3>
                <div class="d-inline-flex text-white">
                    <p class="m-0 text-uppercase"><a class="text-white" href="/bootcampmoa/bootmoaMain">홈</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">${bvo.program }</p>
                    <a href="/bootcampmoa/bootcamp/review/${bvo.bnum}" class="btn btn-outline-primary m-1">리뷰 등록하기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->

    <!-- Blog Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row pb-3">                        
						<c:if test="${ !empty list }" >
            				<c:forEach var = "rvo" items = "${list}">            						
		            			<div class="col-lg-6 mb-4">
		                            <div class="blog-item position-relative overflow-hidden rounded mb-2">
		                            	<img class="img-fluid" src="/bootcampmoa/resources/images/${bvo.logo}">		          
		                                <a class="blog-overlay text-decoration-none" href="">
		                                <p class="text-primary m-0">장점 : ${rvo.good }</p>
		                                <p class="text-primary m-0">단점 : ${rvo.bad }</p>		                                
		                                <p class="text-primary m-0">총점 : ${rvo.total }</p>
		                                <p class="text-primary m-0">강사진 : ${rvo.teachsat }</p>
		                                <p class="text-primary m-0">교육 환경: ${rvo.edusat }</p>
		                                <p class="text-primary m-0">교육 : ${rvo.learnsat }</p>
		                                <p class="text-primary m-0">작성 날짜 : ${rvo.rdate }</p>		                                
										</a>										
		                            </div>
			                        <a href="/bootcampmoa/review/deletereview?id=${rvo.rnum}" class="btn btn-outline-primary m-1">삭제</a>
			                        <a href="/bootcampmoa/review?id=${rvo.rnum}" class="btn btn-outline-primary m-1">수정</a>
		                            
		                        </div>		                     
							</c:forEach>
            			</c:if>
            	
                        <div class="col-12">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-lg justify-content-center mb-0">
                                  <li class="page-item">
                                    <a class="page-link" href="${rvo.rnum}?curPage=1" aria-label="Start">
                                      <span aria-hidden="true">&laquo;</span>
                                      <span class="sr-only">Start</span>                                     
                                    </a>                                    
                                  </li>
                                  <li class="page-item">
                                     <a class="page-link" href="${rvo.rnum}?curPage=${paging.curPage-1 }" aria-label="prev">
                                      <span aria-hidden="true">&lt;</span>
                                      <span class="sr-only">prev</span>
                                    </a>
                                  </li>
                                  
                                     <c:forEach begin="${paging.firstPage }"  end="${paging.lastPage }" var="i">
                                 <a class="page-link" href="${rvo.rnum}?curPage=${i }"  >  
                                    <c:if test="${i eq paging.curPage }">  <span style="color: red">  ${i } </span> </c:if>
                                    <c:if test="${i ne paging.curPage }">  ${i } </c:if> 
                                 </a>
                           </c:forEach>
                                  <li class="page-item">
                                     <a class="page-link" href="${rvo.rnum}?curPage=${paging.curPage+1 }" aria-label="Next">
                                      <span aria-hidden="true">&gt;</span>
                                      <span class="sr-only">Next</span>
                                    </a>
                                  </li>
                                  
                                  <li class="page-item">
                                    <a class="page-link" href="${rvo.rnum}?curPage=${paging.totalPageCount }" aria-label="End">
                                      <span aria-hidden="true">&raquo;</span>
                                      <span class="sr-only">End</span>
                                    </a>
                                  </li>
                                </ul>
                              </nav>
                   </div>
                        
                    </div>
                </div>
    
                <div class="col-lg-4 mt-5 mt-lg-0">
                    
    
                    <!-- Search Form -->
                    <div class="mb-5">
                        <form action="/bootcampmoa/bootcampSearch">
				        	<div class="input-group">
				            	<input type="text" name="keyword" class="form-control form-control-lg" placeholder="부트캠프 명을 검색하세요 ex)인공지능,백엔드">
				                <button type="submit" class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block">
				              			search
				            	</button>
				           </div>
	     				</form>
                    </div>
    
    
                </div>
            </div>
        </div>
    </div>
    <!-- Blog End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
        <div class="row pt-5">
            <div class="col-lg-7 col-md-12">
                <div class="row">
                    <div class="col-md-6 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                        <div class="d-flex justify-content-start mt-4">
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-light btn-square" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Our Courses</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Web Design</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Apps Design</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Marketing</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Research</a>
                            <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>SEO</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-md-12 mb-5">
                <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Newsletter</h5>
                <p>Rebum labore lorem dolores kasd est, et ipsum amet et at kasd, ipsum sea tempor magna tempor. Accu kasd sed ea duo ipsum. Dolor duo eirmod sea justo no lorem est diam</p>
                <div class="w-100">
                    <div class="input-group">
                        <input type="text" class="form-control border-light" style="padding: 30px;" placeholder="Your Email Address">
                        <div class="input-group-append">
                            <button class="btn btn-primary px-4">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="row">
            <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
                <p class="m-0 text-white">&copy; <a href="#">Domain Name</a>. All Rights Reserved. Designed by <a href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
            <div class="col-lg-6 text-center text-md-right">
                <ul class="nav d-inline-flex">
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Privacy</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Terms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">FAQs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Help</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="/bootcampmoa/resources/lib/easing/easing.min.js"></script>
    <script src="/bootcampmoa/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="/bootcampmoa/resources/mail/jqBootstrapValidation.min.js"></script>
    <script src="/bootcampmoa/resources/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="/bootcampmoa/resources/js/main.js"></script>
</body>

</html>
