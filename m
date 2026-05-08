Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6ADCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENAZuorSTFNHLchyus9WjumG5uy8CQ8sS0N+BIvJcxg=; b=wgstTR5JvvuU8RJzfRdkAf+yEj
	eZsuDVLHR2eWA03JK3feJG9hsk9xvM7To7Y4hozn0xMZrdGkc0IwFFo4TVQIPQqWjYu28mgy96UW0
	/a+4qGMWhC1gpoo+Hcv6CdxZSCot/59d4gSQbOPx0j2t/oFdBX4tMIInI8Ftn5XZRjorny4tYPudX
	5ru5b1k3ozA3gy8X4CRK80oakjZI5HmDAWegkebXHygV/S+uY+mSGysJSRtxZKwzbVw9Z+CvJe3ls
	SgpH+veR1dyDeOI+VRAdN7clhgPQiQpP2eIz1h7BUHYHc7s5Lq/4JvfWuaZS4u3/010t8wZAbkd/m
	Hfcaly6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJDa-00000006Jw5-3FmO;
	Fri, 08 May 2026 11:18:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJDS-00000006Jna-1Mwu;
	Fri, 08 May 2026 11:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ENAZuorSTFNHLchyus9WjumG5uy8CQ8sS0N+BIvJcxg=; b=RxEG6t1GR50AYudCPP0OUsLqoS
	Lf4qfjr1PiW8gTU8UbfXB4+eQWlrCHBGeUiebn0tKrD95mJveXBuqEx+N5yR0RKQboWlUod7z85W9
	wuXmEgleii2XWop22UysYG8h5gqa/y8D88PyCO9oS1kJbr4yq2LyEHNPWgCTfvw6o3SM40rjrsuAx
	IH0fuu7aUZowZp06V/7Hh1TcNlzQBtQDIbZDz4vjOTzPbytoZXkz3Lk5Yj3R1LLLak1oGbTfClMkN
	r48t8R/be2o8l7k9XfSXFeVUQPkI3NoIJ9HD6WWO4bRxSZsFKBEwjKIwbMRWllnq5uf7mJXOsnu9D
	tTLQY45w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJDK-000000062XL-0xyr;
	Fri, 08 May 2026 11:17:56 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 648BGhgpE3763952, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778239003; bh=ENAZuorSTFNHLchyus9WjumG5uy8CQ8sS0N+BIvJcxg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=B53220GNQE62l05efIMBA0ihUxaI7O29f+lW/7HRp1/hJOZQvhybUbPSzvX9twAQ0
	 O/gIzOzYIEE5OrPtZDxeL4gaPmdSkFi4leQiMhWHsez3MbEongzFi4/rYmO0o3HFSX
	 zDotLSHLoR4xg1zZB6UqwAN6SzimRi2kU45yumj35pexjlGSM1N+UFT9+fnQSmWwhZ
	 Fg3W2lUqByZVGYgxBNPfv7mBa+9NNHiDxL1hvlEcBLXxbVWcPl2KqNKF4Rw7tF2evJ
	 +eFTVfIahrFx9g5bP2BlXoboH8Wv3i5InuR99EAXTpen7diYA1Cldu6nDlZ4e6HRyx
	 cjlQsbfq6JC5Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 648BGhgpE3763952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2026 19:16:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:42 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 19:16:42 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <bmasney@redhat.com>
Subject: [PATCH v7 07/10] clk: realtek: Add support for MMC-tuned PLL clocks
Date: Fri, 8 May 2026 19:16:38 +0800
Message-ID: <20260508111641.3192177-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260508111641.3192177-1-eleanor.lin@realtek.com>
References: <20260508111641.3192177-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_121751_363464_E9FEE356 
X-CRM114-Status: GOOD (  16.86  )
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

From: Cheng-Yu Lee <cylee12@realtek.com>

Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
operations on MMC PLL clocks.

Also add clk_pll_mmc_phase_ops to support phase get/set operations.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Jyan Chou <jyanchou@realtek.com>
Signed-off-by: Jyan Chou <jyanchou@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS                       |   8 +
 drivers/clk/realtek/Kconfig       |   3 +
 drivers/clk/realtek/Makefile      |   2 +
 drivers/clk/realtek/clk-pll-mmc.c | 453 ++++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-pll.h     |  13 +
 5 files changed, 479 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-pll-mmc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b16d2c62ea3d..a1e19b5f247e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22439,6 +22439,14 @@ F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
 
+REALTEK SOC PLL CLOCK FOR MMC SUPPORT
+M:	Cheng-Yu Lee <cylee12@realtek.com>
+M:	Jyan Chou <jyanchou@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+L:	linux-clk@vger.kernel.org
+S:	Supported
+F:	drivers/clk/realtek/clk-pll-mmc.c
+
 REALTEK SPI-NAND
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 S:	Maintained
diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
index 4e042e41f30d..9efd70094bd2 100644
--- a/drivers/clk/realtek/Kconfig
+++ b/drivers/clk/realtek/Kconfig
@@ -25,4 +25,7 @@ config RTK_CLK_COMMON
 	  multiple Realtek clock implementations, and include integration
 	  with reset controllers where required.
 
+config RTK_CLK_PLL_MMC
+	tristate
+
 endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index f90dc57fcfdb..fd7d777902c8 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -7,3 +7,5 @@ clk-rtk-y += clk-pll.o
 clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
+
+clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
new file mode 100644
index 000000000000..998ab853ffbb
--- /dev/null
+++ b/drivers/clk/realtek/clk-pll-mmc.c
@@ -0,0 +1,453 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include "clk-pll.h"
+
+#define PLL_EMMC1_OFFSET           0x0
+#define PLL_EMMC2_OFFSET           0x4
+#define PLL_EMMC3_OFFSET           0x8
+#define PLL_EMMC4_OFFSET           0xc
+#define PLL_SSC_DIG_EMMC1_OFFSET   0x0
+#define PLL_SSC_DIG_EMMC3_OFFSET   0xc
+#define PLL_SSC_DIG_EMMC4_OFFSET   0x10
+
+#define PLL_MMC_SSC_DIV_N_VAL      0x1b
+
+#define PLL_PHRT0_MASK             BIT(0)
+#define PLL_PHSEL_MASK             GENMASK(4, 0)
+#define PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
+#define PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
+#define PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
+#define PLL_PI_IBSELH_MASK         GENMASK(28, 27)
+#define PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
+#define PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
+#define PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
+#define PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
+#define PLL_EN_SSC_EMMC_MASK       BIT(0)
+#define PLL_FLAG_INITAL_EMMC_MASK  BIT(8)
+
+#define PLL_PHRT0_SHIFT            1
+#define PLL_SSCPLL_RS_SHIFT        10
+#define PLL_SSCPLL_ICP_SHIFT       5
+#define PLL_SSC_DIV_EXT_F_SHIFT    13
+#define PLL_PI_IBSELH_SHIFT        27
+#define PLL_SSC_DIV_N_SHIFT        16
+#define PLL_NCODE_SSC_EMMC_SHIFT   13
+#define PLL_FLAG_INITAL_EMMC_SHIFT 8
+
+#define CYCLE_DEGREES              360
+#define PHASE_STEPS                32
+#define PHASE_SCALE_FACTOR         1125
+
+static inline struct clk_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_pll_mmc, clkr);
+}
+
+static inline int get_phrt0(struct clk_pll_mmc *clkm, u32 *val)
+{
+	u32 reg;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &reg);
+	if (ret)
+		return ret;
+
+	*val = (reg >> PLL_PHRT0_SHIFT) & PLL_PHRT0_MASK;
+
+	return 0;
+}
+
+static inline int set_phrt0(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
+				  PLL_PHRT0_MASK, val << PLL_PHRT0_SHIFT);
+}
+
+static inline int get_phsel(struct clk_pll_mmc *clkm, int id, u32 *val)
+{
+	u32 sft = id ? 8 : 3;
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val >> sft) & PLL_PHSEL_MASK;
+
+	return 0;
+}
+
+static inline int set_phsel(struct clk_pll_mmc *clkm, int id, u32 val)
+{
+	u32 sft = id ? 8 : 3;
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
+				  PLL_PHSEL_MASK << sft, val << sft);
+}
+
+static inline int set_sscpll_rs(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSCPLL_RS_MASK, val << PLL_SSCPLL_RS_SHIFT);
+}
+
+static inline int set_sscpll_icp(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSCPLL_ICP_MASK, val << PLL_SSCPLL_ICP_SHIFT);
+}
+
+static inline int get_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 *val)
+{
+	u32 raw_val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & PLL_SSC_DIV_EXT_F_MASK) >> PLL_SSC_DIV_EXT_F_SHIFT;
+
+	return 0;
+}
+
+static inline int set_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_SSC_DIV_EXT_F_MASK,
+				  val << PLL_SSC_DIV_EXT_F_SHIFT);
+}
+
+static inline int set_pi_ibselh(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
+				  PLL_PI_IBSELH_MASK, val << PLL_PI_IBSELH_SHIFT);
+}
+
+static inline int set_ssc_div_n(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET,
+				  PLL_SSC_DIV_N_MASK, val << PLL_SSC_DIV_N_SHIFT);
+}
+
+static inline int get_ssc_div_n(struct clk_pll_mmc *clkm, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = (raw_val & PLL_SSC_DIV_N_MASK) >> PLL_SSC_DIV_N_SHIFT;
+
+	return 0;
+}
+
+static inline int set_pow_ctl(struct clk_pll_mmc *clkm, u32 val)
+{
+	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, val);
+}
+
+static inline int get_pow_ctl(struct clk_pll_mmc *clkm, u32 *val)
+{
+	int ret;
+	u32 raw_val;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, &raw_val);
+	if (ret)
+		return ret;
+
+	*val = raw_val;
+
+	return 0;
+}
+
+static int clk_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_hw *hwp = clk_hw_get_parent(hw);
+	struct clk_pll_mmc *clkm;
+	int phase_id;
+	int ret;
+	u32 val;
+
+	if (!hwp)
+		return -ENOENT;
+
+	clkm = to_clk_pll_mmc(hwp);
+	phase_id = (hw == &clkm->phase0_hw) ? 0 : 1;
+	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
+	ret = set_phsel(clkm, phase_id, val);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+static int clk_pll_mmc_phase_get_phase(struct clk_hw *hw)
+{
+	struct clk_hw *hwp;
+	struct clk_pll_mmc *clkm;
+	int phase_id;
+	int ret;
+	u32 val;
+
+	hwp = clk_hw_get_parent(hw);
+	if (!hwp)
+		return -ENOENT;
+
+	clkm = to_clk_pll_mmc(hwp);
+	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;
+	ret = get_phsel(clkm, phase_id, &val);
+	if (ret)
+		return ret;
+
+	val = DIV_ROUND_CLOSEST(val * CYCLE_DEGREES, PHASE_STEPS);
+
+	return val;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_phase_ops = {
+	.set_phase = clk_pll_mmc_phase_set_phase,
+	.get_phase = clk_pll_mmc_phase_get_phase,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "REALTEK_CLK");
+
+static int clk_pll_mmc_prepare(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	return set_pow_ctl(clkm, 7);
+}
+
+static void clk_pll_mmc_unprepare(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_pow_ctl(clkm, 0);
+}
+
+static int clk_pll_mmc_is_prepared(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val;
+	int ret;
+
+	ret = get_pow_ctl(clkm, &val);
+	if (ret)
+		return 1;
+
+	return val != 0x0;
+}
+
+static int clk_pll_mmc_enable(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	int ret;
+
+	ret = set_phrt0(clkm, 1);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+static void clk_pll_mmc_disable(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+
+	set_phrt0(clkm, 0);
+	udelay(10);
+}
+
+static int clk_pll_mmc_is_enabled(struct clk_hw *hw)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val;
+	int ret;
+
+	ret = get_phrt0(clkm, &val);
+	if (ret)
+		return 1;
+
+	return val == 0x1;
+}
+
+static unsigned long clk_pll_mmc_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val, ext_f;
+	int ret;
+
+	ret = get_ssc_div_n(clkm, &val);
+	if (ret)
+		return ret;
+
+	ret = get_ssc_div_ext_f(clkm, &ext_f);
+	if (ret)
+		return ret;
+
+	return parent_rate / 4 * (val + 2) + (parent_rate / 4 * ext_f) / 8192;
+}
+
+static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	u32 val;
+
+	if (!req->best_parent_rate)
+		return -EINVAL;
+
+	val = DIV_ROUND_CLOSEST(req->rate * 4, req->best_parent_rate);
+	req->rate = req->best_parent_rate * val / 4;
+
+	return 0;
+}
+
+static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
+{
+	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
+	u32 val = PLL_MMC_SSC_DIV_N_VAL;
+	int ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = set_ssc_div_n(clkm, val);
+	if (ret)
+		return ret;
+
+	ret = set_ssc_div_ext_f(clkm, 1517);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case 31 ... 46:
+		ret = set_pi_ibselh(clkm, 3);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_rs(clkm, 3);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_icp(clkm, 2);
+		if (ret)
+			return ret;
+		break;
+
+	case 20 ... 30:
+		ret = set_pi_ibselh(clkm, 2);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_rs(clkm, 3);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_icp(clkm, 1);
+		if (ret)
+			return ret;
+		break;
+
+	case 10 ... 19:
+		ret = set_pi_ibselh(clkm, 1);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_rs(clkm, 2);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_icp(clkm, 1);
+		if (ret)
+			return ret;
+		break;
+
+	case 5 ... 9:
+		ret = set_pi_ibselh(clkm, 0);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_rs(clkm, 2);
+		if (ret)
+			return ret;
+
+		ret = set_sscpll_icp(clkm, 0);
+		if (ret)
+			return ret;
+		break;
+	}
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
+				 PLL_NCODE_SSC_EMMC_MASK,
+				 27 << PLL_NCODE_SSC_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
+				 PLL_FCODE_SSC_EMMC_MASK, 321);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC4_OFFSET,
+				 PLL_GRAN_EST_EM_MC_MASK, 5985);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_EN_SSC_EMMC_MASK, 0x1);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_EN_SSC_EMMC_MASK, 0x0);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(clkm->clkr.regmap,
+				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
+				 PLL_FLAG_INITAL_EMMC_MASK,
+				 0x1 << PLL_FLAG_INITAL_EMMC_SHIFT);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+const struct clk_ops rtk_clk_pll_mmc_ops = {
+	.prepare          = clk_pll_mmc_prepare,
+	.unprepare        = clk_pll_mmc_unprepare,
+	.is_prepared      = clk_pll_mmc_is_prepared,
+	.enable           = clk_pll_mmc_enable,
+	.disable          = clk_pll_mmc_disable,
+	.is_enabled       = clk_pll_mmc_is_enabled,
+	.recalc_rate      = clk_pll_mmc_recalc_rate,
+	.determine_rate   = clk_pll_mmc_determine_rate,
+	.set_rate         = clk_pll_mmc_set_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_ops, "REALTEK_CLK");
diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
index 237b1d8a2f00..6bf4e02321f9 100644
--- a/drivers/clk/realtek/clk-pll.h
+++ b/drivers/clk/realtek/clk-pll.h
@@ -45,4 +45,17 @@ struct clk_pll {
 extern const struct clk_ops rtk_clk_pll_ops;
 extern const struct clk_ops rtk_clk_pll_ro_ops;
 
+struct clk_pll_mmc {
+	struct clk_regmap clkr;
+	unsigned int pll_ofs;
+	unsigned int ssc_dig_ofs;
+	struct clk_hw phase0_hw;
+	struct clk_hw phase1_hw;
+};
+
+#define __clk_pll_mmc_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
+
+extern const struct clk_ops rtk_clk_pll_mmc_ops;
+extern const struct clk_ops rtk_clk_pll_mmc_phase_ops;
+
 #endif /* __CLK_REALTEK_CLK_PLL_H */
-- 
2.34.1


