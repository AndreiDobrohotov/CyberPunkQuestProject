package com.cyberpunk.events;

public class Title extends Event {
    private String maleCharName;
    private String femaleCharName;
    private String maleCharBio;
    private String femaleCharBio;

    public String getMaleCharName() {
        return maleCharName;
    }

    public String getFemaleCharName() {
        return femaleCharName;
    }

    public String getMaleCharBio() {
        return maleCharBio;
    }

    public String getFemaleCharBio() {
        return femaleCharBio;
    }
}
