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

@WebServlet("/user/add")
public class AddUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> inputs = req.getParameterMap();
        User newUser = new User();
        UserDao userDao = new UserDao();
        newUser.setUserName(inputs.get("username")[0]);
        newUser.setPassword(inputs.get("password")[0]);
        newUser.setEmail(inputs.get("email")[0]);

        User confirmed = userDao.create(newUser);
        if (confirmed == null) {
            req.setAttribute("alert", "true");
            req.getRequestDispatcher("/users/createUser.jsp").forward(req, resp);
            return; // Make sure to return to avoid further execution
        }

        resp.sendRedirect(req.getContextPath() + "/user/list");
    }

}