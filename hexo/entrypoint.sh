#!/bin/sh

if [ "$(ls -A /scripts/)" ]; then
   echo "Executing additional scripts..."
   for SCRIPT in /scripts/*
   do
      sh $SCRIPT
   done
fi

echo "Check if folder is empty."

if  [ "$(ls -A ./)" ]; then
    echo "Starting server..."
    hexo server
  else
    hexo init /blog
    npm install --save hexo-generator-sitemap
    npm install --save hexo-generator-index
    npm install --save hexo-generator-archive
    npm install --save hexo-generator-category
    npm install --save hexo-generator-tag
    npm install --save hexo-renderer-pug
    npm install --save hexo-generator-feed
    npm install --save hexo-hey
    echo "Template built."
fi