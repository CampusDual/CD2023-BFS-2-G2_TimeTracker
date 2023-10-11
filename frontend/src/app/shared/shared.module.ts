import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { DurationRenderComponent } from './duration-render/duration-render.component';

@NgModule({
  imports: [
    OntimizeWebModule
  ],
  declarations: [
  DurationRenderComponent],

  exports: [
    CommonModule,
    DurationRenderComponent
  ]
})
export class SharedModule { }
