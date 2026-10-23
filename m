Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E260A2602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xvyqljqq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gpFNv2hy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=; b=XvyqljqqOXoMQG
	x7cd6XlMwr8o+ql7xCbVh9Ut8vPPRNbIaTTz3qK/d9etRVQ6Y/ui7O56KcrACabA6BvURHqpj8bY7
	z0YfjW4H4vLZBofPX55CfT1Gpx5aQeiLEx84HRUb735J0gTt00ePH1PlBX+/vRXtIld5Sv1poU8ik
	STYH1k9dAMbR4CvcMwLC3L0tm11AXytX1hwh5zh7WzkMLxXPTvNnn7hSEo9Uh/9fpzBGfwE3SIBMi
	HzGUNT5B7wkLC1dW/fPiCa6KCDEb48c+WqI+72LT9yfwyZgkXkaIstIjBjgwU6noBvAggEsMygKcG
	/G9FXarQD5nKEBNidRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wZ-0000000FbKA-2Yga;
	Fri, 23 Oct 2026 06:39:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wO-0000000FbDL-1QQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:39:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48bbb06e746so216737f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737587; x=1793342387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=gpFNv2hyJD2P8KnqztuA3B60aCvr7SiHrnZeHir4LhICNRiebotdG7yqa4FmIdzsjB
         6veDD7MuKKxT7/Q3HcTVfpEH/N4EPW6Ya+edh2rpjSD0wpVcvJBQwKPoc/KR6UyQvuZN
         OqLJFNegSPKhYuxiMdKzHkRyaDr5oMXZVUjaOeSQPSJscZE28U0f8lSgXJBodLZAgSeb
         XhqGTK4zIBjZ3ylpx5BkIbj0MUQ2P6p+ASFW7ze/8jJ2AccoH8oOjUkQN4ACVBVn2zfR
         UzJExNEzyW5jTh5DJXFvfLAPTI/96IJPVMHRBtDJ8DwaM/eDfUwxZOajNGgOCQs1c5y4
         fmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737587; x=1793342387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=rRcxU6hQGL2IHkutld/5tMWJt3rPR8EwbXPE4iWwvax2ql2pt93knJq3OlVKDnfdOb
         iNL66cbtRiV3TtoELeGwarEHfa2UorpOEmUfKTGF/f88amWo0k+MoShDBrU5hJE8WX8M
         yUxhFIA4T0Envm7ysPgT4uH+1X3IdwFvf1ZnNqCFl/bBNNkdEOkHJtvalxCNAjfH1AYJ
         qtsmIsw2sMNnZyrEjkX6WphOzVPohviDmkc2au7RJraNWph6VZFjlZrvrdQJADTnOS87
         4+m3Xi75gxNHbOEcPbFhEbO7aSiLwHKZUp6G3xA81VOW9HEFnzi5yIIg2kRxz/5ywiP+
         kRHA==
X-Gm-Message-State: AFq9FYI3kIHTZkPJP8LHhO5cGLnFNXM0oTN293QdsYXYHPGXgcgnfch3
	AgODEvQWQXJmNxdFcJ72Mf/wlDAuYHl6pqBGiBIFzVrtANBSVvyiL312
X-Gm-Gg: AYBFou2hZ6DjSTy1kq6gOr/trFSUmpEJJg1HOcAWIvpIBCge6x7ofp3B5g7MN7nJ7HR
	OgE3VkKSkHODg7iFnqLG1aca0lYEcVNyKst9pqviPJBUGj69jDmw4e/+eFeQBkp7rd0FtAH6vo2
	gYR2bk59IKYUvXuxelK6/j9M67CLK6FVuG8pxKe97tKDU979+KYtBX8YciJdIhBrWLIBauFJ5Hg
	PbZnIlKUd1J7LLWcmFLlKyI6wY2YY9u80X04ezjpxtLc4jp1egKe1DRBQSsz4YDZLdZvVqqsEq3
	4A6upgq8h6vVLSNebyJCnox4LMAtsh9BY+vZI/Lmbn6MpJq+QnIaamrUjFa1KojC6uSGoe25P96
	+pGaJNvo0n96GONRg8c6wuhuCT2P7Hn0xV67LiXdpRmhodO4VBUTOp6LZJA+oNCj2OK2EzAhk5I
	zwNlDAAWypVcKuiN9YXYdfeQ1Ow72GfRvAfwPeGR9gkx2l2bxa+5xxhcd/JKDivuKdjL+dZTYcD
	DfVeSumLjbedj9kEXYIgD5wyTOKlykOIGF1RSYqpPOm3SttAvMqvtbL/L1fm1dzvCF50NLbBCzG
	vYMTxYHM12c5WJv9SdaurbdGKe15sGVsnsgRCFy5dfBDvaSzuyN8HdnD7cCNdHPDuQFggkHzY4x
	hlSo=
X-Received: by 2002:a05:6000:41c9:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e384e4205mr1725429f8f.0.1792737586551;
        Thu, 22 Oct 2026 23:39:46 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:28 +0200
Subject: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233948_422220_B1C3B0B2 
X-CRM114-Status: GOOD (  14.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A firmware may drive the core's timers, which need their power domains
held; the remoteproc driver does not hold them, so let the DSP node
reference them for a driver that attaches to the running core to hold.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index d6319c8e96f8..80eaef0a19b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -76,6 +76,23 @@ properties:
 # Optional properties:
 # --------------------
 
+  power-domains:
+    description: |
+      Power domains of the SoC timers the running firmware ticks on and
+      times its work out with. The firmware programs these timers itself
+      and makes no power request for them, and the timers' own nodes are
+      reserved for it, so nothing else requests their power; a client
+      driver of the firmware holds them on while it drives the processor.
+      The processor's own power is managed through ti,sci-dev-id, not here.
+    items:
+      - description: power domain of the first timer
+      - description: power domain of the second timer
+
+  power-domain-names:
+    items:
+      - const: timer1
+      - const: timer2
+
   sram:
     minItems: 1
     maxItems: 4

-- 
2.54.0


