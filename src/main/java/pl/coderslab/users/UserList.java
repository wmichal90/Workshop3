package pl.coderslab.users;

import pl.coderslab.usersdao.User;
import pl.coderslab.usersdao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/list")
public class UserList  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        User[] allUsers = userDao.findAll();
        if (allUsers != null){
            req.setAttribute("users", allUsers);
        }


        getServletContext().getRequestDispatcher("/users/list.jsp")
                .forward(req, resp);

    }

}
