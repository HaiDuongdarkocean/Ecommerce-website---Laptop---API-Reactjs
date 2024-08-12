import { injectable } from "tsyringe";
import { UserRepository } from "../repositories/userRepository";

@injectable()
export class UserService {
    constructor(private userRepository: UserRepository) {}
    async createUser(user: any): Promise<any> {
        return this.userRepository.createUser(user);
    }
    async authenticate(username: string, password: string): Promise<any> {
        let user = await this.userRepository.getUserByAccount(username, password);
        if (user) {
            return {
                id: user.id,
                user_first_name: user.user_first_name,
                user_last_name: user.user_last_name,
                user_picture: user.user_picture,
                username: user.username,
                password: user.password,
                email: user.email,
                phone_number: user.phone_number,
                created_at: user.created_at,
                updated_at: user.updated_at,
            };
        }
        return null;
    }
    async getUserAll(): Promise<any> {}
    async deleteUser(): Promise<any> {}
    async updateUser(): Promise<any> {}
} 