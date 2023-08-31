import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';
import { Product } from '../common/product';
import { ProductCategory } from '../common/product-category';

@Injectable({
  providedIn: 'root',
})
export class ProductService {
  productsUrl = 'http://localhost:9090/api/products';

  categoryUrl = 'http://localhost:9090/api/product-category';

  constructor(private http: HttpClient) {}

  /*
  getProductList(): Observable<Product[]> {
    return this.http
      .get<GetResponseProducts>(this.productsUrl)
      .pipe(map((response) => response._embedded.products));
  }
  */
  //get products list
  getProductList(theCategoryId: number): Observable<Product[]> {
    //http://localhost:8080/api/products/search/findByCategoryId?id=2
    const searchUrl =
      'http://localhost:9090/api/products/search/findByCategoryId?id=' +
      theCategoryId;
    return this.http
      .get<GetResponseProducts>(searchUrl)
      .pipe(map((response) => response._embedded.products));
  }

  //get categories
  getProductCategories(): Observable<ProductCategory[]> {
    return this.http
      .get<GetResponseProductCategory>(this.categoryUrl)
      .pipe(map((response) => response._embedded.productCategory));
  }

  getProduct(theProductId: any): Observable<Product> {
    const productUrl = this.productsUrl + '/' + theProductId;
    return this.http.get<Product>(productUrl);
  }

  //search method

  searchProducts(theKeyword: string | null): Observable<Product[]> {
    const searchUrl =
      'http://localhost:9090/api/products/search/findByNameContaining?name=' +
      theKeyword;
    return this.http
      .get<GetResponseProducts>(searchUrl)
      .pipe(map((response) => response._embedded.products));
  }

  searchProductsPaginate(
    thePage: number,
    thePageSize: number,
    theKeyword: any
  ): Observable<GetResponseProducts> {
    //http://localhost:8080/api/products/search/findByNameContaining?name=dell&page=0&size=1
    const searchUrl = `http://localhost:9090/api/products/search/findByNameContaining?name=${theKeyword}&page=${thePage}&size=${thePageSize}`;
    return this.http.get<GetResponseProducts>(searchUrl);
  }

  getProductListPaginate(
    theCategoryId: number,
    thePage: number,
    thePageSize: number
  ): Observable<GetResponseProducts> {
    //http://localhost:8080/api/products/search/findByCategoryId?id=1&page=4&size=2
    const url = `http://localhost:9090/api/products/search/findByCategoryId?id=${theCategoryId}&page=${thePage}&size=${thePageSize}`;
    return this.http.get<GetResponseProducts>(url);
  }
}

export interface GetResponseProducts {
  _embedded: {
    products: Product[];
  };
  page: {
    size: number;
    totalElements: number;
    totalPages: number;
    number: number;
  };
}

export interface GetResponseProductCategory {
  _embedded: {
    productCategory: ProductCategory[];
  };
}
