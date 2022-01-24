const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getMultiple(page = 1){
  const offset = helper.getOffset(page, config.listPerPage);
  const rows = await db.query(
    'SELECT s.id, s.id_category, c.name AS name_category, s.title, s.subtitle, s.price, s.discount, s.description FROM shoes s' +
    ' INNER JOIN categories c ON s.id_category=c.id' +
    ' LIMIT ?,?', 
    [offset, config.listPerPage]
  );
  const data = helper.emptyOrRows(rows);
  const meta = {page};

  return {
    data,
    meta
  }
}

module.exports = {
  getMultiple
}