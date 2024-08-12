import { injectable } from "tsyringe";
import { ProductRepository } from "../repositories/productRepository";

@injectable()
export class ProductService {
  constructor(private productRepository: ProductRepository) {}
  async getProductAll(): Promise<any> {
    return this.productRepository.getProductAll();
  }
  async getProductById(id: any): Promise<any> {
    return this.productRepository.getProductById(id);
  }
  async insertProduct(product: any): Promise<any> {
    return this.productRepository.insertProduct(product);
  }
  async searchProduct(pageIndex:number,pageSize:number, search_content:string): Promise<any> {
    return this.productRepository.searchProduct(pageIndex, pageSize, search_content);
  }

  async updateProduct(product: any): Promise<any> {
    return this.productRepository.updateProduct(product);
  }

  async deleteProduct(id: any): Promise<any> {
    return this.productRepository.deleteProduct(id);
  }
}
