import { Router } from "express";
import 'reflect-metadata';
import productRouter from "./productRouter";
import userRouter from "./userRouter";

const router = Router();

router.use('/products', productRouter);
router.use('/user', userRouter);

export default router