package com.entropy.backend.rest.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PostSaveResp {
    private Integer id;
    private String message;
}