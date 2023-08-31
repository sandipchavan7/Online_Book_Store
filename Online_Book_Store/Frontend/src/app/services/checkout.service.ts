import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Country } from '../common/country';
import { State } from '../common/state';
import { Observable, map, of } from 'rxjs';
import { Purchase } from '../common/purchase';

@Injectable({
  providedIn: 'root',
})
export class CheckcoutService {
  countriesUrl = 'http://localhost:9090/api/countries';

  checkoutUrl = 'http://localhost:9090/api/checkout/purchase';

  constructor(private httpClient: HttpClient) {}

  placeOrder(purchase: Purchase): Observable<Purchase> {
    return this.httpClient.post<Purchase>(this.checkoutUrl, purchase);
  }

  getCountries(): Observable<Country[]> {
    return this.httpClient
      .get<GetResponseCountries>(this.countriesUrl)
      .pipe(map((response) => response._embedded.countries));
  }

  getStates(theCountryCode: string): Observable<State[]> {
    const searchStatesUrl =
      'http://localhost:9090/api/states/search/findByCountryCode?code=' +
      theCountryCode;

    return this.httpClient
      .get<GetResponseStates>(searchStatesUrl)
      .pipe(map((response) => response._embedded.states));
  }

  getCreditCardMonths(startMonth: number): Observable<number[]> {
    let data: number[] = [];
    for (let theMonth = startMonth; theMonth <= 12; theMonth++) {
      data.push(theMonth);
    }
    return of(data);
  }

  getCreditCardYears(): Observable<number[]> {
    let data: number[] = [];
    const startYear = new Date().getFullYear();
    const endYear = startYear + 10;
    for (let theYear = startYear; theYear <= endYear; theYear++) {
      data.push(theYear);
    }
    return of(data);
  }
}

interface GetResponseCountries {
  _embedded: {
    countries: Country[];
  };
}

interface GetResponseStates {
  _embedded: {
    states: State[];
  };
}
