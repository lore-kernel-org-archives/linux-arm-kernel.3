Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9061C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9UBfXvbzTVrfxCxZp59nLH9B+e1MagmgO2AVB+E5S0=; b=qZ31cSZ9XC9vsyC/9HvcctiVAY
	PgAy0GLEIj+nzgJAHvXXg90hRDbm5PxIYDS97o/vIhyp8yW522BJ6HEr4mfrHYHj5oERmTMs0vquZ
	csk52+F45iNlgeXe4Zb/jyCvDMb8lfYRzDN2x1AlodgHwUTTacreVcqjI7ajX97PadwsGDrtWsGf7
	tlVSL5SowI96sUDpEaJapW6wst96D/fjpUvZsN+CefuJG9yWxFLxohhPxiU+MLnqjIbcTycN4uPRt
	2AA/qUVIqCBFu5Ot3HDjB23JM0SB4AjdINwAegPS/VFAFuzOX3ikX7i6j5RZUt+KGYuKPhgPTrz/X
	ETkLlC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzc2s-00000003VKF-2ByI;
	Tue, 01 Apr 2025 13:52:50 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzc12-00000003Uvo-1UCw;
	Tue, 01 Apr 2025 13:50:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3154631f8f.3;
        Tue, 01 Apr 2025 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743515454; x=1744120254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9UBfXvbzTVrfxCxZp59nLH9B+e1MagmgO2AVB+E5S0=;
        b=jyQnPlhA3iGK52kanV5Icfmf/YOq01mG5jV4vQ+kR/OkMxY2EJ5OcD1YCQRXOS9qqH
         soZWScZWet2eyQ/HVHKPNMq6RdKZcFft/KBgvyTAiyZzRPgnxw3uamjZ5c5OwfMYg5IA
         kA+fVw3cl3BI2CkZJVlToQqYEeOz0ynni+kgM0k74/RUdsrMFtA724u3l+I/6HtafRcl
         htupttLCVlmjfFUU2b4gn+MjWYmCceJYP3VQghlzZXE0wp9/wB3m3O8Iwdl7G+Hw7wgs
         Jdg0+eyrsJFStxDVHhKNVWxnhU2L9m+5y56IQww0PANko5+poRZxihxgu7C1VLw+70Kb
         mbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515454; x=1744120254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9UBfXvbzTVrfxCxZp59nLH9B+e1MagmgO2AVB+E5S0=;
        b=u39XL++qoip4ePw26c23uYaLdjcGAzMGUyXtwjRqrgIJtI83nSpvsLKIkR9QUEuXIc
         10jA1E5Xe4L6WN+3fZf7/0iDvGt9Z11KyfG6dTF2BxALnmpfBtbryVwtabA5LwdWD8LJ
         xCAraEfYxGebp3tJuDT6Eze5C6C6smES/b/E0vCTuK4iO/5BhtdTEnWcXgJOE9iBXxSJ
         /U8rzbBB8VRBO8aprJYwgxPHwbTKiVKCFfzHjL+XwTiwIf8+1Kl8bAbszYJYv8HJzcRl
         6DeRdfAg84Q/meu649g0dIswspQkX1AevZxKpeW70nL4PVJE8bF4W15XpDpKykYc8V8m
         4U4g==
X-Forwarded-Encrypted: i=1; AJvYcCUTabSM/hUSiXqZr+HhDAN8nsWDlsx/JxNiYqT08BVPIHzhFYFenV5LvWNDyPtwomlZTPydfrVLyGplKyoX4hc=@lists.infradead.org, AJvYcCW8ZLBcPCQE/vqlvBNY8/J31hbYhicLH9pOIEQDVUlyQahGQyN5BXIGTRVUVwK0qFENKFcQTEMxju9SOR7SO8fM@lists.infradead.org
X-Gm-Message-State: AOJu0YydVgRa5JrImeZrduWyKmYi9joW3mxxby14PntVNtP4Kjldkk6N
	guTNGRxsZN/ngKwuanHFeX1cm75VOLG3bi8zfkycit7tKgBg+lAz
X-Gm-Gg: ASbGncu/5mOP6iKMXaZnRx9iSZSy6IlbBgKWGkXzPW0kSZWFvEq3678H5W8MdEUZfFs
	Q52b67CJwgtWZl7+RrnzX6/4jRHxak9oRtmtYweJ1kxCu03efZok3//xaHKXrwACwMmTIchBQFN
	TxTR2VAwsHyyqDtUYUEFRQfWGmG6UjrGVYSQAtE4nTjJPRwbOq/RZT2UYgaaGGWmWA9V0nXjvmd
	3SU8L+k8jAHl2G0ol+cqf69APG6XHjmJX7fottdbghYAKHPzO9yD6viyIihwIPPwA0WFAnDTqYU
	Ct+b//OZ+oYeRhE9avvFVpW0A+4FAW9soL62yPSJYnCQTK5wMFJ7rhUVhqhuqRW/BBA+KWWIXTY
	KX6IjqwYoNU9duw==
X-Google-Smtp-Source: AGHT+IEvptfLcamhWwedLuGlHspFwqiEnrR1KRa0sGTY6aYu1yAGzOSsMK+B81u/IJ926N+Vf0G7Tw==
X-Received: by 2002:a05:6000:2183:b0:39c:1257:c7a3 with SMTP id ffacd0b85a97d-39c1257c7damr8161644f8f.59.1743515454380;
        Tue, 01 Apr 2025 06:50:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b66a75fsm14015125f8f.41.2025.04.01.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:50:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines
Date: Tue,  1 Apr 2025 15:50:21 +0200
Message-ID: <20250401135026.18018-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_065056_396306_A00D6978 
X-CRM114-Status: GOOD (  13.40  )
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

The current PHY2 LED define are wrong and actually set BITs outside the
related mask. Fix it and set the correct value. While at it, also use
FIELD_PREP_CONST macro to make it simple to understand what values are
actually applied for the mask.

Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
the register define mapping for 5 PHY port, starting from 0. The mapping
was wrongly defined starting from PHY1. Reorder the function group to
start from PHY0. PHY4 is actually never supported as we don't have a
GPIO pin to assign.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add Reviewed-by tag
- Use more symbolic macro

 drivers/pinctrl/mediatek/pinctrl-airoha.c | 159 ++++++++++------------
 1 file changed, 70 insertions(+), 89 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 547a798b71c8..5d84a778683d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
@@ -112,39 +113,19 @@
 #define REG_LAN_LED1_MAPPING			0x0280
 
 #define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
-#define LAN4_PHY4_LED_MAP			BIT(18)
-#define LAN4_PHY2_LED_MAP			BIT(17)
-#define LAN4_PHY1_LED_MAP			BIT(16)
-#define LAN4_PHY0_LED_MAP			0
-#define LAN4_PHY3_LED_MAP			GENMASK(17, 16)
+#define LAN4_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, (_n))
 
 #define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
-#define LAN3_PHY4_LED_MAP			BIT(14)
-#define LAN3_PHY2_LED_MAP			BIT(13)
-#define LAN3_PHY1_LED_MAP			BIT(12)
-#define LAN3_PHY0_LED_MAP			0
-#define LAN3_PHY3_LED_MAP			GENMASK(13, 12)
+#define LAN3_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n))
 
 #define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
-#define LAN2_PHY4_LED_MAP			BIT(12)
-#define LAN2_PHY2_LED_MAP			BIT(11)
-#define LAN2_PHY1_LED_MAP			BIT(10)
-#define LAN2_PHY0_LED_MAP			0
-#define LAN2_PHY3_LED_MAP			GENMASK(11, 10)
+#define LAN2_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n))
 
 #define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
-#define LAN1_PHY4_LED_MAP			BIT(6)
-#define LAN1_PHY2_LED_MAP			BIT(5)
-#define LAN1_PHY1_LED_MAP			BIT(4)
-#define LAN1_PHY0_LED_MAP			0
-#define LAN1_PHY3_LED_MAP			GENMASK(5, 4)
+#define LAN1_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n))
 
 #define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
-#define LAN0_PHY4_LED_MAP			BIT(3)
-#define LAN0_PHY2_LED_MAP			BIT(2)
-#define LAN0_PHY1_LED_MAP			BIT(1)
-#define LAN0_PHY0_LED_MAP			0
-#define LAN0_PHY3_LED_MAP			GENMASK(2, 1)
+#define LAN0_PHY_LED_MAP(_n)			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n))
 
 /* CONF */
 #define REG_I2C_SDA_E2				0x001c
@@ -1476,8 +1457,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1491,8 +1472,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1506,8 +1487,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1521,8 +1502,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	},
@@ -1540,8 +1521,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1555,8 +1536,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1570,8 +1551,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1585,8 +1566,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	},
@@ -1604,8 +1585,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1619,8 +1600,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1634,8 +1615,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1649,8 +1630,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	},
@@ -1668,8 +1649,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1683,8 +1664,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1698,8 +1679,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1713,8 +1694,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	},
@@ -1732,8 +1713,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1747,8 +1728,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1762,8 +1743,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1777,8 +1758,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(0)
 		},
 		.regmap_size = 2,
 	},
@@ -1796,8 +1777,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1811,8 +1792,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1826,8 +1807,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1841,8 +1822,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(1)
 		},
 		.regmap_size = 2,
 	},
@@ -1860,8 +1841,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1875,8 +1856,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1890,8 +1871,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1905,8 +1886,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(2)
 		},
 		.regmap_size = 2,
 	},
@@ -1924,8 +1905,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1939,8 +1920,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1954,8 +1935,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	}, {
@@ -1969,8 +1950,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY_LED_MAP(3)
 		},
 		.regmap_size = 2,
 	},
-- 
2.48.1


