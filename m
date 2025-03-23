Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F030DC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFi/wIa2zliLVLaoNCXevujk62BEru73nW/QKRcDHsY=; b=I7nKLC1YpyDwNdhYsTJu2noB9e
	mbYQ3DKrRisvv5fk6k57yqrG8H8yQphExXZT/GtxU+M2B86dF9AkCgS0Lh+yNOzN4c/JxMfrrVpqi
	YMjxetmV03VcAeqfLMKcglGA9cQpt92/4e0884RyzmO1XPE5eHctd/2qc5d3xof+ZuLr8DNDL2X6A
	Xv9wxWBDHPQAlEN2uDZ0sdsvjYv5569bqwwhzEMrt6XZX5cER0NSWbjkNeUj1uBC0Giku6qegNax3
	ckfVqT/3AVjS1a+TCy2r9qTAqcYQb1DQR3G4r2YgqloXrCPB2Vr8ZFr7vN2ugIPVB4qkrcZ9Q/oYq
	xUrfRcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUgH-00000001u2t-3XDV;
	Sun, 23 Mar 2025 23:24:37 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyn-00000001pC0-03y8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac2aeada833so704468566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769580; x=1743374380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFi/wIa2zliLVLaoNCXevujk62BEru73nW/QKRcDHsY=;
        b=FMlECcl8ZaYQipz85clg+R3EF8+9aB9PFCEoTGi0graT2dmbaFUNl93cGEKJBY7jop
         Wr88NVnUYAGEKOfgaQtx38eKpqmKHxx2b1EWkWZavFee56jCcdVMbcfWr0fFfovCivkc
         8p73dnjkbWzO0M5+0GsQ02nLY/Rf4io28HesKDeor3RTRxqXgy+JggPbtjOG1NLJ4tJ1
         pVkCbNTWOVvmmWTgNyrg+yMeWD2ylST2A52cT3f+Qhpmz2Izt/CEhd1gaiULIqh+IPOo
         UHNfEO40QiTddoF8dHQyeGFaeMqMsCXbZF5rJC80Y3O0BReoSzeg5ozvE+ulXHey99ba
         /TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769580; x=1743374380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFi/wIa2zliLVLaoNCXevujk62BEru73nW/QKRcDHsY=;
        b=ZYLd9mfeaWeCUmLoIti+oe8P1jQrF83QR2Bb2UuuucTi3uud0WbnItL0AFmReyqAvx
         ti5HHbnSDUpEf8/ic5+TPLC1NEbgyvgQNWdUy6ojriD0FISk5LY1snw2SaMgK9WO0mrL
         5mrxM9w7R0PPGkgpmmLE9B5tERd5Jtd2yM+RpftXdl0PNC1OV4oeVySZondMV7ZS7DIf
         ixZjldqa8y7Jr5SMGukNlMjl3Dc2hOtJHopXfWjalvVHfDLpvgqrVjiGxtSDtg2EW63R
         CXP8PmNaGcuzbYctvHvuW0BiDAjBliBgLisZK9FNO+gyBCUU8/oFWU+QXawnrH1KQrei
         aTyg==
X-Forwarded-Encrypted: i=1; AJvYcCUSpHv3nqBUYRt9idzsCfTORQlzBKeNTtbACO6INLSd15Hwjl2M5uzTpj7Qokm+k80wmUSE++MULd8hy3f/y1xo@lists.infradead.org
X-Gm-Message-State: AOJu0YyXElnOqf3CEt7sdsYJk91duoMniNLBs6dpXD9dDprP1s2MVZtT
	gK25Kz2hRkG234Er8QnmaeAVhFwmWHFeGeEKPGRfXCddsx7scrglOLvF4RcMbcs=
X-Gm-Gg: ASbGncs7W4asXhQPPd1cOgz6YMBv3l3ig1jkDlVUX0agClVYJL0OUNHBGGQQzAQqvKT
	pVWXFtC5P6EJIuHcO90W4imSdx/5e0ed2YIL9Q0HzEoYdJxMIfkxJLGYVCN86vtxrXTkkbRerz0
	N3XD0yKXKIMeTg/6VAxCDfnK5xEGqfjilbCi+JJQU28NGW5dpTDjI3ZdWC9TFLjoB+mRpt0qXfn
	/TQdxiaNu9EDxPcQYG8XqCWGwbzf2Uppo3TKchBjWSLuBCCD7I7PQrvB/2tDvem5q2I6d2SiY2+
	R5InSC7xQ6pJcCOVZ7J8Nkj170Oj+2Ux3uzHvfhUCwZuavh8pgxPoA5/6Z7yCTYd+TNVyqlPPVH
	9D75BGMaKjeWtxctAQzIpX0a8oHHy
X-Google-Smtp-Source: AGHT+IExdWMeq50KMSeL2g8X5YzwdCsnSfpgrljF2A0N/7BkwT1ZoOB/F1xNUkswffcMZkq5HeqMZw==
X-Received: by 2002:a17:907:86a7:b0:ac3:c6a2:a02d with SMTP id a640c23a62f3a-ac3cdb95075mr1563087566b.7.1742769579644;
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:43 +0000
Subject: [PATCH 27/34] rtc: s5m: cache value of platform_get_device_id()
 during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-27-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153941_053934_CCED417D 
X-CRM114-Status: GOOD (  13.89  )
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

platform_get_device_id() is called mulitple times during probe. This
makes the code harder to read than necessary.

Just get the ID once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..31bdceac7aa245175a30eb13eaaf1f52f70e22c2 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	const struct platform_device_id	* const id =
+		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (id->driver_data) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -670,7 +672,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     id_entry->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = id->driver_data;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.395.g12beb8f557-goog


