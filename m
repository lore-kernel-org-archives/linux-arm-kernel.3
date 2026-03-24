Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191C6F532CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0AMtvl1NZg5dclnV6GKlxIVEe2T4U6uQwC3on8Pox0=; b=zlDVju4CCShPVsJ5PvqE4ph9OD
	s0c1nrM2bsh/0cGlNqFCTp6O2OPlsSqWslpfMwzPR9ZuTM8k9bxKp1ICPoMCGAcQ/mmL6mhkcqMuO
	QoQ9C/1GvX6g1aPZFe2LSp7E1G2irRauDZxlTFTdHG/lDOC5DRYTaqW/De/TpTtIhkEJW2fS5+kau
	OkecrtnVg9vOchxPURlEyvrZNlCxI14IoYYJQszSH8j2CTKdlzXbFkZDFXmpXGxSFQpIElbMrjbey
	ROKd3jXzfqKrBh1A1AkylcCyFPOSHYKpEjWINIPdeqQEuqh4Q+k6XPLotDvY08wqw4l5naPXWkK+P
	JUJ7go7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwo-00000000QcR-2xao;
	Tue, 24 Mar 2026 02:56:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwk-00000000QZa-0BWA;
	Tue, 24 Mar 2026 02:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=r0AMtvl1NZg5dclnV6GKlxIVEe2T4U6uQwC3on8Pox0=; b=CDaYTYzFNdVgr8kbcrw2sFtZVP
	kRiG8PM0JrGn/h1FbXF/Ae/BJ0O7VBNthwjOvx/C/F3BffwisqLLN9DGAmafoBi8i3WMrQa1yjYKX
	LdFLCi5ypiHNk2+Ve/JkZB2a7CElPW+2jLvcWam4Us1j32IUxC+0r3TfAYJAd7ZEli+CGT2/fnQJG
	QgTNVIrmgyp5u3oxGMs38CEPBVSFZxZSMf62fbK+3wH0o90R6hpl7+DZ7SfMXe5HYnWNBKh7CC5PH
	wOOIyfnRORzY3Nqc4lCJjJh14xzsRId6RaCKywo93nCwLxzWfyYzYYlYIShsgzLTuY2vj/10TMS36
	+MXZ6s9A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rwL-000000035P7-3NRM;
	Tue, 24 Mar 2026 02:56:41 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62O2rYodD278466, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774320814; bh=r0AMtvl1NZg5dclnV6GKlxIVEe2T4U6uQwC3on8Pox0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=vsq8jyEoCTjPxxqTMT6iaILhGsFHClcVCuoxHh7zJPJjs7AN4kF4N9qnASJZAGUSJ
	 ZXywBqAZoxrpqNbdMJ50XOInKNCrshotFJmXXhG3k8d4kH7eKESDwgxoj8KCweWhsH
	 u+0si4+aeCcSJ0o44ABFDnfolzgvpjGt4dSmG7u+N5H6LXEP8zI3VG+XrCBYvS2JEy
	 xAqSlhx6YhQKSVlubBXVj7HcCCA8Echh66g9X7EVoaGOLT4Z7HnOKuaW2tQi165V3W
	 qdfKa9LAH/2C5Z/K4AQBinl58AOIWo8GREKfHxI5qgl2qrVp5NJ/egoIl792NoLry8
	 HIBS36/UFEZ9Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62O2rYodD278466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 10:53:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Mar 2026 10:53:34 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Mar 2026 10:53:34 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v5 07/10] clk: realtek: Add support for mux clock
Date: Tue, 24 Mar 2026 10:53:28 +0800
Message-ID: <20260324025332.3416977-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324025332.3416977-1-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_025626_474115_88BFD193 
X-CRM114-Status: GOOD (  17.20  )
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

Add a simple regmap-based clk_ops implementation for Realtek mux clocks.

The implementation supports parent selection and rate determination through
regmap-backed register access.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v5:
- None.
---
 drivers/clk/realtek/Makefile         |  1 +
 drivers/clk/realtek/clk-regmap-mux.c | 46 ++++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-mux.h | 43 ++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 74375f8127ac..f90dc57fcfdb 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -5,4 +5,5 @@ clk-rtk-y += common.o
 
 clk-rtk-y += clk-pll.o
 clk-rtk-y += clk-regmap-gate.o
+clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
new file mode 100644
index 000000000000..d1612de2e2bc
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include "clk-regmap-mux.h"
+
+static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
+	int num_parents = clk_hw_get_num_parents(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
+	if (ret)
+		return 0;
+
+	val = val >> clkm->shift & clkm->mask;
+
+	if (val >= num_parents)
+		return 0;
+
+	return val;
+}
+
+static int clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
+				  clkm->mask << clkm->shift, index << clkm->shift);
+}
+
+const struct clk_ops rtk_clk_regmap_mux_ops = {
+	.set_parent = clk_regmap_mux_set_parent,
+	.get_parent = clk_regmap_mux_get_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_regmap_mux_ops);
+
+const struct clk_ops rtk_clk_regmap_mux_ro_ops = {
+	.get_parent = clk_regmap_mux_get_parent,
+};
+EXPORT_SYMBOL_GPL(rtk_clk_regmap_mux_ro_ops);
diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
new file mode 100644
index 000000000000..cf7ab6a0604c
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
+#define __CLK_REALTEK_CLK_REGMAP_MUX_H
+
+#include "common.h"
+
+struct clk_regmap_mux {
+	struct clk_regmap clkr;
+	int mux_ofs;
+	unsigned int mask;
+	unsigned int shift;
+};
+
+#define __clk_regmap_mux_hw(_p) __clk_regmap_hw(&(_p)->clkr)
+
+#define __CLK_REGMAP_MUX(_name, _parents, _ops, _flags, _ofs, _sft, _mask)   \
+	struct clk_regmap_mux _name = {                                      \
+		.clkr.hw.init =                                              \
+			CLK_HW_INIT_PARENTS(#_name, _parents, _ops, _flags), \
+		.mux_ofs = _ofs,                                             \
+		.shift = _sft,                                               \
+		.mask = _mask,                                               \
+	}
+
+#define CLK_REGMAP_MUX(_name, _parents, _flags, _ofs, _sft, _mask)           \
+	__CLK_REGMAP_MUX(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
+			 _sft, _mask)
+
+static inline struct clk_regmap_mux *to_clk_regmap_mux(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+
+	return container_of(clkr, struct clk_regmap_mux, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_mux_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
-- 
2.34.1


