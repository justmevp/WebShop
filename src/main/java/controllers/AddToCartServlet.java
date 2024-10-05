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

@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addFromHome".equals(action)) {
            addToCartFromHome(request, response);
        } else if ("addFromDetail".equals(action)) {
            addToCartFromDetail(request, response);
        } else if ("addFromProductMenu".equals(action)) {
            addToCartFromProductMenu(request, response);
        } else {
            response.sendRedirect(request.getContextPath()); // Redirect to home page if action is not specified
        }
    }

    private void addToCartFromHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cartList == null) {
            cartList = new ArrayList<>();
            session.setAttribute("cart-list", cartList);
        }

        // Lưu URL của trang trước vào session
        session.setAttribute("previousPage", request.getHeader("Referer"));

        // Check if the product is already in the cart
        boolean exist = false;
        for (Cart c : cartList) {
            if (c.getId() == productId) {
                exist = true;
                break;
            }
        }

        if (!exist) {
            Cart cartItem = new Cart();
            cartItem.setId(productId);
            cartItem.setQuantity(1); // Default quantity is 1

            cartList.add(cartItem);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Pages/ActionDataPage/Cart.jsp");
        dispatcher.forward(request, response);
    }

    private void addToCartFromDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cartList == null) {
            cartList = new ArrayList<>();
            session.setAttribute("cart-list", cartList);
        }

        // Lưu URL của trang trước vào session
        session.setAttribute("previousPage", request.getHeader("Referer"));

        // Check if the product is already in the cart
        boolean exist = false;
        for (Cart c : cartList) {
            if (c.getId() == productId) {
                exist = true;
                c.setQuantity(c.getQuantity() + quantity); // Increase quantity if the product already exists
                break;
            }
        }

        if (!exist) {
            Cart cartItem = new Cart();
            cartItem.setId(productId);
            cartItem.setQuantity(quantity);

            cartList.add(cartItem);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Pages/ActionDataPage/Cart.jsp");
        dispatcher.forward(request, response);
    }

    private void addToCartFromProductMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cartList == null) {
            cartList = new ArrayList<>();
            session.setAttribute("cart-list", cartList);
        }

        // Lưu URL của trang trước vào session
        session.setAttribute("previousPage", request.getHeader("Referer"));

        // Check if the product is already in the cart
        boolean exist = false;
        for (Cart c : cartList) {
            if (c.getId() == productId) {
                exist = true;
                break;
            }
        }

        if (!exist) {
            Cart cartItem = new Cart();
            cartItem.setId(productId);
            cartItem.setQuantity(1); // Default quantity is 1

            cartList.add(cartItem);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Pages/ActionDataPage/Cart.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
