Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51E2C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 12:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5NRsL8co3xhL6jvZlaPLywxAXjXSLFhQ3FC+Y8P5Hm8=; b=0y3gb18qEQvD4l3R5uGOfU3R7W
	UlTHPmoxFkGl4u2FX8rZMqo3EziIlXzOKkRebxPzXKTnjlEFZc4eHtm+HB/1JK4XAJ3peKxdCiOWV
	V7CQUUES2HG1uRr2i5zuAQmVCnmuQeUjig3lvz+jqNS3bUpQR1q6s9xmhvTuul2JWo/lYbYuhBZRo
	NaBo68qdoi+9R5lyZTVeOvZOiqa9F63R/n/WZAFEDM27Jw5XUjfs4oi8ECURC7/thPxKG2190YzJJ
	L8AKqLoLr5sxDOh1qdYY2z53rTHGWm7yYkHRFU0UamNRFyiM7CKU9lJl2qXjrewyQmW4d+EYmUStx
	GxAS2nMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txPpo-00000008S5u-0Zd1;
	Wed, 26 Mar 2025 12:26:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txPo4-00000008RsH-3bcw;
	Wed, 26 Mar 2025 12:24:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso6275077f8f.2;
        Wed, 26 Mar 2025 05:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742991867; x=1743596667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NRsL8co3xhL6jvZlaPLywxAXjXSLFhQ3FC+Y8P5Hm8=;
        b=ZbH2m0TOxij8nFGQ3UgLN2FHck/3M8p/zcld8uK0ud1OTe2eMuxFj5lwhXsS7ZR1Dq
         /raXLLH56JWhC8FbWnLfOz5cUfL6xRRMziWpttaNPQpuU0Mvssu+07mVFtImSK8LvJZO
         82VJywIs5Xce5kLev8pmsp7iamaO7H15peDIYnAPrce4UydAhAoRB+gRptgaglxJoGyW
         J8xmpXI18lzpJu325rDb0viZeESZyFlmL/AnObxazZdxJpCghLw0KmicHWEhSUNMfVb0
         avIzZUe0rNmoBT+jr4malQji30rSuTileO25Dl1SKSBrR2+/ho00WeNSKHuD6zc6DY6C
         N5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742991867; x=1743596667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NRsL8co3xhL6jvZlaPLywxAXjXSLFhQ3FC+Y8P5Hm8=;
        b=Ww9SfjuuGvBI2Ls2mvv2kEq9f5jFfCVSPz9t9GLuPaKQ0NNKTWC9yoKFqbYyhLUJ4f
         MDyCjPc+LduD49kXIKVnSkJaWbJrnXhN2sxiiNx2YAoX6pVKFzk0/AUZt67D6vyMAVR6
         2p4W3tT9yr2kPniHKWxV1wlxLb1aiwYa23A3ZYgqKGBYk2AwrmiPlOfrXTS6y4iUGkms
         zhyVMezXq3dkMNrtHP+m1zRs4w+5+riNWow/kzekxNpFruNQaVRD3UE7J5dKydowPLfO
         0sHUkeG+AqqHqjauguUsPPkufRDQrFbiiBHQj6XzuiYSMfDkS7IJud6Kw48HC+Z09ZMG
         ncsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFdF4UKo8op2wZuWxGmDtbUSyzWfLHJsecyz4MTB02ixskg914Cxb15CNYMqYef9rTOGnA80EGdZYB5O3zge0=@lists.infradead.org, AJvYcCVeBvdf3MC38TIAj7ePTIdZfDG5+pxVhlJz/eqvqC/VI9NYQBbHsRXkuFutbIoDN/cF6OYa66YyOHq1yWFZJVMk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9eIbXt3y1zlztLyjx9h3ypvKymGlnzXjFTu9O7swWcB2R5wvL
	C3UErnyrmIpKCp7JgCX9ZjqdiZInvzeYgXAuucpfbJBTnsn2VZJP
X-Gm-Gg: ASbGncvKJJA+zeAja19tlGB1v3J1qSlvhxZ0a5mb0uDxQJALhRHiba5vaY+AfTdUFnz
	sIHqq1a1o6cnOWmM+ePxs8OYX+Q8rwG8+4NOnxsPZtf18DMEkEK32mOSk4sv5pcBrVnNsxWwuKw
	zUSinziAEGnzFZ2hgL2pS9OYkWhu2ayQ43G8u7Ppk2qHfHq/Grb7vrAPyveYdSovxGWjPJjfz4u
	8FtcBAb5BqqVy+3lXD9zB/7TN2bJkif8MXr4M07EB7K5Xa/JWVM6+fI7qA1cYSON//QS34COIgl
	X6H4fxw0xqse33LmWuzC77EJJu3MoNvywWJFVDN31KHDWNWnQ1pi4MXP+DPjkXXzQoKoEYovBVn
	51QKN3odkV1VjIg==
X-Google-Smtp-Source: AGHT+IG2qRFk4w/M88fUVgpXm6jRkqbjOUl092hkbtAAH0pUblWOlmPF31Mu9h5mFYUDZagqQzRg2Q==
X-Received: by 2002:a05:6000:2cd:b0:391:412b:e22b with SMTP id ffacd0b85a97d-3997f903a95mr18121647f8f.18.1742991866390;
        Wed, 26 Mar 2025 05:24:26 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d82f15585sm407605e9.24.2025.03.26.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 05:24:25 -0700 (PDT)
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
Subject: [PATCH] pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines
Date: Wed, 26 Mar 2025 13:23:54 +0100
Message-ID: <20250326122359.27504-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_052428_899653_E7C89024 
X-CRM114-Status: GOOD (  13.42  )
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
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 179 +++++++++++-----------
 1 file changed, 90 insertions(+), 89 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 547a798b71c8..9099ad34aa29 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
@@ -112,39 +113,39 @@
 #define REG_LAN_LED1_MAPPING			0x0280
 
 #define LAN4_LED_MAPPING_MASK			GENMASK(18, 16)
-#define LAN4_PHY4_LED_MAP			BIT(18)
-#define LAN4_PHY2_LED_MAP			BIT(17)
-#define LAN4_PHY1_LED_MAP			BIT(16)
-#define LAN4_PHY0_LED_MAP			0
-#define LAN4_PHY3_LED_MAP			GENMASK(17, 16)
+#define LAN4_PHY4_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x4)
+#define LAN4_PHY3_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x3)
+#define LAN4_PHY2_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x2)
+#define LAN4_PHY1_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x1)
+#define LAN4_PHY0_LED_MAP			FIELD_PREP_CONST(LAN4_LED_MAPPING_MASK, 0x0)
 
 #define LAN3_LED_MAPPING_MASK			GENMASK(14, 12)
-#define LAN3_PHY4_LED_MAP			BIT(14)
-#define LAN3_PHY2_LED_MAP			BIT(13)
-#define LAN3_PHY1_LED_MAP			BIT(12)
-#define LAN3_PHY0_LED_MAP			0
-#define LAN3_PHY3_LED_MAP			GENMASK(13, 12)
+#define LAN3_PHY4_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x4)
+#define LAN3_PHY3_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x3)
+#define LAN3_PHY2_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x2)
+#define LAN3_PHY1_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x1)
+#define LAN3_PHY0_LED_MAP			FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, 0x0)
 
 #define LAN2_LED_MAPPING_MASK			GENMASK(10, 8)
-#define LAN2_PHY4_LED_MAP			BIT(12)
-#define LAN2_PHY2_LED_MAP			BIT(11)
-#define LAN2_PHY1_LED_MAP			BIT(10)
-#define LAN2_PHY0_LED_MAP			0
-#define LAN2_PHY3_LED_MAP			GENMASK(11, 10)
+#define LAN2_PHY4_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x4)
+#define LAN2_PHY3_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x3)
+#define LAN2_PHY2_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x2)
+#define LAN2_PHY1_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x1)
+#define LAN2_PHY0_LED_MAP			FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, 0x0)
 
 #define LAN1_LED_MAPPING_MASK			GENMASK(6, 4)
-#define LAN1_PHY4_LED_MAP			BIT(6)
-#define LAN1_PHY2_LED_MAP			BIT(5)
-#define LAN1_PHY1_LED_MAP			BIT(4)
-#define LAN1_PHY0_LED_MAP			0
-#define LAN1_PHY3_LED_MAP			GENMASK(5, 4)
+#define LAN1_PHY4_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x4)
+#define LAN1_PHY3_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x3)
+#define LAN1_PHY2_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x2)
+#define LAN1_PHY1_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x1)
+#define LAN1_PHY0_LED_MAP			FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, 0x0)
 
 #define LAN0_LED_MAPPING_MASK			GENMASK(2, 0)
-#define LAN0_PHY4_LED_MAP			BIT(3)
-#define LAN0_PHY2_LED_MAP			BIT(2)
-#define LAN0_PHY1_LED_MAP			BIT(1)
-#define LAN0_PHY0_LED_MAP			0
-#define LAN0_PHY3_LED_MAP			GENMASK(2, 1)
+#define LAN0_PHY4_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x4)
+#define LAN0_PHY3_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x3)
+#define LAN0_PHY2_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x2)
+#define LAN0_PHY1_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x1)
+#define LAN0_PHY0_LED_MAP			FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, 0x0)
 
 /* CONF */
 #define REG_I2C_SDA_E2				0x001c
@@ -1476,8 +1477,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1491,8 +1492,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1506,8 +1507,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1521,8 +1522,8 @@ static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1540,8 +1541,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1555,8 +1556,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1570,8 +1571,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1585,8 +1586,8 @@ static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1604,8 +1605,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1619,8 +1620,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1634,8 +1635,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1649,8 +1650,8 @@ static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1668,8 +1669,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1683,8 +1684,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1698,8 +1699,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1713,8 +1714,8 @@ static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED0_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1732,8 +1733,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY1_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1747,8 +1748,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY1_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1762,8 +1763,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY1_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1777,8 +1778,8 @@ static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY1_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY0_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1796,8 +1797,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY2_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1811,8 +1812,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY2_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1826,8 +1827,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY2_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1841,8 +1842,8 @@ static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY2_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY1_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1860,8 +1861,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY3_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1875,8 +1876,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY3_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1890,8 +1891,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY3_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1905,8 +1906,8 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY3_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY2_LED_MAP
 		},
 		.regmap_size = 2,
 	},
@@ -1924,8 +1925,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN1_LED_MAPPING_MASK,
-			LAN1_PHY4_LED_MAP
+			LAN0_LED_MAPPING_MASK,
+			LAN0_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1939,8 +1940,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN2_LED_MAPPING_MASK,
-			LAN2_PHY4_LED_MAP
+			LAN1_LED_MAPPING_MASK,
+			LAN1_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1954,8 +1955,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN3_LED_MAPPING_MASK,
-			LAN3_PHY4_LED_MAP
+			LAN2_LED_MAPPING_MASK,
+			LAN2_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	}, {
@@ -1969,8 +1970,8 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_LAN_LED1_MAPPING,
-			LAN4_LED_MAPPING_MASK,
-			LAN4_PHY4_LED_MAP
+			LAN3_LED_MAPPING_MASK,
+			LAN3_PHY3_LED_MAP
 		},
 		.regmap_size = 2,
 	},
-- 
2.48.1


