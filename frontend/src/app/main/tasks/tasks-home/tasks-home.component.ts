import { Component, OnInit, ViewChild } from "@angular/core";
import { Expression, FilterExpressionUtils, OTextInputComponent, OTranslateService } from "ontimize-web-ngx";
import { Key } from "protractor";

@Component({
  selector: "app-tasks-home",
  templateUrl: "./tasks-home.component.html",
  styleUrls: ["./tasks-home.component.scss"],
})
export class TasksHomeComponent implements OnInit {
  arrayData: Array<any> = [];

  constructor(private translator: OTranslateService) {
    this.arrayData = [
      { value: true, key: this.translator.get("FILTER_FINISHED") },
      { value: false, key: this.translator.get("FILTER_PENDING") },
    ];
  }

  ngOnInit() { }

  intialComboSelection() {
    return false;
  }

  getDataArray() {
    return this.arrayData;
  }

  createFilter(values: Array<{ attr, value }>): Expression {
    let filters: Array<Expression> = [];
    values.forEach((fil) => {
      if (fil.value != false || fil.value === false) {
        if (fil.attr === "finishedTasksCombo") {

          filters.push(
            FilterExpressionUtils.buildExpressionEquals(
              "T_FINISHED",
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
