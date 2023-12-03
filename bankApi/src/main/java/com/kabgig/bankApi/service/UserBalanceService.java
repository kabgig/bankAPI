package com.kabgig.bankApi.service;

import com.kabgig.bankApi.entity.Transaction;
import com.kabgig.bankApi.entity.UserBalance;
import com.kabgig.bankApi.repository.UserBalanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

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
    public List<Transaction> transferAmount(double amount, long senderId, long receiverId){
        UserBalance sender = userBalanceRepository.findById(senderId).get();
        UserBalance receiver = userBalanceRepository.findById(receiverId).get();
        sender.setBalance(sender.getBalance() - amount);
        receiver.setBalance(receiver.getBalance() + amount);
        userBalanceRepository.saveAll(List.of(sender, receiver));

        Transaction senderTransfer = Transaction.builder()
                .balance(sender.getBalance())
                .userId(senderId)
                .date(LocalDateTime.now())
                .operation("TRANSFER_OUT")
                .amount(amount)
                .build();

        transactionService.addTransaction(senderTransfer);
        Transaction receiverTransfer = Transaction.builder()
                .balance(receiver.getBalance())
                .userId(receiverId)
                .date(LocalDateTime.now())
                .operation("TRANSFER_IN")
                .amount(amount)
                .build();

        transactionService.addTransaction(receiverTransfer);
        return List.of(senderTransfer,receiverTransfer);
    }
}
