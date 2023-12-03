package com.kabgig.bankApi;

import com.kabgig.bankApi.entity.Transaction;
import com.kabgig.bankApi.service.TransactionService;
import com.kabgig.bankApi.service.UserBalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

@Component
public class functionCalls {
    @Autowired
    private UserBalanceService userBalanceService;
    @Autowired
    private TransactionService transactionService;

    @Bean
    public void callingFunctions() {
        System.out.println(LocalDateTime.now());
//        long id = 103;
//        System.out.println("Start----------");
//        double balance = userBalanceService.getBalance(id);
//        System.out.println("UserId:" + id + " balance:" + balance);
//
//        userBalanceService.putMoneу(id, 100);
//
//        balance = userBalanceService.getBalance(id);
//        System.out.println("UserId:" + id + " balance:" + balance);
//
//        userBalanceService.takeMoney(id, 100);
//
//        balance = userBalanceService.getBalance(id);
//        System.out.println("UserId:" + id + " balance:" + balance);

//
//        System.out.println("---------");
//        List<Transaction> transactionsByDateRangeAndUseId = transactionService
//                .getTransactionsByDateRangeAndUseId(
//                    101L,
//                    LocalDateTime.now().minusMinutes(50),
//                    LocalDateTime.now()
//        );
//        transactionsByDateRangeAndUseId.stream().forEach(System.out::println);
    }
    //@Bean
    public void callingFunctions2(){
        List<Transaction> transactions = userBalanceService
                .transferAmount(45.5, 101L, 102L);
        System.out.println(transactions);
    }
}
