package com.kabgig.bankApi.service;

import com.kabgig.bankApi.entity.Transaction;
import com.kabgig.bankApi.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class TransactionService {
    @Autowired
    private TransactionRepository transactionRepository;

    public void addTransaction(Transaction transaction){
        transactionRepository.save(transaction);
    }

    public List<Transaction> getTransactionsByDateRangeAndUseId(Long userId, LocalDateTime startDate, LocalDateTime endDate){
        if (startDate == null && endDate == null) {
            // If both startDate and endDate are null, return all transactions for the given userId
            return transactionRepository.findByUserId(userId);
        } else if (startDate != null && endDate != null) {
            // If both startDate and endDate are provided, return transactions within the date range
            return transactionRepository.findByUserIdAndDateBetween(userId, startDate, endDate);
        } else if (startDate != null) {
            // If only startDate is provided, return transactions from the startDate onwards
            return transactionRepository.findByUserIdAndDateAfter(userId, startDate);
        } else {
            // If only endDate is provided, return transactions up to the endDate
            return transactionRepository.findByUserIdAndDateBefore(userId, endDate);
        }
    }
}
