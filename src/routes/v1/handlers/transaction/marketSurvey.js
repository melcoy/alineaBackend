import db from "../../../../../db/db.js";

const { main } = db;

const create = async (req, res, next) => {
  try {
    const {
      pic,
      date,
      priceSurveyed,
      brand,
      composition,
      unit,
      uomId,
      manufacturer,
      countryOrigin,
      priceLocal,
      priceUsd,
      sales,
      idUser,
    } = req.body;
    const msrCount = await main.marketSurvey.count();
    const docNumber = `${await helper.formatSingleDigit(smCount + 1, 4)}/MS/${
      config.months.indexOf(month) + 1 < 10
        ? `0${config.months.indexOf(month) + 1}`
        : config.months.indexOf(month) + 1
    }/${year}`;

    const marketSurveyRequest = await main.marketSurvey.create({
      data: {
        numberDocument: docNumber,
        pic,
        date,
        priceSurveyed,
        statusForm: "Waiting",
        approvedIdUser: "",
        marketSurveyDetail: {
          createMany: {
            data: {
              brand,
              unit,
              uomId,
              manufacturer,
              countryOrigin,
              priceLocal,
              priceUSD: priceUsd,
              sales,
            },
          },
        },
      },
    });

    return res.json({
      status: "success",
      message: "Market Survey created successfully",
      data: marketSurveyRequest,
    });
  } catch (e) {
    next(e);
  }
};
export default {
  create,
};
