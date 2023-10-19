import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RecordHomeComponent } from './record-home/record-home.component';
import { RecordNewComponent } from './record-new/record-new.component';
import { RecordDetailComponent } from './record-detail/record-detail.component';

const routes: Routes = [
  {
    path : '',
    component: RecordHomeComponent
  },
  {
    path : "new",
    component: RecordNewComponent
  },
  {
    path : ":TM_ID",
    component: RecordDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RecordRoutingModule { }
