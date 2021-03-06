package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;

/**
 * Servlet implementation class DeletePublic
 */
@WebServlet("/DeletePublic")
public class DeletePublic extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePublic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));
		int deletePublicID = Integer.parseInt(request.getParameter("delete"));
		request.setAttribute("deletePublic", AmsDAO.getApplicationStatusDelete(deletePublicID));
		request.setAttribute("barcodeData", barcodeData);
		request.setAttribute("studentName", AmsDAO.getStudentName(barcodeData));
		String view = "/WEB-INF/view/publicapplicationdelete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));
		int deletePublicID = Integer.parseInt(request.getParameter("deleteId"));
		request.setAttribute("barcodeData", barcodeData);
		request.setAttribute("studentName", AmsDAO.getStudentName(barcodeData));
		AmsDAO.deletePublic(deletePublicID);

		if(!(AmsDAO.checkPublic(barcodeData))){
			AmsDAO.publicFlagDataDOWN(barcodeData);
		}

		String view = "/WEB-INF/view/publicapplicationdeleteresult.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
