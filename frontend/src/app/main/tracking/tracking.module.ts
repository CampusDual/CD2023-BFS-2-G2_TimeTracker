import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TrackingRoutingModule } from './tracking-routing.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { TrackingHomeComponent } from './tracking-home/tracking-home.component';


@NgModule({
  declarations: [TrackingHomeComponent],
  imports: [
    CommonModule,
    TrackingRoutingModule,
    OntimizeWebModule
  ]
})
export class TrackingModule { }
