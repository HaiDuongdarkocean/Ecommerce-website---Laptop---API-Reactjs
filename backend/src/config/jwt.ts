import jwt from "jsonwebtoken";
import { config } from "./config";

const generateToken = (payload: object): string => {
  return jwt.sign(payload, config.jwt.secret, {
    expiresIn: config.jwt.expiresIn,
  });
};

const verifyToken = (token: string): any => {
    try {
        return jwt.verify(token, config.jwt.secret);
    } catch (error: any) {
        return null;
    }
}

export {
    generateToken,
    verifyToken
}
