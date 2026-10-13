
mixin PenaltyCalculator {
  int calculatePenalty(int daysOverdue) {
    if (daysOverdue > 0) {
      return daysOverdue * 20;
    } else {
      return 0;
    }
  }
}
