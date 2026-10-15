import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';
import { ObjectType, Field, ID } from '@nestjs/graphql';

@ObjectType()
@Entity()
export class User {
    
  @Field(() => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Field()
  @Column()
  name: string;

  @Field()
  @Column({ unique: true })
  email: string;

  //Não tem o decorador @Field() no password, pois não queremos expor a senha no GraphQL
  @Column()
  password: string;

  @Field()
  @Column()
  endereco: string;
}