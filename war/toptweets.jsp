<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query.Filter"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterPredicate"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Twitter FB App</title>
<h1 align="center">Facebook Tweet Application</h1>
<br>
</head>
<body>
<br> </br>
   <nav>
   	<ul>
   		<li><a href="tweets.jsp">Tweets</a></li>
   		<li><a href="tweetfriends.jsp">Friends</a></li>
   		<li><a href="toptweets.jsp">Top Tweets</a></li>
   	</ul>
   	</nav>
   	</br>
   	<h2 align="Top Tweets"></h2>
   	<%
    	DatastoreService ds=DatastoreServiceFactory.getDatastoreService();
	    Query q= new Query("Twitter").addSort("visit_counter",Query.SortDirection.DESCENDING);
	    List<Entity> tweets = ds.prepare(q).asList(FetchOptions.Builder.withLimit(5));
   	%>
   	<div style="height: 200px; overflow: auto">
   		 <table align="center" id="tblid">
   		 <tbody>
   		 <tr>
   		 <th style="font-size:16px">
   		 Tweets
   		 </th>
   		 <th style="font-size:16px">
   		 UserName
   		 </th>
   		 <th>
   		 No of Views
   		 </th>
   		 <br> </br>
   		 </tr>
   		 <%
   		 	for(Entity twitter: tweets)
   		 	{
   		 %>
   		 	<tr>
   		 	<td>
   		 	<%=twitter.getProperty("TweetMessage") %>
   		 	</td>
   		 	<td>
   		 	<%= twitter.getProperty("Username") %>
   		 	</td>
   		 	<td>
   		 	<%= twitter.getProperty("visit_counter") %>
   		 	</td>
   		 <% 
   		 	}
   		 %>
   		 	
   		 
   	
</body>
</html>