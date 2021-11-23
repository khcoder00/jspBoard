package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet implementation class BoardController
@WebServlet("/jboard")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    // @see HttpServlet#HttpServlet()
    public BoardController() {
        super();
    }

	// @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String bctr = request.getParameter("bctr");
		RequestDispatcher rd = null;
		switch(bctr) {
		case "listAct":
			rd = request.getRequestDispatcher("/biz/blistAct.jsp");
			break;
		case "list":
			rd = request.getRequestDispatcher("/view/blistView.jsp");
			break;
		case "wrAct":
			rd = request.getRequestDispatcher("/biz/bwrAct.jsp");
			break;
		case "write":
			rd = request.getRequestDispatcher("/view/bwrite.jsp");
			break;
		case "contentAct":
			rd = request.getRequestDispatcher("/biz/bcontentAct.jsp");
			break;
		case "content":
			rd = request.getRequestDispatcher("/view/bcontent.jsp");
			break;
		case "upAct":
			rd = request.getRequestDispatcher("/biz/bupAct.jsp");
			break;
		case "update":
			rd = request.getRequestDispatcher("/view/bupdate.jsp");
			break;
		case "delAct":
			rd = request.getRequestDispatcher("/biz/bdelAct.jsp");
			break;
		case "delete":
			rd = request.getRequestDispatcher("/view/bdelete.jsp");
			break;
		}
		rd.forward(request, response);
	}

	// @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}