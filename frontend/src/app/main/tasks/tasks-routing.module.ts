import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TasksHomeComponent } from './tasks-home/tasks-home.component';
import { TasksDetailComponent } from './tasks-detail/tasks-detail.component';
import { TasksNewComponent } from './tasks-new/tasks-new.component';


const routes: Routes = [
  {
    path:'',
    component: TasksHomeComponent
  },
  {
    path:"new",
    component: TasksNewComponent
  },
  {
   path:":T_ID",
    component: TasksDetailComponent
  }

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TasksRoutingModule { }
