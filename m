Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E057DC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPPKNOZubqToa6N7UffgfUQuz7B1uuXxaqbs4jamRMI=; b=NgYRKPw0nxQxIQxDIzn4BXeGW/
	9fDzrFR5klQhDClqynoc4IQjEMj/MPGiQZBU+o22ZQUJNIXYzjRHW2wu0xMryUXcMTBNQeoTYyZ4L
	d1owC31BGFDr/ABEIU88SYJK+cpV2SzbmPm+U83uf5g365UvsUJTcacYon5spmXublRpm+Dv7fbmw
	Mpvg1BENCo5/8bw6VWy+byqaK/S2pIgB+0q6gXh04+gl20Jw+ELTYvYCASNQtkoj10nsdymeUj8Vf
	s6DUuHuT1LbueKDyp4OlPiVwhQQcCR27c/uQXyGlAymjzrQw0UpclGgQ1kRVwR3zGZ9aDuEzQGxCc
	59HGbhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIAG-00000002M4B-2lAB;
	Tue, 04 Aug 2026 16:38:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIAD-00000002LzS-30ua;
	Tue, 04 Aug 2026 16:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yPPKNOZubqToa6N7UffgfUQuz7B1uuXxaqbs4jamRMI=; b=PybqPk7KUvTdUQB0X+i3cHKAdA
	no0BEhSCIReWVcv9WftX2n9BnEIteL/iVcyqVVCVlpC6VkXkq+KI/tz8b4Jp2o1QwMhYM8feDjpch
	7EnjGq14YljPbQgjgqMO0fOsF0sgCo9PfnM80HCkqUe0BUdXqSXwQqYJEmhJXPtvHsEAinih9I0U/
	Xgmib9WgCjOHuiDOtVBDrocMcCwtj71NFm4WI2YzbksvQIQj62C/1UEqtHtE8HSdbIwSycXzTE2VT
	ZTt+ynsgXR6LA9u34y/ve86rjKaSYC8yVzjJun6k371399FFFK29KHD4yugyLn7saCrPm6/wC0tzM
	aqC9MyGw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrIA7-0000000A5Os-3zKK;
	Tue, 04 Aug 2026 16:38:47 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 674Gc9qO51231946, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785861490; bh=yPPKNOZubqToa6N7UffgfUQuz7B1uuXxaqbs4jamRMI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MxobwEN3XnCx6w3CMG32e7inm6WRDMjzcSjIy8erdOc3dP5LxkMUd0V9NMjl7B4f2
	 CBEb5umHedO3sB21UhbLpjuiy/lgUsf8FkYazvVeKF+sF1BYzrrNuRj+H9mIMp5tSF
	 jxQIKhl+9lRFwdUk2r/cUuxSVUgk7lEb0Md2V3mrq1G1AYpkNSkF4VSihVh+IM6dAy
	 1pNpbT0n8wuhk4SZcCyHjgu7seeoaIk2+ZubwoMxPsC2QJDDx3eI5U1VVNyz5L4AZe
	 dUYRwC2AsH6KTyz6u7d49A/Am2h1lSFw/vIjYU/IsjsItyHHTtOUWfOfJGlkDG8SBp
	 VsmH9Cj3qdE6Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 674Gc9qO51231946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Aug 2026 00:38:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Aug 2026 00:38:09 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Aug 2026 00:38:09 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v12 06/11] clk: realtek: Add support for gate clock
Date: Wed, 5 Aug 2026 00:38:02 +0800
Message-ID: <20260804163807.1285869-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804163807.1285869-1-eleanor.lin@realtek.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_173844_834597_113BE9FC 
X-CRM114-Status: GOOD (  17.29  )
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

Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
for standard regmap gate clocks.

Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v12:
- Add Reviewed-by tag from Brian.
- Change 'gate_ofs' type to 'unsigned int'.
---
 drivers/clk/realtek/Makefile          |  1 +
 drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 71edc18121c6..840aff067b61 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -3,4 +3,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += clk-rtk-common.o
 clk-rtk-y += clk-pll.o
+clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
new file mode 100644
index 000000000000..1c32a87d97df
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include "clk-regmap-gate.h"
+
+static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	unsigned int mask;
+	unsigned int val;
+
+	mask = BIT(clkg->bit_idx);
+	val = BIT(clkg->bit_idx);
+
+	if (clkg->write_en) {
+		mask |= BIT(clkg->bit_idx + 1);
+		val |= BIT(clkg->bit_idx + 1);
+	}
+
+	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
+}
+
+static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	unsigned int mask;
+	unsigned int val;
+
+	mask = BIT(clkg->bit_idx);
+	val = 0;
+
+	if (clkg->write_en) {
+		mask |= BIT(clkg->bit_idx + 1);
+		val |= BIT(clkg->bit_idx + 1);
+	}
+
+	regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
+}
+
+static int rtk_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
+	int ret;
+	u32 val;
+
+	ret = regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & BIT(clkg->bit_idx));
+}
+
+const struct clk_ops rtk_clk_regmap_gate_ops = {
+	.enable     = rtk_clk_regmap_gate_enable,
+	.disable    = rtk_clk_regmap_gate_disable,
+	.is_enabled = rtk_clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ops, "CLK_REALTEK");
+
+const struct clk_ops rtk_clk_regmap_gate_ro_ops = {
+	.is_enabled = rtk_clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ro_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
new file mode 100644
index 000000000000..9303adda3166
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_GATE_H
+#define __CLK_REALTEK_CLK_REGMAP_GATE_H
+
+#include "clk-rtk-common.h"
+
+struct rtk_clk_regmap_gate {
+	struct rtk_clk_regmap clkr;
+	unsigned int gate_ofs;
+	u8 bit_idx;
+	u32 write_en : 1;
+};
+
+#define __rtk_clk_regmap_gate_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
+
+#define __RTK_CLK_REGMAP_GATE(_name, _parent, _ops, _flags, _ofs, _bit_idx, \
+			      _write_en)                                    \
+	struct rtk_clk_regmap_gate _name = {                                \
+		.clkr.hw.init = CLK_HW_INIT(#_name, _parent, _ops, _flags), \
+		.gate_ofs = _ofs,                                           \
+		.bit_idx = _bit_idx,                                        \
+		.write_en = _write_en,                                      \
+	}
+
+#define RTK_CLK_REGMAP_GATE(_name, _parent, _flags, _ofs, _bit_idx, _write_en)        \
+	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+			      _bit_idx, _write_en)
+
+#define RTK_CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en)  \
+	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ro_ops, _flags, \
+			  _ofs, _bit_idx, _write_en)
+
+#define __RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _ops, _flags, _ofs, _bit_idx,  \
+				    _write_en)                                \
+	struct rtk_clk_regmap_gate _name = {                                  \
+		.clkr.hw.init = CLK_HW_INIT_NO_PARENT(#_name, _ops, _flags),  \
+		.gate_ofs = _ofs,                                             \
+		.bit_idx = _bit_idx,                                          \
+		.write_en = _write_en,                                        \
+	}
+
+#define RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _flags, _ofs, _bit_idx, _write_en)        \
+	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+				    _bit_idx, _write_en)
+
+#define RTK_CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en)  \
+	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ro_ops, _flags, \
+				    _ofs, _bit_idx, _write_en)
+
+static inline struct rtk_clk_regmap_gate *to_rtk_clk_regmap_gate(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_gate, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_gate_ops;
+extern const struct clk_ops rtk_clk_regmap_gate_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
-- 
2.43.0


