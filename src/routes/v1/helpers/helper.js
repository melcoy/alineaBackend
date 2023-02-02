const formatSingleDigit = async (num, size = 4) => {
  let formatted = num.toString();
  while (formatted.length < size) {
    formatted = `0${formatted}`;
  }
  return formatted;
};

export default {
  formatSingleDigit,
};
