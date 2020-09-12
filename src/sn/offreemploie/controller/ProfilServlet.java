package sn.offreemploie.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.offreemploie.dao.IProfil;

import sn.offreemploie.entities.Profil;

/**
 * Servlet implementation class ProfilServlet
 */
@WebServlet("/Profil")
public class ProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IProfil profildao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
if(request.getSession().getAttribute("user_session")!= null) {
			
			if(request.getParameter(("action"))!= null) {
				String action = request.getParameter("action").toString();
				int id = Integer.parseInt(request.getParameter("idP").toString()); 
				switch(action) {
				case "edit":
					Profil p = profildao.get(id);
					request.setAttribute("profil",p);
					break;
					
				case "delete":
					profildao.delete(id);
					break;
					
					
				}
				
			}
			
			
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.setAttribute("profils", profildao.getAll());
			request.getRequestDispatcher("view/profil/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");				
		Profil  p = new Profil();
		p.setNom(nom);			
		if(request.getParameter("id")!=null) {//Pour la modification
			int id = Integer.parseInt(request.getParameter("id").toString());
			p.setId(id);
			profildao.update(p);
		}else {//Pour l'ajout à la BD
			profildao.add(p);
		}
						
		doGet(request, response);
	}

}
