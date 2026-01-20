Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F508D2ED11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 04:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyReD0FGPHyCNo3ka9EshiTdpLiW7lhhWJbYHeoeAsk=; b=Aiur4MZcEdDLE1gjdKvsls+nwJ
	VZGEKsDSEbn3MyFjBWvRnBwuYdXzoO6IhI+fpvKBGiW6buhlFbyqYt6yoVHm9jYd1Amipq6jIyCjB
	w5SKJQrtfJpmLgq0MTTHr+tdbICXh3A4F7zuBWKPCky8HQtqD74kAWIr6KWOU3+a1VkrRoRcDqd31
	Gl9edV2jQPdJOUiVP/c86UV8h79yX9op3111FTEt8Cqn5pV4g6oBTmDed+v9LAnS/he97ZlUa5k/d
	BMy2rd4Ctcm04hIFVB6kPtEzbcUzdb2e3KaMWZvZtR2NMG9h0lpKRsYGMVEwTD1f8Vzc4v2Zmi6Yp
	00LOdsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3U5-00000003C6A-0DEb;
	Tue, 20 Jan 2026 04:36:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Tr-00000003C25-1O8T
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 04:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wyReD0FGPHyCNo3ka9EshiTdpLiW7lhhWJbYHeoeAsk=; b=KOA7BLU2XpnfCkNsmDs+MgrwF2
	pLOJpZ28Y/xgr2TtK3ZTS7KEw8rEvUdsGnXH+fYaEblJ58lWzDEHUOyNyyamlVn9WMYj9/88Euzhx
	4TF+hemX8C4MnSifCmrOw0xRP9VW9rrY/KOqRB0T5ulhBudlRmyOsRC16NY9EWpekIrRjRTBC6UqE
	ucasStYhqtMLbF+HnT92ByLtNq2wk4IemKRWF3x98BlRQ6G8Hq/q2SU5G5MavFvXTFszY8oFZ90X2
	m1MjcOrwzrMmxhJIVZlVYTGpT96NOuVKtXUaF8tyHyfBCPNiwZgZUlGGpbWn9Adt/VkB3TZLc0Yll
	tLLh2eMw==;
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3To-0000000DKYB-0tbO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 04:36:38 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12332910300so7388276c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 20:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883794; x=1769488594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyReD0FGPHyCNo3ka9EshiTdpLiW7lhhWJbYHeoeAsk=;
        b=jUXyPcDT0NGKpkfrBGa48y4VcwiY9rl3yF8Tg9CB3hTj2jIycu2HULZOmUL3OR2LVf
         XsD1YZSAI52wiP1Rd3quC/EewKb7HmaxXmf9Dtl0XkP7qilwrW78M2ajzhAY/ebi+Mje
         fNhYZh9sE56qNQRqKowkC7jYYuf67ml21FeIiy5FZEinRXeBTo/CNbgjuI65XHUydSCr
         k4nlOF89TuVElKqapYCn0NullmknFFzAqijUKxm1mXLp43hE9Y+OTr7yB8MT1XYWzphm
         6mIhgTQ038Y3QAr2eS9Bk8VNnvbwJ35awoD/3cFJC4isWO0yM8rNrfAiCgwx8VJOe5/W
         y0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883794; x=1769488594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyReD0FGPHyCNo3ka9EshiTdpLiW7lhhWJbYHeoeAsk=;
        b=f7gK7q00Fovlks18ZBiMZhz77Pqs5kanByMkl+lDQyEgcWbUfqvFSa48MmT1DZAllW
         aMn4qC1UxfNn8AFTa6b+ck923+mXWI0iV+sNntG+XsdICsV3QTtS/6g3KxSUHRyVC9T0
         bleSLUANt2oKypVSZkNi85ISGEMd6JhU9cebKcgie1xzyjf1dx1X+ZilQZyzr5MGvQ1f
         BSHoHdCQLzd+NRMhKF0UJnf5qSMpyzh1ATfOLxanDHdfNUCRA13KPyiLpMFXFfd2U0HN
         o+B2Hh8QbdQArFpnYr34h2YcZI/n1xnioEKv/sGxpWimyeZiBaNqD8MAxl2bVNHZfeEj
         1RQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCbz/qcENMgiSWbKmKAVbOQrvZJQnmZD76l5jkK/ZqEoyip0v0XhAIuxlbCEcZGk1Zv8fcqdD5uLSZVT6wZWIX@lists.infradead.org
X-Gm-Message-State: AOJu0YymiT4GKDu40bZ+N6zUVAc+DfVlQ1oe4ss4AHqQoIaJrDuzPBh3
	0b+DQPI/hlElBTSO0142kl5o5rZpFJr9r8cUncWUGBe6eAXx8MWHrn6k
X-Gm-Gg: AY/fxX7vpCw3Gk/L7EXkev1IkeIK1G6rGpnV0xUtINO5+yL6hizhXZEMMo4Ymvtw/p4
	5HSI8dR9tYQXhulp0TuTv1QbWpyH7A8Sr3V9WC+hG3wADWnlOiY2My9XRX37aXpWZy35TxV9FmQ
	o++KsIkW1EIpCQREfAn3EVLbWzWahKduvjtCsIwrNSdEAjdq8Vsl4gkJnNA9/UnFRqjrEaLySxV
	D02C5t5hxLv3iy77TTgEAtelCFGscdqrbbd/qbICWDgzPy1iDSnFGu7xJ2GlVtAIgjFZALmM/rC
	huQA9cufiUsZjz8IZAhSf/Q0MoV+C+Mws5lV7qQMIf+SoVD2YUBhFB4kVcB/6YBoAGgmJuKimKW
	2APbpC3/Mv9IrZNa0SJ1lDCEvCvtKYyAb7hpweqRaJgHpNQE5QHGXVL5JMAkuYdxO5tsLecT0e0
	hwcgvSXGmiEEC9oiHRMNaP
X-Received: by 2002:a05:7022:2385:b0:119:e569:fb9b with SMTP id a92af1059eb24-1244a6fca7cmr8955362c88.10.1768883794022;
        Mon, 19 Jan 2026 20:36:34 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6bd8e7cd9sm14617890eec.16.2026.01.19.20.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:33 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3 SoC
Date: Tue, 20 Jan 2026 12:36:08 +0800
Message-ID: <20260120043609.910302-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_043636_443440_B40A20AA 
X-CRM114-Status: GOOD (  27.87  )
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

Adds Spacemit dwmac driver support on the Spacemit K3 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
 3 files changed, 237 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 907fe2e927f0..583a4692f5da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -216,6 +216,18 @@ config DWMAC_SOPHGO
 	  for the stmmac device driver. This driver is used for the
 	  ethernet controllers on various Sophgo SoCs.
 
+config DWMAC_SPACEMIT
+	tristate "Spacemit dwmac support"
+	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
+	select MFD_SYSCON
+	default m if ARCH_SPACEMIT
+	help
+	  Support for ethernet controllers on Spacemit RISC-V SoCs
+
+	  This selects the Spacemit platform specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  Spacemit K3 ethernet controllers.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 7bf528731034..9e32045631d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
+obj-$(CONFIG_DWMAC_SPACEMIT)	+= dwmac-spacemit.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
new file mode 100644
index 000000000000..72744e60d02a
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Spacemit DWMAC platform driver
+ *
+ * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+/* ctrl register bits */
+#define PHY_INTF_RGMII			BIT(3)
+#define PHY_INTF_MII			BIT(4)
+
+#define WAKE_IRQ_EN			BIT(9)
+#define PHY_IRQ_EN			BIT(12)
+
+/* dline register bits */
+#define RGMII_RX_DLINE_EN		BIT(0)
+#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
+#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
+#define RGMII_TX_DLINE_EN		BIT(16)
+#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
+#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
+
+#define MAX_DLINE_DELAY_CODE		0xff
+
+struct spacemit_dwmac {
+	struct device *dev;
+	struct clk *tx;
+};
+
+/* Note: the delay step value is at 0.1ps */
+static const unsigned int k3_delay_step_10x[4] = {
+	367, 493, 559, 685
+};
+
+static int spacemit_dwmac_set_delay(struct regmap *apmu,
+				    unsigned int dline_offset,
+				    unsigned int tx_code, unsigned int tx_config,
+				    unsigned int rx_code, unsigned int rx_config)
+{
+	unsigned int mask, val;
+
+	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
+	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
+	val = FIELD_PREP(RGMII_TX_DLINE_CODE, tx_config) |
+	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
+	      FIELD_PREP(RGMII_TX_DLINE_CODE, rx_config) |
+	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
+
+	return regmap_update_bits(apmu, dline_offset, mask, val);
+}
+
+static int spacemit_dwmac_detected_delay_value(unsigned int delay,
+					       unsigned int *config)
+{
+	int i;
+	int code, best_code = 0;
+	unsigned int best_delay = 0;
+	unsigned int best_config = 0;
+
+	if (delay == 0)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
+		unsigned int step = k3_delay_step_10x[i];
+
+		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
+			/*
+			 * Note K3 require a specific factor for calculate
+			 * the delay, in this scenario it is 0.9. So the
+			 * formula is code * step / 10 * 0.9
+			 */
+			unsigned int tmp = code * step * 9 / 10 / 10;
+
+			if (abs(tmp - delay) < abs(best_delay - delay)) {
+				best_code = code;
+				best_delay = tmp;
+				best_config = i;
+			}
+		}
+	}
+
+	*config = best_config;
+
+	return best_code;
+}
+
+static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
+				    struct regmap *apmu,
+				    unsigned int dline_offset,
+				    unsigned int tx_delay, unsigned int rx_delay)
+{
+	bool mac_rxid = rx_delay != 0;
+	bool mac_txid = tx_delay != 0;
+	unsigned int rx_config = 0;
+	unsigned int tx_config = 0;
+	unsigned int rx_code;
+	unsigned int tx_code;
+
+	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+								  mac_txid,
+								  mac_rxid);
+
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
+		return -EINVAL;
+
+	rx_code = spacemit_dwmac_detected_delay_value(rx_delay, &rx_config);
+	tx_code = spacemit_dwmac_detected_delay_value(tx_delay, &tx_config);
+
+	return spacemit_dwmac_set_delay(apmu, dline_offset,
+					tx_code, tx_config,
+					rx_code, rx_config);
+}
+
+static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
+					  struct stmmac_resources *stmmac_res,
+					  struct regmap *apmu,
+					  unsigned int ctrl_offset)
+{
+	unsigned int mask = PHY_INTF_MII | PHY_INTF_RGMII | WAKE_IRQ_EN;
+	unsigned int val = 0;
+
+	switch (plat_dat->phy_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		val |= PHY_INTF_MII;
+		break;
+
+	case PHY_INTERFACE_MODE_RMII:
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		val |= PHY_INTF_RGMII;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (stmmac_res->wol_irq >= 0)
+		val |= WAKE_IRQ_EN;
+
+	return regmap_update_bits(apmu, ctrl_offset, mask, val);
+}
+
+static int spacemit_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	unsigned int rx_delay = 0;
+	unsigned int tx_delay = 0;
+	struct regmap *apmu;
+	unsigned int offset[2];
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
+				     "failed to get tx clock\n");
+
+	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
+	if (IS_ERR(apmu))
+		return dev_err_probe(dev, PTR_ERR(apmu),
+				"Failed to get apmu regmap\n");
+
+	ret = spacemit_dwmac_update_ifconfig(plat_dat, &stmmac_res,
+					     apmu, offset[0]);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure ifconfig\n");
+
+	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
+	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
+
+	ret = spacemit_dwmac_fix_delay(plat_dat, apmu, offset[1], tx_delay, rx_delay);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure delay\n");
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id spacemit_dwmac_match[] = {
+	{ .compatible = "spacemit,k3-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_dwmac_match);
+
+static struct platform_driver spacemit_dwmac_driver = {
+	.probe  = spacemit_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "spacemit-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = spacemit_dwmac_match,
+	},
+};
+module_platform_driver(spacemit_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Spacemit DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0


