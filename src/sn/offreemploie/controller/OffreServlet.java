package sn.offreemploie.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.offreemploie.dao.ICategorie;
import sn.offreemploie.dao.IOffre;
import sn.offreemploie.entities.Offre;



/**
 * Servlet implementation class OffreServlet
 */
@WebServlet("/Offre")
public class OffreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private IOffre offredao;
	@EJB
	private ICategorie categoriedao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OffreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user_session")!= null) {
			request.setAttribute("user", request.getSession().getAttribute("user_session"));
			request.setAttribute("offres", offredao.getAll());
			request.setAttribute("categories", categoriedao.getAll());
			request.getRequestDispatcher("view/offre/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateE = request.getParameter("dateE");
		String dateP = request.getParameter("dateP");
		String localiter =request.getParameter("localiter");	
		int idC =Integer.parseInt(request.getParameter("categorie"));		
		Offre  o = new Offre();
		
		try {
			o.setDateExpiration(new SimpleDateFormat("yyyy-MM-dd").parse(dateE));
			o.setDatepublication(new SimpleDateFormat("yyyy-MM-dd").parse(dateP));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		o.setLocalite(localiter);
		o.setCategorie(categoriedao.get(idC));
		
		offredao.add(o);
		doGet(request, response);
	}

	}


