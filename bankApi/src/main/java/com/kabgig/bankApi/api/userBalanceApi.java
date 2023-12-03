package com.kabgig.bankApi.api;

import com.kabgig.bankApi.entity.UserBalance;
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
    public UserBalance putMoney(@PathVariable long id, @PathVariable double amount){
        return userBalanceService.putMoneу(id,amount);
    }
    @PostMapping("/take/{id}/{amount}")
    public UserBalance takeMoney(@PathVariable long id, @PathVariable double amount){
        return userBalanceService.takeMoney(id, amount);
    }
}
