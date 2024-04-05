<%--
  Created by IntelliJ IDEA.
  User: michalw_cl
  Date: 05.04.2024
  Time: 16:00
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
                    <h6 class="m-0 font-weight-bold text-primary">Wyświetl uzytkownika</h6>
                </div>
                <div class="card-body">

                    <table class="table table-hover">

                        <tbody>
                        <tr>

                            <td>ID</td>
                            <td>${user.id}</td>
                        </tr>
                        <tr>

                            <td>Nazwa użytkownika</td>
                            <td>${user.userName}</td>
                        </tr>
                        <tr>

                            <td>Email</td>
                            <td>${user.email}</td>
                        </tr>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</html>
