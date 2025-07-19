Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5534C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=; b=KgbWdG/yqqvJtSwzo286dcWuQo
	IpW04LdhNg4OqEayExjKyB/MwqQm7BE3+dJNv+4DqI9Byifqq8ujGq+3TRwmqAacb2N2FOSIvTPkL
	aUcYC6XUCxNTImuPCZC44D8BfYTzwmsUCxeg3hPTNtrOn+jjsY/k85ehyE+LZWztcjFQEp8nCGEI3
	4LpP+lMjrxcMo2GbYuKUYQtQVTAfe8htW1uSxvFfOud++MlngxaKJKwpacaBR3i6Q7xEoQbgJdOkB
	j23AM+cAjR7XrpN7nppgJv8QLMa81iR/2me0PYfciMOW5Ew/rzrKg4RU/3OXIMerAHF559LkkRlBy
	JBYSxTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7Lv-0000000EHvX-4AWg;
	Sat, 19 Jul 2025 13:11:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud77F-0000000EGVS-3i2i;
	Sat, 19 Jul 2025 12:56:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4560d176f97so32825405e9.0;
        Sat, 19 Jul 2025 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929796; x=1753534596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=ldON8eRUupjQOVp++z6RDyNaAadzVAgPQ2reVXIkA8DM9XgRYfW4im17xWGWCupUKw
         Fb9ZRZWxWVKVWRsUJXcotqu924PRFEtRMatuVed73pVQPNmUOn6BWOgkJEiA5Tfd3HTf
         uihvsG6OT1z444VDg4yodr6xik11qUySBnEOZ9Sv6oobvmiGK1rienPC5NFzX29mIMH6
         gWVJU+DSqMh4EP85+Teu4yPgkfNWZenxhrvceV+semAeO0I2R2CWBQwcxR+NrCsN4F5K
         q9i92HbDWEr90jdm+l255N0ikmXSg9ZRd1Y9ZkVelI4FZP8BhS/px/XYOdxb4fxQ6I9U
         ap4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929796; x=1753534596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKfLEG6+ipDQ095wwf+Yj6O/rN6WeuJI3tKiO7F5vfc=;
        b=bt7m7ibScq7qoj+Zn5pIL+gVmmONDLGgz2vEKh0n8/gT/bYfhlNK2+C0QprDZQgSfo
         nSBqAyFRJv1hgPRDwT5Ci/MMwK6gu4lGwcTNYC2lVl+8PyqdnvcNEM7jUwj3CnS5bMw0
         ED41zcsLzS3pO2phAFZpcDwcFqwnZBPnqm23DSknuBqmQA9U8NYFAkrmYwEMD4foyw0+
         cWQTi5gBp9mgstvEDqwab9AN6QnSn58WSM9YpP0PfRCqOFIWKTfewSjq78FPH4p8y8ab
         rwOaHdsbeYcCoZf/hIbntvU4tPkCjZ6Omy6i7I1qrqp2k9vCi5noycre1ucA0UEuDPql
         MP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX40UaamxcoGJVUFnkzrQbbIWui6nYUOFACVckPc9v01khHtGt33yDKO46h5jl70I0iBXaS0jXYXVlE0KuaoQBi@lists.infradead.org, AJvYcCXBsvBTSSsekKLNWGiKcmO1MFBaadW6BhOoS+T+Xv+8vva/Lr+CUSBB02ngjQPwbMtlu/fiZTT9OVFLMl0VgoE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtV19EGDN9XqbzyX4Kl7LyG7ldZCSMiWsuc+ugvYWtNW/r5Lye
	Lst/GUiuCMDyFgchvyPG/Vsxdq0XBTMdyHPrYZvwKjzNE7m07sT9EA3O
X-Gm-Gg: ASbGncsy9F3wdCQH5C0kj20tBkOKNPOS9A+kq6WcWHNbs6sLmSMXRnSOQ+GeqDv6pcN
	zzaBdD/4UybDwcYjc7nHRTzhFOVxdnfZ6m48Za75JoqRE6fmXjCKk209j6wLFuT38F7C+bPVxzs
	TqRgXbfDuMyHWmCwSWO4+Zx/s2sHbrTw9TRsEZvnUBQ2qcVY74ME3GNTK/ExXX9ATXh1nMF+9ja
	jQIUpZ/MIab7bqCVZ9xzCfMIIR+E0l3aPiHfNZvNmu0WhMRuBYvRixEzHIB9UV7aAD/mbHQD0Xs
	+7o3diK9Ij2UOfNk/WmJslmETvR9JdXPQ1PtL1RG3kdXH79rGv0QX2VPzvS0HDmnLEO60lEp1Rv
	N3co9I4B4nSXpDY/tWzguXLCCbyQVa6qo2D6A5umLODzpEcJUjCOXzLQ2nVoab0i40CmeRIDeIC
	nj
X-Google-Smtp-Source: AGHT+IHuF11ip4L2zFfEUMigRC8dkjkuBq7ULx5s8kWGHzrhWElZjxldUDaslThQi3g96GCZtgJjdg==
X-Received: by 2002:a05:600c:4f85:b0:456:43d:1198 with SMTP id 5b1f17b1804b1-4562e3801ddmr128008475e9.32.1752929796210;
        Sat, 19 Jul 2025 05:56:36 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 4/5] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Sat, 19 Jul 2025 14:56:14 +0200
Message-ID: <20250719125617.8886-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055637_925046_6E783807 
X-CRM114-Status: GOOD (  15.37  )
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

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 58c3da92cea3..b4dc1fb269a6 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -88,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -98,8 +99,12 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	/* Set SCL_STRETCH only for Mediatek SoC */
+	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 	/* Clear any pending interrupt */
 	iowrite32(1, i2c->base + REG_PINTEN_REG);
@@ -276,6 +281,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
 	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "airoha,an7581-i2c" },
 	{ /* sentinel */ }
 };
 
-- 
2.50.0


