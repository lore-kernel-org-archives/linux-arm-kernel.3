Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7081FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cUvc9znz0E7tKame3aaiF89AtwZ/kSu0btFLEU1OTU=; b=xPZ8o2Cn4TVGkYPpCP38KsZh90
	L3GGCXP9FRRXM8GaJFhh3IPrcX2rmbRDA+Mg1qqUplaHRjch8mdDcyfGn8TasrYodxSvPibYb89RU
	Hfyhkj4jVTqtMXwW9lFwQ66O4pDg/ZSquDNmBiPKfuB4GJvDlsb+VKAUSzDPdArEZgyAkAedWfdoI
	GpTcjGPjQsuoOyW2d0BymetziFRAFqkZtEZyIxztjgjB6xDoDMK5K2essWNqFIANgSd1756oFCY4z
	H93eHdgXldPbfoP6eqXG3Fr5kRtCYSkHj6rh0JUl/SIAZWiED06zlXuQ1SpoWHwBLoj2STwxq/q+I
	24sdfWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTB7-0000000H2z0-2tBg;
	Sun, 05 Jan 2025 16:08:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUT6a-0000000H2HZ-0A6s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:03:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436a03197b2so45199015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093034; x=1736697834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cUvc9znz0E7tKame3aaiF89AtwZ/kSu0btFLEU1OTU=;
        b=SJaxTboAtauG5I7EjYDor5PIKs0iZUykpX8Ok5f3/cKWcxmRBtkPJDzgEwea3G5Nu1
         em4H+DP+nHtaq+NGd7UW/O6QJYHVhCBxWj23dLD74DwptZO1kvudFdYZie6P61kTdlvV
         OyplPSzelHhEovyUQSMVu28dsDizKx6y1e2LRecmOGTbmFThWzsXYc+CPqU9rOx5WHm8
         z++HqeSxFeswQui6rz2T48SFoQnjPMYlSakkvXJYDnkpiEVa/e0sZrZJWsNPOwu/AKDQ
         mmCINuP6HGGMOWSE0jeobClpFcSNWxv2klouOghgdjddCtoBQt3bGlRgi598FaxBIJd0
         aMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093034; x=1736697834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cUvc9znz0E7tKame3aaiF89AtwZ/kSu0btFLEU1OTU=;
        b=DDNPoiIZe8PaLcc1PiJQkPhpMoJS2gBtAB3BJl279LPa0t3chi7C0bwi25PDR04BqA
         kAPDshxXwasiIKRnOw9tWB1xQrTQCfobC42bo4Aqx+KL9v12hKBKlRNy5JWRctrHreGf
         V12+wjzPZ7QFq6DXGYGid2NPc5fDga0a+Yv50IDEDpxOaESaYaBUSQbbF4BsojT9NgFU
         1JPDsc2tJWW3NuhL6Sj5ftzqZG2NXtdiNuTFzlCbw5mdvKGluU/I/41BvxZ97pRohURZ
         KUUlKS2Or8ZTrsMo9Lo1RWKnLtrY57bfa+dydR2zuErpAql+oayMBdOAdy9h3Ro/qLfy
         D1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWXe4a8OXN0HvzrLmtbI4K0bTd3mOGA8OoStxpaK8AuYxrRWG/Rl5XU5nY+UFwNvkmSsCJ7nbkGPkLh03jml6wC@lists.infradead.org
X-Gm-Message-State: AOJu0YxFclLkxfo2ZjB/98fKmDv5uKL/iMZbIsMQ1M2DWUmB5gmjSoj3
	jtcSNN+jxWytfI/DqyCUI68a4mZ8nPbgEWpKMsMtiUPHADP2I7nD
X-Gm-Gg: ASbGncv0wb4TBYVYlPWxQKTYKiOys97orvGTKqedG5LooPf/B2JmqU5yaKzFK1XcXZN
	BU53Wpm6a+Zw8jcIxWinHmrf0IyxLg+hFY/5uboEdX6/XyrneDMcYjju5glXNmd4GYyJS1y829/
	X50NnV1tnGofMkG/iCiku7zQ4zrG6uyd6zAcNnUE/qe+ZuLPxOOCXe0DVhTy/ku+5XOv+lRwsSa
	0dIWUoWEqUnzILYk4Ydvszn08YKEb9qOITAqswwncp0ECWCax1G3/Wi1tSGTCIM2mxpR/E=
X-Google-Smtp-Source: AGHT+IECdL9oah7LnyKA1Y1FSjtzazMt1aFusJKzejPK6BMfcn4QeUZTfTZ5Wv1FMehXae88IXoshw==
X-Received: by 2002:adf:ab0c:0:b0:38a:5ce8:7a33 with SMTP id ffacd0b85a97d-38a5ce87b43mr11686435f8f.49.1736093034114;
        Sun, 05 Jan 2025 08:03:54 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:53 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Sun,  5 Jan 2025 18:03:45 +0200
Message-ID: <20250105160346.418829-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_080356_075430_19E2DB4A 
X-CRM114-Status: GOOD (  20.05  )
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

USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1).

USIv1, unlike USIv2, doesn't have any known register map. Underlying
protocols that it implements have no offset, like with Exynos850.
Desired protocol can be chosen via SW_CONF register from System
Register block of the same domain as USI.

In order to select a particular protocol, the protocol has to be
selected via the System Register. Unlike USIv2, there's no need for
any setup before the given protocol becomes accessible apart from
enabling the APB clock and the protocol operating clock.

Modify the existing driver in order to allow USIv1 instances in
Exynos8895 to probe and set their protocol.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 65 ++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..3dd8202ef 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -16,6 +16,18 @@
 
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
+/* USIv1: System Register: SW_CONF register bits */
+#define USI_V1_SW_CONF_NONE		0x0
+#define USI_V1_SW_CONF_I2C0		0x1
+#define USI_V1_SW_CONF_I2C1		0x2
+#define USI_V1_SW_CONF_I2C0_1		0x3
+#define USI_V1_SW_CONF_SPI		0x4
+#define USI_V1_SW_CONF_UART		0x8
+#define USI_V1_SW_CONF_UART_I2C1	0xa
+#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
+					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
+					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
+
 /* USIv2: System Register: SW_CONF register bits */
 #define USI_V2_SW_CONF_NONE	0x0
 #define USI_V2_SW_CONF_UART	BIT(0)
@@ -34,7 +46,8 @@
 #define USI_OPTION_CLKSTOP_ON	BIT(2)
 
 enum exynos_usi_ver {
-	USI_VER2 = 2,
+	USI_VER1 = 1,
+	USI_VER2,
 };
 
 struct exynos_usi_variant {
@@ -66,19 +79,39 @@ struct exynos_usi_mode {
 	unsigned int val;		/* mode register value */
 };
 
-static const struct exynos_usi_mode exynos_usi_modes[] = {
-	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
-	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
-	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
-	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+#define USI_MODES_MAX (USI_MODE_UART_I2C1 + 1)
+static const struct exynos_usi_mode exynos_usi_modes[][USI_MODES_MAX] = {
+	[USI_VER1] = {
+		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
+		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
+		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V1_SW_CONF_SPI },
+		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V1_SW_CONF_I2C0 },
+		[USI_MODE_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
+		[USI_MODE_I2C0_1] =	{ .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
+		[USI_MODE_UART_I2C1] =	{ .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
+	}, [USI_VER2] = {
+		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
+		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
+		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
+		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+	},
 };
 
 static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
 static const struct exynos_usi_variant exynos850_usi_data = {
 	.ver		= USI_VER2,
 	.sw_conf_mask	= USI_V2_SW_CONF_MASK,
-	.min_mode	= USI_V2_NONE,
-	.max_mode	= USI_V2_I2C,
+	.min_mode	= USI_MODE_NONE,
+	.max_mode	= USI_MODE_I2C,
+	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
+	.clk_names	= exynos850_usi_clk_names,
+};
+
+static const struct exynos_usi_variant exynos8895_usi_data = {
+	.ver		= USI_VER1,
+	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
+	.min_mode	= USI_MODE_NONE,
+	.max_mode	= USI_MODE_UART_I2C1,
 	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
 	.clk_names	= exynos850_usi_clk_names,
 };
@@ -88,6 +121,10 @@ static const struct of_device_id exynos_usi_dt_match[] = {
 		.compatible = "samsung,exynos850-usi",
 		.data = &exynos850_usi_data,
 	},
+	{
+		.compatible = "samsung,exynos8895-usi",
+		.data = &exynos8895_usi_data,
+	},
 	{ } /* sentinel */
 };
 MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
@@ -109,14 +146,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
 	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
 		return -EINVAL;
 
-	val = exynos_usi_modes[mode].val;
+	val = exynos_usi_modes[usi->data->ver][mode].val;
 	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
 				 usi->data->sw_conf_mask, val);
 	if (ret)
 		return ret;
 
 	usi->mode = mode;
-	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
+	dev_dbg(usi->dev, "protocol: %s\n",
+		exynos_usi_modes[usi->data->ver][usi->mode].name);
 
 	return 0;
 }
@@ -169,9 +207,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 		return ret;
 
 	if (usi->data->ver == USI_VER2)
-		return exynos_usi_enable(usi);
+		ret = exynos_usi_enable(usi);
+	else
+		ret = clk_bulk_prepare_enable(usi->data->num_clks,
+					      usi->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
-- 
2.43.0


