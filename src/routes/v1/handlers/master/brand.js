import db from "../../../../../db/db.js";

const { main } = db;
const index = async (req, res, next) => {
  try {
    const compositionChile = await main.masterBrand.findMany({
      select: { id: true, nameBrand: true, MasterComposition: true },
    });

    return res.json({
      status: "success",
      message: "Brand fetched successfully",
      data: compositionChile,
    });
  } catch (e) {
    next(e);
  }
};
const selectOne = async (req, res, next) => {
  try {
    const { idBrand } = req.params;
    // const composition = await main.masterComposition.findMany({
    //   include: {
    //     brand: {
    //       select: { nameBrand: true },
    //     },
    //   },
    // });

    const compositionChile = await main.masterBrand.findFirst({
      where: { id: idBrand },
      select: { id: true, nameBrand: true, MasterComposition: true },
    });

    return res.json({
      status: "success",
      message: "Select One Brand fetched successfully",
      data: compositionChile,
    });
  } catch (e) {
    next(e);
  }
};
export default {
  index,
  selectOne,
};
