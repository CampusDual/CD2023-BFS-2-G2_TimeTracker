import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProjectsRoutingModule } from './projects-routing.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { ProjectsHomeComponent } from './projects-home/projects-home.component';


@NgModule({
  declarations: [ProjectsHomeComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    ProjectsRoutingModule
  ]
})
export class ProjectsModule { }
