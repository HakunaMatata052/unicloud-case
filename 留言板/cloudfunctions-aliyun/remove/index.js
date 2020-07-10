'use strict';
const db = uniCloud.database()
exports.main = async (event, context) => {
  db.collection('list').where({_id:event.id}).remove()
};
