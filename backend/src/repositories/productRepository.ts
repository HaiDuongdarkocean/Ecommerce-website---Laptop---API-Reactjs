import { injectable } from "tsyringe";
import { Database } from "../config/database";

@injectable()
export class ProductRepository {
  constructor(private db: Database) {}

  async getProductAll(): Promise<any> {
    try {
      const sql = "CALL GetProductAll()";
      const [results] = await this.db.query(sql, []);
      return results;
    } catch (error: any) {
      throw new Error(error.message);
    }
  }
  async getProductById(id: string): Promise<any> {
    try {
      const sql = "CALL GetProductById(?)";
      const [results] = await this.db.query(sql, [id]);

      // test Results
      console.log(results);

      if (Array.isArray(results) && results.length > 0) {
        return results[0];
      }
      return null;
    } catch (error: any) {
      throw new Error(error.message);
    }
  }
  async insertProduct(product: any): Promise<any> {
    try {
      const sql = "CALL InsertProduct(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      await this.db.query(sql, product);
    } catch (error: any) {
      throw new Error(error.message);
    }
  }
  async searchProduct(pageIndex: number, pageSize: number, search_content: string): Promise<any> {
    try {
      const sql = 'CALL SearchProduct(?, ?, ?)';
      const [results] = await this.db.query(sql, [pageIndex, pageSize, search_content]);
      return results;
    } catch (error: any) {
      throw new Error( error.message )
    }
  }

  async updateProduct(product: any): Promise<any> {
    try {
      const sql = "CALL UpdateProduct(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      await this.db.query(sql, product);
      return true;
    } catch (error: any) {
      throw new Error(error.message);
    }
  }

  async deleteProduct(id: any): Promise<any> {
    try {
      const sql = "CALL DeleteProduct(?)";
      await this.db.query(sql, [id]);
      return true;
    } catch (error: any) {
      throw new Error(error.message);
    }
  }
}
