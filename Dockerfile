FROM public.ecr.aws/lambda/nodejs:18-x86_64

# set working dir (LAMBDA_TASK_ROOT is provided by base but explicit is fine)
WORKDIR ${LAMBDA_TASK_ROOT}

# copy lockfile first to leverage layer cache
COPY package.json package-lock.json ./

# install production deps only (faster, smaller)
ENV NODE_ENV=production
RUN npm ci --omit=dev

# copy app source
COPY . .

# optional: remove dev files if any leftover
RUN rm -rf /root/.npm /tmp/*

# handler must export 'handler'
CMD [ "handler.handler" ]
