package pl.coderslab.users;

import pl.coderslab.usersdao.User;
import pl.coderslab.usersdao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;


@WebServlet("/user/delete")
public class DeleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserDao userDao = new UserDao();

        User userFromId = userDao.read(id);
        if (userFromId != null){

            // Create a key-value map
            Map<String, String> keyValueMap = new HashMap<>();
            keyValueMap.put("id", String.valueOf(id));
            keyValueMap.put("username", userFromId.getUserName());
            keyValueMap.put("email", userFromId.getEmail());

            // Convert the map to JSON using Gson
            Gson gson = new Gson();
            String json = gson.toJson(keyValueMap);

            // Set response content type to JSON
            resp.setContentType("application/json");
            // Write JSON response
            resp.getWriter().write(json);
//            userDao.delete(userFromId.getId());
//            resp.sendRedirect(req.getContextPath() + "/user/list");
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserDao userDao = new UserDao();

        User userFromId = userDao.read(id);
        if (userFromId != null){
            userDao.delete(userFromId.getId());
//            resp.sendRedirect(req.getContextPath() + "/user/list");
        }
    }
}
