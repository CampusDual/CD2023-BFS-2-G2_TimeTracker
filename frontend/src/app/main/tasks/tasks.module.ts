import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TasksRoutingModule } from './tasks-routing.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { TasksHomeComponent } from './tasks-home/tasks-home.component';
import { TasksDetailComponent } from './tasks-detail/tasks-detail.component';
import { TasksNewComponent } from './tasks-new/tasks-new.component';


@NgModule({
  declarations: [
    TasksHomeComponent,
    TasksDetailComponent,
    TasksNewComponent
  ],
  imports: [
    CommonModule,
    OntimizeWebModule,
    TasksRoutingModule
  ]
})
export class TasksModule { }
