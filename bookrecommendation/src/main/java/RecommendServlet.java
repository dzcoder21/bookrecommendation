import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RecommendServlet")
public class RecommendServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bookdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = ""; // use your password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Book> recommendedBooks = new ArrayList<>();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT * FROM books ORDER BY rating DESC LIMIT 6";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Book book = new Book(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("author"),
                            rs.getDouble("rating")
                    );
                    recommendedBooks.add(book);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("recommendedBooks", recommendedBooks);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
