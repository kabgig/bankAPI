package com.kabgig.bankApi.repository;

import com.kabgig.bankApi.entity.UserBalance;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserBalanceRepository extends JpaRepository<UserBalance,Long> {
}
