<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY 클론 프로젝트 </title>
</head>
<body>
    <div id="header">
        <tiles:insertAttribute name="header" />
    </div>
    
    <div id="container" style="display: flex;">
        <div id="menu" style="width: 200px;">
            <tiles:insertAttribute name="menu" />
        </div>
        <div id="body">
            <tiles:insertAttribute name="body" />
        </div>
    </div>
    
    <div id="footer">
        <tiles:insertAttribute name="footer" />
    </div>
</body>
</html>