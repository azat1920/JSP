import pack.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;

@WebServlet(name = "AreaCheckServlet", urlPatterns = "/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String xx = request.getParameter("X");
        String yy = request.getParameter("Y");
        String rr = request.getParameter("R");

        boolean bbb = Check(xx, yy, rr);
        float x =0;
        float y=0, r=0;

        if (bbb) {
            x = Float.parseFloat(xx);
            y = Float.parseFloat(yy);
            r = Float.parseFloat(rr);

        }
            String s;
            if (!bbb) s="Неккоректные данные";
            else {
                if (x > 0 && y > 0 && x * x + y * y < r * r / 4
                        || x > 0 && y < 0 && y > 2 * x - r
                        || x < 0 && y < 0  && x > -r && y > -r/2) {
                    s = "Принадлежит";
                } else{
                    s = "Не принадлежит";
                }

            }
        addResult(request, x, y, r, s);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private boolean Check(String x, String y, String r){
        try {
            Float.parseFloat(x);
            Float.parseFloat(y);
            Float.parseFloat(r);
            return true;
        }catch (NumberFormatException e){
            return false;
        }
    }

    private void addResult(HttpServletRequest request, float x, float y, float r, String s){
        String res = "ResultList";
        if (request.getServletContext().getAttribute(res) == null){
            ArrayList<Result> arr = new ArrayList<>();
            arr.add(new Result(x, y, r, s));
            request.getServletContext().setAttribute(res, arr);
        }else {
            ArrayList<Result> arr = (ArrayList<Result>) request.getServletContext().getAttribute(res);
            arr.add(new Result(x, y, r, s));
            request.getServletContext().setAttribute(res, arr);
        }
    }
}

