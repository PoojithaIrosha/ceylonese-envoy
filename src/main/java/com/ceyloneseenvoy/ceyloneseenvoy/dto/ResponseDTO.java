package com.ceyloneseenvoy.ceyloneseenvoy.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ResponseDTO implements Serializable {
    private Boolean status;
    private String message;

}
