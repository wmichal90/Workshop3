package pl.coderslab.users;

import pl.coderslab.usersdao.User;
import pl.coderslab.usersdao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/user/edit")
public class EditUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> inputs = req.getParameterMap();
        User userToUpdate = new User();
        UserDao userDao = new UserDao();
        int userId = Integer.parseInt(inputs.get("id")[0]);
        userToUpdate.setId(userId);
        User userFromId = userDao.read(userId);


        if (!inputs.get("password")[0].isEmpty()){
            userToUpdate.setPassword(inputs.get("password")[0]);
        } else {
            userToUpdate.setPassword(userFromId.getPassword());
        }

        if (!inputs.get("email")[0].isEmpty()){
            userToUpdate.setEmail(inputs.get("email")[0]);
        } else {
            userToUpdate.setEmail(userFromId.getEmail());
        }

        if (!inputs.get("username")[0].isEmpty()){
            userToUpdate.setUserName(inputs.get("username")[0]);
        } else {
            userToUpdate.setUserName(userFromId.getUserName());
        }

        userDao.update(userToUpdate);
        resp.sendRedirect(req.getContextPath() + "/user/list");
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserDao userDao = new UserDao();

        User userFromId = userDao.read(id);
        if (userFromId != null){
            req.setAttribute("user", userFromId);
            req.getRequestDispatcher("/users/editUser.jsp").forward(req, resp);
        }

    }
}
