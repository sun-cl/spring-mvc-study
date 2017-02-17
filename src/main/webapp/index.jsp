<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我不是真正的慕课网</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css"
	type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>

</head>
<script>
jQuery(function($){
	var urlStr = "<%=request.getContextPath()%>/courses/<%=request.getParameter("courseId")%>";
	//alert("Before Call:"+urlStr);
	$.ajax({
		//XHR 发送请求，OPEN(method,url,async)方法，async请求是同步还是异步，默认异步（true）
		method: "GET",
		url: urlStr,
		success:function(data,status,jqXHR){
			//XHR即XMLHttpRequest对象，ajax实现的 基础
			//alert("Success1:"+data);
			var course = data;
			var path = "<%=request.getContextPath()%>/";	
			$(".course-title").html(course.title);
			$(".course_video").attr("src", path+course.imgPath);
			$("#learningNum").text(course.learningNum);
			$("#duration").text(course.duration);
			$("#levelDesc").text(course.levelDesc);
			$(".course_shortdecription").html(course.descr);
			
			var chapterList = course.chapterList;
			var chapter;
			
			for(var i = 0;i<chapterList.length;i++){
				chapter = chapterList[i];	
				
				var liObj = $("li",$("#chapterTemplate")).clone();				 
				$(".outline_name", liObj).text(chapter.title);
				$(".outline_descr", liObj).text(chapter.descr);				
				liObj.appendTo("#couList");				
			}// ~ end for			
		}
	}); // end ajax
	
	var urlStr2 = "<%=request.getContextPath()%>/courses/teacher/123";
	
	$.ajax({
		method: "GET",
		url: urlStr2,
		success:function(data,status,jqXHR){
			//alert("success:"+data);
			var teacher = data;
			$(".teacher_shortdecription").html(teacher.experience);
			
			
		}
		
		
	});// end ajax
	
	
});
</script>
<body>


	<div id="main">

		<div class="newcontainer" id="course_intro">
			<div class="course-title"></div>
			<div class="course_info">
				<div class="course-embed l">
					<div id="js-course-img" class="img-wrap">
						<img width="600" height="340" alt=""
							class="course_video" />
					</div>
					<div id="js-video-wrap" class="video" style="display: none">
						<div class="video_box" id="js-video"></div>
					</div>
				</div>
				<div class="course_state">
					<ul>
						<li><span>学习人数</span> <em id="learningNum"></em></li>
						<li class="course_hour"><span>课程时长</span> <em
							class="ft-adjust"><span id="duration"></span>秒</em></li>
						<li><span>课程难度</span> <em id="levelDesc"></em></li>
					</ul>
				</div>

			</div>
			<div class="course_list">
				<div class="outline">
					<h3 class="chapter_introduces">课程介绍</h3>
					<div class="course_shortdecription"></div>

					<h3 class="chapter_catalog">课程提纲</h3>
					<ul id="couList">
						
					</ul>
					
					<h3 class="teacher_introduces">教师信息</h3>
					<div class="teacher_shortdecription"></div>
				</div>

			</div>
		</div>

	</div>

    <div id="chapterTemplate"  style="display:none">
       <li class="clearfix open"><a href="#">
				<div class="openicon"></div>
				<div class="outline_list l">
						<h5 class="outline_name"></h5>
						<p class="outline_descr"></p>
				</div>
		 </a></li>
    </div>

</body>
</html>