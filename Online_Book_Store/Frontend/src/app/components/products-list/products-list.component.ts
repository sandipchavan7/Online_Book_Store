import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CartItem } from 'src/app/common/cart-item';
import { Product } from 'src/app/common/product';
import { CartService } from 'src/app/services/cart.service';
import {
  ProductService,
  GetResponseProducts,
} from 'src/app/services/product.service';

@Component({
  selector: 'app-products-list',
  templateUrl: './products-list.component.html',
  styleUrls: ['./products-list.component.css'],
})
export class ProductsListComponent implements OnInit {
  products: Product[] = [];
  currentCategoryId: any;
  previousCategoryId: any;
  searchMode: boolean = false;

  //pagination props
  thePageNumber: number = 1;
  thePageSize: number = 4;
  theTotalElements: number = 0;

  previousKeyword: any;

  pageSizes: number[] = [4, 8, 12, 16, 20];

  constructor(
    private service: ProductService,
    private route: ActivatedRoute,
    private cartService: CartService
  ) {
    console.log('ProductsListComponent object is created');
  }

  ngOnInit(): void {
    //this.listProducts();

    this.route.paramMap.subscribe(() => {
      this.listProducts();
    });
  }

  /*
  listProducts() {
    const hasCategoryId = this.route.snapshot.paramMap.has('id');

    if (hasCategoryId) {
      this.currentCategoryId = this.route.snapshot.paramMap.get('id');
    } else {
      this.currentCategoryId = 1;
    }
    this.service.getProductList(this.currentCategoryId).subscribe((data) => {
      console.log(data);
      this.products = data;
    });
  }
  */
  listProducts() {
    this.searchMode = this.route.snapshot.paramMap.has('keyword');
    if (this.searchMode) {
      //search products
      this.handleSearchProducts();
    } else {
      //display products list
      this.handleListProducts();
    }
  }

  handleSearchProducts() {
    const theKeyword = this.route.snapshot.paramMap.get('keyword');

    if (this.previousKeyword != theKeyword) {
      this.thePageNumber = 1;
    }

    this.previousKeyword = theKeyword;

    this.service
      .searchProductsPaginate(
        this.thePageNumber - 1,
        this.thePageSize,
        theKeyword
      )
      .subscribe(this.processResult());
  }

  handleListProducts() {
    const hasCategoryId = this.route.snapshot.paramMap.has('id');

    if (hasCategoryId) {
      this.currentCategoryId = this.route.snapshot.paramMap.get('id');
    } else {
      this.currentCategoryId = 1;
    }

    if (this.previousCategoryId != this.currentCategoryId) {
      this.thePageNumber = 1;
    }

    this.previousCategoryId = this.currentCategoryId;

    this.service
      .getProductListPaginate(
        this.currentCategoryId,
        this.thePageNumber - 1,
        this.thePageSize
      )
      .subscribe(this.processResult());

    /*
    this.service.getProductList(this.currentCategoryId).subscribe((data) => {
      console.log(data);
      this.products = data;
    });
    */
  }
  processResult() {
    return (data: GetResponseProducts) => {
      this.products = data._embedded.products;
      this.thePageNumber = data.page.number + 1;
      this.thePageSize = data.page.size;
      this.theTotalElements = data.page.totalElements;
    };
  }

  updatePageSize(pageSize: number) {
    this.thePageSize = pageSize;
    this.thePageNumber = 1;
    this.listProducts();
  }

  addProductToCart(theProduct: Product) {
    console.log(`Adding to cart: ${theProduct.name}, ${theProduct.unitPrice}`);
    const theCartItem = new CartItem(theProduct);
    this.cartService.addToCart(theCartItem);
  }
}
