package sn.offreemploie.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.offreemploie.dao.IUtilisateur;
import sn.offreemploie.entities.Utilisateur;



/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/Admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IUtilisateur userdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user_session")!= null) {
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.getRequestDispatcher("view/admin/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email").toString();
		String password = request.getParameter("password").toString();
		Utilisateur user = userdao.getLogin(email, password);
		
		if(user!= null && user.getProfil().getNom().equalsIgnoreCase("Admin")) {
			request.getSession().setAttribute("user_session", user);
			response.sendRedirect("Welcome");
			
		}else if(user!= null && user.getProfil().getNom().equalsIgnoreCase("Entreprise")) {
			request.getSession().setAttribute("user_session", user);
			response.sendRedirect("WelecomeEntreprise");
			
		}else if(user!= null && user.getProfil().getNom().equalsIgnoreCase("Demandeur")) {
			request.getSession().setAttribute("user_session", user);
			response.sendRedirect("WelcomeDemandeur");
			
		}else {
			response.sendRedirect("Login");
		}
	}

}
