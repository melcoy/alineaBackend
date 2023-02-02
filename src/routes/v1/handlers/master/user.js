import jwt from "jsonwebtoken";
import config from "../../../../../config/config.js";
import service from "../../../../../services/service.js";

const login = async (req, res, next) => {
  try {
    const { username, password } = req.body;

    const user = await service.login(username, password);
    let name = user.data.accName;
    let email = user.data.accEmail;

    if (username === "admin") {
      name = "admin";
      email = "admin@mail.com";
    }
    const data = {
      name,
      username,
      email,
    };

    const token = jwt.sign(data, config.jwtSecret, { expiresIn: "3h" });
    return res.json({
      status: "success",
      message: "login successfull",
      data: {
        token,
        ...data,
      },
    });
  } catch (e) {
    next(e);
  }
};

export default {
  login,
};
