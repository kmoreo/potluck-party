var Stamp = function(args) {
  this.name = args.name;
  this.issueDate = args.issueDate;
  this.appraisalValues = args.appraisalValues;
}

Stamp.prototype.averageAppraisal = function() {
  var sum = this.appraisalValues.reduce(add, 0);
  function add(a, b) { return a + b;}
  return ( sum / this.appraisalValues.length );
};

Stamp.prototype.maximumAppraisal = function() {
  var maxValue = 0;

  for (var i in this.appraisalValues) {
    if (this.appraisalValues[i] > maxValue) {
      maxValue = this.appraisalValues[i];
    }
  }
  return maxValue;
};