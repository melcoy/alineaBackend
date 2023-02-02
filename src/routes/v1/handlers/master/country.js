import db from "../../../../../db/db.js";
const { main } = db;
const index = async (req, res, next) => {
  try {
    const country = await main.masterCountry.findMany();

    return res.json({
      status: "success",
      message: "Country fetched successfully",
      data: country,
    });
  } catch (e) {
    next(e);
  }
};

export default {
  index,
};
