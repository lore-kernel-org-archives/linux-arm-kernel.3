Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ACBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk17Af825MoY5+ViL1QPuoghulUe2DIpjNeLf3FSRxs=; b=Nih6Qe4KppoHiRZC4KDHEBVb5m
	VbQJa+njeclFmX9aw3eTXfPxP+gJ1P+Sw69UkTs3mykHTzDFf+mDgKeQacv9ZkOo/5vdg1OUCK182
	S6xeyuWcVYkh6oss7cAxhxm/80uEMWlMZbGn1yeuTYCdmRu79myuGM3qcENlUCPlSqfHYNDMax55o
	qGXTI6Lx+CiDuJnF6ocO7GHYw/dQ91Y7GJniAyJgts63tcW0CJGJY2cJbTaX7O2pmkQ+3QbITytIh
	AFB01l38IyA/xhdcPA+6pJBxrS6wOrPxb0jI9jqAB7j0UIb/IgHVXBauBMPoyJiSTwwTO7vBQrvp2
	2UlBQF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBDG-0000000B6sm-1H4n;
	Sun, 23 Feb 2025 12:36:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0N-0000000B4ta-0Uq1;
	Sun, 23 Feb 2025 12:22:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f70170005so1882947f8f.3;
        Sun, 23 Feb 2025 04:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313361; x=1740918161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk17Af825MoY5+ViL1QPuoghulUe2DIpjNeLf3FSRxs=;
        b=YDAQae+ZodXOMI8wSSIfVQcB88NuxSHZtL6QUBNxugMtBgMK3ikY2TfmnDjyi4mEM6
         XsgNgfr4mqXQY9WK5/uaWLa2sUB8CUpweYBxaVfC1sqnJzhvY4lyHe6nNxPHL234IF1X
         ZtKtJaPW7Om2xYQhkKNXaeGiVnRVxTaxtiBWXADvorXB08pNXJuhnUBfqJWoD0T0+wxi
         HYYtCHDsCm8X2Qm3hVKHmGXBHuvlcG0+rTy6QEjB5EozNcHvz+t1m7gVwS6rO0J5aZir
         YSHoUnORbVRYE8HyLifi3G5R2DYpN64KSjR3OKSxaWyt+FVLO2m2zW3Of5avhIkJO9de
         EEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313361; x=1740918161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mk17Af825MoY5+ViL1QPuoghulUe2DIpjNeLf3FSRxs=;
        b=M0OA0wy2uYCE+Wj4bvHcHx4EKiUA3LhDjLPkGktN/FqsFo/nuQIlDsaRKx1A919+re
         5hc6VOo2zN+7N5Vjt2uxRz6q/4POFkTiltbgfH2qWl6OnxnbEcNO/5qFfbOTEIlpfTpQ
         yLLBGv0Uf7F/CZlfCZzoG1C9uV6zqLkGMX2wbBOcV6bicyYqPriUWX5tDCEBH30pfRAy
         ZV4Ek7NkDhw7G06301/wSShvd8GfpNKuQz6jDyfn+FuOQr2GSTx/muZfVYQPygYB8x/H
         JYBJjGsxr0Yor7M++TToUINSpXvNwREdwecjzb/xAFK+zP00vqWW7Yl7apmCoXG61PJE
         anNA==
X-Forwarded-Encrypted: i=1; AJvYcCUkZlJfYZw6vExOjO0UNwAcfPWUL/oPw70u+nbSe73keSgIxgTCvGPY2hQaSYOeLfpu3yGmheT+rFcCtbNziUml@lists.infradead.org, AJvYcCUqUHe16TTsQfZ1K8sOGJcsx9FPXCitByW9fSenWTConmPlZshhHxKruuqHIO/yBUdY/cjm88TZz0Ye@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Wzssdj+QiWrq37OmzYkoBGUR8F5gzrbWdBy7yw+shOCWukpu
	+8R5gYhWmGzrYtwtbvH42GFdQGQ9AIW2R4Pn9EFMJ5hUqCvDZTRb
X-Gm-Gg: ASbGnctWKXZj6QprU19LcziIOVAiGxPkRx3BRpGlea/ofPDDywKNsrV3bjLGPSTVu0M
	s8xHEsd8HLr6h25FTWjMBuZyAPJ4XsfWzMYqNs3QDBNtoWzFqo0lVXL+5blcqCKDrMl1ocGVskc
	3HB/XIa2xQMmA+H5BF06QICFsUiyiPqrLn0EUsH+jneb7Npqv24hTf58pZKRjRueKsy2H0c7YqJ
	5tpchN/JxyKo2cxYEiGeJYJLWVGtNU3lR/WnB6mDJRyJbKcEX0R3KDsafEoqzbdqikX/X/Pc3cL
	IC1HPZNl7f0T4lhuoykcW5RlvnhEhmEwE/D35vdLky58JUUIYDNt6d+ovkd6k2sjEVirhLhGyjH
	QnA==
X-Google-Smtp-Source: AGHT+IGWxAXkSNHk+1KebllT+xCEuhjnywiq2a9VK2BhfWGgHCBvEOWfCz0XyKO8Rf1jRfUwEJMmcw==
X-Received: by 2002:a05:6000:1ac7:b0:38d:d299:709f with SMTP id ffacd0b85a97d-38f6f0d1d13mr8003029f8f.48.1740313361328;
        Sun, 23 Feb 2025 04:22:41 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:40 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] phy: samsung: add Exynos2200 usb phy controller
Date: Sun, 23 Feb 2025 14:22:27 +0200
Message-ID: <20250223122227.725233-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042243_162644_EEE7663A 
X-CRM114-Status: GOOD (  24.72  )
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

The Exynos2200 SoC comes with a TI external repeater and 3 USB PHYs:
- snps eUSB2 for UTMI
- snps USBDP combophy for PIPE3 and DP
- samsung USBCON phy

The USBCON phy is an intermediary between the USB controller (DWC3)
and the underlying PHYs. Add a new driver for it, modelled to take
a phandle to the high-speed PHY for now.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/Kconfig                 |  12 +
 drivers/phy/samsung/Makefile                |   1 +
 drivers/phy/samsung/phy-exynos2200-usbcon.c | 250 ++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e2330b089..0f809a382 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -77,6 +77,18 @@ config PHY_S5PV210_USB2
 	  particular SoC is compiled in the driver. In case of S5PV210 two phys
 	  are available - device and host.
 
+config PHY_EXYNOS2200_USBCON
+	tristate "Exynos2200 USBCON PHY driver"
+	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
+	depends on HAS_IOMEM
+	select GENERIC_PHY
+	select MFD_SYSCON
+	default y
+	help
+	  Enable USBCON PHY support for Exynos2200 SoC.
+	  This driver provides PHY interface for the USBCON phy, which acts as
+	  an intermediary between the USB controller and underlying PHYs.
+
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
index fea1f96d0..e2686a3f5 100644
--- a/drivers/phy/samsung/Makefile
+++ b/drivers/phy/samsung/Makefile
@@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
+obj-$(CONFIG_PHY_EXYNOS2200_USBCON)	+= phy-exynos2200-usbcon.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
diff --git a/drivers/phy/samsung/phy-exynos2200-usbcon.c b/drivers/phy/samsung/phy-exynos2200-usbcon.c
new file mode 100644
index 000000000..aad59349e
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynos2200-usbcon.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+
+#define EXYNOS2200_USBCON_LINKCTRL		0x4
+#define LINKCTRL_FORCE_QACT			BIT(8)
+
+#define EXYNOS2200_USBCON_UTMI_CTRL		0x10
+#define UTMI_CTRL_FORCESLEEP			BIT(13)
+#define UTMI_CTRL_FORCESUSPEND			BIT(12)
+#define UTMI_CTRL_FORCE_VBUSVALID		BIT(1)
+#define UTMI_CTRL_FORCE_BVALID			BIT(0)
+
+#define EXYNOS2200_USBCON_LINK_CLKRST		0xc
+#define LINK_CLKRST_SW_RST			BIT(0)
+
+struct exynos2200_usbcon_phy_drvdata {
+	const char * const *clk_names;
+	int num_clks;
+};
+
+struct exynos2200_usbcon_phy {
+	struct phy *phy;
+	void __iomem *base;
+	struct regmap *reg_pmu;
+	struct clk_bulk_data *clks;
+	const struct exynos2200_usbcon_phy_drvdata *drv_data;
+	u32 pmu_offset;
+	struct phy *hs_phy;
+};
+
+static void exynos2200_usbcon_phy_isol(struct exynos2200_usbcon_phy *inst,
+				       bool isolate)
+{
+	unsigned int val;
+
+	if (!inst->reg_pmu)
+		return;
+
+	val = isolate ? 0 : EXYNOS4_PHY_ENABLE;
+
+	regmap_update_bits(inst->reg_pmu, inst->pmu_offset,
+			   EXYNOS4_PHY_ENABLE, val);
+}
+
+static void exynos2200_usbcon_phy_write_mask(void __iomem *base, u32 offset,
+					     u32 mask, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg &= ~mask;
+	reg |= val & mask;
+	writel(reg, base + offset);
+
+	/* Ensure above write is completed */
+	readl(base + offset);
+}
+
+static int exynos2200_usbcon_phy_init(struct phy *p)
+{
+	int ret;
+	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
+
+	/* Power-on PHY ... */
+	ret = clk_bulk_prepare_enable(phy->drv_data->num_clks, phy->clks);
+	if (ret)
+		return ret;
+
+	/*
+	 * ... and ungate power via PMU. Without this here, we can't access
+	 * registers
+	 */
+	exynos2200_usbcon_phy_isol(phy, false);
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This will force
+	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
+	 * the PHY clock is not gated by the hardware.
+	 */
+	exynos2200_usbcon_phy_write_mask(phy->base, EXYNOS2200_USBCON_LINKCTRL,
+					 LINKCTRL_FORCE_QACT,
+					 LINKCTRL_FORCE_QACT);
+
+	/* Reset Link */
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST,
+					 LINK_CLKRST_SW_RST);
+
+	fsleep(10); /* required after POR high */
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST, 0);
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_UTMI_CTRL,
+					 UTMI_CTRL_FORCESLEEP |
+					 UTMI_CTRL_FORCESUSPEND,
+					 0);
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_UTMI_CTRL,
+					 UTMI_CTRL_FORCE_BVALID |
+					 UTMI_CTRL_FORCE_VBUSVALID,
+					 UTMI_CTRL_FORCE_BVALID |
+					 UTMI_CTRL_FORCE_VBUSVALID);
+
+	return phy_init(phy->hs_phy);
+}
+
+static int exynos2200_usbcon_phy_exit(struct phy *p)
+{
+	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = phy_exit(phy->hs_phy);
+	if (ret)
+		return ret;
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_UTMI_CTRL,
+					 UTMI_CTRL_FORCESLEEP |
+					 UTMI_CTRL_FORCESUSPEND,
+					 UTMI_CTRL_FORCESLEEP |
+					 UTMI_CTRL_FORCESUSPEND);
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST,
+					 LINK_CLKRST_SW_RST);
+
+	/* Gate power via PMU */
+	exynos2200_usbcon_phy_isol(phy, true);
+
+	clk_bulk_disable_unprepare(phy->drv_data->num_clks, phy->clks);
+
+	return 0;
+}
+
+static const struct phy_ops exynos2200_usbcon_phy_ops = {
+	.init		= exynos2200_usbcon_phy_init,
+	.exit		= exynos2200_usbcon_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int exynos2200_usbcon_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos2200_usbcon_phy *phy;
+	const struct exynos2200_usbcon_phy_drvdata *drv_data;
+	struct phy_provider *phy_provider;
+	struct phy *generic_phy;
+	int ret;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
+	phy->drv_data = drv_data;
+
+	phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(phy->base))
+		return PTR_ERR(phy->base);
+
+	phy->clks = devm_kcalloc(dev, drv_data->num_clks,
+				 sizeof(*phy->clks), GFP_KERNEL);
+	if (!phy->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < drv_data->num_clks; ++i)
+		phy->clks[i].id = drv_data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, phy->drv_data->num_clks,
+				phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	phy->reg_pmu = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							    "samsung,pmu-syscon",
+							    1, &phy->pmu_offset);
+	if (IS_ERR(phy->reg_pmu)) {
+		dev_err(dev, "Failed to lookup PMU regmap\n");
+		return PTR_ERR(phy->reg_pmu);
+	}
+
+	phy->hs_phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	if (IS_ERR(phy->hs_phy))
+		return dev_err_probe(dev, PTR_ERR(phy->hs_phy),
+				     "failed to get hs_phy\n");
+
+	generic_phy = devm_phy_create(dev, NULL, &exynos2200_usbcon_phy_ops);
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create phy %d\n", ret);
+
+	dev_set_drvdata(dev, phy);
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register phy provider\n");
+
+	return 0;
+}
+
+static const char * const exynos2200_clk_names[] = {
+	"bus",
+};
+
+static const struct exynos2200_usbcon_phy_drvdata exynos2200_usbcon_phy = {
+	.clk_names		= exynos2200_clk_names,
+	.num_clks		= ARRAY_SIZE(exynos2200_clk_names),
+};
+
+static const struct of_device_id exynos2200_usbcon_phy_of_match_table[] = {
+	{
+		.compatible = "samsung,exynos2200-usbcon-phy",
+		.data = &exynos2200_usbcon_phy,
+	}, { },
+};
+MODULE_DEVICE_TABLE(of, exynos2200_usbcon_phy_of_match_table);
+
+static struct platform_driver exynos2200_usbcon_phy_driver = {
+	.probe		= exynos2200_usbcon_phy_probe,
+	.driver = {
+		.name	= "exynos2200-usbcon-phy",
+		.of_match_table = exynos2200_usbcon_phy_of_match_table,
+	},
+};
+
+module_platform_driver(exynos2200_usbcon_phy_driver);
+MODULE_DESCRIPTION("Exynos2200 USBCON PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


