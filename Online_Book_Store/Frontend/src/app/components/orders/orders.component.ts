import { Component } from '@angular/core';
import { OrderHistory } from 'src/app/common/order-history';
import { OrderHistoryService } from 'src/app/services/order-history.service';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css'],
})
export class OrdersComponent {
  orderHistoryList: OrderHistory[] = [];

  constructor(private orderHistoryService: OrderHistoryService) {}

  ngOnInit(): void {
    this.handleOrderHistory();
  }

  handleOrderHistory() {
    this.orderHistoryService.getOrderHistory().subscribe((data) => {
      this.orderHistoryList = data._embedded.orders;
    });
  }
}
