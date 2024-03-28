import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import DAO.ConnectionDAO;
import DAO.UserinfoDAO;
import DTO.AccountDTO;
import DTO.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class Login_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();

        // Your existing code to check credentials and connect to the database
        ConnectionDAO connectionDAO = new ConnectionDAO();
        Connection con = null;

        try {
            con = connectionDAO.connect();

            String name = request.getParameter("Username");
            String pass = request.getParameter("password");

            // Check if name or pass is null
            if (name == null || pass == null || name.isEmpty() || pass.isEmpty()) {
                // Alert for empty
                pw.println("<script>alert('Username and password cannot be empty!'); window.location.href='Login.jsp';</script>");
            } else {
                // Create a UserDAO object
            	UserinfoDAO userDAO = new UserinfoDAO(con);

                if (userDAO.validateUser(name, pass)) {
                    // If the user is validated, create a UserDTO object
                    UserDTO userDTO = userDAO.getUserDetails(name, pass);

                    // After retrieving user details, set the Connection and account details in request attributes
                    List<AccountDTO> acctList = userDAO.getAccountDetails(userDTO.getId());
                    request.setAttribute("dbConnection", con);
                    request.setAttribute("acctList", acctList);

                    // Set the user object in the session
                    request.getSession().setAttribute("user", userDTO);

                    // Forward to Welcome.jsp
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/Welcome.jsp");
                    dispatcher.forward(request, response);
                    return; // Ensure that you don't execute the code below after forwarding
                } else {
                    // Display login failure messages directly in Login.jsp
                    pw.println("<div style=\"color: red; font-size: 18px; font-weight: bold; background-color: #ffe6e6; padding: 10px; border: 1px solid #ff3333; height: 30px; width: 500px; text-align: center; margin: 0 auto; margin-top :10px;\">Login failed!</div>");
                    pw.println("<div style=\"color: green; font-size: 18px; font-weight: bold; background-color: #ffe6e6; padding: 10px; border: 1px solid #ff3333; height: 30px; width: 500px; text-align: center; margin: 0 auto; margin-top :10px;\">Try To Login Again: <a href=\"Login.jsp\"><input type=\"submit\" value=\"Login_in\"></a><br></div>");
                    pw.println("<div style=\"color: green; font-size: 18px; font-weight: bold; background-color: #ffe6e6; padding: 10px; border: 1px solid #ff3333; height: 30px; width: 500px; text-align: center; margin: 0 auto; margin-top :10px;\">New User Register Here: <a href=\"Register.jsp\"><input type=\"submit\" value=\"Register\"></a><br></div>");
                }
            }
        } catch (SQLException e) {
            // Handle SQLException more gracefully, e.g., redirect to an error page
            e.printStackTrace();
            response.sendRedirect("/error.jsp");
            return;
        } finally {
            // Disconnect from the database
            connectionDAO.disconnect(con);
        }
    }
}
