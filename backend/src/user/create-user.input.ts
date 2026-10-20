import { InputType, Field } from '@nestjs/graphql';
import { IsEmail, IsNotEmpty, MaxLength, MinLength } from 'class-validator';
import { Transform } from 'class-transformer';

const trim = ({ value }: { value: unknown }) =>
  typeof value === 'string' ? value.trim() : value;

@InputType()
export class CreateUserInput {
  @Field()
  @Transform(trim)
  @IsNotEmpty({ message: 'Nome de usuário é obrigatório' })
  @MaxLength(100, { message: 'Nome de usuário deve ter no máximo 100 caracteres' })
  name: string;

  @Field()
  @Transform(({ value }) =>
    typeof value === 'string' ? value.trim().toLowerCase() : value,
  )
  @IsEmail({}, { message: 'E-mail inválido' })
  @MaxLength(250, { message: 'E-mail deve ter no máximo 250 caracteres' })
  email: string;

  @Field()
  @MinLength(6, { message: 'Senha deve ter pelo menos 6 caracteres' })
  @MaxLength(50, { message: 'Senha deve ter no máximo 50 caracteres' })
  password: string;

  @Field()
  @Transform(trim)
  @IsNotEmpty({ message: 'Endereço é obrigatório' })
  @MaxLength(250, { message: 'Endereço deve ter no máximo 250 caracteres' })
  endereco: string;
}