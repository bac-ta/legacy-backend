package com.entropy.backend.enumeration;

import lombok.Getter;

import java.util.Arrays;

public enum ApproveType {
    REJECT(0, "REJECT"),
    ACCEPTED(1, "ACCEPTED"),
    WAITING(2, "WAITING");
    @Getter
    private int value;
    @Getter
    private String name;

    ApproveType(int value, final String name) {
        this.value = value;
        this.name = name;
    }


    public static ApproveType findByValue(int value) {
        return Arrays.stream(ApproveType.values())
                .filter(approveType -> approveType.getValue() == value)
                .findFirst().orElse(null);
    }
}