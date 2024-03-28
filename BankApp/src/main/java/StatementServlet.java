import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import DAO.ConnectionDAO;
import DAO.UserinfoDAO;
import DTO.AccountDTO;
import DTO.StatementDTO;
import DTO.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StatementServlet")
public class StatementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Your existing code to connect to the database
        Connection con = null;

        try {
            con = new ConnectionDAO().connect();

            String selectedAccountNumber = request.getParameter("selectedAccount");

            if (selectedAccountNumber == null || selectedAccountNumber.isEmpty()) {
                // Handle case where no account is selected
                response.setContentType("text/html");
                response.getWriter().println("<html><body><script>alert('Please select an account.'); window.history.back();</script></body></html>");
                return;
            }

            // Create a UserDAO object
            UserinfoDAO userDAO = new UserinfoDAO(con);

            // Get the user details from the session
            UserDTO userDTO = (UserDTO) request.getSession().getAttribute("user");

            // Get the account details for the selected account
            List<AccountDTO> acctList = userDAO.getAccountDetails(userDTO.getId());
            AccountDTO selectedAccount = null;

            for (AccountDTO acct : acctList) {
                if (acct.getAccountNumber().equals(selectedAccountNumber)) {
                    selectedAccount = acct;
                    break;
                }
            }

            if (selectedAccount != null) {
                // Get the statement details for the selected account
                List<StatementDTO> statementList = userDAO.getStatementsForAccount(selectedAccount.getAccountNumber());

                // Get the latest statement
                StatementDTO statement = statementList.isEmpty() ? null : statementList.get(0);

                // Set the Connection object as a request attribute
                request.setAttribute("dbConnection", con);

                // Forward to Statement.jsp with necessary attributes
                request.setAttribute("selectedAccount", selectedAccount);
                request.setAttribute("statementList", statementList); // Pass the list of statements
                request.setAttribute("latestStatement", statement); // Pass the latest statement

                RequestDispatcher dispatcher = request.getRequestDispatcher("/Statement.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle case where the selected account is not found
                response.sendRedirect("/error.jsp");
            }
        } catch (SQLException e) {
            // Handle SQLException more gracefully, e.g., redirect to an error page
            e.printStackTrace();
            response.sendRedirect("/error.jsp");
        } finally {
            // Disconnect from the database
            new ConnectionDAO().disconnect(con);
        }
    }
}
