package com.cyberpunk.servlets;

import com.cyberpunk.events.Event;
import com.cyberpunk.events.EventDB;
import com.cyberpunk.events.EventType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet(value = "/game")
public class GameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        getServletContext().getRequestDispatcher("/jsp/game.jsp").forward(req, resp);
    }

    //получаем параметр "selectedAction" из JSP формы, который содержит "ключ" от следующего события.
    //получаем следующее событие по ключу и записываем его в сессию.
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String selectedAction = req.getParameter("selectedAction");
        if(selectedAction!=null){
            Event currentEvent = EventDB.getInstance().getEvent(selectedAction);
            if(currentEvent!=null){
                HttpSession session = req.getSession(true);
                session.setAttribute("currentEvent", currentEvent);
                statisticCounter(session,currentEvent.getType());
            }
        }
        resp.sendRedirect("/game");
    }

    //метод увеличивает параметры в статистике взависимости от типа события.
    public void statisticCounter(HttpSession session, EventType type){
        switch (type){
            case TITLE -> incrementAttribute(session,"gamesCount");
            case WIN -> incrementAttribute(session,"winsCount");
            case LOSE -> incrementAttribute(session, "losesCount");
        }
    }

    public void incrementAttribute(HttpSession session, String attribute){
        session.setAttribute(attribute,(int) session.getAttribute(attribute)+1);
    }
}
