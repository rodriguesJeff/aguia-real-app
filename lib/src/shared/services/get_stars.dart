int getStars(num score) {
  if (score >= 0 && score <= 200) {
    return 1;
  } else if (score >= 201 && score <= 400) {
    return 2;
  } else if (score >= 401 && score <= 600) {
    return 3;
  } else if (score >= 601 && score <= 800) {
    return 4;
  } else if (score >= 81 && score <= 1000) {
    return 5;
  } else {
    return 1;
  }
}
