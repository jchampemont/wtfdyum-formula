#!/bin/bash
java -jar wtfdyum-{{ wtfdyum.version }}.jar --wtfdyum.twitter.appId={{ wtfdyum.appId }} --wtfdyum.twitter.appSecret={{ wtfdyum.appSecret }} --wtfdyum.server-base-url={{ wtfdyum.url }}