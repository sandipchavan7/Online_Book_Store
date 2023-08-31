import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { OrderHistory } from '../common/order-history';

@Injectable({
  providedIn: 'root',
})
export class OrderHistoryService {
  private orderUrl = 'http://localhost:9090/api/orders/';

  constructor(private httpClient: HttpClient) {}

  getOrderHistory(): Observable<GetResponseOrderHistory> {
    return this.httpClient.get<GetResponseOrderHistory>(this.orderUrl);
  }
}

interface GetResponseOrderHistory {
  _embedded: {
    orders: OrderHistory[];
  };
}
