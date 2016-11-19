import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ControllerServlet", urlPatterns = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameterMap().containsKey("X")){
            request.getRequestDispatcher("AreaCheckServlet").forward(request, response);
        }else{

            if(request.getParameterMap().containsKey("delete")){
                getServletContext().setAttribute("ResultList", null);
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }


}
