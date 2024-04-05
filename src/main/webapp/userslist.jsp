<%--
  Created by IntelliJ IDEA.
  User: michalw_cl
  Date: 04.04.2024
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type='text/javascript'>
    function handleDelete(id) {
        // Perform actions for delete operation here
        console.log("Delete button clicked for user with ID:", id);

        // Example: You can make an AJAX call to delete the user

        fetch("/user/delete?id=" + id)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Assuming the servlet returns JSON data
            })
            .then(data => {
                // Process the data received from the servlet
                console.log(data);
                console.log(data.email);

                // Write values to modal
                document.getElementById('exampleModalLabel').innerText = "Delete User " + data.username + " from db?";
                document.querySelector('.modal-body').innerHTML =
                    "<table class='table'>" +
                    "<tbody>" +
                    "<tr>" +
                    "<td>ID</td>" +
                    "<td>" + data.id + "</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>Nazwa użytkownika</td>" +
                    "<td>" + data.username + "</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>Email</td>" +
                    "<td>" + data.email + "</td>" +
                    "</tr>" +
                    "</tbody>" +
                    "</table>";

                // Show the modal
                $('#exampleModal').modal('show');
                deleteChosenUser(id);
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });

    }

    function deleteChosenUser(id){
        // Attach event listener to the delete button
        document.getElementById('deleteButton').addEventListener('click', function() {
            // Make a fetch request to delete the user
            fetch("/user/delete?id=" + id, {
                method: 'POST'
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    // Handle successful response here
                    console.log('User deleted successfully');
                    location.reload();
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        });

    }
</script>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" hidden="hidden">
    Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger"  id="deleteButton" data-dismiss="modal">
                    <i class="fas fa-trash-alt"></i> Delete
                </button>
                <button type="button" class="btn btn-success" data-dismiss="modal">
                    <i class="fas fa-check"></i> Keep
                </button>
            </div>

        </div>
    </div>
</div>

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

                        <c:if test="${not empty users}">
                            <c:forEach items="${users}" var="singleUser">
                            <tr>
                                <td class="sorting_1">${singleUser.id}</td>
                                <td>${singleUser.userName}</td>
                                <td>${singleUser.email}</td>
                                <td>
                                    <a href="/user/show?id=${singleUser.id}" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
                                            class="fas fa-search fa-sm text-white-50"></i></a>
                                    <a href="/user/edit?id=${singleUser.id}" class="d-none d-sm-inline-block btn btn-sm btn-warning shadow-sm" id="${singleUser.id}"><i
                                            class="fas fa-edit fa-sm text-white-50"></i></a>
                                    <a  onclick="handleDelete(${singleUser.id})" id="delete_${singleUser.id}" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm"><i
                                            class="fas fa-trash-alt fa-sm text-white-50"></i></a>
                                </td>

                            </tr>
                            </c:forEach>
                        </c:if>

                            </tbody>
                        </table>

</div>
</div>

