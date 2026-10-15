import { ConflictException, Injectable } from '@nestjs/common';
import { User } from './user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm/repository/Repository.js';
import { CreateUserInput } from './create-user.input';
import * as bcrypt from 'bcrypt';


@Injectable()
export class UserService {

    constructor(
        @InjectRepository(User) private readonly repo: Repository<User>,
    ) {}

    getHello(): string {
        return 'Olá, eu sou o user service!';
    }

    findAll(): Promise<User[]> {
        return this.repo.find();
    }

    async create(input: CreateUserInput): Promise<User> {
        const alreadyExists = await this.repo.findOne({ where: { email: input.email } });
        if (alreadyExists) {
            throw new ConflictException('Email já cadastrado');
        }
        const hash = await bcrypt.hash(input.password, 10);
        const user = this.repo.create({ ...input, password: hash });
        return this.repo.save(user);
    }
}
