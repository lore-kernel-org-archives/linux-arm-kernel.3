Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE62E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 01:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSgmUq6fWDAYGhUiI+1p1Nvpascpw09NerCf1YnBrAA=; b=T1TGYVGQpyISLcX6Zd4WziFCPz
	kxl2e2ZEMFXTPysnvNY9aNu56PzkwdwQq9t42xdg694mghV2a0cTo4in7MfcBb+19ez4gnFPXHFQC
	7W51sZfycVZgrU/76lDbQk1hsOBxiGVPGBdhvzKheDZo4MAQB1P5jwAAt7csGNkbwodMgARf6U9cj
	ktT/WZHWyQAF+LvecsPP4CCg1vdFT6Wil1Yi79ATLPGX0p5e9x85yYrCopO+S+Nv1i2xuaQsuxdZu
	l1iSAEZ1u49jRpoHRNaPJOige7iOltOgGTHdH2w9Up+bWXVXcpu0GiOGhsSc5sCuDjoEbj/SHueuE
	dlvq4QSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWrm-000000093Od-3Igw;
	Mon, 23 Dec 2024 01:04:14 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWnF-000000092bX-3mZQ;
	Mon, 23 Dec 2024 00:59:35 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-467b955e288so35790251cf.1;
        Sun, 22 Dec 2024 16:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734915572; x=1735520372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSgmUq6fWDAYGhUiI+1p1Nvpascpw09NerCf1YnBrAA=;
        b=Mpcek3lblnjQiIxTt22BTNL3uebBwHOzZ0Xop5Q7es9NTsMlNIu3jLG8v1hNf6ULOL
         2Sj258CGfX6FeCbj+Ui9FMBf9xzmsQxiORgaqBTEgrM65+DpOhePnToF91LC2U7RcKAB
         Bj3OmdQRdD4RC3uBA7+y4zbVJKYkXrTL7VD4GrhxHqneYCQLHmCwd0yBOqTxj7pEZXOe
         g07a8pyplpsR++kKvINqQ9k8RN/jyj4oG8+RFaxgokh2U2Ot3h5IGGIIitlzuj7h11+2
         O4RmV8Br503EpKa4vKxJ4kDUPcpRSk+3kO8w9uSihCVhXv8R8NNWODrbxGY01qlEQom6
         ZGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734915572; x=1735520372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSgmUq6fWDAYGhUiI+1p1Nvpascpw09NerCf1YnBrAA=;
        b=FMOK8gx0E7NLjkslZKSHsANJitA70tqPOEDywBNAvN+TxVIClhte4LeBCk/t4V/R0v
         h3TKZO7Kx7bL625AwgjTDeRvn8mNQCJ5DrFrM4cS2ezBvXhJ291hKXktun3zI/qpcS/0
         huFGlso3PXwLXYyZWygJh34f/xkTDfL00hrMaSM8m5ISKJTRRKbHeyadYCMK0dD5B3f1
         n5i5XSTcixCg94mIrkxgH29U00kRdvVgsQh6jJeJl0Cxx0wlUu0+RN3aJrnaEa6lc6TI
         C4HF0WZ8KT2Y98ORAWak9nRODCuizoRCorxRcu84gnbqC9A2wATmDvg77sRNS8bvj+Qb
         SI+A==
X-Forwarded-Encrypted: i=1; AJvYcCVUgYKdunGdyN6jxk6Hlt/0zh1SsGtGqqCNmSy2GwOGxcVFQx6SWt2TW24W500ZMwwiIymIYsnQVpro887x7f8Y@lists.infradead.org, AJvYcCW6+qZXcIwxYe1XgibTgQatIdhh0NunDEycYNhmNOYUbjIWuESvYbRpW6hCo3uH9o0tZMw/Ys+8jk/J2tU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr7YAn3vJGMTGXslTx6hHFuxQ2hwN4kaKyBo1a2N9stDPKHJnI
	+cknEZGiBG/bZatIluJhYTc9rahN2TTywbPdyyF73FTi4E/tHxj6
X-Gm-Gg: ASbGncsjcoJL89ZWt+p74LvbZ8gzIq5lHi2lGRhkCdHVEA+YwwDOzN4dtZEoEtOHU71
	M4hEZ5mKYmV+ku6L2EZbkhDMCEaib9V0oBqGiWxEJOs4EUtQU3MIt77mnIUjej5kdEqpVWh9AUR
	uif29afACNwIkPsW5Z/u4GYtYbCc8VERyi+tywwEWPVx16uW9793xX5FqWmUhFbAkd9C0UBySs1
	MUogvkviIMumaQcQqpuDMfhgbU8toqR
X-Google-Smtp-Source: AGHT+IHjz7WDJXZngk0HiOawE5i+rAuNn2t3oiKW5rDk4l39S/7Vt67KkTJKlnank9Y1jvPWV5vKBA==
X-Received: by 2002:ac8:59cf:0:b0:466:9824:16ef with SMTP id d75a77b69052e-46a4a8b5f64mr181259011cf.3.1734915571686;
        Sun, 22 Dec 2024 16:59:31 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb33b11sm39454091cf.72.2024.12.22.16.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 16:59:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Date: Mon, 23 Dec 2024 08:58:39 +0800
Message-ID: <20241223005843.483805-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241223005843.483805-1-inochiama@gmail.com>
References: <20241223005843.483805-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_165933_945573_CA72E8B4 
X-CRM114-Status: GOOD (  21.28  )
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

Adds Sophgo dwmac driver support on the Sophgo SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 105 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 6658536a4e17..23085d27ace6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -169,6 +169,17 @@ config DWMAC_SOCFPGA
 	  for the stmmac device driver. This driver is used for
 	  arria5 and cyclone5 FPGA SoCs.
 
+config DWMAC_SOPHGO
+	tristate "Sophgo dwmac support"
+	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
+	default m if ARCH_SOPHGO
+	help
+	  Support for ethernet controllers on Sophgo RISC-V SoCs
+
+	  This selects the Sophgo SoC specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  ethernet controllers on various Sophgo SoCs.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 2389fd261344..36f21c86568d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
+obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
new file mode 100644
index 000000000000..a4997cc0294a
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sophgo DWMAC platform driver
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#include "stmmac_platform.h"
+
+struct sophgo_dwmac {
+	struct device *dev;
+	struct clk *clk_tx;
+};
+
+static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+{
+	struct sophgo_dwmac *dwmac = priv;
+	long rate;
+	int ret;
+
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
+		dev_err(dwmac->dev, "invalid speed %u\n", speed);
+		return;
+	}
+
+	ret = clk_set_rate(dwmac->clk_tx, rate);
+	if (ret)
+		dev_err(dwmac->dev, "failed to set tx rate %lu: %pe\n",
+			rate, ERR_PTR(ret));
+}
+
+static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
+				    struct plat_stmmacenet_data *plat_dat,
+				    struct stmmac_resources *stmmac_res)
+{
+	struct sophgo_dwmac *dwmac;
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(dwmac->clk_tx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
+				     "failed to get tx clock\n");
+
+	dwmac->dev = &pdev->dev;
+	plat_dat->bsp_priv = dwmac;
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->fix_mac_speed = sophgo_dwmac_fix_mac_speed;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 1;
+
+	return 0;
+}
+
+static int sophgo_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
+
+	ret = sophgo_sg2044_dwmac_init(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2044-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_dwmac_match);
+
+static struct platform_driver sophgo_dwmac_driver = {
+	.probe  = sophgo_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "sophgo-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = sophgo_dwmac_match,
+	},
+};
+module_platform_driver(sophgo_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.47.1


