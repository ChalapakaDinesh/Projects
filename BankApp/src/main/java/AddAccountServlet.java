import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import DAO.ConnectionDAO;
import DAO.UserinfoDAO;
import DTO.AccountDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddAccountServlet")
public class AddAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;

        try {
            con = new ConnectionDAO().connect();

            // Retrieve form parameters
            String accountNumber = request.getParameter("accountNumber");
            String ifscCode = request.getParameter("ifscCode");
            String bankName = request.getParameter("bankName");
            String accountType = request.getParameter("accountType");

            // Validate and parse currentBalance
            double currentBalance;
            try {
                currentBalance = Double.parseDouble(request.getParameter("currentBalance"));
            } catch (NumberFormatException e) {
                // Handle the case where the input is not a valid double
                e.printStackTrace();  // Log the exception for debugging
                response.sendRedirect("error.jsp");  // Redirect to an error page or handle it accordingly
                return;  // Exit the method to avoid further processing
            }

            int userId = Integer.parseInt(request.getParameter("userId"));

            // Create an AccountDTO object with the form data
            AccountDTO accountDTO = new AccountDTO();
            accountDTO.setAccountNumber(accountNumber);
            accountDTO.setIfscCode(ifscCode);
            accountDTO.setBankName(bankName);
            accountDTO.setAcctType(accountType);
            accountDTO.setCurrBalance(currentBalance);
            accountDTO.setUserId(userId);

            // Create a UserDAO object
            UserinfoDAO userDAO = new UserinfoDAO(con);

            // Insert the new account into the database
            boolean accountCreated = userDAO.createAccount(accountDTO);

         // ...

            if (accountCreated) {
                // Set the connection in the request attribute
                request.setAttribute("dbConnection", con);
                // Redirect to the user's dashboard or another appropriate page
                RequestDispatcher dispatcher = request.getRequestDispatcher("Welcome.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle case where account creation failed
                response.sendRedirect("error.jsp");
            }

            // ...


        } catch (SQLException e) {
            // Handle SQLException more gracefully, e.g., redirect to an error page
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            // Disconnect from the database
            new ConnectionDAO().disconnect(con);
        }
    }
}
