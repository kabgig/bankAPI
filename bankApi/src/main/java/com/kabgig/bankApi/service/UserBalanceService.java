package com.kabgig.bankApi.service;

import com.kabgig.bankApi.entity.Transaction;
import com.kabgig.bankApi.entity.UserBalance;
import com.kabgig.bankApi.repository.UserBalanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UserBalanceService {

    @Autowired
    private UserBalanceRepository userBalanceRepository;

    @Autowired
    private TransactionService transactionService;

    public double getBalance(long userId) {
        try {
            Optional<UserBalance> userBalance = userBalanceRepository.findById(userId);
            if (userBalance.isEmpty()) return -1;
            return userBalance.get().getBalance();
        } catch (Exception e) {
            System.out.println(e);
            return -1;
        }
    }

    @Transactional
    public int putMoneу(long userId, double amount) {
        try {
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
            UserBalance userBalance = userBalanceRepository.save(userBalanceEntity);
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }

    @Transactional
    public int takeMoney(long userId, double amount) {
        try {
            UserBalance userBalanceEntity = userBalanceRepository.findById(userId).get();
            if (userBalanceEntity.getBalance() < amount) return 0;
            userBalanceEntity.setBalance(userBalanceEntity.getBalance() - amount);
            Transaction putTransaction = Transaction.builder()
                    .userId(userBalanceEntity.getId())
                    .amount(amount)
                    .date(LocalDateTime.now())
                    .operation("TAKE")
                    .balance(userBalanceEntity.getBalance())
                    .build();
            transactionService.addTransaction(putTransaction);
            userBalanceRepository.save(userBalanceEntity);
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }

    @Transactional
    public int transferAmount(double amount, long senderId, long receiverId) {
        try {
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
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
}
