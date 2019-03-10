[![Built with Crystal](https://img.shields.io/badge/built%20with-crystal-000000.svg?style=flat-square)](https://crystal-lang.org/)
[![Travis CI build](https://img.shields.io/travis/vladfaust/onyx-todo-json-api/part-2.svg?style=flat-square)](https://travis-ci.org/vladfaust/onyx-todo-json-api)

This repository contains code from the [Creating JSON APIs with Onyx](https://blog.onyxframework.org/posts/creating-json-apis-with-onyx-part-1/) tutorial series blog posts. It is powered by [Crystal](https://crystal-lang.org/) and [Onyx Framework](https://onyxframework.org/). The code is split to branches in accordance to the tutorial parts:

1. [Part 1 — The First Endpoint](https://blog.onyxframework.org/posts/creating-json-apis-with-onyx-part-1/) ⎇ [part-1](https://github.com/vladfaust/onyx-todo-json-api/tree/part-1)
2. [Part 2 — CRUD](https://blog.onyxframework.org/posts/creating-json-apis-with-onyx-part-2/) ⎇ part-2 (current)

## Installation

0. Install Crystal. See the [installation instructions](https://crystal-lang.org/reference/installation/index.html).

1. Clone the repository:

```sh
> git clone https://github.com/vladfaust/onyx-todo-json-api && cd onyx-todo-json-api
```

2. Checkout to the `part-2` branch:

```sh
> git checkout part-2
```

3. Install dependenies:

```sh
> shards install
```

4. Add `DATABASE_URL` to `.env.development.local` file (you should have PostgreSQL instance running):

```
DATABASE_URL=postgres://postgres:postgres@localhost:5432/todo-onyx
```

5. Run the server:

```sh
> crystal src/server.cr
```

## Contributors

- [Vlad Faust](https://github.com/your-github-user) - creator and maintainer

## Licensing

This software is licensed under [MIT License](LICENSE).

[![Open Source Initiative](https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Opensource.svg/100px-Opensource.svg.png)](https://opensource.org/licenses/MIT)
