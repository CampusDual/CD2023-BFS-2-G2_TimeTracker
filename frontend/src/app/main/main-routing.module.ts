import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuardService } from 'ontimize-web-ngx';
import { MainComponent } from './main.component';

export const routes: Routes = [
  {
    path: '',
    component: MainComponent,
    canActivate: [AuthGuardService],
    children: [
      { path: '', redirectTo: 'projects', pathMatch: 'full' },
      { path: 'home', loadChildren: () => import('./home/home.module').then(m => m.HomeModule) },
      { path: 'projects', loadChildren: () => import('./projects/projects.module').then(m => m.ProjectsModule) },
      { path: 'tasks', loadChildren: () => import('./tasks/tasks.module').then(m => m.TasksModule) },
      { path: 'record', loadChildren: () => import('./record/record.module').then(m => m.RecordModule) },
      
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MainRoutingModule { }
