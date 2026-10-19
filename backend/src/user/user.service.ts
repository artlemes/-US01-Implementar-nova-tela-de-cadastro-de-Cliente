import { ConflictException, Injectable } from '@nestjs/common';
import { User } from './user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserInput } from './create-user.input';
import * as bcrypt from 'bcrypt';


@Injectable()
export class UserService {

    constructor(
        @InjectRepository(User) private readonly repo: Repository<User>,
    ) {}


    findAll(): Promise<User[]> {
        return this.repo.find();
    }

    async create(input: CreateUserInput): Promise<User> {

        //constantes de validação
        const alreadyExists = await this.repo.findOne({ where: { email: input.email } });
        
        //validações
        if (alreadyExists) {
            throw new ConflictException('Email já cadastrado');
        }

        //criptografando a senha do usuário
        const hash = await bcrypt.hash(input.password, 10);
        const user = this.repo.create({ ...input, password: hash });
        return this.repo.save(user);
    }
}
