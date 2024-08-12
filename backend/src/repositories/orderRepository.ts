import { injectable } from "tsyringe";
import { Database } from "../config/database";

@injectable()
export class OrderRepository {
    constructor(private db: Database) {}
    async createOrder(order: any): Promise<any> {}
    async createOrderItem(orderItem: any): Promise<any> {}
}