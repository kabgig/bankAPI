package com.kabgig.bankApi.api;

import com.kabgig.bankApi.service.UserBalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class userBalanceApi {
    @Autowired
    private UserBalanceService userBalanceService;

    @GetMapping("/get/{id}")
    public double getBalance (@PathVariable long id){
        return userBalanceService.getBalance(id);
    }

    @PostMapping("/put/{id}/{amount}")
    public int putMoney(@PathVariable long id, @PathVariable double amount){
        return userBalanceService.putMoneу(id,amount);
    }

    @PostMapping("/take/{id}/{amount}")
    public int takeMoney(@PathVariable long id, @PathVariable double amount){
        return userBalanceService.takeMoney(id, amount);
    }

    @PostMapping("/transfer/{senderId}/{receiverId}/{amount}")
    public int transfer(
            @PathVariable long senderId,
            @PathVariable long receiverId,
            @PathVariable double amount){
        return userBalanceService.transferAmount(amount,senderId,receiverId);
    }
}
