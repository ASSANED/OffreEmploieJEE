package sn.offreemploie.controller;

import java.io.IOException;


import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import sn.offreemploie.dao.IProfil;
import sn.offreemploie.dao.IUtilisateur;

import sn.offreemploie.entities.Utilisateur;

/**
 * Servlet implementation class UtilisateurServlet
 */
@WebServlet("/Utilisateur")
public class UtilisateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IUtilisateur utilisateurdao;
	@EJB
	private IProfil profildao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UtilisateurServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user_session")!= null) {
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.setAttribute("utilisateurs", utilisateurdao.getAll());
			request.setAttribute("profils", profildao.getAll());
			request.getRequestDispatcher("view/utilisateur/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		String photo =request.getParameter("photo");
		int idP =Integer.parseInt(request.getParameter("profil"));		
		Utilisateur  u = new Utilisateur();
		
		u.setNom(nom);
		u.setPrenom(prenom);
		u.setEmail(email);
		u.setPassword(password);
		u.setPhoto(photo);
		u.setProfil(profildao.get(idP));
		
		utilisateurdao.add(u);
		doGet(request, response);
	}

}
