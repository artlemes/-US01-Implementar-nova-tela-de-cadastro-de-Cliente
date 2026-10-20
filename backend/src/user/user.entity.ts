import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';
import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
@Entity()
export class User {
    
  @Field(() => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Field()
  @Column({ length: 100 })
  name: string;

  @Field()
  @Column({ unique: true, length: 250 })
  email: string;

  //Não tem o decorador @Field() no password, pois não queremos expor a senha no GraphQL
  @Column({ length: 255 })
  password: string;

  @Field()
  @Column({ length: 250 })
  endereco: string;
}