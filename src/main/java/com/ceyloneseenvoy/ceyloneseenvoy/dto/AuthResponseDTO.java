package com.ceyloneseenvoy.ceyloneseenvoy.dto;

import java.io.Serializable;

public class AuthResponseDTO implements Serializable {
    private Boolean status;
    private String message;

    public AuthResponseDTO(Boolean status, String message) {
        this.status = status;
        this.message = message;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
