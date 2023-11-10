import { Component, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OTableComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-projects-detail',
  templateUrl: './projects-detail.component.html',
  styleUrls: ['./projects-detail.component.scss']
})
export class ProjectsDetailComponent implements OnInit {

  @ViewChild('tasksTable', { static: false }) tasksTable: OTableComponent;

  constructor(private router: Router) {}

  ngOnInit() { }

  public openTasksDetailsSelected() {
    let selectedItem = this.tasksTable.getSelectedItems();
    if (selectedItem.length === 1) {
      let taskId = selectedItem[0]['T_ID'];
      this.router.navigate(['main/tasks/' + taskId]);
    }
  }
}
