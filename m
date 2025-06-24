Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4156FC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wN4giaX3vmqVUZtbZtIjALAYwpEYzbdeOb30EYe4QKU=; b=BY31g3ES7CXg3mcy55ylmIqqqr
	Dd40re0iYnPnG2Ig2yACGKjdq5rNnXRMP1qY6ST2OI5KvnsY6vMUL4VcIZ0dukIrJFuVJE69YTwjn
	hHrM80vCbfTknZQNrwcbnVAMWVg8Vl/ok55xLcxqEIC/iZ+xOP1EEsJZejydmYjkvT3zh+RUG6mWg
	chy6E464tNvgZfIrOWU3wWhS+yoqb2miutSDRFoo5VE0/icCfP21EKa0ramoUi1d4ryxii/mlScEM
	yhUtUrvxba6egiEyVpKkxe9OZFH8t+Nblp+aoXCv4tbrms7fCjs+BOHw/pxY77GJdQGrPi5DAfLY6
	PH5bKnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5ID-000000062uA-1xEc;
	Tue, 24 Jun 2025 15:10:37 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45F-00000005n3H-1vUf;
	Tue, 24 Jun 2025 13:53:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso575063e87.1;
        Tue, 24 Jun 2025 06:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773188; x=1751377988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN4giaX3vmqVUZtbZtIjALAYwpEYzbdeOb30EYe4QKU=;
        b=a32Xbi8Nfri/uDOsFW6AGI01WYLTxFc8wn5jbsW6scgd1f95LumNF5HkVCkbGz2bbU
         TzPyzhofHOPLKAJp6QAAPAYniovRv0/KZaHaRU2zWycm4xC/PKsk/5JAc6yiofbvTHDB
         PW43gpPMyYBleaNQ/9MsAettbf/nefb8xsoT2cXlRYLuiy5gYLoOQwekDGhFhMRIoCPB
         bopvqrOyCAiGzsPharGTo3xUFxoifm2PUXRzzNDQlr5/46KsX9gKwD7ztxmnTwT0zvw9
         UbLQjHZQ168NRUvi46CN9pwESGeIg1i6zWAk84hNgq4nyNOMhfr+rcBd5letHX+/KXdI
         mERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773188; x=1751377988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wN4giaX3vmqVUZtbZtIjALAYwpEYzbdeOb30EYe4QKU=;
        b=wO/Ta9ODh2wL8hFS9Vk/sehAhxr3AqNOH23gBoMkVpqapKZdRexRzJdFwgSwDupq2u
         L9yVtATCQJvOx8zpCBF6N8alssDyQV33RpRtH2sBTkrVefqDYAnn8/Gd5nNfZM7OG3I1
         HWHoU3lWkPlSxf6lDA0xkJzXU+HA9GqaWXrvQ8w+D9PGU480V4GpbGecbO7tJoxYDx64
         CKeK0s7cpeOiB6N8XJSlcJS7Dwh5WfRnmM0xg9NMcgj2FvOYqKUQ428u3/Gu2J4rBmbT
         051BgpuLOQrAmZixUxWUs5k5Nzb8rfTWH6BwTOvOFSO0f0lPnz7751+jeiOwxu2sv4ZN
         mI9w==
X-Forwarded-Encrypted: i=1; AJvYcCVPa0xZmOCAhFDsIWq4l0X9hRHHJltljtJ77aPcWEV28Szrm1YVaRF8vPN1xm1VATOy926FaGsVyydtmLlw@lists.infradead.org, AJvYcCWrKQgKjjvUnM0ny++us+IoWIXR+UJ1T8aXhyP5HtZqzPxKang/U9plCpg2ng0F/kkSjiWZi++M7qxI9Ylrtlbrlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJH5o4I/afd2wgmfCbPqvnV78QQiLzF9q06ytZZ5KT6AYPfFQ
	rjlM7Z2MCRvnu9sB0mf67rJWyZb5cqj6QWsrmOGEdnYa5bkOCw4mp6AN
X-Gm-Gg: ASbGnctqeUprnOzBh/u+TBF92sd/7u568zcZuIRyycX5u9WNU1DQSgKHs9ozRnMQ74N
	ltjhpZE+wixBwMD7rXA4M8X8ntTUAdrOZ3uOvIBXDGpOtDv6JvvMhmPYLKa3SrTxuOaMtHQKZ8Q
	tnGWlVjE57peI+aD7dnHXvlwPojwIVHaCpl+EBi8RQrRRQ9+cTbUO9lRj6sciAfdiLt+IWt3IqF
	RHYg6yHPmiQcQrVPyGKzlOsE2OIDnyHgz35CIIawzqDxrjvX86NaRj10idpBxT3FyfkQdf06R4c
	MqzWDNx/tmbGqwoUaNJHGAG8Ryy+80rw+seuCI/1Qa9+lDDy/1+9bsOQn73SmJsoMZkNvyKsBiS
	dAGJoqFTm20Pmg1xsfF7K3sCwItb33TVyrBmSGe3DaXTiBUWDYulSKqIWQ5svPg==
X-Google-Smtp-Source: AGHT+IGvmJuGS3IZ/uyOBYmFaf2eCOHsx/MrEv4aHYhplNKbOds3Lba3ShwHOK3DV9og2hdief5A/w==
X-Received: by 2002:a05:6512:a89:b0:553:35ad:2f45 with SMTP id 2adb3069b0e04-553e3cfec05mr5091992e87.50.1750773187422;
        Tue, 24 Jun 2025 06:53:07 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:06 -0700 (PDT)
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
Subject: [PATCH v12 03/22] crypto: amlogic - Remove clock input
Date: Tue, 24 Jun 2025 16:51:55 +0300
Message-Id: <20250624135214.1355051-4-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065309_494281_B599A9C8 
X-CRM114-Status: GOOD (  10.70  )
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

Amlogic crypto IP, which uses DMA crypto engine,
doesn't take a clock input.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index d7e455f73c04..90b539401b71 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -9,7 +9,6 @@
 
 #include <crypto/engine.h>
 #include <crypto/internal/skcipher.h>
-#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -267,19 +266,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
-	if (IS_ERR(mc->busclk)) {
-		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
-		return err;
-	}
-
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
-	}
-
 	err = meson_allocate_chanlist(mc);
 	if (err)
 		goto error_flow;
@@ -304,7 +290,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 error_flow:
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -319,8 +304,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, mc->flow_cnt - 1);
-
-	clk_disable_unprepare(mc->busclk);
 }
 
 static const struct meson_pdata meson_gxl_pdata = {
-- 
2.34.1


