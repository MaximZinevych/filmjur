package com.codecrab.filmjur.entity;

public class Hello {

    private final int id ;
    private final String content;

    public int getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public Hello(int id, String content){
        this.id = id;
        this.content = content;
    }
}
