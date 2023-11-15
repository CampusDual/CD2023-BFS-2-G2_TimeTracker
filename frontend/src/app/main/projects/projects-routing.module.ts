import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ProjectsHomeComponent } from "./projects-home/projects-home.component";
import { ProjectsDetailComponent } from "./projects-detail/projects-detail.component";
import { ProjectsNewComponent } from "./projects-new/projects-new.component";
import { AddUserprojectComponent } from "./add-userproject/add-userproject.component";
import { AddTaskprojectComponent } from "./add-taskproject/add-taskproject.component";
import { TasksDetailComponent } from "../tasks/tasks-detail/tasks-detail.component";
import { TasksNewComponent } from "../tasks/tasks-new/tasks-new.component";

const routes: Routes = [
  {
    path: "",
    component: ProjectsHomeComponent,
  },
  {
    path: "new",
    component: ProjectsNewComponent,
  },
  {
    path: ":P_ID",
    component: ProjectsDetailComponent,
  },
  {
    path: ":P_ID/addUserProject/new",
    component: AddUserprojectComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ProjectsRoutingModule {}
