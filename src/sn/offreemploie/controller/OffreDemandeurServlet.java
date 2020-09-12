package sn.offreemploie.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.offreemploie.dao.ICategorie;
import sn.offreemploie.dao.IOffre;

/**
 * Servlet implementation class OffreDemandeurServlet
 */
@WebServlet("/OffreDemandeur")
public class OffreDemandeurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IOffre offredao;
	@EJB
	private ICategorie categoriedao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OffreDemandeurServlet() {
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
			request.getRequestDispatcher("view/offredemandeur/liste.jsp").forward(request, response);
			
		}else {
			response.sendRedirect("Login");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
