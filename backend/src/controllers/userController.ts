import { Request, Response } from "express";
import { injectable } from "tsyringe";
import { v4 as uuidv4 } from "uuid";
import { UserService } from "../services/userService";
import { generateToken } from "../config/jwt";

@injectable()
export class UserController {
  constructor(private userService: UserService) {}
  async createUser(req: Request, res: Response): Promise<void> {
    try {
      const id = uuidv4();
      const infoUserObject = req.body as {
        user_first_name: string;
        user_last_name: string;
        user_picture: string;
        username: string;
        password: string;
        email: string;
        phone_number: string;
      };
      if (Array.isArray(req.files)) {
        infoUserObject.user_picture = req.files[0].path;
      }
      const infoUserArray = Object.values(infoUserObject);
      const user = [id, ...infoUserArray];
      console.log(user);
      await this.userService.createUser(user);
      res.json({ message: "The user has been successfully created"})
    } catch (error: any) {
        res.json({ message: error.message })
    }
  }
  async getUserByAccountAndAuthenticate(req: Request, res: Response): Promise<void> {
    try {
        const { username, password } = req.body;
        const user = await this.userService.authenticate(username, password);
        console.log(user);
        if (user) {
            const token = generateToken(user);
            user.token = token;
            res.json(user);
        }
    } catch (error: any) {
        // 401 Unauthorized
        res.status(401).json({ message: "Incorrect username or password. Please try again." })
    }
  }
  async getUserAll(req: Request, res: Response): Promise<void> {}
  async deleteUser(req: Request, res: Response): Promise<void> {}
  async updateUser(req: Request, res: Response): Promise<void> {}
}
