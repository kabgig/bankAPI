package com.kabgig.bankApi.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class UserBalance {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private double balance;
}
