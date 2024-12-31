Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD623E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4dCuqUM4byBfXceaAxAYO1ebj2/JzKW0iFkDEvyBg0=; b=aqijset+YtiEGWVOgeTZmJJloG
	DX/r3tqgRN9Hy0fAtKKZiyLKeZUUZlWglyyvsPMhCpjC9nHKVqH3oz933gNPQ6DxxaFA1WzJijm7f
	0p9b4e7ClQEVUc0670V4xxFsm8qt4Q8VKyMpNkmjbosEPcsODHB1SHIJVTGHZHraejKkH4MWcHgv+
	jB64UWxSq1lfda//E01opddNDxWSyHZMaxTPkk+fTbR9KlH2aJKNX/MaxqXUdH5W93abcukgCgS9s
	949aX3Py3fg+9rh1VOaYivueZ3rhRPMEhTmlxxFvFXk2hYbKsrlUytUNPlpuF2E9EKaW0qoT3VYiu
	8qVpgvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tShmr-00000007e7t-1pJU;
	Tue, 31 Dec 2024 19:20:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShkT-00000007dk9-0eE9;
	Tue, 31 Dec 2024 19:17:50 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso15712861a12.2;
        Tue, 31 Dec 2024 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735672667; x=1736277467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4dCuqUM4byBfXceaAxAYO1ebj2/JzKW0iFkDEvyBg0=;
        b=nbx0qTMQzRKJZjUjHY00/cy1vx44XyhSFwrzHKROdVnQtU8xZJdZJNOQROK5AmX+DE
         tzXPOaiUJp/uAKBPRei7K6rokc3E9bl5c+xuYThNPAjd2sc1SgWa59vqroGVqSMtRhy/
         U3/w/rwL6FRmwVG755A5vTs+f7z97URmbMVwoMmLLSesjyVS13lbEhI9fqLfeZJkKuRY
         q5w7ZNrlUu+oUJJJwY4eutvPRQhrvK1PPB3p4doy34PsRT878C1HYH9i+FRKINr+8c9Y
         bcRm5kdnFFNSWeKJWA11zK0Y+IeZWcTQ2PqNgxPQ5z+mAkA708LWQ93P2KksdCtXJ7Ic
         W0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672667; x=1736277467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4dCuqUM4byBfXceaAxAYO1ebj2/JzKW0iFkDEvyBg0=;
        b=FpGejJuzahQXiQqcf43qOkmZ6DdGLUvNaP/WppXvSTTU/PP6kHqrCcXhTVWFUogN2u
         3RiM4rIXosRGwAKiInIuiuYWFLN5PWk07IakNjDmMbUw56ETOUDzS/6ke9wp5il9LZxt
         4GS0mHAd3mWrxk9vEiiImga60753+bZ+k9B5E8VOKqF/VgM7vlO80/IzN16EQj0By9gq
         6GwJJL2NZfrlbzDXtdw8L772asZnx8Oy/7SXybu9KlDdYSfzOyIFn6N+Qwdth7b7XHDU
         s/Ak0jxj8regWmIGiVnsQHUXGIZ5Hzt8zrOc7eDUImMe78sH6DESF01R8oGFD0rkheX1
         +K2A==
X-Forwarded-Encrypted: i=1; AJvYcCX8+TAOTxeZFOmnH2HKyqLhf0RXkUH83QtW02vWFMJcUTozto+TQ3ke5TbTvkyj8mzplTmdit9ckW8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoKF0D8uc6PDEriI+tIdvTQun8BUk0Jb91aJpguT3D1+/l8T2m
	DGbz1HB7THXgjJW4wh2OMIpNSRM5AoKHMx1uo6q/TyHlSWW1Nu8JOBM6YA==
X-Gm-Gg: ASbGncspIEMLxpsfKyQOuXZjFDwzJDvfv/idW2/mTyb4bVIO/UtcwIj6X0OyuO8CQTM
	8e/YLKa4xKUlJSYupuHY38joMDqjzXPKlm+rU4/O4GY0qAfulBflk5xN7QW1P3daYOMVwhXZdYa
	iqAa4NUdTm5EZF/YxbeKWMqWedU6mKDmBdJzR6F7qEIIJXggOlntlQY9fVcPHMymHSGO+Vv6fSn
	Gw6YR0gAXtELajLN+7BxIWIDbdDIR89XCDx3HE6sZr2xRstBYHATvo8g3VODC206mA7o93y6OzO
	vo1QJY2AN+u2jwYfNgMdBWZPpmVFrn0XEcORjU9r8SpLiu3NAzh6BzolS33s3Y2SrvWmH+XDDdC
	TG/1K9OJO/hjD4HPZr3qHce+h
X-Google-Smtp-Source: AGHT+IHboD+mOzahTXU+akPfIqU2kT+ne/eUXefsa6NZz0S9CZQPGls2uBwz2MzG5nyqUz0x5vBUKQ==
X-Received: by 2002:a05:6402:40d1:b0:5d0:e63e:21c3 with SMTP id 4fb4d7f45d1cf-5d81dd8af3bmr34595687a12.14.1735672666793;
        Tue, 31 Dec 2024 11:17:46 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b300-ce00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b300:ce00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3d2sm16311780a12.16.2024.12.31.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:17:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
Date: Tue, 31 Dec 2024 20:17:17 +0100
Message-ID: <20241231191718.2764065-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231191718.2764065-1-martin.blumenstingl@googlemail.com>
References: <20241231191718.2764065-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_111749_266160_6E095B21 
X-CRM114-Status: GOOD (  11.00  )
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

This simplifies the code by re-using the FIELD_PREP helper. No
functional changes inteded.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d63147c41b8c..d9c761b7c15c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -39,9 +40,7 @@
 	#define REG_CTRL_TX_BITSTUFF_ENN		BIT(18)
 	#define REG_CTRL_COMMON_ON			BIT(19)
 	#define REG_CTRL_REF_CLK_SEL_MASK		GENMASK(21, 20)
-	#define REG_CTRL_REF_CLK_SEL_SHIFT		20
 	#define REG_CTRL_FSEL_MASK			GENMASK(24, 22)
-	#define REG_CTRL_FSEL_SHIFT			22
 	#define REG_CTRL_PORT_RESET			BIT(25)
 	#define REG_CTRL_THREAD_ID_MASK			GENMASK(31, 26)
 
@@ -170,10 +169,10 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			   REG_CONFIG_CLK_32k_ALTSEL);
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
-			   0x2 << REG_CTRL_REF_CLK_SEL_SHIFT);
+			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
-			   0x5 << REG_CTRL_FSEL_SHIFT);
+			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
 
 	/* reset the PHY */
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-- 
2.47.1


