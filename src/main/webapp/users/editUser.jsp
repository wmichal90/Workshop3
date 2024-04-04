<%--
  Created by IntelliJ IDEA.
  User: michalw_cl
  Date: 04.04.2024
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<%@ include file="/header.jsp" %>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
        <a href="/user/list" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-user-alt fa-sm text-white-50"></i> Lista użytkowników</a>
    </div>

    <!-- Content Row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Edycja użytkownika</h6>
                </div>
                <div class="card-body">
                    <form method="POST" action="/user/edit">
                        <div class="form-group">
                            <label for="id">ID</label>
                            <input type="text" class="form-control" id="id" aria-describedby="identyfikator" name="id" value="${user.id}" readonly>
                            <small id="identyfikator" class="form-text text-muted">Identyfikator uzytkownika</small>
                        </div>
                        <div class="form-group">
                            <label for="emailEdit">Email address</label>
                            <input type="email" class="form-control" id="emailEdit" aria-describedby="emailEditHelp" name="email" placeholder="${user.email}">
                            <small id="emailEditHelp" class="form-text text-muted">Edytuj maila uzytkownika</small>
                        </div>
                        <div class="form-group">
                            <label for="emailPasswordEdit">Password</label>
                            <input type="password" class="form-control" id="emailPasswordEdit" name="password" aria-describedby="emailPasswordEditHelp">
                            <small id="emailPasswordEditHelp" class="form-text text-muted">Zmień hasło użytkownika</small>
                        </div>
                        <div class="form-group">
                            <label for="userNameEdit">Nazwa użytkownika</label>
                            <input type="text" class="form-control" id="userNameEdit" aria-describedby="userNameEditHelp" name="username" placeholder="${user.userName}">
                            <small id="userNameEditHelp" class="form-text text-muted">Zmień nazwę użytkownika</small>
                        </div>

                        <button type="submit" class="btn btn-warning">Edytuj</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
