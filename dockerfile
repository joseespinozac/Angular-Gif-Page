# Imagen base con node instalado por defecto con alias #
FROM node:14.2.0-alpine3.11 as build
WORKDIR /app

# Se instala el cliente de angular, se instalan los modulos y se corre el constructor con ng build#
# Se copia el package.json y los archivos del proyecto #
RUN npm install -g @angular/cli

COPY ./package.json .
RUN npm install
COPY . .
RUN ng build

# Imagen base con nginx instalado por defecto con alias#
FROM nginx as runtime
# Se copian los archivos de la aplicacion de angular en la carpeta html de nginx #
COPY --from=build /app/dist/gif-page-angular /usr/share/nginx/html
