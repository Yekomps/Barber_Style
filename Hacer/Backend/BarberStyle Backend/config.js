import { config } from "dotenv";
config();

export const PORT_INDEX  = process.env.PORT_INDEX || 3000;
export const PORT_SERVER  = process.env.PORT_SERVER || 3001;
export const USER = process.env.USER;
export const PASSWORD = process.env.PASSWORD;
export const DBCLUSTER = process.env.DBCLUSTER;
export const COLLECTION = process.env.COLLECTION;
export const DBNAME = process.env.DBNAME;
export const IDDB = process.env.IDDB
export const HOST_POSTGRES = process.env.HOST_POSTGRES;
export const USER_POSTGRES = process.env.USER_POSTGRES;
export const PASSWORD_POSTGRES = process.env.PASSWORD_POSTGRES;
export const DATA_BASE_POSTGRES = process.env.DATA_BASE_POSTGRES;
export const PORT_POSGRES = process.env.PORT_POSGRES || 5432;

export const MONGO_URI = `mongodb+srv://${USER}:${PASSWORD}@${DBCLUSTER}.${IDDB}.mongodb.net/`