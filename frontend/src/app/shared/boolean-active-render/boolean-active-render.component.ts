import { Component, Injector, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer, OTranslateService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-boolean-active-render',
  templateUrl: './boolean-active-render.component.html',
  styleUrls: ['./boolean-active-render.component.css']
})
export class BooleanActiveRenderComponent extends OBaseTableCellRenderer {

  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;

  constructor(protected injector: Injector, private translator : OTranslateService) {
    super(injector);
    }

  getCellData(cellvalue: any, rowvalue?: any): string{

    let active;

    if (cellvalue == false) {
      return active = this.translator.get("ACTIVE");
    } else {
      return active = this.translator.get("P_ARCHIVED");
    }
  }
}