var StampCollection = function(stampArray) {
  this.stamps = stampArray;
}

StampCollection.prototype.stampNamed = function(name) {
  for (var i in this.stamps) {
    if (this.stamps[i].name === name){
      return this.stamps[i];
    };
  };
};

StampCollection.prototype.stampsIssued = function(year) {
  var matchedStamps = [];
  for (var i in this.stamps) {
    if (this.stamps[i].issueDate === year) {
      matchedStamps.push(this.stamps[i]);
    };
  };
  return matchedStamps;
};

StampCollection.prototype.value = function() {
  var maxValues = 0;
  for (var i in this.stamps) {
    maxValues += this.stamps[i].maximumAppraisal();
  };  
  return maxValues;
};