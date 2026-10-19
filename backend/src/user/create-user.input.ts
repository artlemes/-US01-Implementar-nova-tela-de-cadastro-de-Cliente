import { InputType, Field } from '@nestjs/graphql';
import { IsEmail, isString, MinLength } from 'class-validator';
import { Transform } from 'class-transformer';


@InputType()
export class CreateUserInput {
  @Field()
  @MinLength(2, { message: 'Nome deve ter pelo menos 2 caracteres' })
  name: string;

  @Field()
  @IsEmail({}, { message: 'Email inválido' })
  @Transform(({ value }) => isString(value) ? value.trim().toLowerCase() : value)
  email: string;

  @Field()
  @MinLength(6, { message: 'Senha deve ter pelo menos 6 caracteres' })
  password: string;

  @Field()
  @MinLength(2, { message: 'Endereço deve ter pelo menos 2 caracteres' })
  endereco: string;
}