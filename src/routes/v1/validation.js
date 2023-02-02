import { body } from "express-validator";
import config from "../../../config/config.js";

const createMarketSurveyRequest = [
  body("brandId")
    .exists({ checkFalsy: true })
    .withMessage("type is required")
    .isInt(),

  body("brand")
    .isString()
    .withMessage("brand must be a string")
    .exists({ checkFalsy: true })
    .withMessage("brand is required"),
  body("dosageForm")
    .isString()
    .withMessage("dosage Form must be a string")
    .exists({ checkFalsy: true })
    .withMessage("dosage Form is required"),
  body("originatorBrand")
    .isString()
    .withMessage("Originator Brand must be a string")
    .exists({ checkFalsy: true })
    .withMessage("Originator Brand  is required"),

  body("originatorCompany")
    .isString()
    .withMessage("Originator Company must be a string")
    .exists({ checkFalsy: true })
    .withMessage("Originator Company is required"),
];

export default {
  createMarketSurveyRequest,
};
