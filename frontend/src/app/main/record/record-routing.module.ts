import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RecordHomeComponent } from './record-home/record-home.component';

const routes: Routes = [
  {
    path : '',
    component: RecordHomeComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RecordRoutingModule { }
