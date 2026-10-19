import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { UserService } from './user.service';
import { User } from './user.entity';
import { CreateUserInput } from './create-user.input';

@Resolver()
export class UserResolver {
    
    constructor(private readonly userService: UserService) {}

    @Query(() => [User])
    users(): Promise<User[]> {
        return this.userService.findAll();
    }
    @Mutation(() => User)
    createUser(@Args('input') input: CreateUserInput): Promise<User> {
        return this.userService.create(input);
    }
}
