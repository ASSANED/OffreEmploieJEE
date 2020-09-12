package sn.offreemploie.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.offreemploie.dao.ICurricirum;
import sn.offreemploie.entities.Curricirum;



/**
 * Servlet implementation class CVServlet
 */
@WebServlet("/CV")
public class CVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private ICurricirum curricirumdao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CVServlet() {
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
				int id = Integer.parseInt(request.getParameter("idCV").toString()); 
				switch(action) {
				case "edit":
					Curricirum cv = curricirumdao.get(id);
					request.setAttribute("curricirum",cv);
					break;
					
				case "delete":
					curricirumdao.delete(id);
					break;
					
					
				}
				
			}
			
			
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.setAttribute("curricirums", curricirumdao.getAll());
			request.getRequestDispatcher("view/cv/liste.jsp").forward(request, response);
			
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
		int age = Integer.parseInt(request.getParameter("age").toString());
		String adresse = request.getParameter("adresse");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String specialite = request.getParameter("specialite");
		String niveauEtude = request.getParameter("niveauEtude");
		String expProffessionel = request.getParameter("expProffessionel");
		Curricirum  c = new Curricirum();
		c.setNom(nom);	
		c.setPrenom(prenom);
		c.setAge(age);
		c.setAdresse(adresse);
		c.setEmail(email);
		c.setTel(tel);
		c.setSpecialite(specialite);
		c.setNiveauEtude(niveauEtude);
		c.setExpProffessionel(expProffessionel);
		if(request.getParameter("id")!=null) {//Pour la modification
			int id = Integer.parseInt(request.getParameter("id").toString());
			c.setId(id);
			curricirumdao.update(c);
		}else {//Pour l'ajout à la BD
			curricirumdao.add(c);
		}
						
		doGet(request, response);
	}

}
