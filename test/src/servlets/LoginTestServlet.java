package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beans.BankRedg;
import dao.DataAccessObject;

/**
 * Servlet implementation class LoginTestServlet
 */
@WebServlet("/LoginTestServlet")
public class LoginTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String  acc_no = request.getParameter("acc_no");
		String pwd = request.getParameter("pwd");
		System.out.println("Account no is =="+acc_no);
		System.out.println("password is=="+pwd);
		DataAccessObject dao= new DataAccessObject();
		BankRedg bd =dao.authenticate(acc_no, pwd);
		if(bd!=null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("BankRedg", bd);
			session.setAttribute("acc_no",acc_no);
			rd.forward(request, response);
			//response.sendRedirect("home.jsp");
		}
		else
		{
		response.sendRedirect("login.jsp");	
		}
	}

}


