import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { DurationRenderComponent } from './duration-render/duration-render.component';
import { TimerControlsComponent } from './timer-controls/timer-controls.component';

@NgModule({
  imports: [
    OntimizeWebModule
  ],
  declarations: [
  DurationRenderComponent,
  TimerControlsComponent
  ],
  exports: [
    CommonModule,
    DurationRenderComponent,
    TimerControlsComponent
  ]
})
export class SharedModule { }
