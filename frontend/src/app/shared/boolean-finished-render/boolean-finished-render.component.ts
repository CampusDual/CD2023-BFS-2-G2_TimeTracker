import { Component, Injector, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer, OTranslateService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-boolean-finished-render',
  templateUrl: './boolean-finished-render.component.html',
  styleUrls: ['./boolean-finished-render.component.css']
})
export class BooleanFinishedRenderComponent extends OBaseTableCellRenderer {

  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;


  constructor(protected injector: Injector, private translator : OTranslateService) { 
    super(injector);
  }

  getCellData(cellvalue: any, rowvalue?: any): string{

    let finished;

    if (cellvalue == false) {
      return finished = this.translator.get("UNFINISHED");
    } else {
      return finished = this.translator.get("FINISHED_T");
    }
  }
}
