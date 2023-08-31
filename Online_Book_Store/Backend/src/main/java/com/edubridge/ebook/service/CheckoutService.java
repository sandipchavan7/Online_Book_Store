package com.edubridge.ebook.service;

import com.edubridge.ebook.dto.Purchase;
import com.edubridge.ebook.dto.PurchaseResponse;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);
}