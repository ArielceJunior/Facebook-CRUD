package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelException;
import model.User;
import model.dao.DAOFactory;
import model.dao.UserDAO;
import model.utils.PasswordEncryptor;

@WebServlet(urlPatterns = {"/users", "/user/save", "/user/update", "/user/delete"})
public class UsersController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		String action = req.getRequestURI();

		System.out.println(action);

		switch (action) {
		case "/facebook/users": {
			
			// Carregar a lista de usuários do banco
			loadUsers(req);

			RequestDispatcher rd = req.getRequestDispatcher("users.jsp");
			rd.forward(req, resp);
			break;
		}
		case "/facebook/user/save": {

			String userId = req.getParameter("user_id");
			if (userId != null && !userId.equals(""))
				updateUser(req);
			else insertUser(req);

			resp.sendRedirect("/facebook/users");			
			break;
		}
		case "/facebook/user/update": {

			loadUser(req);

			RequestDispatcher rd = req.getRequestDispatcher("/form_user.jsp");
			rd.forward(req, resp);
			break;
		} case "/facebook/user/delete": {
			
			deleteUser(req);
			
			resp.sendRedirect("/facebook/users");
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}

	private void deleteUser(HttpServletRequest req) {
		String userIdString = req.getParameter("userId");
		int userId = Integer.parseInt(userIdString);
		
		User user = new User(userId);
		
		UserDAO dao = DAOFactory.createDAO(UserDAO.class);
		
		try {
			dao.delete(user);
		} catch (ModelException e) {
			// log no servidor
			e.getCause().printStackTrace();
			e.printStackTrace();
		}
	}

	private void updateUser(HttpServletRequest req) {
		User user = createUser(req);

		UserDAO dao = DAOFactory.createDAO(UserDAO.class);

		try {
			dao.update(user);
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
		}
	}

	private User createUser(HttpServletRequest req) {
		String userId = req.getParameter("user_id");
		String userName = req.getParameter("user_name");
		String userGender = req.getParameter("user_gender");
		String userEMail = req.getParameter("user_email");
		
		String userPW = req.getParameter("user_pw");
		if (!userPW.equals(""))
			userPW = PasswordEncryptor.hashPassword(userPW);

		User user;
		if (userId.equals(""))
			user = new User();
		else user = new User(Integer.parseInt(userId));
		
		user.setName(userName);
		user.setGender(userGender);
		user.setEmail(userEMail);
		user.setPassword(userPW);
		
		return user;
	}

	private void loadUser(HttpServletRequest req) {
		String userIdParameter = req.getParameter("userId");

		int userId = Integer.parseInt(userIdParameter);

		UserDAO dao = DAOFactory.createDAO(UserDAO.class);

		try {
			User user = dao.findById(userId);

			if (user == null)
				throw new ModelException("Usuário não encontrado para alteração");
			
			req.setAttribute("usuario", user);
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
		}
	}

	private void insertUser(HttpServletRequest req) {
		User user = createUser(req);

		UserDAO dao = DAOFactory.createDAO(UserDAO.class);

		try {
			dao.save(user);
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
		}
	}

	private void loadUsers(HttpServletRequest req) {
		UserDAO dao = DAOFactory.createDAO(UserDAO.class);

		List<User> users = null;
		try {
			users = dao.listAll();
		} catch (ModelException e) {
			// Log no servidor
			e.printStackTrace();
		}

		if (users != null)
			req.setAttribute("usuarios", users);
	}
}
