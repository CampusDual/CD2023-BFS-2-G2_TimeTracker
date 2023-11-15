import { Component, OnInit, ViewChild } from '@angular/core';
import { Expression, FilterExpressionUtils, OTranslateService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-projects-home',
  templateUrl: './projects-home.component.html',
  styleUrls: ['./projects-home.component.scss']
})
export class ProjectsHomeComponent implements OnInit {
  arrayData: Array<any> = [];

  constructor(private translator: OTranslateService) {
    this.arrayData = [
      { value: true, key: this.translator.get("FILTER_ARCHIVED") },
      { value: false, key: this.translator.get("FILTER_ACTIVE") },
    ];
  }

  ngOnInit() { }

  getDataArray() {
    return this.arrayData;
  }

  initialComboSelection(){
    return false;
  }

  createFilter(values: Array<{ attr, value }>): Expression {
    let filters: Array<Expression> = [];
    values.forEach((fil) => {
      if (fil.value != false || fil.value === false) {
        if (fil.attr === "finishedProjetcsCombo") {
          
          filters.push(
            FilterExpressionUtils.buildExpressionEquals(
              "P_FINISHED",
              fil.value
            )
          );

        }
      }
    });

    if (filters.length > 0) {
      return filters.reduce((exp1, exp2) =>
        FilterExpressionUtils.buildComplexExpression(
          exp1,
          exp2,
          FilterExpressionUtils.OP_AND
        )
      );
    } else {
      return null;
    }
  }
}
