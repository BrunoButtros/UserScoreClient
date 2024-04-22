package com.bruno.buttros.Score.API.Server.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScoreResponse {
    private int score;

    public ScoreResponse() {
    }

    public ScoreResponse(int score) {
        this.score = score;
    }
}
