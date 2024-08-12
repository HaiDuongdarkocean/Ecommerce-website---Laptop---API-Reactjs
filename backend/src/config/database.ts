import { injectable } from 'tsyringe';
import { Pool, PoolConnection, createPool } from 'mysql2/promise';
import { config } from './config';

// Configure the connection of MySQL80
const connectionConfig = {
    host: config.db.host,
    port: config.db.port,

    /* Bug---------------------
        ! I type `username`
        ? replace `username` to `user`
    ** -------------------*/
    user: config.db.username,
    password: config.db.password,
    database: config.db.database
};

@injectable()
export class Database {
    // connection pooling
    private pool: Pool;
    constructor() {
        // create connection pooling
        this.pool = createPool(connectionConfig);
    }
    public async query(sql: string, values: any[]): Promise<any> {
        let connection: PoolConnection | null = null;
        try {
            connection = await this.pool.getConnection();
            const [results] = await connection.query(sql, values)

            /* Bug---------------------
                // ! {"message": "(intermediate value) is not iterable"}
                ? I don't return results
            ** -------------------*/
            return results;
        } catch (error) {
            throw error;
        } finally {
            if (connection) {
                connection.release();
            }
        }
    }
}