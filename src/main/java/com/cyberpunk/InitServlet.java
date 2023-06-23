package com.cyberpunk;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/start")
public class InitServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        resp.setContentType("text/html;charset=UTF-8");

        Event currentEvent = EventDB.getInstance().getEvent("event1");
        Title title = EventDB.getInstance().getTitle();

        session.setAttribute("currentEvent",currentEvent);
        session.setAttribute("title",title);
        session.setAttribute("name","САМЫЙ ЛУЧШИЙ ПОЛЬЗОВАТЕЛЬ");
        session.setAttribute("eventName","event1");
        session.setAttribute("count",0);
        resp.sendRedirect("/index.jsp");
        //session.setAttribute("test",main.getEvent("event1"));
        //session.setAttribute("test2","test2");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        resp.setContentType("text/html;charset=UTF-8");
        int count = (int) req.getSession().getAttribute("count");
        String selectedAction = req.getParameter("selectedAction");
        req.getSession().setAttribute("count",count+1);
        req.getSession().setAttribute("eventName",selectedAction);
        // Обновляем текущее событие на основе выбранного действия
        if (selectedAction != null) {
            Event currentEvent = EventDB.getInstance().getEvent(selectedAction);
            session.setAttribute("currentEvent", currentEvent);
        }


        // Перенаправляем пользователя на исходную JSP-страницу
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

}