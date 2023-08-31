import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Country } from 'src/app/common/country';
import { Order } from 'src/app/common/order';
import { OrderItem } from 'src/app/common/order-item';
import { Purchase } from 'src/app/common/purchase';
import { State } from 'src/app/common/state';
import { CartService } from 'src/app/services/cart.service';
import { CheckcoutService } from 'src/app/services/checkout.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css'],
})
export class CheckoutComponent implements OnInit {
  checkoutFormGroup: FormGroup;
  countries: Country[] = [];
  shippingAddressStates: State[] = [];
  billingAddressStates: State[] = [];
  creditCartMonths: number[] = [];
  creditCartYears: number[] = [];

  totalPrice = 0.0;
  totalQuantity = 0;

  constructor(
    private formBuilder: FormBuilder,
    private checkOutService: CheckcoutService,
    private cartService: CartService,
    private router: Router
  ) {}

  reviewCartDetails() {
    this.cartService.totalPrice.subscribe((data) => {
      this.totalPrice = data;
    });

    this.cartService.totalQuantity.subscribe((data) => {
      this.totalQuantity = data;
    });
  }
  ngOnInit(): void {
    this.reviewCartDetails();

    this.checkoutFormGroup = this.formBuilder.group({
      customer: this.formBuilder.group({
        firstName: [
          '',
          [
            Validators.required,
            Validators.minLength(2),
            Validators.pattern('^[a-zA-Z]*$'),
          ],
        ],
        lastName: [
          '',
          [
            Validators.required,
            Validators.minLength(2),
            Validators.pattern('^[a-zA-Z]*$'),
          ],
        ],
        email: ['', [Validators.required, Validators.email]],
      }),

      shippingAddress: this.formBuilder.group({
        street: ['', [Validators.required]],
        city: ['', [Validators.required]],
        state: ['', [Validators.required]],
        country: ['', [Validators.required]],
        zipCode: ['', [Validators.required, Validators.pattern('^[0-9]{6}$')]],
      }),

      billingAddress: this.formBuilder.group({
        street: ['', [Validators.required]],
        city: ['', [Validators.required]],
        state: ['', [Validators.required]],
        country: ['', [Validators.required]],
        zipCode: ['', [Validators.required, Validators.pattern('^[0-9]{6}$')]],
      }),

      creditCard: this.formBuilder.group({
        cardType: ['', [Validators.required]],
        nameOnCard: ['', [Validators.required]],
        cardNumber: [
          '',
          [Validators.required, Validators.pattern('^[0-9]{16}$')],
        ],
        securityCode: [
          '',
          [Validators.required, Validators.pattern('^[0-9]{3}$')],
        ],
        expirationMonth: [''],
        expirationYear: [''],
      }),
    });

    const startMonth: number = new Date().getMonth() + 1;

    this.checkOutService.getCreditCardMonths(startMonth).subscribe((data) => {
      this.creditCartMonths = data;
    });

    this.checkOutService.getCreditCardYears().subscribe((data) => {
      this.creditCartYears = data;
    });

    this.checkOutService.getCountries().subscribe((data) => {
      this.countries = data;
    });
  }

  handleMonthsAndYears() {
    const creditCardFormGroup = this.checkoutFormGroup.get('creditCard');

    const selectedYear: number = Number(
      creditCardFormGroup?.value.expirationYear
    );

    const currentYear: number = new Date().getFullYear();

    let startMonth: number;

    if (currentYear === selectedYear) {
      startMonth = new Date().getMonth() + 1;
    } else {
      startMonth = 1;
    }

    this.checkOutService.getCreditCardMonths(startMonth).subscribe((data) => {
      this.creditCartMonths = data;
    });
  }

  getStates(formGroupName: string) {
    const formGroup = this.checkoutFormGroup.get(formGroupName);
    const countryCode = formGroup?.value.country.code;
    const countryName = formGroup?.value.country.name;

    this.checkOutService.getStates(countryCode).subscribe((data) => {
      if (formGroupName === 'shippingAddress') {
        this.shippingAddressStates = data;
      } else {
        this.billingAddressStates = data;
      }
    });
  }
  copyShippingAddressToBillingAddress(event: any) {
    if (event.target.checked) {
      this.checkoutFormGroup.controls?.['billingAddress'].setValue(
        this.checkoutFormGroup.controls?.['shippingAddress'].value
      );
      this.billingAddressStates = this.shippingAddressStates;
    } else {
      this.checkoutFormGroup.controls?.['billingAddress'].reset();
      this.billingAddressStates = [];
    }
  }

  //customer getter methods
  get firstName() {
    return this.checkoutFormGroup.get('customer.firstName');
  }

  get lastName() {
    return this.checkoutFormGroup.get('customer.lastName');
  }

  get email() {
    return this.checkoutFormGroup.get('customer.email');
  }

  //shipping address getter methods
  get shippingAddressStreet() {
    return this.checkoutFormGroup.get('shippingAddress.street');
  }
  get shippingAddressCity() {
    return this.checkoutFormGroup.get('shippingAddress.city');
  }
  get shippingAddressState() {
    return this.checkoutFormGroup.get('shippingAddress.state');
  }
  get shippingAddressZipCode() {
    return this.checkoutFormGroup.get('shippingAddress.zipCode');
  }
  get shippingAddressCountry() {
    return this.checkoutFormGroup.get('shippingAddress.country');
  }

  //billing address getter methods
  get billingAddressStreet() {
    return this.checkoutFormGroup.get('billingAddress.street');
  }
  get billingAddressCity() {
    return this.checkoutFormGroup.get('billingAddress.city');
  }
  get billingAddressState() {
    return this.checkoutFormGroup.get('billingAddress.state');
  }
  get billingAddressZipCode() {
    return this.checkoutFormGroup.get('billingAddress.zipCode');
  }
  get billingAddressCountry() {
    return this.checkoutFormGroup.get('billingAddress.country');
  }

  //credit card getter methods
  get creditCardType() {
    return this.checkoutFormGroup.get('creditCard.cardType');
  }
  get creditCardNameOnCard() {
    return this.checkoutFormGroup.get('creditCard.nameOnCard');
  }
  get creditCardNumber() {
    return this.checkoutFormGroup.get('creditCard.cardNumber');
  }
  get creditCardSecurityCode() {
    return this.checkoutFormGroup.get('creditCard.securityCode');
  }

  onSubmit() {
    if (this.checkoutFormGroup.invalid) {
      this.checkoutFormGroup.markAllAsTouched();
      return;
    }

    let order = new Order();
    order.totalPrice = this.totalPrice;
    order.totalQuantity = this.totalQuantity;

    let cartItems = this.cartService.cartItems;

    let orderItems: OrderItem[] = cartItems.map(
      (cartItem) => new OrderItem(cartItem)
    );

    let purchase = new Purchase();
    purchase.customer = this.checkoutFormGroup.controls['customer'].value;

    purchase.shippingAddress =
      this.checkoutFormGroup.controls['shippingAddress'].value;
    const shippingState = JSON.parse(
      JSON.stringify(purchase.shippingAddress.state)
    );
    const shippingCountry = JSON.parse(
      JSON.stringify(purchase.shippingAddress.country)
    );
    purchase.shippingAddress.state = shippingState.name;
    purchase.shippingAddress.country = shippingCountry.name;

    purchase.billingAddress =
      this.checkoutFormGroup.controls['billingAddress'].value;
    const billingState = JSON.parse(
      JSON.stringify(purchase.billingAddress.state)
    );
    const billingCountry = JSON.parse(
      JSON.stringify(purchase.billingAddress.country)
    );
    purchase.billingAddress.state = billingState.name;
    purchase.billingAddress.country = billingCountry.name;

    purchase.order = order;
    purchase.orderItems = orderItems;

    this.checkOutService.placeOrder(purchase).subscribe(
      (response: Purchase) => {
        alert(
          `Your order is received\nOrder Tracking number: ${response.orderTrackingNumber}`
        );
        //reset cart
        this.resetCart();
      },
      (err) => {
        alert(`There was something happen: ${err.message}`);
      }
    );
  }
  resetCart() {
    this.cartService.cartItems = [];
    this.cartService.totalPrice.next(0);
    this.cartService.totalQuantity.next(0);
    this.checkoutFormGroup.reset();
    this.router.navigateByUrl('/products');
  }
}
