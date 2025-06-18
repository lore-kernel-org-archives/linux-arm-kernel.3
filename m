Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EC9C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaZUxZfR4LVFlXZ9G/sKKJWMQAC209gl7LEnCa9qfYw=; b=PQc2E6JctYyBSHFJtzzeCiFA1H
	Ab5ohDYIEzWEhEBIS0GWE7xmRjXgru5F1Eilm+4qZQCzbr+oQcI0AgL7CZdiLtT/PkRQzZvCbgUr4
	x6EvDuA4xuyM2tD1Wl8jEHSMMZcW8Itj2NM0crEo0Mvhk5o4bH1fjudR+SreU0QK2jQaAKJw6mqJp
	hKa/6lXQp11PxRJjKhYqYGH96lcQ4Z6V4sTuQ3vzecN9GZMHgVZeWjvWZHrtqob7WnNVtQTbw+WZL
	XoImgQaFdqdeiIt2oV1QR8n+vr6JVKLgOrHCFnqQYEvTznTrQdhMe/dM/l6hXEzS9zClnnQNkKGEo
	Yy5x4jrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpks-00000009j7Q-3gWu;
	Wed, 18 Jun 2025 10:10:54 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpZs-00000009gIQ-3Rq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:33 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so10586338a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240771; x=1750845571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaZUxZfR4LVFlXZ9G/sKKJWMQAC209gl7LEnCa9qfYw=;
        b=fWrpQey9ztihAMq3YedBjb9Daz/OYy2dCaeEHpPDGhf+EKq5C2vwxBas5XaE9JYELH
         zGKPl9zO+zWiM02j5K7epKNIiCnpAAE6rFIbF8c1iRYtp/vQOTU2Zc4ihxDk9rCmSCZg
         uZHn4WZcE0JfNTNv1wWZGY2lRKbxf4GtzUqoEOwg29GEQKRv9yUVnwb60M7zAwbLvDKT
         NCZrbdnRk/7ktN5bSs71Oac2/+XgJ+KbZuEVnZFJEbgpuV2nyqV9OVLAJYPqLzM6k2/T
         nOaUjZp+3H6nChil0sCaslkZpk3heqTtKjdkjq5UcfR97JLpWkxYhMl9KcmP3VXRcWGk
         sgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240771; x=1750845571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaZUxZfR4LVFlXZ9G/sKKJWMQAC209gl7LEnCa9qfYw=;
        b=PkU4RjM/a9mUGEkohRo873vbXzB0m+Pg1ObSX62dCbwei4FodSeaqp5PrM7O6dVE0+
         ZxrDPuqULcAD5FpHZHfFSYJ8dZfZ02sBFps5cBZ+SvrqTak/rQkVwOT00XkfmD/C2NW8
         TvR3sZnv8lJkHoVzXz8ix/9JPOYBTZHVeSrzTdft2jdlQEDKxLdJD3NN7W/vWhAPmL8R
         ee7PQXb78UzZxkakqehweZEcBqSuyfNFdgXbgFWtXLC4qubVXb46idWP/vsrTmKPtdh0
         eZMaYzxzT6JkP31j3PQsALNxbhKF4XDt1gpwqxyufR0SWoRKYf8G7bAqO8MjcISi1nMa
         dgcw==
X-Forwarded-Encrypted: i=1; AJvYcCVF/A9DTVYKOwUudL5heflUHMBEBMq4EWyj7U/+vuYvy14sKpuxbE9zn4TrDZpYsOqixrDYKDL0VQMvO2hHKPj5@lists.infradead.org
X-Gm-Message-State: AOJu0YxxSDWAzs5HogX8ol6v0j0QcwwiF/n1PiFsuv8tbFKaFNzRV0tJ
	zqfXyMii2eHZZgdS6gkpLJDswNhIOeRgio27FQk9rOhjlmdnLPV4eD+K
X-Gm-Gg: ASbGncsVbftQnFzgKWdUwuARNF4odazS5Wyae+Wy/jzPHm+Ao6i2zRD4nmX90SotObt
	GV7+j1kcmhDoI0IzYRWxZNKG5NiyzefcPO6HRYtL/KWCfCIkLTJSv9LvL/9liNBzg/elor6AcEz
	IHSun/BzdgXsJ2rCRsrw/NMjPwd2VQfUDpNIu+RyoJW8CvIyFr2jMolH71WB8KL+scveQgo5XqD
	hrNGX1O2qykBZAKqbX9mp7psJKgz6DUsApjs1Gl+2PWbIoQLW5moClDh4ayTE2zINyzoKzp6rkt
	RM/h/jNn3rF/HDR1bbEyR+pifSucPQUz2mkO8Ro+jZTkW178IDoFCraCJKXBgRaQ3WdaJBf52JM
	=
X-Google-Smtp-Source: AGHT+IHfnf3VtoJ26EFASDqtQTxgpRHeuZi+Y25r3DCIec5bB40siKeSLecbTcKf5YnOXIgJqGFk+w==
X-Received: by 2002:a05:6402:350e:b0:607:1c07:727d with SMTP id 4fb4d7f45d1cf-608d09b8ec8mr13802281a12.23.1750240770954;
        Wed, 18 Jun 2025 02:59:30 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:30 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: [PATCH v4 01/19] media: mc: Add INTERNAL pad flag
Date: Wed, 18 Jun 2025 12:58:37 +0300
Message-ID: <20250618095858.2145209-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025932_862068_C8779F2D 
X-CRM114-Status: GOOD (  19.42  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
Internal source pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
 drivers/media/mc/mc-entity.c                           | 10 ++++++++--
 include/uapi/linux/media.h                             |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..f55ef055bcf8 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. Such a pad shall not be connected with a link.
+
+	  The internal flag may currently be present only in a source pad where
+	  it indicates that the :ref:``stream <media-glossary-stream>``
+	  originates from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582..d1feacc60807 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		iter->index = i++;
 
 		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+					     MEDIA_PAD_FL_SOURCE)) != 1 ||
+		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
+		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1120,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1151,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..80cfd12a43fc 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.49.0


