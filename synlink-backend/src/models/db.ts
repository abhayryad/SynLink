import {Pool} from 'pg';

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'synlinkdb',
  password: 'Abhay@1312',
  port: 5432
});  

export default pool;