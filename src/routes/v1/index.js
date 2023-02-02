import express from "express";
import brand from "./handlers/master/brand.js";

import country from "./handlers/master/country.js";
import dosage from "./handlers/master/dosage.js";
import user from "./handlers/master/user.js";
import marketsurveyrequest from "./handlers/transaction/marketsurveyrequest.js";
import checkValidation from "./middlewares/checkValidation.js";
import checkToken from "./middlewares/token.js";
import validation from "./validation.js";

const router = express.Router();
router.post("/master/user/login", user.login);
router.get("/master/country", country.index);
router.get("/master/brand", brand.index);
router.get("/master/brand/:id", brand.selectOne);
router.get("/master/dosage/", dosage.index);
router.post(
  "/transaction/marketsurveyrequest",
  validation.createMarketSurveyRequest,
  checkValidation,
  marketsurveyrequest.create
);
export default router;
