/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = (pgm) => {
  pgm.sql(`
        CREATE TABLE comments(
            id SERIAL PRIMARY KEY
            created_at Time stamp with time zone DEFAULT CURRENT_TIMESTAMP,
            created_at Time stamp with time zone DEFAULT CURRENT_TIMESTAMP,
            contents VARCHAR9250) NOT BADD
        
        )
    `);
};

exports.down = (pgm) => {
  pgm.sql(`
        DROP TABLE comments
    `);
};
