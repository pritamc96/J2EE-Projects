package servlets;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BankRedg;
import dao.DataAccessObject;

/**
 * Servlet implementation class RegisterServlets
 */
@WebServlet("/RegisterServlets")
public class RegisterServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String str;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlets() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BankRedg bd= new BankRedg();
		Random random = new Random();
		String acc_no;
		char x,y;
		x=request.getParameter("fname").charAt(0);
		y=request.getParameter("lname").charAt(0);
		int z = random.nextInt(999);
		int p = random.nextInt(999);
		acc_no= "" + x + y +z+p;
		String ss=request.getParameter("uid");
		System.out.println("From Servlet "+ss);
		bd.setEmail(ss);
		bd.setPassword(request.getParameter("pwd"));
		bd.setFirstname(request.getParameter("fname"));
		bd.setLastname(request.getParameter("lname"));
		bd.setPhone(request.getParameter("ph"));
		bd.setAddress(request.getParameter("add"));
		bd.setPincode(request.getParameter("pin"));
		bd.setOpeningBalance(request.getParameter("opbal"));
		bd.setAccountNumber(acc_no);
		DataAccessObject dao= new DataAccessObject();
		try {
			if(dao.bankregister(bd)) {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				request.setAttribute("acc_no", acc_no);
				request.setAttribute("str", "welcome");
				rd.forward(request, response);
			}
			else
			{
				System.out.println("Could not register user");
				response.sendRedirect("registertest.jsp");

			}
		}catch(Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Contact Servlet Error --> "+e.getMessage());
		}
	}

}
