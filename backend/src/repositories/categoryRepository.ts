import { injectable } from "tsyringe";
import { Database } from "../config/database";

@injectable()
export class CategoryRepository {
    constructor(private db: Database) {  }

    async getCategoryAll(): Promise<any> {}
    async getCategoryById(): Promise<any> {}
    async insertCategory(): Promise<any> {}
    async searchCategory(): Promise<any> {}

    async updateCategory(): Promise<any> {}

    async deleteCategory(): Promise<any> {}
}