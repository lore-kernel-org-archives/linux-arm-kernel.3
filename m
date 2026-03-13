Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83C106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvElaFYq/IK33ggppVBYpY4DYtvgpJTsuUOAWi+UkTA=; b=34mxmzJDqWJbzrTfFVQqivnA9m
	2UBJYQFIF2I4IjDjpnMJOKRSb5LHZoLf8Z5NTxtKy3udnAlFBfZ8xzeqYaEOouseGcU+hkRC5HQde
	5WvEIeueCigg853YFk6/gm7FBUNM8ftFJdwSyj+pLW5zua8FOdkxYRO4/0IdELf83sKpuS2QHINXM
	vr7zQ8dzQtzQJdT+iE4obV5/slwoYz9oS7A+OGPacTfGe/3rK2jgiAsZH/a+XUKFpoPmBd69SpIsZ
	mYYV6JWIixDUIJeWZNAoDxxWxJo3YPsuLkNX7sglyCNYNw1uobJgT7vBGmCd1hoUwosYY13qChj6G
	n1a6RZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeL-0000000HBwj-31Vg;
	Fri, 13 Mar 2026 08:13:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeJ-0000000HBvi-3pco;
	Fri, 13 Mar 2026 08:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CvElaFYq/IK33ggppVBYpY4DYtvgpJTsuUOAWi+UkTA=; b=HLDnBTfTzVqPcg4J6CgIXp6qPj
	e20RErVDMWH2wQvccQmBtPmSfzAjb/pLi/gfyLkAYsilJLGa6A8aYMQ1PoxnEUdCyAuBK+QEowddw
	bhRYQ7Ebc6k5wWRE7cuc7tCb/VrEJmRkfuyD+T9y3kwcEb7wzmVUZSJ7x7gFFmGnBXWGBwkJD9eCc
	FZqa7G0z7rYoXzE/w0uQbGq48pX8p0KHGfxAd3fPAQHIJK1FlctQXcmANjaz0KIpfAMpp8MSIe22z
	roEk7T/ymX4GVNWR/e+CHGOZ4Z+rRwoq989+khSLZCx8JU3XForAD9jhAnD00QUJc2/thYnU5FkLz
	77BhLO2g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeF-00000002pFc-3lyS;
	Fri, 13 Mar 2026 08:13:34 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B2HJ0053110, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389462; bh=CvElaFYq/IK33ggppVBYpY4DYtvgpJTsuUOAWi+UkTA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=J5ZXXajCNNX4X/PXeRKGg2+w9sNDVAuaHZu02M4D5rYPCAZzyi+b3YnWiMQ8HyNmx
	 4F0b+Q7+cVLYmLo4d3YNbWoE8zjWXoXeUtwI3TNAELHPayk2oWtl2dnhssO4VmqYB6
	 yJWqukpl99c6ECwEzpGKazuVh13Vcqy7ajEcYdSmHweSrRPpSW7aL7+aua5Q4aAPOn
	 59Az/GQqEaqiVdh82YPXBYONkwLJGhmQPdz/mXab5u0885n/MqeR0qmEZCxcEmlanx
	 osjWF4W/KRsLTBd9ZXehCWJJPEFo9Bvi0sY+DVV3ZVrLAvQF9G/SKPgnsisfWte1Ol
	 oRY8AygD8xqMA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B2HJ0053110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:02 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:02 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 13 Mar 2026 16:11:02 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 16:11:02 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v4 06/10] clk: realtek: Add support for gate clock
Date: Fri, 13 Mar 2026 16:10:56 +0800
Message-ID: <20260313081100.596224-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260313081100.596224-1-eleanor.lin@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_081332_764843_4FDA20CB 
X-CRM114-Status: GOOD (  16.93  )
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
disable_unused for standard regmap gate clocks.

Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- None.
---
 drivers/clk/realtek/Makefile          |  2 +
 drivers/clk/realtek/clk-regmap-gate.c | 66 +++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-gate.h | 65 ++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index c173ea3b10e3..97058d48a176 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -2,6 +2,8 @@
 obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 
 clk-rtk-y += common.o
+
 clk-rtk-y += clk-pll.o
+clk-rtk-y += clk-regmap-gate.o
 clk-rtk-y += freq_table.o
 clk-rtk-y += reset.o
diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
new file mode 100644
index 000000000000..5174283c2c21
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include "clk-regmap-gate.h"
+
+static int clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct clk_regmap_gate *clkg = to_clk_regmap_gate(hw);
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
+static void clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct clk_regmap_gate *clkg = to_clk_regmap_gate(hw);
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
+static int clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap_gate *clkg = to_clk_regmap_gate(hw);
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
+	.enable     = clk_regmap_gate_enable,
+	.disable    = clk_regmap_gate_disable,
+	.is_enabled = clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_regmap_gate_ops);
+
+const struct clk_ops rtk_clk_regmap_gate_ro_ops = {
+	.is_enabled = clk_regmap_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_regmap_gate_ro_ops);
diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
new file mode 100644
index 000000000000..b93357bd5a0d
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-gate.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_GATE_H
+#define __CLK_REALTEK_CLK_REGMAP_GATE_H
+
+#include "common.h"
+
+struct clk_regmap_gate {
+	struct clk_regmap clkr;
+	int gate_ofs;
+	u8 bit_idx;
+	u32 write_en : 1;
+};
+
+#define __clk_regmap_gate_hw(_p) __clk_regmap_hw(&(_p)->clkr)
+
+#define __CLK_REGMAP_GATE(_name, _parent, _ops, _flags, _ofs, _bit_idx,     \
+			  _write_en)                                        \
+	struct clk_regmap_gate _name = {                                    \
+		.clkr.hw.init = CLK_HW_INIT(#_name, _parent, _ops, _flags), \
+		.gate_ofs = _ofs,                                           \
+		.bit_idx = _bit_idx,                                        \
+		.write_en = _write_en,                                      \
+	}
+
+#define CLK_REGMAP_GATE(_name, _parent, _flags, _ofs, _bit_idx, _write_en)    \
+	__CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+			  _bit_idx, _write_en)
+
+#define CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en) \
+	__CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ro_ops, _flags,    \
+			  _ofs, _bit_idx, _write_en)
+
+#define __CLK_REGMAP_GATE_NO_PARENT(_name, _ops, _flags, _ofs, _bit_idx,     \
+				    _write_en)                               \
+	struct clk_regmap_gate _name = {                                     \
+		.clkr.hw.init = CLK_HW_INIT_NO_PARENT(#_name, _ops, _flags), \
+		.gate_ofs = _ofs,                                            \
+		.bit_idx = _bit_idx,                                         \
+		.write_en = _write_en,                                       \
+	}
+
+#define CLK_REGMAP_GATE_NO_PARENT(_name, _flags, _ofs, _bit_idx, _write_en)    \
+	__CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
+				    _bit_idx, _write_en)
+
+#define CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en) \
+	__CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ro_ops, _flags,    \
+				    _ofs, _bit_idx, _write_en)
+
+static inline struct clk_regmap_gate *to_clk_regmap_gate(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_regmap_gate, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_gate_ops;
+extern const struct clk_ops rtk_clk_regmap_gate_ro_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
-- 
2.34.1


