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
 * Servlet implementation class Deposit
 */
@WebServlet("/deposit-servlet")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deposit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int amount = Integer.parseInt(request.getParameter("depositParam"));
		boolean flag=true;
		BankRedg bd = new  BankRedg();
		HttpSession session = request.getSession();
		String ac=(String)session.getAttribute("acc_no");
		transactionentry dao= new transactionentry();
		System.out.println("at deposit.java:\\accountno is "+ ac);
		System.out.println("at deposit.java:\\amount is "+ amount);
		try
		{
			if(amount >= 100 && amount <= 25000)
			{
				System.out.println("amount deposition checked");
				bd.setAmount(amount);
				bd.setAcc_no(ac);
			}
			else
			{
				flag= false;
				System.out.println("ammount is "+ amount);
				response.sendRedirect("transaction.jsp");
			}
			
			if(dao.deposit(bd)) {
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			}
			else
			{
				System.out.println("Could not deposit");
				response.sendRedirect("transaction.jsp");

			}
		}catch(Exception e) {
			flag=false;
			System.out.println("at deposit.jsp: exception is== "+e.getMessage());
			}
	}

	

}
