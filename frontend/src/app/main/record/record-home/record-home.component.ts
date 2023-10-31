import { Component, OnInit } from "@angular/core";
import { Expression, FilterExpressionUtils } from "ontimize-web-ngx";

@Component({
  selector: "app-record-home",
  templateUrl: "./record-home.component.html",
  styleUrls: ["./record-home.component.scss"],
})
export class RecordHomeComponent implements OnInit {
  constructor() {}

  ngOnInit() {}

  createFilter(values: Array<{ attr, value }>): Expression {
    let filters: Array<Expression> = [];
    values.forEach((fil) => {
      if (fil.value) {
        if (fil.attr === "STARTDATE_I") {
          filters.push(
            FilterExpressionUtils.buildExpressionMoreEqual(
              "TM_START_TIME",
              fil.value
            )
          );
        }
        if (fil.attr === "STARTDATE_E") {
          filters.push(
            FilterExpressionUtils.buildExpressionLessEqual(
              "TM_START_TIME",
              fil.value
            )
          );
        }
        if (fil.attr === "ENDDATE_I") {
          filters.push(
            FilterExpressionUtils.buildExpressionMoreEqual(
              "TM_END_TIME",
              fil.value
            )
          );
        }
        if (fil.attr === "ENDDATE_E") {
          filters.push(
            FilterExpressionUtils.buildExpressionLessEqual(
              "TM_END_TIME",
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
