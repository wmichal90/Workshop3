package pl.coderslab.users;

import pl.coderslab.usersdao.User;
import pl.coderslab.usersdao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/delete")
public class DeleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserDao userDao = new UserDao();

        User userFromId = userDao.read(id);
        if (userFromId != null){
            userDao.delete(userFromId.getId());
            resp.sendRedirect(req.getContextPath() + "/user/list");
        }

    }
}
