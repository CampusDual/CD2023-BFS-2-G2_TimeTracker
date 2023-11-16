import { Component, ElementRef, Injector, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  registerForm: FormGroup = new FormGroup({});
  nameCtrl: FormControl = new FormControl('', Validators.required);
  surnameCtrl: FormControl = new FormControl('', Validators.required);
  mailCtrl: FormControl = new FormControl('', Validators.required);
  pwdCtrl: FormControl = new FormControl('', Validators.required);

  service: OntimizeService;

  constructor(protected injector: Injector) {
    this.service = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.configureService();

    this.registerForm.addControl('name', this.nameCtrl);
    this.registerForm.addControl('surname', this.surnameCtrl);
    this.registerForm.addControl('mail', this.mailCtrl);
    this.registerForm.addControl('password', this.pwdCtrl);
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration("users");
    this.service.configureService(conf);
  }

  register() {
    if (this.service !== null) {
      const values = { USER_ : this.registerForm.value.name, PASSWORD : this.registerForm.value.password, NAME : this.registerForm.value.name, 
      SURNAME : this.registerForm.value.surname, EMAIL : this.registerForm.value.mail};
      this.service.insert(values, "register").subscribe(resp => {
        if (resp.code === 0) {
          console.log("respcode 0")
        } else {
          console.log(resp);
          console.log("hola");
        }
      });
    }
  }

  handleError(error) {
    switch (error.status) {
      case 401:
        console.error('Email or password is wrong.');
        break;
      default: break;
    }
  }
}
