Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EE8CD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSWJVKglNpMUeLvf2TMVSbIheMkylfB7P/Qb2Y04AtU=; b=EA4uuBP0LxDHTeBjXmenPLu0sL
	/O2g3dnrFTKTko36lrHpN5HLzvZ6PzrBrOb2aRseaWvXxI+fz7LcYbP834vT7gaRe2Dtnq1XF0A4m
	xqkDu3pr2PxrGYHd7tTKiLy5fkEos5yvO93oO+GMPRF0hv/R2oGsibysWu1FWrPJa9ET9U0C5m8gZ
	Fm5+FjhZM5OL7gI/JO2jcvxvDwrKvbfINLrINqs1qS5W27dCgqH4L7z8CAI8VUu2lrfwT/t+/8Y7w
	bUnR7z2nDzVlMle2uKUpf71pmSNrRRz9wHi7Dtqql7GisoYvHZ7R6BYyP074SJab+1iqa+FsAuLcS
	NayMM8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzy-00000002y1B-1Ij6;
	Tue, 19 May 2026 22:33:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzt-00000002xwi-1Kco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:33:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso47161125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229988; x=1779834788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSWJVKglNpMUeLvf2TMVSbIheMkylfB7P/Qb2Y04AtU=;
        b=L0Q7bHmEkDlc+f/kahPXGSfqqFfIeQxNSVRsKvfns2vsEC0+kibZtNOtscrrpB8VcG
         8IQ8XeaeiWagTsDhzrgZMWIHn4gmoDTN+jXQ67lBY2aXDCOrUR32FzIGqZLZjO5BlGry
         pAeePUtz/8rIueIoz1YLoTT4tFWGuCFBblpVQWCv9H2j68F3ldz9KCuOCeXn77lZ0gmA
         PWqJ3D0x5zXRzaR1OWg4ibPtSOabr2OPFhQ+yiObqL77ryI6+nnopLpZ76NKBFlqAYZF
         SlQ3mly7ujw2oIfDA8F4giruBFGlOX/FLrSZbMQUSf/J6MXQEGwvf8T87AmElMUmBQAg
         n3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229988; x=1779834788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rSWJVKglNpMUeLvf2TMVSbIheMkylfB7P/Qb2Y04AtU=;
        b=Bvo/Jpar9h7MnQqM7iAeRaF1A+nufv7Qb5ZqpGO9py7Wh5voUOq1AHVqo0qfc9OQp4
         Qe3wJT5h6DWfLfPWSKqwj1cvcGce+SimHYj4iRN0YU0yND2cqXOwGdiL8KADuRM8zr49
         NFIKMQ/ZU+G+1digWVTGYJwrpzkKQzxi8cDP8kjgvo4W1VdcMoVG84Xj0FFKR0ZspuN5
         Euu8xwFGHW4pB6npC4CqXVV0D+T8fg69rkgKfH0bvbYmUB7UP2sHj0eieh9ZodllhvlX
         ZiZOlUfA5h/ObuIkvcNyV07Vy+Hh8WQXi9Eh8XbwQ73jM/RWc15nE+Kcz2Shfhr2QYXx
         ynxg==
X-Forwarded-Encrypted: i=1; AFNElJ8lCoIaliFP3ju1HmCD+kz3SMxQwZJvS8pgy2wqdUV5AXqa00uBYpc4wVrHCy/jNl+nSXP1kyxXhPWbNFV/F+1z@lists.infradead.org
X-Gm-Message-State: AOJu0YzzEc/Ztd1t9mLrSw6PmpxdYPJnnCdnaeT+ndHnPyZ/VWJAFEi8
	VL+KOoAIvtLuU0RiTCxXri3xwEPDaQ/Ya+xGnX9fugDbLFNukw/JvOIS
X-Gm-Gg: Acq92OEc3FpwdP24mqgc8HGtF+/jBRKb7pI4Mu7mGRII6+SYaZSmYkThVAJdF6cwNE2
	qjiyTB7r/F1lbnKxaQZCe2009SEPNCRh9OsOUK7i7yH/oDoYYVFwV9qkduPYUEt63J6zDdii+xc
	2KfmTL0Tww+dDh2BuQC22SRnRARwhoQbT5/qpFZi0HMK0N+hZG1waKYXTc2Mzz+d0cwcqFwA64n
	n+SuozsTvPBMHhf4DOOqOfYsBiyvXuaGx1hHxBDTgzKb1ihqgJhLRj/z/3x82bZGvLixaWcp8dD
	N/3r6ZfrJdWSoirBoTc9bNTgXN4n5Mdyj6yExxi7Ke5edtzTMqy2kyoK/cjMStqOx64oyvslSXy
	gX3cSgYyRKxmQK+teLT4CnqQCMO/s0y8VYI8/aBY+RoCEw6exJZR3ZFOOaRCUiZj3MSEYHLR6Jw
	fUvrTTJtAa9vCbuu7OhfS2I60qBrlftRk7lQVmyxS5fKUnHcLCmcl4MK4BdoCfEF4p+fc/0zQ=
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr314706265e9.7.1779229987604;
        Tue, 19 May 2026 15:33:07 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:07 -0700 (PDT)
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
Subject: [PATCH v3 1/5] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Wed, 20 May 2026 00:32:43 +0200
Message-ID: <20260519223253.1093-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153309_383776_CD5664C0 
X-CRM114-Status: GOOD (  16.87  )
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

It was reported the need for atomic operation on some Airoha SoC that
makes use of I2C bus. Rework the cmd/wait OPs to suppor the xfer_atomic
variant. To support this it's mainlin needed to do the readl poll in
atomic context.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 56 ++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..700beb9e7b1a 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -67,14 +67,19 @@ struct mtk_i2c {
 	struct clk *clk;
 };
 
-static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
+static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 	u32 val;
 
-	ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
-					 val, !(val & SM0CTL1_TRI),
-					 10, TIMEOUT_MS * 1000);
+	if (atomic)
+		ret = readl_relaxed_poll_timeout_atomic(i2c->base + REG_SM0CTL1_REG,
+							val, !(val & SM0CTL1_TRI),
+							10, TIMEOUT_MS * 1000);
+	else
+		ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
+						 val, !(val & SM0CTL1_TRI),
+						 10, TIMEOUT_MS * 1000);
 	if (ret)
 		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
 
@@ -117,27 +122,28 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_start(struct mtk_i2c *i2c)
+static int mtk_i2c_start(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_stop(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len,
+		       bool atomic)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			int num)
+static int mtk_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct mtk_i2c *i2c;
 	struct i2c_msg *pmsg;
@@ -152,12 +158,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		pmsg = &msgs[i];
 
 		/* wait hardware idle */
-		ret = mtk_i2c_wait_idle(i2c);
+		ret = mtk_i2c_wait_idle(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_start(i2c);
+		ret = mtk_i2c_start(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -173,7 +179,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			len = 1;
 		}
 		iowrite32(addr, i2c->base + REG_SM0D0_REG);
-		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
+		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len,
+				  atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -198,7 +205,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len, atomic);
 			if (ret)
 				goto err_timeout;
 
@@ -218,7 +225,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 
@@ -226,7 +233,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
@@ -237,6 +244,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return ret;
 }
 
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int mtk_i2c_xfer_atomic(struct i2c_adapter *adap,
+			       struct i2c_msg *msgs, int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static u32 mtk_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
@@ -244,6 +263,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 
 static const struct i2c_algorithm mtk_i2c_algo = {
 	.xfer = mtk_i2c_xfer,
+	.xfer_atomic = mtk_i2c_xfer_atomic,
 	.functionality = mtk_i2c_func,
 };
 
-- 
2.53.0


