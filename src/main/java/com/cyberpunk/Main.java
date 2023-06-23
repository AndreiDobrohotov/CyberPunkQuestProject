package com.cyberpunk;

public class Main {
    public static void main(String[] args) {
        Title title = EventDB.getInstance().getTitle();
        System.out.println(title.getTextContent());
        System.out.println(title.getStartEvent());
    }
}
