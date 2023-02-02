import * as dotenv from "dotenv";
import * as dotenvExpand from "dotenv-expand";

const myEnv = dotenv.config();
dotenvExpand.expand(myEnv);

const port = process.env.PORT || 5000;
const host = process.env.HOST || "0.0.0.0";
const auth = process.env.AUTH_SERVICE_URL || "";
const jwtSecret = process.env.JWT_SECRET || null;
const mainDbConn = {
  url: `${process.env.DB_URL}`,
};
const getMonthFromString = (mon, year) => {
  const d = Date.parse(`${mon}1`);

  if (!isNaN(d)) {
    return new Date(d).getMonth() + 1;
  }
  return -1;
};
const getMonthName = (monthNumber, year) => {
  const date = new Date(year, monthNumber, 1);
  date.setMonth(monthNumber - 1);

  return date.toLocaleString("en-US", { month: "long" });
};

const getMonthYear = (monthNumber, year, increment) => {
  const date = new Date(year, monthNumber, 1);
  date.setMonth(monthNumber - 1 - increment);

  return [date.getMonth(), date.getFullYear()];
};
const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

export default {
  port,
  host,
  mainDbConn,
  months,
  getMonthFromString,
  getMonthName,
  getMonthYear,
  auth,
  jwtSecret,
};
