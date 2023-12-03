package com.kabgig.bankApi.api;

import com.kabgig.bankApi.entity.Transaction;
import com.kabgig.bankApi.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
public class transactionApi {
    @Autowired
    private TransactionService transactionService;

    @PostMapping("/transaction/{id}/{start}/{end}")
    public List<Transaction> getTransactionList(
            @PathVariable long id,
            @PathVariable LocalDateTime start,
            @PathVariable  LocalDateTime end
            ){
        return transactionService.getTransactionsByDateRangeAndUseId(id,start,end);
    }
}
