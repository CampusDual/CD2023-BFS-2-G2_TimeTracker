import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProjectsHomeComponent } from './projects-home/projects-home.component';
import { ProjectsDetailComponent } from './projects-detail/projects-detail.component';
import { ProjectsNewComponent } from './projects-new/projects-new.component';
import { AddUserprojectComponent } from './add-userproject/add-userproject.component';
import { AddTaskprojectComponent } from './add-taskproject/add-taskproject.component';


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
},
{
  path: ":P_ID/addUserProject/new",
  component: AddUserprojectComponent
},
{
  path: ":P_ID/addTaskProject/new",
  component: AddTaskprojectComponent
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProjectsRoutingModule { }
