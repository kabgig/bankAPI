package com.kabgig.bankApi;

import com.kabgig.bankApi.service.UserBalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class functionCalls {
    @Autowired
    private UserBalanceService userBalanceService;

    @Bean
    public void callingFunctions() {
        long id = 101;
        System.out.println("Start----------");
        double balance = userBalanceService.getBalance(id);
        System.out.println("UserId:" + id + " balance:" + balance);

        userBalanceService.putMoneу(id, 100);

        balance = userBalanceService.getBalance(id);
        System.out.println("UserId:" + id + " balance:" + balance);

        userBalanceService.takeMoney(id, 100);

        balance = userBalanceService.getBalance(id);
        System.out.println("UserId:" + id + " balance:" + balance);
    }
}
