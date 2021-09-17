<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
<div class="d-flex justify-content-between" style="background: ${session.branch.branchColor}">
	<div>${session.branch.branchName} ${session.pokemon.permission } ${session.pokemon.pokemonName}님 환영합니다.</div>
	<div class="picture"></div>
</div>
</header>