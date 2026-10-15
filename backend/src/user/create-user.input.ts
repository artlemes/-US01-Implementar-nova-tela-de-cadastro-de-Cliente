import { InputType, Field } from '@nestjs/graphql';
import { IsEmail, isString, MinLength } from 'class-validator';
import { Transform } from 'class-transformer';


@InputType()
export class CreateUserInput {
  @Field()
  @MinLength(2)
  name: string;

  @Field()
  @IsEmail()
  @Transform(({ value }) => isString(value) ? value.trim().toLowerCase() : value)
  email: string;

  @Field()
  @MinLength(6)
  password: string;

  @Field()
  @MinLength(2)
  endereco: string;
}