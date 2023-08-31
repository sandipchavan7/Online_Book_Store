package com.edubridge.ebook.dto;

import com.edubridge.ebook.entity.Address;
import com.edubridge.ebook.entity.Customer;
import com.edubridge.ebook.entity.Order;
import com.edubridge.ebook.entity.OrderItem;
import lombok.Data;

import java.util.Set;

@Data
public class Purchase {

    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;

}