<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %> 

<%	// Controller로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
	Integer[] arr = (Integer[])request.getAttribute("Qno");
	
	// 모든 no 중 0번째 방이 가장 최근에 등록한 값..!!
	int no = arr[0];
%>

<% if(cnt == 0) { %>
		<script>
			alert('등록 실패');
			history.back();	// 브라우저가 직전에 직전 페이지(입력중 페이지로)
		</script>
<% } else { %>
		<script>
			alert('등록 성공');
			location.href = "view.community?no=<%= no %>";
		</script>
<% } %>