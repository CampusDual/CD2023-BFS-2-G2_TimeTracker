import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RegisterComponent } from './register.component';
import { SharedModule } from '../shared/shared.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { RegisterRoutingModule } from './register-routing.module';

@NgModule({
  imports: [
    SharedModule,
    OntimizeWebModule,
    RegisterRoutingModule
  ],
  declarations: [RegisterComponent]
})
export class RegisterModule { }
