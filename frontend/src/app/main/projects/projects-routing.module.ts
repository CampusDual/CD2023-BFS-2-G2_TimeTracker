import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProjectsHomeComponent } from './projects-home/projects-home.component';
import { ProjectsDetailComponent } from './projects-detail/projects-detail.component';
import { ProjectsNewComponent } from './projects-new/projects-new.component';


const routes: Routes = [
{
  path: '',
  component: ProjectsHomeComponent
},
{
  path: "new",
  component: ProjectsNewComponent
},
{
  path: ":P_ID",
  component: ProjectsDetailComponent
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProjectsRoutingModule { }
