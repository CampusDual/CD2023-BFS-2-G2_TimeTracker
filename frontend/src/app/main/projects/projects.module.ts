import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProjectsRoutingModule } from './projects-routing.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { ProjectsHomeComponent } from './projects-home/projects-home.component';
import { ProjectsDetailComponent } from './projects-detail/projects-detail.component';
import { ProjectsNewComponent } from './projects-new/projects-new.component';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [
    ProjectsHomeComponent,
    ProjectsDetailComponent,
    ProjectsNewComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    OntimizeWebModule,
    ProjectsRoutingModule
  ]
})
export class ProjectsModule { }
