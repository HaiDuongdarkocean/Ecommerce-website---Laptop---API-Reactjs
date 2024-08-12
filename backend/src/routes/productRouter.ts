import { Router } from "express";
import { container } from "tsyringe";
import { ProductController } from "../controllers/productController";

const productRouter = Router();

// Why is container.resolve() ?
const productController = container.resolve(ProductController);

productRouter.post('/insert', productController.insertProduct.bind(productController));
productRouter.post('/search', productController.searchProduct.bind(productController));
productRouter.get('/get-all', productController.getProductAll.bind(productController));
productRouter.get('/getbyid/:id', productController.getProductById.bind(productController));
productRouter.post('/update', productController.updateProduct.bind(productController));
productRouter.get('/delete/:id', productController.deleteProduct.bind(productController));
export default productRouter;