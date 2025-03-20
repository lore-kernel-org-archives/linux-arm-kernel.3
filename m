Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B47C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wn2/hmuc3pnGhw1oNI9gcjxThAXzwvaMI5eUiGxYDOA=; b=nSC78P/oEROWqtbu851+V81zlL
	xLHCR1eWgILFTJxKbJ6Z2RRd4HdNO04Hje51s6oyOPEt1SSTm0xdniioJjNO0c3trkZ67t3dCILyE
	2aeyMcYMTW3YhLebFtVotWtUcfcZBHrhROdocBM8gUH64lq12+WoDeUfBmIurWQUIvefZqIXaSHrC
	fFMqDvPhWwFlIEJseyWhHOn2EDFVg9S3ZzrWHEKAQZDZHriYLhyk8XO+jXBQndlulRA1xxOzicLUm
	TbwL4c36T6MW+xeEc/vobek404zh2K4WTm6JBEoJ6GYcJPaOPPTj+FoldbwSAwbFyfThtx+Lu6M+n
	a+ySlQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFsm-0000000CDm5-2AAW;
	Thu, 20 Mar 2025 13:24:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWi-0000000CAcU-4Bek;
	Thu, 20 Mar 2025 13:01:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so7709945e9.2;
        Thu, 20 Mar 2025 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475695; x=1743080495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wn2/hmuc3pnGhw1oNI9gcjxThAXzwvaMI5eUiGxYDOA=;
        b=CH0FATJDjMnJviwsQacV3QAuDYJXpNhSPV+3AF1Y6zpUDsI2118XZSEUHQzv93EZ5f
         LeKEb6juk/NlobP6MN4zAePz0UNQWyE2aEY/PS1GXYpr7zuNdPDoUgQiohrPSPcooNEx
         DrORqZYO6N3B6z5ugRtjFDBwk2p5rt5Fu70L4pa3QOqh3YI3JLRtuUATAKXS2Eyc3jyf
         T6l0KZ6ycIqnKCd9GvEq648yKRJFPkaRfiyAC2SxhM4Km5JvBXTjh8yA/nmcFOYnVy5K
         s4jL2yLh9lQPiB27crkW27P62w4hf8LF+htkz1MHYuHF8R4VTMWy5u5MEHlenkrg+/5k
         vtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475695; x=1743080495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wn2/hmuc3pnGhw1oNI9gcjxThAXzwvaMI5eUiGxYDOA=;
        b=v+JZzSKsHXgN6VVl85unFcbqe8fBY4uc8IrkrPGk03Gxe5jJuZNv1X/1J0qJG5Elof
         dCK5C8dkg4EhO3yxsUAuFueMOSZL5+S/gMStRL8W6q+aohrv+DKGyCT1OpSSTmK8Zq/o
         EQbpMzX3sl7OkEy+uLsC4IBUk+khHgHnSQiaEK0nipJLsvPAzLawSw3ObJPx1StQ6K8l
         BApXp3Pu8hdXsMmHtu9GBZhwBjdrUjWu5aRtthvDwATzZTERt8W9OMER8pVu3evaBF7Q
         pTbqkwvqqA3ZMEs/ALb8hPA73h5tqOv5KenAGJ0+H0Mp4UzCjQPQF61d42tpHF0EhqOq
         Qykw==
X-Forwarded-Encrypted: i=1; AJvYcCVXgQYbf6ALcOFIBaHWkgGamFdzCJUjFY1rmfOj1LppXqb+BQYZ6Dns5NPikBSjJTitNcnJqE4dzsvUxtePyGM=@lists.infradead.org, AJvYcCXRPcyNYdn1Bv/iFqk0ouMo6sS3bhfdwRW+4+8fPkMK4bXcCOvBM9+pa9Nz5INGQPR1mbwaA5m+O0BUMaZw7XqR@lists.infradead.org, AJvYcCXTzKt3I1/gaC8IE9RftP+MnLtgoSJbRGlpOyvt0tY8QJQfKuidyMLgHSRpH+auz753rNIUAInBAiMo@lists.infradead.org
X-Gm-Message-State: AOJu0YwSRTzrB2Ny35Mr66dZR0Csc6qMzeCKKW0TJAWY/rzlSRJ+kPYo
	cfxFopgaPcbNOQY9ggJcJ9gYAGP339kbjHgBJf6owLdAp6ImUlvv
X-Gm-Gg: ASbGncup0h9Yw+yVSVIpK4H0O09D50PQ6bX60UZ1NJpXKgVAWbiJJLCstlewNO9XVwI
	bmMduLF3s+SMhKBcqNAlXXf8E2zMH8UiujY5vhD6qrKZdm185gadqmCxqnJAwaT8ma2T6mctetF
	cVGYUVg0PYlCKr/7IUhuTyGtHjLouX5jUco5GkbZtHmDhwBOZ2GfRtrPK9AEoXdtKOQAq4fxwmb
	b8RE15FYR1Xk9DZAUugyh7Zxce19bt6Pihx6zbT3ak93gf6A+LtN0qapCV/HsF652zstjxMkaB/
	sJctdeZUo6peFn2xs0iH3toHBzWYjK665NaCii2oSEEe+DsaOJLYLTek3mmioA3D/HFdctljJ/a
	5vBxv97JqDdU6YCKruOzdR0xF
X-Google-Smtp-Source: AGHT+IGi5vCdtEa2LCRHJP2raJyvd24trrbEgKD5KtNz8cQAFgw+tCXFVtwNUxD1X7czDtnEosU6xQ==
X-Received: by 2002:a5d:5f4b:0:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-399795a4fc2mr2851317f8f.3.1742475694722;
        Thu, 20 Mar 2025 06:01:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH v2 04/11] soc: airoha: add support for configuring SCU SSR Serdes port
Date: Thu, 20 Mar 2025 14:00:27 +0100
Message-ID: <20250320130054.4804-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060137_049095_9D51B693 
X-CRM114-Status: GOOD (  33.24  )
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

This driver is to correctly setup these bits.
Single driver can't independently set the Serdes port mode as that
would cause a conflict if someone declare, for example, in DT
(and enable) PCIe 2 port and USB2 3.0 port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                               |   2 +
 drivers/soc/Kconfig                       |   1 +
 drivers/soc/Makefile                      |   1 +
 drivers/soc/airoha/Kconfig                |  18 ++
 drivers/soc/airoha/Makefile               |   3 +
 drivers/soc/airoha/airoha-scu-ssr.c       | 221 ++++++++++++++++++++++
 include/linux/soc/airoha/airoha-scu-ssr.h |  23 +++
 7 files changed, 269 insertions(+)
 create mode 100644 drivers/soc/airoha/Kconfig
 create mode 100644 drivers/soc/airoha/Makefile
 create mode 100644 drivers/soc/airoha/airoha-scu-ssr.c
 create mode 100644 include/linux/soc/airoha/airoha-scu-ssr.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9944845ae9f5..7cd54c70aeed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -741,7 +741,9 @@ M:	Christian Marangi <ansuelsmth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
+F:	drivers/soc/airoha/airoha-scu-ssr.c
 F:	include/dt-bindings/soc/airoha,scu-ssr.h
+F:	include/linux/soc/airoha/airoha-scu-ssr.h
 
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
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
index 2037a8695cb2..2b4027837d60 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the Linux Kernel SOC specific device drivers.
 #
 
+obj-y				+= airoha/
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
index 000000000000..29e17577e9a4
--- /dev/null
+++ b/drivers/soc/airoha/airoha-scu-ssr.c
@@ -0,0 +1,221 @@
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
+#define AIROHA_SCU_MAX_SERDES_PORT	4
+
+struct airoha_scu_ssr_priv {
+	struct device *dev;
+	struct regmap *regmap;
+
+	unsigned int serdes_port[AIROHA_SCU_MAX_SERDES_PORT];
+};
+
+static const char * const airoha_scu_serdes_mode_to_str[] = {
+	[AIROHA_SCU_SERDES_MODE_PCIE0_X1] = "pcie0_x1",
+	[AIROHA_SCU_SERDES_MODE_PCIE0_X2] = "pcie0_x2",
+	[AIROHA_SCU_SERDES_MODE_PCIE1_X1] = "pcie1_x1",
+	[AIROHA_SCU_SERDES_MODE_PCIE2_X1] = "pcie2_x1",
+	[AIROHA_SCU_SERDES_MODE_USB3] = "usb3",
+	[AIROHA_SCU_SERDES_MODE_ETHERNET] = "ethernet",
+};
+
+static int airoha_scu_serdes_str_to_mode(const char *serdes_str)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(airoha_scu_serdes_mode_to_str); i++)
+		if (!strncmp(serdes_str, airoha_scu_serdes_mode_to_str[i],
+			     strlen(airoha_scu_serdes_mode_to_str[i])))
+			return i;
+
+	return -EINVAL;
+}
+
+static int airoha_scu_ssr_apply_modes(struct airoha_scu_ssr_priv *priv)
+{
+	int ret;
+
+	/*
+	 * This is a very bad scenario and needs to be correctly warned
+	 * as it cause PCIe malfunction.
+	 */
+	if ((priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SERDES_MODE_PCIE0_X2 &&
+	     priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] != AIROHA_SCU_SERDES_MODE_PCIE0_X2) ||
+	    (priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] != AIROHA_SCU_SERDES_MODE_PCIE0_X2 &&
+	     priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] == AIROHA_SCU_SERDES_MODE_PCIE0_X2)) {
+		WARN(true, "Wrong Serdes configuration for PCIe0 2 Line mode. Please check DT.\n");
+		return -EINVAL;
+	}
+
+	/* PCS driver takes care of setting the SCU bit for HSGMII or USXGMII */
+	if (priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SERDES_MODE_PCIE0_X1 ||
+	    priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SERDES_MODE_PCIE0_X2) {
+		ret = regmap_update_bits(priv->regmap, AIROHA_SCU_SSTR,
+					 AIROHA_SCU_PCIE_XSI0_SEL,
+					 AIROHA_SCU_PCIE_XSI0_SEL_PCIE);
+		if (ret)
+			return ret;
+	}
+
+	/* PCS driver takes care of setting the SCU bit for HSGMII or USXGMII */
+	if (priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] == AIROHA_SCU_SERDES_MODE_PCIE1_X1 ||
+	    priv->serdes_port[AIROHA_SCU_SERDES_WIFI2] == AIROHA_SCU_SERDES_MODE_PCIE0_X2) {
+		ret = regmap_update_bits(priv->regmap, AIROHA_SCU_SSTR,
+					 AIROHA_SCU_PCIE_XSI1_SEL,
+					 AIROHA_SCU_PCIE_XSI1_SEL_PCIE);
+		if (ret)
+			return ret;
+	}
+
+	/* Toggle PCIe0 2 Line mode if enabled or not */
+	if (priv->serdes_port[AIROHA_SCU_SERDES_WIFI1] == AIROHA_SCU_SERDES_MODE_PCIE0_X2)
+		ret = regmap_set_bits(priv->regmap, AIROHA_SCU_PCIC,
+				      AIROHA_SCU_PCIE_2LANE_MODE);
+	else
+		ret = regmap_clear_bits(priv->regmap, AIROHA_SCU_PCIC,
+					AIROHA_SCU_PCIE_2LANE_MODE);
+	if (ret)
+		return ret;
+
+	if (priv->serdes_port[AIROHA_SCU_SERDES_USB1] == AIROHA_SCU_SERDES_MODE_ETHERNET)
+		ret = regmap_clear_bits(priv->regmap, AIROHA_SCU_SSR3,
+					AIROHA_SCU_SSUSB_HSGMII_SEL);
+	else
+		ret = regmap_set_bits(priv->regmap, AIROHA_SCU_SSR3,
+				      AIROHA_SCU_SSUSB_HSGMII_SEL);
+	if (ret)
+		return ret;
+
+	if (priv->serdes_port[AIROHA_SCU_SERDES_USB2] == AIROHA_SCU_SERDES_MODE_PCIE2_X1)
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
+static int airoha_scu_ssr_parse_mode(struct device *dev,
+				     struct airoha_scu_ssr_priv *priv,
+				     const char *property_name, unsigned int port,
+				     unsigned int default_mode)
+{
+	const struct airoha_scu_ssr_serdes_info *port_info;
+	const struct airoha_scu_ssr_data *pdata;
+	const char *serdes_mode;
+	int mode, i;
+
+	pdata = dev->platform_data;
+
+	if (of_property_read_string(dev->of_node, property_name,
+				    &serdes_mode)) {
+		priv->serdes_port[port] = default_mode;
+		return 0;
+	}
+
+	mode = airoha_scu_serdes_str_to_mode(serdes_mode);
+	if (mode) {
+		dev_err(dev, "invalid mode %s for %s\n", serdes_mode, property_name);
+		return mode;
+	}
+
+	port_info = &pdata->ports_info[port];
+	for (i = 0; i < port_info->num_modes; i++) {
+		if (port_info->possible_modes[i] == mode) {
+			priv->serdes_port[port] = mode;
+			return 0;
+		}
+	}
+
+	dev_err(dev, "mode %s not supported for %s", serdes_mode, property_name);
+	return -EINVAL;
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
+	ret = airoha_scu_ssr_parse_mode(dev, priv, "airoha,serdes-wifi1",
+					AIROHA_SCU_SERDES_WIFI1,
+					AIROHA_SCU_SERDES_MODE_PCIE0_X1);
+	if (ret)
+		return ret;
+
+	ret = airoha_scu_ssr_parse_mode(dev, priv, "airoha,serdes-wifi2",
+					AIROHA_SCU_SERDES_WIFI2,
+					AIROHA_SCU_SERDES_MODE_PCIE1_X1);
+	if (ret)
+		return ret;
+
+	ret = airoha_scu_ssr_parse_mode(dev, priv, "airoha,serdes-usb1",
+					AIROHA_SCU_SERDES_USB1,
+					AIROHA_SCU_SERDES_MODE_USB3);
+	if (ret)
+		return ret;
+
+	ret = airoha_scu_ssr_parse_mode(dev, priv, "airoha,serdes-usb2",
+					AIROHA_SCU_SERDES_USB2,
+					AIROHA_SCU_SERDES_MODE_USB3);
+	if (ret)
+		return ret;
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
+static struct platform_driver airoha_scu_ssr_driver = {
+	.probe		= airoha_scu_ssr_probe,
+	.driver		= {
+		.name	= "airoha-scu-ssr",
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
index 000000000000..0224c0340b6d
--- /dev/null
+++ b/include/linux/soc/airoha/airoha-scu-ssr.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __AIROHA_SCU_SSR__
+#define __AIROHA_SCU_SSR__
+
+enum airoha_scu_serdes_modes {
+	AIROHA_SCU_SERDES_MODE_PCIE0_X1,
+	AIROHA_SCU_SERDES_MODE_PCIE0_X2,
+	AIROHA_SCU_SERDES_MODE_PCIE1_X1,
+	AIROHA_SCU_SERDES_MODE_PCIE2_X1,
+	AIROHA_SCU_SERDES_MODE_USB3,
+	AIROHA_SCU_SERDES_MODE_ETHERNET,
+};
+
+struct airoha_scu_ssr_serdes_info {
+	unsigned int *possible_modes;
+	unsigned int num_modes;
+};
+
+struct airoha_scu_ssr_data {
+	const struct airoha_scu_ssr_serdes_info *ports_info;
+};
+
+#endif
-- 
2.48.1


