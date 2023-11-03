import { Component, Injector, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer } from 'ontimize-web-ngx';

@Component({
  selector: 'app-boolean-active-render',
  templateUrl: './boolean-active-render.component.html',
  styleUrls: ['./boolean-active-render.component.css']
})
export class BooleanActiveRenderComponent extends OBaseTableCellRenderer {

  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;

  constructor(protected injector: Injector) {
    super(injector);
    }

  getCellData(cellvalue: any, rowvalue?: any): string{

    let active;

    if (cellvalue == false) {
      return active = "activo";
    } else {
      return active = "archivado";
    }
  }
}