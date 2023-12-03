package com.kabgig.bankApi.service;

import com.kabgig.bankApi.entity.Transaction;
import com.kabgig.bankApi.entity.UserBalance;
import com.kabgig.bankApi.repository.UserBalanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class UserBalanceService {

    @Autowired
    private UserBalanceRepository userBalanceRepository;

    @Autowired
    private TransactionService transactionService;

    public double getBalance(long userId){
        return userBalanceRepository.findById(userId).get().getBalance();
    }

    public UserBalance putMoneу(long userId, double amount){
        UserBalance userBalanceEntity = userBalanceRepository.findById(userId).get();
        userBalanceEntity.setBalance(userBalanceEntity.getBalance() + amount);
        Transaction putTransaction = Transaction.builder()
                .userId(userBalanceEntity.getId())
                .amount(amount)
                .date(LocalDateTime.now())
                .operation("PUT")
                .balance(userBalanceEntity.getBalance())
                .build();
        transactionService.addTransaction(putTransaction);
        return userBalanceRepository.save(userBalanceEntity);
    }
    public UserBalance takeMoney(long userId, double amount){
        UserBalance userBalanceEntity = userBalanceRepository.findById(userId).get();
        userBalanceEntity.setBalance(userBalanceEntity.getBalance() - amount);
        Transaction putTransaction = Transaction.builder()
                .userId(userBalanceEntity.getId())
                .amount(amount)
                .date(LocalDateTime.now())
                .operation("TAKE")
                .balance(userBalanceEntity.getBalance())
                .build();
        transactionService.addTransaction(putTransaction);
        return userBalanceRepository.save(userBalanceEntity);
    }
    public void deleteUserById(long userId){
        userBalanceRepository.deleteById(userId);
    }
}
