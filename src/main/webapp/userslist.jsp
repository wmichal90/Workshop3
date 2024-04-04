<%--
  Created by IntelliJ IDEA.
  User: michalw_cl
  Date: 04.04.2024
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Lista użytkowników</h6>
    </div>
    <div class="card-body">


                        <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0"
                               role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                            <thead>
                            <tr role="row">
                                <th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1"
                                    colspan="1" aria-sort="ascending"
                                    aria-label="Name: activate to sort column descending" style="width: 134.734px;">ID
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                                    aria-label="Position: activate to sort column ascending" style="width: 225.125px;">
                                    Nazwa użytkownika
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                                    aria-label="Office: activate to sort column ascending" style="width: 94.0938px;">
                                    Email
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1"
                                    aria-label="Age: activate to sort column ascending" style="width: 38.3281px;">Akcja
                                </th>

                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th rowspan="1" colspan="1">ID</th>
                                <th rowspan="1" colspan="1">Nazwa użytkownika</th>
                                <th rowspan="1" colspan="1">Email</th>
                                <th rowspan="1" colspan="1">Akcja</th>

                            </tr>
                            </tfoot>
                            <tbody>


                            <c:forEach items="${users}" var="singleUser">
                            <tr>
                                <td class="sorting_1">${singleUser.id}</td>
                                <td>${singleUser.userName}</td>
                                <td>${singleUser.email}</td>
                                <td>
                                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
                                            class="fas fa-search fa-sm text-white-50"></i></a>
                                    <a href="/user/edit?id=${singleUser.id}" class="d-none d-sm-inline-block btn btn-sm btn-warning shadow-sm" id="${singleUser.id}"><i
                                            class="fas fa-edit fa-sm text-white-50"></i></a>
                                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm"><i
                                            class="fas fa-trash-alt fa-sm text-white-50"></i></a>
                                </td>

                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>

</div>
</div>