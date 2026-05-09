Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6711CD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNthY/vc+xApAiW+Ngr8WtzfKJImSMBfZhPBgaVC8u0=; b=DwYsASyJ3m1/Z9qiL8X6sa9TEN
	Qfu/82UxazgJv1tp7g2oxehLvDLp/9wSfBsdJLqVkW3h1ekL+hwfRq4XGJ3IcO4kp/TDD2JNNT8t9
	qh9qYsHGt8Q5gkJwxZAJHC2Tzbj91zVZ3BxuR+OM8FWpzCTj6SU5Z1ehon2JLapALquE3K5FyWXp/
	sKUwUyKBcJrFUu6G+5T6P2E4oPyaJElt2G4pROghP+T11JsP3MNhgA8vAl78yMPdbCDzODhS2b0y7
	ALngz/DPCCyRvnCWRMWkKF9Vq6EbJouwZSkzLafT9QnrNs4InGYX1Tkyo5JowhQ9dk4NA+b6eK8Gf
	Fi5xRmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmul-00000009TNj-3iFd;
	Sat, 09 May 2026 19:00:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuc-00000009TFn-3AKd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso26914015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353229; x=1778958029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNthY/vc+xApAiW+Ngr8WtzfKJImSMBfZhPBgaVC8u0=;
        b=H2AR6wKm7Co+77DWz+ma2zPn8ZomT90AX7xDiosMgTeZTDQkEm4jxrvIg+j0OUCNHD
         M5TYG++nrQYvmq5ia//YBa6ND6noEN7JIpzwPZtlKNWPNzJ3ax5Zj4iVX6dra5sEDNF7
         LjJbOx0MlEjXAVJPu5qq/oQgmt2LYZFofH5HCicTt9dM0BLZWVs3Jaw5nzoobxab7XNf
         FsYdJx6vwArP8wiTvy8/j85td0BIX6yT6b78klcViktor19oSXjzeV0Obv5rQj6GtRrh
         GasUOqqwezPJBUb02ifRoNGR6OmXDCXK6KcvepZPV41b0SrFchVKN2tIrN2vvYx99CTh
         lGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353229; x=1778958029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNthY/vc+xApAiW+Ngr8WtzfKJImSMBfZhPBgaVC8u0=;
        b=G7pkW2u+mT2EX/r8+T5dSnGP97PXVvMNsA/W0BnYEv9IpnPQS3U7cwOv0A1wULpOML
         f5LLujd9oGJya3TWswASYrev8m/d3bsQJppY1zKqc7a8ZJu1/+eHxoqUkGzVAySbsW2h
         eCPQ8PnzUTvyT07j7QiB9amuivTHaeaPf0eiHPgJI1lm9cYTdHcHZ3o7FgkOa8U+Bzqt
         NQgdc6Ct4MunGqwjyst7QmGtIWTfXjrbpXSWGS0yEp0EmQia+olO9b9LVV4CVn6lZBF1
         ZNEJlDFsxnG0whg0/zVAC6pNDpOljnFDwlD7WKdYPiciITQamNLs01rF+91NZjBQVIQF
         svLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aF/ODdc5Arf4jobKg7xm/BRXpoG1gqABd1s0xvS7s24WrTWajjurs6CTGTG+BtF5ONMwJ73xr15yK+tgSnm8a@lists.infradead.org
X-Gm-Message-State: AOJu0YwMpS2oG7V7wcquqw46TYxiGr9vK5+vrTugpLoiCy2xoAYScqIT
	LzzygDynkECTcKgkf2ihXhfEJOVJo2PJ5+RuHf5nbk/jM1cQ/p3W1iOP
X-Gm-Gg: Acq92OFS099Cp8Ep4RuKWUbqKR+PuOjT/SoI2QFz4624bW3Fm508eFlCdAPzWS/MHOR
	MUtTAqORL95VH9G0QXXY0WtmZVhi5C6J1XmHw6YY5zaOtV+5c1gYb3q1QNTTqxydjEzxWM0p8KB
	GqhxRTiNCWkdGQloFae9BlNiuP1l4mzCSVgL5nKolsKZJ6tfRrXN/tN13+oIb3wl0jkIqRnLD/G
	ChHX3dz9aAhQcYU7mC9asag6pkdFVr85CoA/D2h1/8V7dxVvVjYONAWn/ePlgTnW+/9bCUMQ/cj
	PmBeQymVb3zeqmSmsJ7fSvy/HlQbsyMRdXWwctulhJi9BWcE3NS9R8G12fBIf5ak/HS2OvPYUG+
	doGXX96cFE21ver0fsX9ous4o/fIwdsggM0TsK9MfD0pRN/8OLcp0yVB+mEBxxUTKyNBscedRZL
	KPVSMUSAzjmCPzXjadS27j8+EGLyvgk7Nk+fr+8VihOilhns7l4FjhpHaZJQygnzhij+g=
X-Received: by 2002:a05:600c:b8d:b0:489:1fa5:997f with SMTP id 5b1f17b1804b1-48e70691673mr52380085e9.9.1778353228681;
        Sat, 09 May 2026 12:00:28 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:28 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 6/8] drm/sun4i: Add planes driver
Date: Sat,  9 May 2026 21:00:13 +0200
Message-ID: <20260509190015.79086-7-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120030_846062_B70E1205 
X-CRM114-Status: GOOD (  27.49  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

This driver serves just as planes sharing manager, needed for Display
Engine 3.3 and newer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- removed CONFIG_DRM_SUN50I_PLANES Kconfig entirely
- make sun50i_planes_of_table[] static
- folded sun50i_planes_node_is_planes() into sun50i_planes_setup()
- sun50i_planes_setup() error returns now ERR_PTR(-EINVAL) instead of NULL
  at first three checks
- quirks and of_device_id table moved on top to avoid forward declaration

 drivers/gpu/drm/sun4i/Makefile        |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c | 201 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h |  41 ++++++
 3 files changed, 244 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11..501e3d867918 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -16,7 +16,8 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
-				   sun8i_vi_scaler.o sun8i_csc.o
+				   sun8i_vi_scaler.o sun8i_csc.o \
+				   sun50i_planes.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4i/sun50i_planes.c
new file mode 100644
index 000000000000..6469de1baf03
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#include <drm/drm_device.h>
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "sun50i_planes.h"
+#include "sun8i_ui_layer.h"
+#include "sun8i_vi_layer.h"
+
+static const struct sun50i_planes_quirks sun50i_h616_planes_quirks = {
+	.def_map = {
+		{
+			.map = {0, 6, 7},
+			.num_ch = 3,
+		},
+		{
+			.map = {1, 2, 8},
+			.num_ch = 3,
+		},
+	},
+	.cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		/*
+		 * TODO: All planes support scaling, but driver needs
+		 * improvements to properly support it.
+		 */
+		.scaler_mask    = 0,
+		.scanline_yuv	= 4096,
+	},
+};
+
+static const struct of_device_id sun50i_planes_of_table[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-planes",
+		.data = &sun50i_h616_planes_quirks
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer)
+{
+	struct sun50i_planes *planes = dev_get_drvdata(dev);
+	const struct sun50i_planes_quirks *quirks;
+	struct drm_plane **drm_planes;
+	const struct default_map *map;
+	unsigned int i;
+
+	if (!of_match_node(sun50i_planes_of_table, dev->of_node)) {
+		dev_err(dev, "Device is not planes driver!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!planes) {
+		dev_err(dev, "Planes driver is not loaded yet!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (mixer > 1) {
+		dev_err(dev, "Mixer index is too high!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	quirks = planes->quirks;
+	map = &quirks->def_map[mixer];
+
+	drm_planes = devm_kcalloc(drm->dev, map->num_ch + 1,
+				  sizeof(*drm_planes), GFP_KERNEL);
+	if (!drm_planes)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < map->num_ch; i++) {
+		unsigned int phy_ch = map->map[i];
+		struct sun8i_layer *layer;
+		enum drm_plane_type type;
+
+		if ((i == 0 && map->num_ch == 1) || i == 1)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		if (phy_ch < UI_PLANE_OFFSET)
+			layer = sun8i_vi_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+		else
+			layer = sun8i_ui_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+
+		if (IS_ERR(layer)) {
+			dev_err(drm->dev,
+				"Couldn't initialize DRM plane\n");
+			return ERR_CAST(layer);
+		}
+
+		drm_planes[i] = &layer->plane;
+	}
+
+	return drm_planes;
+}
+EXPORT_SYMBOL(sun50i_planes_setup);
+
+static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
+{
+	const struct sun50i_planes_quirks *quirks = planes->quirks;
+	unsigned int i, j;
+	u32 mapping;
+
+	mapping = 0;
+	for (j = 0; j < MAX_DISP; j++)
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch < UI_PLANE_OFFSET)
+				mapping |= j << (ch * 2);
+			else
+				mapping |= j << ((ch - UI_PLANE_OFFSET) * 2 + 16);
+		}
+	regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG, mapping);
+
+	for (j = 0; j < MAX_DISP; j++) {
+		mapping = 0;
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch >= UI_PLANE_OFFSET)
+				ch += 2;
+
+			mapping |= ch << (i * 4);
+		}
+		regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN_MUX_REG + j * 4, mapping);
+	}
+}
+
+static const struct regmap_config sun50i_planes_regmap_config = {
+	.name		= "planes",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x17fffc,
+};
+
+static int sun50i_planes_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sun50i_planes *planes;
+	void __iomem *regs;
+
+	planes = devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
+	if (!planes)
+		return -ENOMEM;
+
+	planes->quirks = of_device_get_match_data(&pdev->dev);
+	if (!planes->quirks)
+		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
+
+	planes->mapping = syscon_regmap_lookup_by_phandle(dev->of_node,
+							  "allwinner,plane-mapping");
+	if (IS_ERR(planes->mapping))
+		return dev_err_probe(dev, PTR_ERR(planes->mapping),
+				     "Unable to get mapping\n");
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	planes->regs = devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap_config);
+	if (IS_ERR(planes->regs))
+		return PTR_ERR(planes->regs);
+
+	dev_set_drvdata(dev, planes);
+
+	sun50i_planes_init_mapping(planes);
+
+	return 0;
+}
+
+static struct platform_driver sun50i_planes_platform_driver = {
+	.probe		= sun50i_planes_probe,
+	.driver		= {
+		.name		= "sun50i-planes",
+		.of_match_table	= sun50i_planes_of_table,
+	},
+};
+module_platform_driver(sun50i_planes_platform_driver);
+
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
+MODULE_DESCRIPTION("Allwinner DE33 planes driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/sun4i/sun50i_planes.h
new file mode 100644
index 000000000000..e5b54ed16178
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#ifndef _SUN50I_PLANES_H_
+#define _SUN50I_PLANES_H_
+
+#include "sun8i_mixer.h"
+
+/* mapping registers, located in clock register space */
+#define SUNXI_DE33_DE_CHN2CORE_MUX_REG	0x24
+#define SUNXI_DE33_DE_PORT02CHN_MUX_REG	0x28
+#define SUNXI_DE33_DE_PORT12CHN_MUX_REG	0x2c
+
+#define MAX_DISP	2
+#define MAX_CHANNELS	8
+#define UI_PLANE_OFFSET	6
+
+struct regmap;
+struct drm_device;
+
+struct default_map {
+	unsigned int map[MAX_CHANNELS];
+	unsigned int num_ch;
+};
+
+struct sun50i_planes_quirks {
+	struct default_map	def_map[MAX_DISP];
+	struct sun8i_layer_cfg	cfg;
+};
+
+struct sun50i_planes {
+	struct regmap				*regs;
+	struct regmap				*mapping;
+	const struct sun50i_planes_quirks	*quirks;
+};
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer);
+
+#endif /* _SUN50I_PLANES_H_ */
-- 
2.54.0


