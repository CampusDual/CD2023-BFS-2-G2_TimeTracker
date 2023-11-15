import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProjectsRoutingModule } from './projects-routing.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { ProjectsHomeComponent } from './projects-home/projects-home.component';
import { ProjectsDetailComponent } from './projects-detail/projects-detail.component';
import { ProjectsNewComponent } from './projects-new/projects-new.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { AddUserprojectComponent } from './add-userproject/add-userproject.component';
import { AddTaskprojectComponent } from './add-taskproject/add-taskproject.component';
import { OChartModule } from 'ontimize-web-ngx-charts';
import { TasksModule } from '../tasks/tasks.module';


@NgModule({
  declarations: [
    ProjectsHomeComponent,
    ProjectsDetailComponent,
    ProjectsNewComponent,
    AddUserprojectComponent,
    AddTaskprojectComponent,
  ],
  imports: [
    CommonModule,
    SharedModule,
    OntimizeWebModule,
    ProjectsRoutingModule,
    OChartModule,
    TasksModule
  ]
})
export class ProjectsModule { }
