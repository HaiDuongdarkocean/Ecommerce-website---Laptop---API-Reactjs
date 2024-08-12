import { Request, Response } from "express";
import { injectable } from "tsyringe";
import { v4 as uuidv4 } from "uuid";
import { ProductService } from "../services/productService";

@injectable()
export class ProductController {
  constructor(private productService: ProductService) {}
  async getProductAll(req: Request, res: Response): Promise<void> {
    try {
      const data = await this.productService.getProductAll();
      data && data.length > 0
        ? res.json(data)
        : res.json({ message: "Unable to get the list" });
    } catch (error: any) {
      res.json({ "controller message": error.message });
    }
  }
  async getProductById(req: Request, res: Response): Promise<void> {
    const id = req.params.id;
    const product = await this.productService.getProductById(id);
    product
      ? res.json(product)
      : res.json({ message: "The object you want to find doesn't exist" });
  }
  async insertProduct(req: Request, res: Response): Promise<void> {
    try {
      const id = uuidv4();
      const infoProductObject = req.body as {
        name: any;
        description: any;
        version: any;
        color: any;
        product_type: any;
        price: any;
        stock: any;
        category_id: any;
        image_url: any;
      };
      const InfoProductArray = Object.values(infoProductObject);
      const product = [id, ...InfoProductArray];
      await this.productService.insertProduct(product);
      res.json({ message: "The product has been successfully inserted" });
    } catch (error: any) {
      res.json({ message: error.message });
    }
  }
  async searchProduct(req: Request, res: Response): Promise<void> {
    try {
      const object = req.body as {
        pageIndex: number;
        pageSize: number;
        search_content: string;
      };
      const data: any = await this.productService.searchProduct(
        object.pageIndex,
        object.pageSize,
        object.search_content
      );
      if (data) {
        res.json({
          totalItems: Math.ceil(
            data && data.length > 0 ? data[0].RecordCount : 0
          ),
          page: object.pageIndex,
          pageSize: object.pageSize,
          data: data,
          pageCount: Math.ceil(
            (data && data.length > 0 ? data[0].RecordCount : 0) /
              (object.pageSize ? object.pageSize : 1)
          ),
        });
      } else {
        res.json({ message: "No search results.", success: true });
      }
    } catch (error: any) {
      res.json({ message: error.message, success: false });
    }
  }

  async updateProduct(req: Request, res: Response): Promise<void> {
    try {
      const product = req.body as {
        id: any;
        name: any;
        description: any;
        version: any;
        color: any;
        product_type: any;
        price:any;
        stock:any
        category_id: any;
        image_url: any;
      };
      const arrayProduct = Object.values(product);
      await this.productService.updateProduct(arrayProduct);
      res.json({ message: "The product has been successfully updated", success: true });
    } catch (error: any) {
      res.json({ message: error.message, success: false });
    }
  }

  async deleteProduct(req: Request, res: Response): Promise<void> {
    try {
      const id = req.params.id;
      await this.productService.deleteProduct(id);
      res.json({ message: "the product has been successfully deleted", success: true });
    } catch (error: any) {
      res.json({ message: error.message, success: false });
    }
  }
}
