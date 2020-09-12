package sn.offreemploie.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import sn.offreemploie.dao.ICategorie;
import sn.offreemploie.entities.Categorie;

/**
 * Servlet implementation class CategorieServlet
 */
@WebServlet("/Categorie")
public class CategorieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private ICategorie categoriedao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategorieServlet() {
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
				int id = Integer.parseInt(request.getParameter("idC").toString()); 
				switch(action) {
				case "edit":
					Categorie c = categoriedao.get(id);
					request.setAttribute("categorie",c);
					break;
					
				case "delete":
					categoriedao.delete(id);
					break;
					
					
				}
				
			}
			
			
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.setAttribute("categories", categoriedao.getAll());
			request.getRequestDispatcher("view/categorie/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");				
		Categorie  c = new Categorie();
		c.setNom(nom);			
		if(request.getParameter("id")!=null) {//Pour la modification
			int id = Integer.parseInt(request.getParameter("id").toString());
			c.setId(id);
			categoriedao.update(c);
		}else {//Pour l'ajout à la BD
			categoriedao.add(c);
		}
						
		doGet(request, response);
	}
	}


