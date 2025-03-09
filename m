Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A34C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaDdHrFfN/cuId2Cj+ZtZ5wegXqwq61TDynErdHq3Vs=; b=DV1WT6vwtlR+5xqlJgkL0x0tjs
	MjIV7UFqodAlfYB1TwBmcGMKq8pNQx2f5aTRP6MjWWL3AaFDK3b2kZzcug084SG4QAiYwo4k9bC7K
	SwHWMVp3KKUS6XiTgaPyzN79NRdZiOuKbkxnbj04v5Dt1hJChOm7BCqnvUxcYusRoNsg6/91Ib//T
	KN6q3PKHgn9fSwCWLq+BlreyRE9FZeUQmNei6tn+Mr1/22cU8B1pj/7mM1B/7juAlnOb0CHihvqvQ
	Lvp6ANCEWyMeoWdR8Aa3T4XZq8fYh6ZwwmvrA28jBXWVSD675UqojUvRwMA7wZ3n+5DdAm3mjQlvx
	zwzuWU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGyK-00000000cWa-1tP8;
	Sun, 09 Mar 2025 13:45:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGk1-00000000aU1-0kUH;
	Sun, 09 Mar 2025 13:30:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso4292395e9.3;
        Sun, 09 Mar 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527051; x=1742131851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaDdHrFfN/cuId2Cj+ZtZ5wegXqwq61TDynErdHq3Vs=;
        b=RdP1vDOQXqERYQ7rgGFdczKIynPGCjd+MGj8GqF8KzmCO0huPPNQKim+x6tEZsycZe
         kGPVDV1huqAtM72BnunjaQIVba64s2VcO1kncMvZHd3e7Yqai/YO/VNl5gGt0Qdrg8kA
         lrAMm1+n7BiI7ZKmCWHFAZUDht5sKBfkyZEvvSZKxdBer6WMz/gSH1Cnigfj7a7UrElV
         YB1ehR1xSGQBW4Zd1RevCq+cubsAtNr4yMlrbr4z68rCaWb1TLUPOhLIF1eVxK5tzuF0
         4ddnGEDw8DdaZwvRotWALmQCShbQqYrsEFSGLf0Z9qeECODlwpfUHrs0zXUekoFsNaDa
         IG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527051; x=1742131851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaDdHrFfN/cuId2Cj+ZtZ5wegXqwq61TDynErdHq3Vs=;
        b=G2W5iCefPlYgKDRMTwxF/FncKFYokVSnC2SubNuE2aZrs4LCbAjdmdmiHf34linluM
         XOz2UFmlq85Te5TOrRfESccOpOgJzw3j/H3td/6pSUB5IOihJ6vIROc4lxJ4KVXDTGnF
         OfHgLOE1gdkF0g8ZP9LHZSDCqtTV4qDYOAODxwvjW/ABVU488hee1smn+CW2J/CYXjLp
         HxqMx9I/bM7D8t/cYMikYrdUVh8CLGQAxXVDKQRtS5euWShi/0GIKaaIuUdz9Van+xi+
         pCKYf3BHjf5sS4exbCbUbxcSFOcMA1seMfpux3hQqF304niNCoRmjD7NCvoZHxutcn2c
         v4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL8sFbh4uy7Fc1MQFHd8exMAMi8DEQ+7mP9XfDbZ2Atths9sxoBcF1xsH4QSGiT0zAsGmHYQssWEZnVxCF2Voa@lists.infradead.org, AJvYcCUQBxPdWQ1g06W61aBxagpjzbyjKij5k8wDMnQJDAH3nQon1cl6Brj4sLJZIoPKGXjkzs3BYNPtMb8AO0WELCA=@lists.infradead.org, AJvYcCW2Vr1Bu/Cj/+z+nxLxKMxSoWKcBrQXwsErYVd0SeuNxVi4EkmgEj2dIchzDAiW5dnpFgFoFHVzdY1k@lists.infradead.org
X-Gm-Message-State: AOJu0Yx14FM2fH9nikKmZ4IjBPEzPhZrSdxGr3rDF1WbrTX5KDKQ5KRe
	74Xen4eEYgqx52oObc+AIvj/RXj+m6Cy4TVX/5Pv+PIdDqFnGyh4kL0G3w==
X-Gm-Gg: ASbGncs2uprskYaEcTQATci08+YtyhUgva6imKsgUAW4vkZE5sj6nOn6s+tLH9wqgl7
	dmSU3EeWQFSdyQTp3c8W5wY+tQXAU4f2+7mccxuf8YAppLYCdMSRYEDYkY4ojFten9adozUhuPN
	BdkwogJUt7h+H7uMw9PKvfYZKg94LEUJfdHqX0TzziCVqOjozc3hCx/ckmRKjoK7Sa++LrrqOlN
	Obi+eHVeVIoteDQrMR1iIgOH4nhPSm0ga1HoVV0mp+ZMrxuN4z2mMAt3xOvpbRB1tSLQRF+3g3e
	BkmPa9BYAeunf4fFuyZ1UaI/dd5++IJq9oXv5RIV1OlitBkloqqxT/H6XdGB6If2N8aBblgZLN9
	j5c2WoAsLzOW+Ug==
X-Google-Smtp-Source: AGHT+IEiSIK5016GDeMsMvzWNTkzBaWLO48BvAc2SsYBWNmLkvti3ZmfcW0CvOCphh/orfbgClUAaw==
X-Received: by 2002:a05:6000:1867:b0:390:f987:26a1 with SMTP id ffacd0b85a97d-39132d885bcmr5325580f8f.29.1741527051346;
        Sun, 09 Mar 2025 06:30:51 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 08/13] soc: airoha: add support for configuring SCU SSR Serdes port
Date: Sun,  9 Mar 2025 14:29:39 +0100
Message-ID: <20250309132959.19045-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063053_223212_E075CE0C 
X-CRM114-Status: GOOD (  33.41  )
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

Add support for configuring SCU SSR Serdes port. Airoha AN7581 SoC can
configure the different Serdes port by toggling bits in the SCU register
space.

Port Serdes mode are mutually exclusive, force example the USB2 Serdes port
can either used for USB 3.0 or PCIe 2 port. Enabling USB 3.0 makes the
PCIe 2 to not work.

The current supported Serdes port are:
- WiFi 1 and defaults to PCIe0 1 line mode
- Wifi 2 and defaults to PCIe1 1 line mode
- USB 1 and defaults to USB 3.0 mode
- USB 2 and defaults to USB 3.0 mode

WiFi 1, WiFi 2 and USB 1 also support a particular Ethernet mode that
can toggle between USXGMII or HSGMII mode (USB 1 only to HSGMII)
Such mode doesn't configure bits as specific Ethernet PCS driver will
take care of configuring the Serdes mode based on what is required.

This driver is to correctly setup these bits and provide an API to read
the current status of the Serdes port. Single driver can't independently
set the Serdes port mode as that would cause a conflict if someone
declare, for example, in DT (and enable) PCIe 2 port and USB2 3.0 port.

Drivers will use the airoha_scu_ssr_get_serdes_mode function and will
validate the Serdes port is the expected one and fail if it's not.

Each driver will have to define in DT the phandle airoha,scu-ssr
pointing to the SCU SSR node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                               |   1 +
 drivers/soc/Kconfig                       |   1 +
 drivers/soc/Makefile                      |   1 +
 drivers/soc/airoha/Kconfig                |  18 ++
 drivers/soc/airoha/Makefile               |   3 +
 drivers/soc/airoha/airoha-scu-ssr.c       | 195 ++++++++++++++++++++++
 include/linux/soc/airoha/airoha-scu-ssr.h |  17 ++
 include/linux/soc/soc/airoha-scu-ssr.h    |  17 ++
 8 files changed, 253 insertions(+)
 create mode 100644 drivers/soc/airoha/Kconfig
 create mode 100644 drivers/soc/airoha/Makefile
 create mode 100644 drivers/soc/airoha/airoha-scu-ssr.c
 create mode 100644 include/linux/soc/airoha/airoha-scu-ssr.h
 create mode 100644 include/linux/soc/soc/airoha-scu-ssr.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9944845ae9f5..fe34c80b8d52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -741,6 +741,7 @@ M:	Christian Marangi <ansuelsmth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
+F:	drivers/soc/airoha/airoha-scu-ssr.c
 F:	include/dt-bindings/soc/airoha,scu-ssr.h
 
 AIROHA SPI SNFI DRIVER
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 6a8daeb8c4b9..21bacefd2e06 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "SOC (System On Chip) specific Drivers"
 
+source "drivers/soc/airoha/Kconfig"
 source "drivers/soc/amlogic/Kconfig"
 source "drivers/soc/apple/Kconfig"
 source "drivers/soc/aspeed/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 2037a8695cb2..4338730af0aa 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the Linux Kernel SOC specific device drivers.
 #
 
+obj-$(CONFIG_ARCH_AIROHA)	+= airoha/
 obj-y				+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
diff --git a/drivers/soc/airoha/Kconfig b/drivers/soc/airoha/Kconfig
new file mode 100644
index 000000000000..56c677f8238d
--- /dev/null
+++ b/drivers/soc/airoha/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config AIROHA_SCU_SSR
+	tristate "Airoha SCU SSR Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	help
+	  Say 'Y' here to add support for Airoha SCU SSR driver.
+
+	  Airoha SoC pheriperal (like USB/PCIe/Ethernet port) are
+	  selected by toggling specific bit. Serdes Port line
+	  are mutually exclusive such as selecting PCIe port 2
+	  disable support for USB port 2 3.0 mode.
+
+	  This driver is used to configure such bit and expose
+	  an API to read the current status from a user of such
+	  Serdes lines.
+
diff --git a/drivers/soc/airoha/Makefile b/drivers/soc/airoha/Makefile
new file mode 100644
index 000000000000..530825251ae9
--- /dev/null
+++ b/drivers/soc/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_AIROHA_SCU_SSR)		+= airoha-scu-ssr.o
diff --git a/drivers/soc/airoha/airoha-scu-ssr.c b/drivers/soc/airoha/airoha-scu-ssr.c
new file mode 100644
index 000000000000..fe65b5b91146
--- /dev/null
+++ b/drivers/soc/airoha/airoha-scu-ssr.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <dt-bindings/soc/airoha,scu-ssr.h>
+#include <linux/bitfield.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/airoha/airoha-scu-ssr.h>
+
+#define AIROHA_SCU_PCIC			0x88
+#define   AIROHA_SCU_PCIE_2LANE_MODE	BIT(14)
+
+#define AIROHA_SCU_SSR3			0x94
+#define   AIROHA_SCU_SSUSB_HSGMII_SEL	BIT(29)
+
+#define AIROHA_SCU_SSTR			0x9c
+#define   AIROHA_SCU_PCIE_XSI0_SEL	GENMASK(14, 13)
+#define   AIROHA_SCU_PCIE_XSI0_SEL_PCIE	FIELD_PREP_CONST(AIROHA_SCU_PCIE_XSI0_SEL, 0x0)
+#define   AIROHA_SCU_PCIE_XSI1_SEL	GENMASK(12, 11)
+#define   AIROHA_SCU_PCIE_XSI1_SEL_PCIE	FIELD_PREP_CONST(AIROHA_SCU_PCIE_XSI0_SEL, 0x0)
+#define   AIROHA_SCU_USB_PCIE_SEL	BIT(3)
+
+struct airoha_scu_ssr_priv {
+	struct device *dev;
+	struct regmap *regmap;
+
+	u32 serdes_port[AIROHA_SCU_MAX_SERDES_PORT];
+};
+
+int airoha_scu_ssr_get_serdes_mode(struct device *dev,
+				   enum airoha_scu_serdes_port port)
+{
+	struct airoha_scu_ssr_priv *priv;
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "airoha,scu-ssr", 0);
+	if (!np)
+		return -ENODEV;
+
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev || !platform_get_drvdata(pdev)) {
+		if (pdev)
+			put_device(&pdev->dev);
+		return -EPROBE_DEFER;
+	}
+
+	priv = platform_get_drvdata(pdev);
+
+	return priv->serdes_port[port];
+}
+EXPORT_SYMBOL_GPL(airoha_scu_ssr_get_serdes_mode);
+
+static int airoha_scu_ssr_apply_modes(struct airoha_scu_ssr_priv *priv)
+{
+	int ret;
+
+	/*
+	 * This is a very bad scenario and needs to be correctly warned
+	 * as it cause PCIe malfunction
+	 */
+	if ((priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SSR_WIFI1_PCIE0_2LINE &&
+	     priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] != AIROHA_SCU_SSR_WIFI2_PCIE0_2LINE) ||
+	    (priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] != AIROHA_SCU_SSR_WIFI1_PCIE0_2LINE &&
+	     priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] == AIROHA_SCU_SSR_WIFI2_PCIE0_2LINE)) {
+		WARN(true, "Wrong Serdes configuration for PCIe0 2 Line mode. Please check DT.\n");
+		return -EINVAL;
+	}
+
+	/* PCS driver takes case of setting the SCU bit for HSGMII or USXGMII */
+	if (priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SSR_WIFI1_PCIE0_2LINE ||
+	    priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SSR_WIFI1_PCIE0) {
+		ret = regmap_update_bits(priv->regmap, AIROHA_SCU_SSTR,
+					 AIROHA_SCU_PCIE_XSI0_SEL,
+					 AIROHA_SCU_PCIE_XSI0_SEL_PCIE);
+		if (ret)
+			return ret;
+	}
+
+	/* PCS driver takes case of setting the SCU bit for HSGMII or USXGMII */
+	if (priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] == AIROHA_SCU_SSR_WIFI2_PCIE0_2LINE ||
+	    priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] == AIROHA_SCU_SSR_WIFI2_PCIE1) {
+		ret = regmap_update_bits(priv->regmap, AIROHA_SCU_SSTR,
+					 AIROHA_SCU_PCIE_XSI1_SEL,
+					 AIROHA_SCU_PCIE_XSI1_SEL_PCIE);
+		if (ret)
+			return ret;
+	}
+
+	/* Toggle PCIe0 2 Line mode if enabled or not */
+	if (priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SSR_WIFI1_PCIE0_2LINE)
+		ret = regmap_set_bits(priv->regmap, AIROHA_SCU_PCIC,
+				      AIROHA_SCU_PCIE_2LANE_MODE);
+	else
+		ret = regmap_clear_bits(priv->regmap, AIROHA_SCU_PCIC,
+					AIROHA_SCU_PCIE_2LANE_MODE);
+	if (ret)
+		return ret;
+
+	if (priv->serdes_port[AIROHA_SCU_SERDES_USB1] == AIROHA_SCU_SSR_USB1_ETHERNET)
+		ret = regmap_clear_bits(priv->regmap, AIROHA_SCU_SSR3,
+					AIROHA_SCU_SSUSB_HSGMII_SEL);
+	else
+		ret = regmap_set_bits(priv->regmap, AIROHA_SCU_SSR3,
+				      AIROHA_SCU_SSUSB_HSGMII_SEL);
+	if (ret)
+		return ret;
+
+	if (priv->serdes_port[AIROHA_SCU_SERDES_USB2] == AIROHA_SCU_SSR_USB2_PCIE2)
+		ret = regmap_clear_bits(priv->regmap, AIROHA_SCU_SSTR,
+					AIROHA_SCU_USB_PCIE_SEL);
+	else
+		ret = regmap_set_bits(priv->regmap, AIROHA_SCU_SSTR,
+				      AIROHA_SCU_USB_PCIE_SEL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int airoha_scu_ssr_probe(struct platform_device *pdev)
+{
+	struct airoha_scu_ssr_priv *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	/* Get regmap from MFD */
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return -EINVAL;
+
+	/* If not set, default to PCIE0 1 line */
+	if (of_property_read_u32(dev->of_node, "airoha,serdes-wifi1",
+				 &priv->serdes_port[AIROHA_SCU_SERDES_WIFI1]))
+		priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] = AIROHA_SCU_SSR_WIFI1_PCIE0;
+
+	/* If not set, default to PCIE1 1 line */
+	if (of_property_read_u32(dev->of_node, "airoha,serdes-wifi2",
+				 &priv->serdes_port[AIROHA_SCU_SERDES_WIFI2]))
+		priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] = AIROHA_SCU_SSR_WIFI2_PCIE1;
+
+	/* If not set, default to USB1 USB 3.0 */
+	if (of_property_read_u32(dev->of_node, "airoha,serdes-usb1",
+				 &priv->serdes_port[AIROHA_SCU_SERDES_USB1]))
+		priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] = AIROHA_SCU_SSR_USB1_USB;
+
+	/* If not set, default to USB2 USB 3.0 */
+	if (of_property_read_u32(dev->of_node, "airoha,serdes-usb2",
+				 &priv->serdes_port[AIROHA_SCU_SERDES_USB2]))
+		priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] = AIROHA_SCU_SSR_USB2_USB;
+
+	ret = airoha_scu_ssr_apply_modes(priv);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static const struct of_device_id airoha_phy_id_table[] = {
+	{ .compatible = "airoha,an7581-scu-ssr" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, airoha_phy_id_table);
+
+static struct platform_driver airoha_scu_ssr_driver = {
+	.probe		= airoha_scu_ssr_probe,
+	.driver		= {
+		.name	= "airoha-scu-ssr",
+		.of_match_table = airoha_phy_id_table,
+	},
+};
+
+module_platform_driver(airoha_scu_ssr_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Airoha SCU SSR/STR driver");
diff --git a/include/linux/soc/airoha/airoha-scu-ssr.h b/include/linux/soc/airoha/airoha-scu-ssr.h
new file mode 100644
index 000000000000..d5ff50dc224f
--- /dev/null
+++ b/include/linux/soc/airoha/airoha-scu-ssr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __AIROHA_SCU_SSR__
+#define __AIROHA_SCU_SSR__
+
+enum airoha_scu_serdes_port {
+	AIROHA_SCU_SERDES_WIFI1 = 0,
+	AIROHA_SCU_SERDES_WIFI2,
+	AIROHA_SCU_SERDES_USB1,
+	AIROHA_SCU_SERDES_USB2,
+
+	AIROHA_SCU_MAX_SERDES_PORT,
+};
+
+int airoha_scu_ssr_get_serdes_mode(struct device *dev,
+				   enum airoha_scu_serdes_port port);
+
+#endif
diff --git a/include/linux/soc/soc/airoha-scu-ssr.h b/include/linux/soc/soc/airoha-scu-ssr.h
new file mode 100644
index 000000000000..d5ff50dc224f
--- /dev/null
+++ b/include/linux/soc/soc/airoha-scu-ssr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __AIROHA_SCU_SSR__
+#define __AIROHA_SCU_SSR__
+
+enum airoha_scu_serdes_port {
+	AIROHA_SCU_SERDES_WIFI1 = 0,
+	AIROHA_SCU_SERDES_WIFI2,
+	AIROHA_SCU_SERDES_USB1,
+	AIROHA_SCU_SERDES_USB2,
+
+	AIROHA_SCU_MAX_SERDES_PORT,
+};
+
+int airoha_scu_ssr_get_serdes_mode(struct device *dev,
+				   enum airoha_scu_serdes_port port);
+
+#endif
-- 
2.48.1


