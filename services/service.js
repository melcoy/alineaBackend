import axios from "axios";
import config from "../config/config.js";

const login = async (username, password) => {
  try {
    console.log(config.auth + "/GodKingWeb/Login");
    const user = await axios({
      method: "POST",
      url: config.auth + "/GodKingWeb/Login",
      data: {
        username,
        password,
      },
      headers: {
        "Content-Type": "application/json",
      },
    });

    return {
      code: 200,
      status: "ok",
      data: user.data,
    };
  } catch (e) {
    throw new Error(e);
  }
};

export default {
  login,
};
