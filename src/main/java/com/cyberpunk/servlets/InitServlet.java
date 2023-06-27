package com.cyberpunk.servlets;

import com.cyberpunk.events.Event;
import com.cyberpunk.events.EventDB;
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

        Event currentEvent = EventDB.getInstance().getEvent("title");

        session.setAttribute("currentEvent", currentEvent);
        session.setAttribute("gamesCount",0);
        session.setAttribute("winsCount",0);
        session.setAttribute("losesCount",0);
        resp.sendRedirect("/game");

    }



}