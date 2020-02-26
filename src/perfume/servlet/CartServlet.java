package perfume.servlet;

import perfume.dao.ItemDAO;
import perfume.entity.Cart;
import perfume.entity.Item;

import javax.naming.PartialResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private String action;
    private ItemDAO itemDAO = new ItemDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action = request.getParameter("action");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        String result = "";
        if("add".equals(action)){
            if(addItemToCart(request,response)){
                result = "添加商品成功";
            }else{
                result = "添加商品失败";

            }
            writer.print(result);
        }else if("show".equals(action)){
            response.sendRedirect("cart.jsp");
        }else if("delete".equals(action)){
            if (deleteItemFromCart(request,response)){
                result = "删除成功";

            }else{
                result = "删除失败";
            }
            writer.print(result);
        }else if("reduce".equals(action)){
            reduceNumberToCart(request,response);
        }

    }
    private boolean deleteItemFromCart(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        Item item = itemDAO.getItemById(Integer.parseInt(id));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart.removeGoodsFromCart(item)){
            return true;
        }else{
            return false;
        }
    }

    private boolean reduceNumberToCart(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        String number = request.getParameter("number");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Item item = itemDAO.getItemById(Integer.parseInt(id));
        if(cart.reduceNumber(item,Integer.parseInt(number))){
            return true;
        }else{
            return false;
        }
    }

    private boolean addItemToCart(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        String number = request.getParameter("number");
        HttpSession session = request.getSession();
        if(session.getAttribute("cart")==null){
            Cart cart = new Cart();
            session.setAttribute("cart",cart);
        }
        Cart cart = (Cart) session.getAttribute("cart");
        Item item = itemDAO.getItemById(Integer.parseInt(id));
        if (cart.addGoodInCart(item,Integer.parseInt(number))){
            return true;
        }else{
            return false;
        }
    }
}
