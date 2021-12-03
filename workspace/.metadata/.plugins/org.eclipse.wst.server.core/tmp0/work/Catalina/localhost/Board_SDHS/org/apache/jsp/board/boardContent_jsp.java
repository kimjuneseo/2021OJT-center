/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.54
 * Generated at: 2021-12-03 06:54:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import review.ReviewDataBean;
import review.ReviewDBBean;
import java.util.List;
import java.text.SimpleDateFormat;
import board.BoardDataBean;
import board.BoardDBBean;

public final class boardContent_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("review.ReviewDataBean");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("review.ReviewDBBean");
    _jspx_imports_classes.add("board.BoardDataBean");
    _jspx_imports_classes.add("board.BoardDBBean");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>글 상세보기 페이지</title>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("@import\r\n");
      out.write("	url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap')\r\n");
      out.write("	;\r\n");
      out.write("\r\n");
      out.write(":root { \r\n");
      out.write("		--line_color: #2c3e7e; \r\n");
      out.write("		--back_color: #f2f4fb;\r\n");
      out.write("		\r\n");
      out.write("		/* z-index  */\r\n");
      out.write("		--on_index: 100;\r\n");
      out.write("		--under_index:10;\r\n");
      out.write("}\r\n");
      out.write("/*전체영역*/\r\n");
      out.write("* {\r\n");
      out.write("	box-sizing: border-box;\r\n");
      out.write("	margin: 0;\r\n");
      out.write("	padding: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a {\r\n");
      out.write("	text-decoration: none;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	transition: .3s\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a:hover {\r\n");
      out.write("	color: #99424f;\r\n");
      out.write("	transition: .3s\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("h2 {\r\n");
      out.write("	text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("input {\r\n");
      out.write("	width: 100%;\r\n");
      out.write("	height: 100%;\r\n");
      out.write("	border: hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn {\r\n");
      out.write("	padding: 10px;\r\n");
      out.write("	background: var(--line_color);\r\n");
      out.write("	border: none;\r\n");
      out.write("	font-family: 'Noto Sans KR', sans-serif;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	cursor: pinter;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn:hover {\r\n");
      out.write("	background: #585555;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	transition: .5s\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".grid {\r\n");
      out.write("	display: grid;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".flex {\r\n");
      out.write("	display: flex;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#container {\r\n");
      out.write("	width: 1500px;\r\n");
      out.write("	margin: 20px auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".form {\r\n");
      out.write("	border-top: 3px solid var(--line_color);\r\n");
      out.write("	border-bottom: 3px solid var(--line_color);	\r\n");
      out.write("	\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(".form>.small {\r\n");
      out.write("	height: 50px; \r\n");
      out.write("	border : 1px solid #999;\r\n");
      out.write("	border-right: hidden;\r\n");
      out.write("	border-left: hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(".content {\r\n");
      out.write("	grid-template-columns: 15% 85%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".content div:nth-of-type(7), .content div:nth-of-type(8) {\r\n");
      out.write("	border-bottom: 3px solid #000;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".content_grid {\r\n");
      out.write("	grid-template-columns: 15% 43.5% 15% 43.5%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".form .grid>div {\r\n");
      out.write("	background: var(--back_color);\r\n");
      out.write("	align-items: center;\r\n");
      out.write("	margin-right: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".form p{\r\n");
      out.write("	line-height: 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".form h2 {\r\n");
      out.write("	color: var(--line_color);\r\n");
      out.write("	font-size: 1.4rem\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".m_item {\r\n");
      out.write("	padding-bottom: 20px;\r\n");
      out.write("	justify-content: right;\r\n");
      out.write("}\r\n");
      out.write("/* 제목 */\r\n");
      out.write("#m_title {\r\n");
      out.write("	margin-bottom: 10px;\r\n");
      out.write("	font-size: 3em;\r\n");
      out.write("	text-align: center;\r\n");
      out.write("	font-family: 'Permanent Marker', cursive;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#s_title {\r\n");
      out.write("	margin-bottom: 40px;\r\n");
      out.write("	font-size: 1.75em;\r\n");
      out.write("	font-weight: 900;\r\n");
      out.write("	font-family: 'Noto Sans KR', sans-serif;\r\n");
      out.write("	text-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".content__text {\r\n");
      out.write("	font-family: 'Noto Sans KR', sans-serif;\r\n");
      out.write("	font-size: 1rem;\r\n");
      out.write("	color: #000;\r\n");
      out.write("	font-weight: 600;\r\n");
      out.write("	text-decoration: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".d_login {\r\n");
      out.write("	grid-template-columns: 80px 80px;\r\n");
      out.write("	justify-content: right;\r\n");
      out.write("	text-align: right;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".big__board {\r\n");
      out.write("	position: fixed;\r\n");
      out.write("	top: 10px;\r\n");
      out.write("	left: 1%\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".big__board>div {\r\n");
      out.write("	border-top: 2px solid var(--line_color);\r\n");
      out.write("	padding: 10px\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".read_count {\r\n");
      out.write("	grid-template-columns: 15% 85%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".board__content {\r\n");
      out.write("	color: #666;\r\n");
      out.write("	width: 250px;\r\n");
      out.write("	text-overflow: ellipsis;\r\n");
      out.write("	overflow: hidden;\r\n");
      out.write("	white-space: nowrap;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".right {\r\n");
      out.write("	width: 75%;\r\n");
      out.write("	margin: 0 auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".right>.btns {\r\n");
      out.write("	padding-top: 10px;\r\n");
      out.write("	padding-bottom: 10px;\r\n");
      out.write("	justify-content: flex-end;\r\n");
      out.write("	gap: 20px;\r\n");
      out.write("	border-bottom: 4px solid var(--line_color);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".content___ {\r\n");
      out.write("	height: 400px;\r\n");
      out.write("	padding: 20px\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".content___>textarea{ max-width:100%; max-height:100%; width: 100%; height: 100%; border: none;}\r\n");
      out.write("\r\n");
      out.write("/* 댓글 작성  */\r\n");
      out.write(".reviewForm {padding: 10px 0px; }\r\n");
      out.write(".reviewForm__reviewitems{grid-template-columns:90% 10%; align-items: center;}\r\n");
      out.write(".reviewForm textarea{max-width:100%; max-height: 100px; height: 100px; border: none;}\r\n");
      out.write("\r\n");
      out.write("/* 댓글 리스트 */\r\n");
      out.write(".review__item {width: 100%; position:relative; z-index: var(--under_index); border-top:3px solid var(--line_color)}\r\n");
      out.write("\r\n");
      out.write(".review__item>div{border: 1px solid #666; border-left: hidden;border-right: hidden; border-bottom: hidden;}\r\n");
      out.write(".review__subtitle{background: var(--back_color); text-align: center;}\r\n");
      out.write("\r\n");
      out.write(".review__num { height:50px; grid-template-columns: 15% 85%; }\r\n");
      out.write(".review__num div{width:100%; height:100%; line-height: 40px}\r\n");
      out.write(".review__writer{ height:50px;grid-template-columns: 15% 42.4% 15% 25.5%}\r\n");
      out.write(".review__content{height: 100px; padding: 10px; border: none;}\r\n");
      out.write("\r\n");
      out.write(".review__btns {position: absolute; top: 10px; right: 0; z-index: var(--on_index); gap:10px}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("window.onload = function() {\r\n");
      out.write("	let board_form = document.boardForm;\r\n");
      out.write("	let update_btn = document.querySelector(\"#btn_update\");\r\n");
      out.write("	let delete_btn = document.querySelector(\"#btn_delete\");\r\n");
      out.write("	let insert_btn = document.querySelector(\"#btn_insert\");\r\n");
      out.write("	if(update_btn){\r\n");
      out.write("	update_btn.addEventListener(\"click\", () => {\r\n");
      out.write("		if(!board_form.subject.value) {\r\n");
      out.write("			alert(\"제목 입력해주세요.\");\r\n");
      out.write("			board_form.subject.focus();\r\n");
      out.write("			return;\r\n");
      out.write("		};\r\n");
      out.write("		if(!board_form.content.value) {\r\n");
      out.write("			alert(\"내용 입력해주세요.\");\r\n");
      out.write("			board_form.content.focus();\r\n");
      out.write("			return;\r\n");
      out.write("		};\r\n");
      out.write("		board_form.action = \"boardUpdatePro.jsp\";\r\n");
      out.write("		board_form.submit(); \r\n");
      out.write("	});\r\n");
      out.write("	\r\n");
      out.write("	delete_btn.addEventListener(\"click\", () => {\r\n");
      out.write("		board_form.action = \"boardDeletePro.jsp\";\r\n");
      out.write("		board_form.submit();\r\n");
      out.write("	});\r\n");
      out.write("	}\r\n");
      out.write("	let review_form = document.reviewForm;\r\n");
      out.write("	let reviewdelete_btn = document.querySelectorAll(\".review__btn--delete\");\r\n");
      out.write("	let review_update_btn = document.querySelectorAll(\".review__btn--update\");\r\n");
      out.write("	\r\n");
      out.write("	reviewdelete_btn.forEach(e => {\r\n");
      out.write("		e.addEventListener(\"click\", ({target}) => {\r\n");
      out.write("			form = target.closest(\"form\");\r\n");
      out.write("			console.log(form);\r\n");
      out.write("			form.action = '../review/ReviewDeletePro.jsp'\r\n");
      out.write("			form.submit();\r\n");
      out.write("		})\r\n");
      out.write("	})\r\n");
      out.write("	\r\n");
      out.write("	review_update_btn.forEach(e => {\r\n");
      out.write("		e.addEventListener(\"click\", ({target}) => {\r\n");
      out.write("			form = target.closest(\"form\");\r\n");
      out.write("			console.log(form);\r\n");
      out.write("			form.action = '../review/ReviewUpdatePro.jsp'\r\n");
      out.write("			form.submit();\r\n");
      out.write("		})\r\n");
      out.write("	})\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("};\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("	");

		BoardDBBean boardPro = BoardDBBean.getInstance();
	List<BoardDataBean> boardList = boardPro.getBoardList();

	int cnt = boardList.size();
	String id = (String) session.getAttribute("memberId");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	int num = Integer.parseInt(request.getParameter("num"));
	boardPro.readCountOnePlus(num);
	BoardDataBean board = boardPro.getBoard(num);
	
	ReviewDBBean reviewPro = ReviewDBBean.getInstance();
	List<ReviewDataBean> reviewList = reviewPro.getReview(num);
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<div id=\"container\">\r\n");
      out.write("		<div id=\"m_title\">Street Woman Fighter</div>\r\n");
      out.write("		<div id=\"s_title\">글 상세보기</div>\r\n");
      out.write("		<div class=\"m_item grid\">\r\n");
      out.write("			<div class=\"d_login grid\">\r\n");
      out.write("				<div id=\"d_id\">\r\n");
      out.write("					<a href=\"../member/memberInfoform.jsp\">");
      out.print(id);
      out.write("님</a>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div id=\"btn_logout\">\r\n");
      out.write("					<a href=\"../member/memberLogout.jsp\">로그아웃</a>\r\n");
      out.write("				</div>\r\n");
      out.write("				<button class=\"btn\">\r\n");
      out.write("					<a href=\"boardList.jsp\">전체 게시판</a>\r\n");
      out.write("				</button>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<div class=\"right\">\r\n");
      out.write("			<form action=\"boardUpdatePro.jsp\" method=\"post\" name=\"boardForm\">\r\n");
      out.write("				<div class=\"form\">\r\n");
      out.write("					<div class=\"grid content small\">\r\n");
      out.write("						<div class=\"grid\">\r\n");
      out.write("							<h2>제목</h2>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div>\r\n");
      out.write("							<input type=\"text\" name=\"subject\"\r\n");
      out.write("								value=\"");
      out.print(board.getSubject());
      out.write("\">\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"content_grid grid small\">\r\n");
      out.write("						<div class=\"grid\">\r\n");
      out.write("							<h2>등록일자</h2>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div>\r\n");
      out.write("							<input type=\"text\" value=\"");
      out.print(sdf.format(board.getRegdate()));
      out.write("\">\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"grid\">\r\n");
      out.write("							<h2>작성자</h2>\r\n");
      out.write("						</div>\r\n");
      out.write("						<p>");
      out.print(board.getWriter());
      out.write("</p>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"content___\">\r\n");
      out.write("						<textarea name=\"content\">");
      out.print(board.getContent());
      out.write("</textarea>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"read_count grid small\">\r\n");
      out.write("						<div class=\"grid\">\r\n");
      out.write("							<h2>조회수</h2>\r\n");
      out.write("						</div>\r\n");
      out.write("						<p>");
      out.print(board.getReadcount());
      out.write("</p>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				<input type=\"hidden\" name=\"num\" value=\"");
      out.print(board.getNum());
      out.write("\">\r\n");
      out.write("			</form>\r\n");
      out.write("			<div class=\"btns flex\">\r\n");
      out.write("				<button class=\"btn\" id=\"btn_insert\">\r\n");
      out.write("					<a href=\"boardInsertForm.jsp\">글쓰기</a>\r\n");
      out.write("				</button>\r\n");
      out.write("				");
 if(id.equals(board.getWriter())){ 
      out.write("\r\n");
      out.write("				<button class=\"btn\" id=\"btn_update\">글수정</button>\r\n");
      out.write("				<button class=\"btn\" id=\"btn_delete\">글삭제</button>\r\n");
      out.write("				");
} 
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("			<form class=\"reviewForm\" method=\"post\" action=\"../review/reviewInsertPro.jsp\">\r\n");
      out.write("				<div class=\"reviewForm__reviewitems grid\">\r\n");
      out.write("					<textarea rows=\"\" cols=\"\" name=\"content\"></textarea>\r\n");
      out.write("					<button class=\"btn\" id=\"btn_insert\" type=\"submit\">댓글작성</button>\r\n");
      out.write("				</div>\r\n");
      out.write("				<input type=\"hidden\" name=\"writer\" value=\"");
      out.print(id );
      out.write("\">\r\n");
      out.write("				<input type=\"hidden\" name=\"ref\" value=\"");
      out.print(num );
      out.write("\">\r\n");
      out.write("			</form>\r\n");
      out.write("			<div class=\"reviews\">\r\n");
      out.write("				");
 for(ReviewDataBean reviews : reviewList){
      out.write("\r\n");
      out.write("				<div class=\"review__item grid\">\r\n");
      out.write("					<div class=\"review__num grid\">\r\n");
      out.write("						<div class=\"review__subtitle\">댓글 번호</div>\r\n");
      out.write("						<div>");
      out.print(reviews.getRenum() );
      out.write("</div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"review__writer grid\">\r\n");
      out.write("						<div class=\"review__subtitle\">작성자</div>\r\n");
      out.write("						<div>");
      out.print(reviews.getWriter() );
      out.write("</div>\r\n");
      out.write("						<div class=\"review__subtitle\">작성일자</div>\r\n");
      out.write("						<div>");
      out.print(reviews.getRegdate() );
      out.write("</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				");
 if(id.equals(reviews.getWriter())){ 
      out.write("\r\n");
      out.write("				<form action=\"../review/ReviewDeletePro.jsp\" method=\"post\"  name=\"reviewForm\">\r\n");
      out.write("					<input name=\"content\" class=\"review__content grid\" value=\"");
      out.print(reviews.getContent() );
      out.write("\">\r\n");
      out.write("					\r\n");
      out.write("					<input type=\"hidden\" value=\"");
      out.print(reviews.getRenum() );
      out.write("\"  name=\"renum\">\r\n");
      out.write("					<input type=\"hidden\" value=\"");
      out.print(reviews.getRef() );
      out.write("\"  name=\"ref\">\r\n");
      out.write("				<div class=\"review__btns flex\">\r\n");
      out.write("					<input class=\"btn review__btn--delete\" value=\"삭제\" type=\"button\">\r\n");
      out.write("					<input class=\"btn review__btn--update\" value=\"수정\" type=\"button\">\r\n");
      out.write("				</div>\r\n");
      out.write("				</form>\r\n");
      out.write("				");
}else{
      out.write("\r\n");
      out.write("				<div class=\"review__content grid\">\r\n");
      out.write("						<div>");
      out.print(reviews.getContent() );
      out.write("</div> \r\n");
      out.write("				</div>\r\n");
      out.write("				");
} 
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("				");
}
      out.write("\r\n");
      out.write("				\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("			<div class=\"big__board\">\r\n");
      out.write("			");

				for (BoardDataBean boards : boardList) {
			
      out.write("\r\n");
      out.write("			<div>\r\n");
      out.write("				<div class=\"big__item grid \">\r\n");
      out.write("					<div>\r\n");
      out.write("						<a class=\"content__text\"\r\n");
      out.write("							href=\"boardContent.jsp?num=");
      out.print(boards.getNum());
      out.write('"');
      out.write('>');
      out.print(boards.getSubject());
      out.write("</a>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				<p class=\"board__content\">");
      out.print(boards.getContent());
      out.write("</p>\r\n");
      out.write("				<div class=\"flex\">\r\n");
      out.write("					<div>\r\n");
      out.write("						작성자:\r\n");
      out.write("						");
      out.print(boards.getWriter());
      out.write("</div>\r\n");
      out.write("					&ensp;\r\n");
      out.write("					<div>\r\n");
      out.write("						조회수:\r\n");
      out.write("						");
      out.print(boards.getReadcount());
      out.write("</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			");

				}
			
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
