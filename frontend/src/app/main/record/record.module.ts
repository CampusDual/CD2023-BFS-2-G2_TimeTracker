import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { RecordRoutingModule } from './record-routing.module';
import { RecordHomeComponent } from './record-home/record-home.component';
import { SharedModule } from 'src/app/shared/shared.module';

@NgModule({
  declarations: [RecordHomeComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    SharedModule,
    RecordRoutingModule
  ]
})
export class RecordModule { }
