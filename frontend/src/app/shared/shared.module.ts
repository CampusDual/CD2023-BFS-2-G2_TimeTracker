import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { DurationRenderComponent } from './duration-render/duration-render.component';
import { TimerControlsComponent } from './timer-controls/timer-controls.component';
import { DurationDecimalRenderComponent } from './duration-decimal-render/duration-decimal-render.component';
import { BooleanActiveRenderComponent } from './boolean-active-render/boolean-active-render.component';
import { BooleanFinishedRenderComponent } from './boolean-finished-render/boolean-finished-render.component';

@NgModule({
  imports: [
    OntimizeWebModule
  ],
  declarations: [
  DurationRenderComponent,
  TimerControlsComponent,
  DurationDecimalRenderComponent,
  BooleanActiveRenderComponent,
  BooleanFinishedRenderComponent
  ],
  exports: [
    CommonModule,
    DurationRenderComponent,
    TimerControlsComponent,
    DurationDecimalRenderComponent,
    BooleanActiveRenderComponent,
    BooleanFinishedRenderComponent
  ]
})
export class SharedModule { }
