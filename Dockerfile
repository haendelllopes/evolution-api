FROM node:20-alpine

# Install dependencies
RUN apk add --no-cache curl bash python3 make g++ git

# Create app directory
WORKDIR /app

# Clone and build Evolution API from source
RUN git clone https://github.com/EvolutionAPI/evolution-api.git . && \
    npm install --ignore-scripts && \
    npm run build

# Copy configuration
COPY evolution-config.json /app/

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080
ENV SERVER_URL=https://evolution-api-whatsapp.onrender.com
ENV LOG_LEVEL=ERROR
ENV CORS_ORIGIN=*

# Authentication - will be set by Render
ENV AUTHENTICATION_API_KEY=${AUTHENTICATION_API_KEY}

# Instance configuration
ENV INSTANCE_DEFAULT_NAME=navigator-whatsapp
ENV INSTANCE_DEFAULT_QR_CODE=true
ENV INSTANCE_DEFAULT_READ_MESSAGES=true
ENV INSTANCE_DEFAULT_READ_STATUS=true

# Disable database completely
ENV DATABASE_ENABLED=false
ENV DATABASE_PROVIDER=""
ENV DATABASE_CONNECTION_URI=""
ENV DATABASE_CONNECTION_URI_POSTGRES=""
ENV DATABASE_CONNECTION_URI_MONGODB=""
ENV REDIS_ENABLED=false
ENV REDIS_URI=""

# Disable all storage
ENV STORE_MESSAGES=false
ENV STORE_CONTACTS=false
ENV STORE_CHATS=false
ENV STORE_PRESENCE=false
ENV STORE_SETTINGS=false

# Webhook configuration
ENV WEBHOOK_GLOBAL_URL=https://hndll.app.n8n.cloud/webhook/evolution-webhook
ENV WEBHOOK_GLOBAL_ENABLED=true
ENV WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=false
ENV WEBHOOK_GLOBAL_EVENTS="MESSAGES_UPSERT,MESSAGES_UPDATE,MESSAGES_DELETE,SEND_MESSAGE,CONTACTS_SET,CONTACTS_UPSERT,CONTACTS_UPDATE,PRESENCE_UPDATE,CHATS_SET,CHATS_UPSERT,CHATS_UPDATE,CHATS_DELETE,GROUPS_UPSERT,GROUP_UPDATE,GROUP_PARTICIPANTS_UPDATE,CONNECTION_UPDATE,CALL,NEW_JWT_TOKEN"

EXPOSE 8080

CMD ["node", "dist/src/main.js"]
