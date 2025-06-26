Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C5DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B9UQTA0XO+RGIXXW8DAfCHZQQ8vv/QjGxfsmB/2GQk=; b=UGbCxmWILbZoMe9d0HINn0UqhY
	0it2ApWMTRb6tN/CAVGoGbidB8K9vclAqMuFlPxIQeTRNNVazzrH6pc4+8ZAummHyaNtIITEpUyuy
	gUR7zhcSyIXvl7zsRXTrRQyfuALZk8YIN50uxmuf71inwqV3g0p0mwgpfvG/nKslP4IVFGOfXj+bs
	OQsrzjhe6Qc2E/N2GahYAZCzl0KMKKOitroDemDckWE147NmFF6pjpHiJVP36sBqbJizu1C27voSc
	9ic4K8QS4oKmiDIWmHOd/TGAdh8o8rLRuaZktEH+DQMZIQb6K/BPxsyiqCboD+g3bebm9/RCEQB5u
	gUUMQNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnRX-0000000BtaY-3KAH;
	Thu, 26 Jun 2025 14:19:11 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnDr-0000000Br1H-2Alk;
	Thu, 26 Jun 2025 14:05:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae0df6f5758so70644666b.0;
        Thu, 26 Jun 2025 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946702; x=1751551502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B9UQTA0XO+RGIXXW8DAfCHZQQ8vv/QjGxfsmB/2GQk=;
        b=KE3NiwMnxq2RipheXMXNzBIla9UJtXq5NSa7oSwLgO1fzbbc2K9g05/tRqCSPojidg
         BBaBZXvTqifmqlRhsHXU52g7g5U5ghm0Svux0kNj3cM7UgU9Ctz4QC6fLw5O8lS8lcNd
         hTs7fQ8HS5puGYzid34n8UgIISqccuO3Pvi/kJJUsYUUd/ulNw/78TnkMT1ySWtebEUB
         cHNMeeIJvYi7oiI9sQSlgLtapJa8NAnzmz+zZRe5v1pAOYOgXSw1dWBsE/KlXor7c9Ih
         MUO07rcrc/vuThChby7ah6/Z3IgCgNvxx73RQzjDdkOy1PC0PrnK0s5KbN2cXob3QmO6
         TX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946702; x=1751551502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B9UQTA0XO+RGIXXW8DAfCHZQQ8vv/QjGxfsmB/2GQk=;
        b=XoxbpxWuTzKpU7BJbk/cT8u79bhSeitb57N8qt/h6FQ1pteDImw+y/s40HthvlLXGW
         fh52zymUrzw6gmPxSK+JK/atSJ7BRTw0JONru1SuAyUFi/rodxzhiokQntwX0Y0yOcpK
         aO9vEwBlD8hpwep2PBSu1m8C2GK97V7poDIGvTfbAGxe91uMnkTSJOi6ft3L9yJVoxqn
         POIrkXemBsHLVnIzs67oi61KybfrXnIkgdGJCPjvj27zJDGbeDolPgkCduCrPwWYJRjQ
         oFF/LTe7st8XrTYBzemoo0hG5oaKbFJQhZIXyUArl1cBaaiZFoN4exaXkJIVcgxvTWr2
         kWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW49BrBv/1Be+I1Gxa3UEeVC4NRLO5XkEn6f5CczQtBG9vU/82leD3sEUy+4T3KDu/LGGnlxOweAPGYm+WXy7J6@lists.infradead.org
X-Gm-Message-State: AOJu0YzWT0rvAQJOPemunP0uxykjZkhhHTZWEQfzzoxQXpQ04YSSU9gH
	GJEd4D2eWYk+wM3okZazDGXt2nlddVNysFHYdP88b2Z+Ml7KeA980YY561iiCJ8P8ad3uA==
X-Gm-Gg: ASbGncsYXp2ydh+n52ux5US/6+Y8tN/+zP1CwM++VOhNN9pYbgtw7I99xaiQ52r+JiI
	dgtxF6unwcGIJfo/+fpaMscjm/FagjDPUk9DThZq3Zuvb5Gof/3T3Vjq7lXlh3tEUo5TGB+Fh9o
	1fBRnAJj97rxh/7K4IBbW2v1+suCly6dDswqRDxV6hqZenLISiiV3tWIyERLHg++4D/1a/gSV6k
	uFPLIPIQ/7W7rXvtBhvlxXhU4pL4mzHTPz9ot6IwCbbfU3g0M8qcqHT2WKIeBHchZ6L1HR5JYCw
	0JBQkUKbEkpT0dSNpxC3Rm2pQewnW0dc+LVFKchv3f8r3JTO2FwA1oCw11sJEFRbbDW/vr4R7tN
	3QPrWXI2sv2c=
X-Google-Smtp-Source: AGHT+IE07fXK7KUi/Kcs82M8/c4AI6q7J6d/VrAbZNafj4SS/HHhE/zXHJGl4LKHd9oOEFh9xlCkuA==
X-Received: by 2002:a17:906:c10a:b0:ae0:628a:5093 with SMTP id a640c23a62f3a-ae0be7fdd39mr844096766b.3.1750946701083;
        Thu, 26 Jun 2025 07:05:01 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:05:00 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge 2
Date: Thu, 26 Jun 2025 17:04:31 +0300
Message-ID: <d8596aeea72b2acab614277372f15b773ef3d008.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_070503_579313_DFA327B8 
X-CRM114-Status: GOOD (  21.21  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
The original behavior can still be used when the cooling-levels property is not specified,
ensuring that the new functionality does not break old boards.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313b..504e7d254 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -15,10 +15,16 @@
 #include <linux/thermal.h>
 
 #define MAX_LEVEL 3
+#define MAX_SPEED 0x64
 
 struct khadas_mcu_fan_ctx {
 	struct khadas_mcu *mcu;
 	unsigned int level;
+
+	unsigned int fan_max_level;
+	unsigned int fan_register;
+	unsigned int *fan_cooling_levels;
+
 	struct thermal_cooling_device *cdev;
 };
 
@@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 				    unsigned int level)
 {
 	int ret;
+	unsigned int write_level = level;
+
+	if (level > ctx->fan_max_level)
+		return -EINVAL;
+
+	if (ctx->fan_cooling_levels != NULL) {
+		write_level = ctx->fan_cooling_levels[level];
+
+		if (write_level > MAX_SPEED)
+			return -EINVAL;
+	}
+
+	ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
+			   write_level);
 
-	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
-			   level);
 	if (ret)
 		return ret;
 
@@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
 					unsigned long *state)
 {
-	*state = MAX_LEVEL;
+	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
+
+	*state = ctx->fan_max_level;
 
 	return 0;
 }
@@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
 {
 	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
 
-	if (state > MAX_LEVEL)
+	if (state > ctx->fan_max_level)
 		return -EINVAL;
 
 	if (state == ctx->level)
@@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
 	.set_cur_state = khadas_mcu_fan_set_cur_state,
 };
 
+static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
+{
+	struct device_node *np = ctx->mcu->dev->of_node;
+	int num, i, ret;
+
+	if (!of_property_present(np, "cooling-levels"))
+		return 0;
+
+	ret = of_property_count_u32_elems(np, "cooling-levels");
+	if (ret <= 0) {
+		dev_err(dev, "Wrong data!\n");
+		return ret ? : -EINVAL;
+	}
+
+	num = ret;
+	ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
+						   GFP_KERNEL);
+	if (!ctx->fan_cooling_levels)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "cooling-levels",
+					 ctx->fan_cooling_levels, num);
+	if (ret) {
+		dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
+			dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
+				ctx->fan_cooling_levels[i], MAX_SPEED);
+			return -EINVAL;
+		}
+	}
+
+	ctx->fan_max_level = num - 1;
+	ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
+
+	return 0;
+}
+
 static int khadas_mcu_fan_probe(struct platform_device *pdev)
 {
 	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
@@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 	ctx->mcu = mcu;
 	platform_set_drvdata(pdev, ctx);
 
+	ctx->fan_max_level = MAX_LEVEL;
+	ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
+
+	ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
+	if (ret)
+		return ret;
+
 	cdev = devm_thermal_of_cooling_device_register(dev->parent,
 			dev->parent->of_node, "khadas-mcu-fan", ctx,
 			&khadas_mcu_fan_cooling_ops);
-- 
2.49.0


