Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB86C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6VQVxWPrKSBA2sbYaQf9GploMxfJIkFBHTbYFWvLtg=; b=CMx0NvtwTPIUPt3mku23F+pmSg
	94bt4XCO//1Pbzde80UlP/Rav+dmPfucoA7A+LbHFNxMZbVq9oL1ksvEUkG6Mn3SJcg6d/NAW2kX3
	dzWMw5xA3f3r7A2J+R8ULywFESLcXmpWr8PllpLJzV2KXGDznHXUSIraJ4sabFJx90qY9JOBA7uQS
	A6H6FexBRnp2zim6ZU462BPJUnbN5QHBYRhzV1sukVapUwUx0/k+nRerttvtdLDu2ekYqWHqcfsRy
	ie/t8dYdQFDz55XOGWFzRR/o2iXJ7Vfq2X07WT3V3WF1nOyLKBSbcca5IFJ31v79+0mxRgsr67/Ww
	JXH6qTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5P0-000000064IR-3XH5;
	Tue, 24 Jun 2025 15:17:38 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45K-00000005n68-127L;
	Tue, 24 Jun 2025 13:53:15 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32ae3e94e57so36127491fa.1;
        Tue, 24 Jun 2025 06:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773192; x=1751377992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6VQVxWPrKSBA2sbYaQf9GploMxfJIkFBHTbYFWvLtg=;
        b=Yf+Ak+nz46gs0anFzXRBKR2r/0m1BGGvEB6avdBd2VFMJ26u3YtTmbjivGVlrDglp3
         2dGfKvkomuZJvxpqYY5KH8anfJ7/Hw1YvSCJm+veNPl/chdKtWzgtT73UIOoeQ1J0fsO
         xDnl6W3eD5e6twvGZEow0+djDaRN3m1NhmAw9kQZ+rZcIUPEGpgrUWIbkvxJhTe7kr6D
         WuVY4IsU/Yl05ZNubbGfV3aDMJ7U7/ON+g/gp+XMfHemZNvkkqLCiK/yv5SnWivPn2QT
         1E35OK0ivTQ+m6ftMJuK2oE0KkaJkmz3KNsDvsvSCRtDuDPr/ZLWCp+KSlS18ocRcdi3
         mlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773192; x=1751377992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6VQVxWPrKSBA2sbYaQf9GploMxfJIkFBHTbYFWvLtg=;
        b=GDJOe9EH2XdFaK25HAM1A1P8MPzRDViyCnKN893Me+bK//MBYXunCZniQWw6s7491F
         AaL7hCPVS2F/lKsRR/iUS95WVnn0a6xcUtQTxbOabledtM7iVQBiKkNFWEikIic5dmFX
         ZHgwRvgb4mevMYrCEB4fz9HNDBK6PkkRjkNoAUF97B6pmMB5koCQs5ZuoUu93MhqWz93
         Gskz+5bqrl/N3o640Mlro8CxtCQwzFZrBRuEAn4iZD5nOkxmDHwzPdkdhhTes7icG8n+
         HUcqWc2koZaabTx92AQ9lk+uq+g49G2ZKESscj8sjx2/Tg3vlp0AY1MLJGdiKY+U4jaR
         m3qg==
X-Forwarded-Encrypted: i=1; AJvYcCUOvHVEvQBCIVm1ffwEtoVlgK1epoNgb+fOa0vtX0v8ZTiT14eTo+w3ziUShYxxvLfRwSa1y2kHeOLu140uKAVfLg==@lists.infradead.org, AJvYcCUVqPrWM2wDDMnB0qlFg9J3UeL5cm5GmZclGsrm3tyj9iu/4CkTTdHgJJ2EhNWehBkHjedLorD0mnyepSrq@lists.infradead.org
X-Gm-Message-State: AOJu0YyGu6jirCT6lcf/8Ymjx7WJ/ljX4Kg+ycwxCggBCZFwIGH/1Xof
	gowQ8bmfBzc7zjZZDZHsF2jWOqYsirg7aA4g/fEmelsVkChriq0SLluE
X-Gm-Gg: ASbGnctZaXmNJQp9VssshlgLIrCR7hF8QQPp0OoUZ4reAOZBmsHRNHJJHizZut4Xp04
	Tt0G7C+H/sNtRzjwjwUCNK4Xg9fQ5mRQupolEvpZugCGAYiwWL3SYJmoLn7im9kTQ6/SpyDcZQQ
	3WFS+yTvAKpl/JOlIUndZyNjTKt2VD8GmLQyIXmkH658bUVWCkrCCQ6Ir5eCLm2ot+7opcxA2/Q
	RpxLs+ATiR9aUe/SA7+aJR5Yg0BzEVGQL8qTzpa5oeQn9C7lDtGJJCUfmI0oXvyUhOdsFd79Y7O
	eDf5TE1lsxDAeqTWcfqRheFOY/Oj73lawUOrm8VxLqWbNSVTtmgOVw7YQyuLDEMlmbOziEEkfHR
	200IygMsKNCyQ1bMDP8ws4Cp+leJuNbyVfJ1Jy3xkk2Ep1N7JAQrgNeHkAccFiEUOxBpo0tAO
X-Google-Smtp-Source: AGHT+IFDQOmpu2KqgvgKBvVUGcsKCyKXlJo6cbGYkD0fUpbKYOofU/NED/QQobHL/74ty7DfuDhAhA==
X-Received: by 2002:a05:651c:4102:b0:32b:3879:ce7f with SMTP id 38308e7fff4ca-32b98c930f3mr28231231fa.0.1750773191996;
        Tue, 24 Jun 2025 06:53:11 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:11 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 06/22] crypto: amlogic - Drop status field from meson_flow
Date: Tue, 24 Jun 2025 16:51:58 +0300
Message-Id: <20250624135214.1355051-7-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065314_287727_6B4E6BF4 
X-CRM114-Status: GOOD (  16.02  )
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

This field is used only to check for timeout. But there is more
convenient way to achive the same goal.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 13 +++++++++----
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 -
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 --
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 18e9e2d39b1f..dc0b100c5de2 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -219,13 +219,18 @@ static int meson_cipher(struct skcipher_request *areq)
 	}
 
 	reinit_completion(&mc->chanlist[flow].complete);
-	mc->chanlist[flow].status = 0;
 	meson_dma_start(mc, flow);
-	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
-						  msecs_to_jiffies(500));
-	if (mc->chanlist[flow].status == 0) {
+
+	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
+							msecs_to_jiffies(500));
+	if (err == 0) {
 		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
 		err = -EINVAL;
+	} else if (err < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
+	} else {
+		/* No error */
+		err = 0;
 	}
 
 	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 44e71e917e5e..9259ad0417d1 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -53,7 +53,6 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
 			if (meson_dma_ready(mc, flow)) {
-				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index cb70277c3a31..0dde7662ae37 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -59,7 +59,6 @@ struct meson_desc {
  * @engine:	ptr to the crypto_engine for this flow
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
- * @status:	set to 1 by interrupt if task is done
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
@@ -68,7 +67,6 @@ struct meson_desc {
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
-	int status;
 	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
-- 
2.34.1


