package com.cyberpunk;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Event {
    private String textContent;

    private EventType type;
    private ArrayList<Action> actions;

    public Event() {
    }

    public EventType getType() {
        return type;
    }

    public String getTextContent() {
        return textContent;
    }

    public List<Action> getActions() {
        return actions;
    }
}
