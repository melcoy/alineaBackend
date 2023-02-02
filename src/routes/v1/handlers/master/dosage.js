import db from "../../../../../db/db.js";

const { main } = db;
const index = async (req, res, next) => {
  try {
    const { idBrand } = req.params;
    const dosage = await main.masterDosage.findMany();

    return res.json({
      status: "success",
      message: "dossage fetched successfully",
      data: dosage,
    });
  } catch (e) {
    next(e);
  }
};

export default {
  index,
};
