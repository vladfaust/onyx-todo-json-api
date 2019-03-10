-- +migrate up
CREATE TABLE items (
  id          SERIAL      PRIMARY KEY,
  completed   BOOLEAN     NOT NULL  DEFAULT false,
  content     TEXT        NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL  DEFAULT now(),
  updated_at  TIMESTAMPTZ
);

CREATE INDEX items_completed  ON items (completed);
CREATE INDEX items_created_at ON items (created_at);

-- +migrate down
DROP TABLE items;
