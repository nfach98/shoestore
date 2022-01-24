const env = process.env;

const config = {
  db: {
    host: env.DB_HOST || '101.50.1.56',
    user: env.DB_USER || 'ninofach_admin',
    password: env.DB_PASSWORD || '7lr5ehcw?$o=',
    database: env.DB_NAME || 'ninofach_shoestore',
  },
  listPerPage: env.LIST_PER_PAGE || 12,
};


module.exports = config;