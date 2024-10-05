package controllers;
import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.entities.Cart;

@WebServlet(name = "SetPreviousPageServlet", urlPatterns = "/set-previous-page")
public class SetPreviousPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String previousPage = request.getParameter("previousPage");
        HttpSession session = request.getSession();
        session.setAttribute("previousPage", previousPage);
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
