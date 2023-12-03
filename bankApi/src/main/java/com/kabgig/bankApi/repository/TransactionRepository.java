package com.kabgig.bankApi.repository;

import com.kabgig.bankApi.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    List<Transaction> findByUserIdAndDateBetween(Long userId, LocalDateTime startDate, LocalDateTime endDate);

    List<Transaction> findByUserId(Long userId);

    List<Transaction> findByUserIdAndDateAfter(Long userId, LocalDateTime startDate);

    List<Transaction> findByUserIdAndDateBefore(Long userId, LocalDateTime endDate);
}