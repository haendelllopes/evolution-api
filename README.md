# Evolution API - WhatsApp Ilimitado

**Repositório dedicado para Evolution API** - WhatsApp ilimitado e gratuito para o Navigator.

## 🚀 Deploy no Render

### Configuração automática
Este repositório está configurado para deploy automático no Render:

- **Dockerfile:** Configurado para Evolution API
- **render.yaml:** Configuração automática do Render
- **Variáveis de ambiente:** Pré-configuradas

### Deploy
1. Acessar: https://render.com
2. New → Web Service
3. Connect GitHub → `haendelllopes/evolution-api`
4. Deploy automático

## 📱 Uso

### Endpoints principais
- **Health:** `GET /manager/health`
- **Create Instance:** `POST /instance/create`
- **Send Message:** `POST /message/sendText/{instance}`
- **Connection State:** `GET /instance/connectionState/{instance}`

### Configuração WhatsApp
1. Criar instância: `navigator-whatsapp`
2. Escanear QR Code
3. Configurar webhook N8N

## 🔗 Integração

### N8N
- Webhook: `https://hndll.app.n8n.cloud/webhook/evolution-webhook`
- Credential: Evolution API Navigator

### Navigator (Vercel)
- Endpoints: `/api/webhooks/evolution/send-message`
- Variáveis de ambiente configuradas

## 📊 Vantagens

- ✅ **Gratuito** - Sem custos de mensagem
- ✅ **Ilimitado** - Sem limites de envio
- ✅ **Brasileiro** - Suporte em português
- ✅ **Auto-hospedado** - Controle total dos dados
- ✅ **Webhooks** - Integração fácil com N8N

---

**Navigator** - Sistema de Onboarding com IA via WhatsApp 🚀
