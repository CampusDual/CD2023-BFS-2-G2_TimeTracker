import { Component, ElementRef, Injector, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { DialogService, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  registerForm: FormGroup = new FormGroup({});
  nameCtrl: FormControl = new FormControl('', Validators.required);
  pwdCtrl: FormControl = new FormControl('', Validators.required);
  rpwdCtrl: FormControl = new FormControl('', Validators.required);

  service: OntimizeService;

  constructor(protected injector: Injector, protected dialogService: DialogService) {
    this.service = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.configureService();

    this.registerForm.addControl('name', this.nameCtrl);
    this.registerForm.addControl('password', this.pwdCtrl);
    this.registerForm.addControl('repeat_password', this.rpwdCtrl);
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration("users");
    this.service.configureService(conf);
  }

  register() {
    if (this.registerForm.value.password == this.registerForm.value.repeat_password) {
      if (this.service !== null) {
        const values = { USER_ : this.registerForm.value.name, PASSWORD : this.registerForm.value.password, NAME : this.registerForm.value.name};
        this.service.insert(values, "register").subscribe(resp => {
          if (resp.code === 0) {
            if (this.dialogService) {
              this.dialogService.info("SUCCESSFUL_TITLE", "SUCCESSFUL_INSERT_USER_MSG");
            }
          } else {
            console.log(resp);
            console.log("resp");
          }
        },
        error => {
          if (this.dialogService) {
            this.dialogService.error("ERROR", error);
          }
        }
        );
      }
    } else {
      if (this.dialogService) {
        this.dialogService.error("ERROR", "ERROR_PASSWORD_MSG");
      }
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
