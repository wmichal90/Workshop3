<%--
  Created by IntelliJ IDEA.
  User: michalw_cl
  Date: 04.04.2024
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: michalw_cl
  Date: 04.04.2024
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<%@ include file="/header.jsp" %>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
        <a href="/users/createUser.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-plus-circle fa-sm text-white-50"></i> Dodaj użytkownika</a>
    </div>

    <!-- Content Row -->
    <div class="row">

        <div class="col-lg-12">
            <%@ include file="/userslist.jsp" %>
        </div>

    </div>

    <!-- Content Row -->

    <div class="row">




    </div>

    <!-- Content Row -->
    <div class="row">




    </div>

</div>
<!-- /.container-fluid -->

<%@ include file="/footer.jsp" %>

</html>
