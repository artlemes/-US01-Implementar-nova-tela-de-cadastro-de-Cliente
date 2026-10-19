import { NestFactory } from '@nestjs/core';
import { BadRequestException, ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
      whitelist: true,
      exceptionFactory: (errors) => {
        const messages = errors.flatMap((e) => Object.values(e.constraints ?? {}));
        return new BadRequestException(messages.join('; '));
      },
    }),
  );
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();