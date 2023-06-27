package com.cyberpunk.events;

import com.google.gson.Gson;

import java.io.*;
import java.util.*;

public class EventDB {
    private volatile static EventDB instance;
    public static EventDB getInstance(){
        if(instance==null){
            synchronized (EventDB.class){
                if(instance == null){
                    instance = EventDB.initDB();
                }
            }
        }
        return instance;
    }

    private HashMap<String,Event> events;
    private Title title;
    private EventDB() {

    }

    private static EventDB initDB(){
        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        try(InputStreamReader reader = new InputStreamReader(Objects.requireNonNull(loader.getResourceAsStream("events.json")))){
            Gson gson = new Gson();
            return gson.fromJson(reader,EventDB.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public Event getEvent(String eventName){
        if(eventName.equals("title")) return title;
        else return events.get(eventName);
    }
}