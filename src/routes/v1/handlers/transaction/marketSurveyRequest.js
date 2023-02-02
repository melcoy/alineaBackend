import config from "../../../../../config/config.js";
import db from "../../../../../db/db.js";
import helper from "../../helpers/helper.js";

const { main } = db;

const create = async (req, res, next) => {
  try {
    const {
      country,
      type,
      brand,
      brandId,
      dosageForm,
      originatorBrand,
      originatorCompany,
      idUser,
    } = req.body;
    console.log(brandId);
    const date = new Date();
    const msrCount = await main.marketSurveyRequest.count();
    const docNumber = `${await helper.formatSingleDigit(
      msrCount + 1,
      4
    )}/${country}/MSR/${date.getFullYear()}`;

    const marketSurveyRequest = await main.marketSurveyRequest.create({
      data: {
        numberDocument: docNumber,
        type,
        idBrand: brandId,
        country,
        brand,
        dosageForm,
        originatorBrand,
        originatorCompany,
        statusForm: "Waiting",
        approvedIdUser: "",
      },
    });
    return res.json({
      status: "success",
      message: "Market Survey Request created successfully",
      data: marketSurveyRequest,
    });
  } catch (e) {
    next(e);
  }
};
export default {
  create,
};
