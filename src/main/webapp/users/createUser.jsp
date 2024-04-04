<%--
  Created by IntelliJ IDEA.
  User: michalw_cl
  Date: 04.04.2024
  Time: 18:54
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
                <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
            </div>
            <div class="card-body">
                    <form method="POST" action="/user/add">
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" required>
                            <small id="emailHelp" class="form-text text-muted">Podaj adres email dla nowego
                                uzytkownika</small>
                        </div>
                        <div class="form-group">
                            <label for="emailPassword">Password</label>
                            <input type="password" class="form-control" id="emailPassword" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="userName">Nazwa użytkownika</label>
                            <input type="text" class="form-control" id="userName" aria-describedby="userNameHelp" name="username"
                                   required>
                            <small id="userNameHelp" class="form-text text-muted">Podaj nazwę dla nowego
                                użytkownika</small>
                        </div>

                        <button type="submit" class="btn btn-success">Dodaj</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>


<%@ include file="/footer.jsp" %>
<script>
    // Check if 'alert' attribute is set to 'true'
    var showAlert = '<%= request.getAttribute("alert") %>' === 'true';

    // If showAlert is true, show the alert
    if (showAlert) {
        alert("Uzytkownik o podanym emailu juz istnieje. Podaj inny adres email!");
    }
</script>
</html>

