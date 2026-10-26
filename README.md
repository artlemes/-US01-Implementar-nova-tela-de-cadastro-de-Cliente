# [US01] - Cadastro de usuário

Tela de cadastro de usuário.

## Tecnologias
- **Back-end:** Node.js, NestJS, GraphQL, PostgreSQL, TypeScript
- **App:** Dart, Flutter

## Descrição do sistema
Tela de cadastro, com validação de campos no frontend e no backend
Banco de dados relacional local com hash na senha através da lib bcrypt

## Como rodar

1. `cp .env.example .env`
2. `docker compose up -d`
3. `cd backend && npm install && npm run start:dev`
4. `cd app && flutter pub get && flutter run`
