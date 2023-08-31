import { Component } from '@angular/core';
import { LoginService } from './services/login.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  loggedIn = false;

  constructor(private loginService: LoginService) {}
  ngOnInit() {
    this.loggedIn = this.loginService.isLoggedIn();
  }

  logOut() {
    this.loginService.logout();
    location.reload();
  }
}
