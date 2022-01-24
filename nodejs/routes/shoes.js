const express = require('express');
const router = express.Router();
const shoes = require('../services/shoes');

router.post('/get-multi', async function(req, res, next) {
  try {
    res.json(await shoes.getMultiple(req.query.page));
  } catch (err) {
    console.error('Error while getting shoes', err.message);
    next(err);
  }
});

module.exports = router;