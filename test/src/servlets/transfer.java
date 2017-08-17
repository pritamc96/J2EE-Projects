package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BankRedg;
import dao.transactionentry;

/**
 * Servlet implementation class transfer
 */
@WebServlet("/transfer")
public class transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int amount = Integer.parseInt(request.getParameter("amount"));
		String accounttr =request.getParameter("account");
		boolean flag=true;
		BankRedg bd = new  BankRedg();
		HttpSession session = request.getSession();
		String ac=(String)session.getAttribute("acc_no");
		transactionentry dao= new transactionentry();
		try
		{
			if(amount >= 100 && amount <= 25000)
			{
				System.out.println("amount transfer checked");
				bd.setAmount(amount);
				bd.setAcc_no(ac);
				bd.setAccountNumber(accounttr);
			}
			else
			{
				flag= false;
				System.out.println("ammount is "+ amount);
				response.sendRedirect("transaction.jsp");
			}
			
			if(dao.transfer(bd)) {
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			}
			else
			{
				System.out.println("Could not transfer");
				response.sendRedirect("transaction.jsp");

			}
		}catch(Exception e) {
			flag=false;
			System.out.println("at transfer.jsp: exception is== "+e.getMessage());
			}
	}

}
