Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF1606D825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+s/Hg3J;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=j2I35RcS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sUwgE7umEstB2AuKdIc5+gCPN9cVvjjoRM3ZlqDw+SU=; b=d+s/Hg3J/fqzAn
	+48+KJATbHb+5szTs1CBdkmYsW1sQK2/T0sBvwoilYy4bdL9o34xsqCPvtbOp5fit5Z+U30l11bBn
	DMkvmS3DHieH320i03Id8eB9mUlk3/QUov3Hq0PT0RJbDNf++wRssaYfBP2VU15VRGmK7E2jVmFkz
	CEUZJ5i+iL8kouRMLXmkh5JeSSmzdjzOJOvdEc+gX7oCeXp6x+wHZMWkEnjVBehAqsR4+S58KkJ/U
	qXJCA0tgrK85TfSu+bJwbL3K3bSPJgSOgLVL54gAVkphSLM1Sp4jbg0l2r05pPvn6xS5RrDwEulAY
	RWhN22Aemn89/FqiLdHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLZ-0000000Ba3v-1GAb;
	Fri, 06 Nov 2026 08:30:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLL-0000000BZgW-3I8i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so2509575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953838; x=1794558638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUwgE7umEstB2AuKdIc5+gCPN9cVvjjoRM3ZlqDw+SU=;
        b=j2I35RcSWpKOExqM0Ko1WO3YssjAqXUXIWTRa5QfwYQzVo7AgKyMrfzXEuof8HOe60
         xtFzH5yIF/s5YZIdRHzf7aLZP8DD/sLJoXA/TDoHyOpnnqbt9dHta/FdrqYg9QynlE5/
         +9orxsJ58YcEjd7aE3Q7CNDBYioHGAPs8XotilijudippyP3rTfFD3EFhWuRskwxO0qL
         RJWwGa03ZGDFCjDdpRaqDI8htkT920WNXu6vnnnlZgzyYZMYfAE7sLgkjpV4bhmPXUlQ
         YbJoBlpdPDgZk36/o0ohdQ93PYCLM79WEZxX6xjaB7gFM+iWoll7JQJ4cgwt4pvhHMAc
         aHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953838; x=1794558638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUwgE7umEstB2AuKdIc5+gCPN9cVvjjoRM3ZlqDw+SU=;
        b=BEUGzmDkay7e6lXpWiqEY1iglHseUXGVLmwCop5cSLMCbM1wQwHNUZbGGJHJ4r2R5O
         jtD7kGtQ9ihrbb19Z05Po7+3Ax0LlpaXP7ED+6dvXDeMDFVlAzo7kDUgpZQABEZyhCKc
         ic0AvEn18Tm3TctssKFoYw+xbUQhXhsRFyD/83g9FQ3lDmQxxeUUflHHQ2I5JLekzNx/
         cETYIK+QlF7AII9gB50bIC4mjuRP+zb833QMM4ROPyxHlgDnup3BUypY/b9WlYHYu8Sm
         XdNT93V4/Up3G66T0OVDK/Eg1NnSVsAPN+K9HSRtC4tsfLUNi9LLXGtJ1D3NLoYVLZYb
         uD/g==
X-Forwarded-Encrypted: i=1; AKwUvBzIcOUIOjuO9cZ4z+r64fgZxQV22yfQxi1O2/cdgxE9dmaXlnAdoCcE9nXNTOn52Lx0ABCBttDX/CKlhGXZlCjp@lists.infradead.org
X-Gm-Message-State: APuU4Z/60MDTpfGXmoA8YSbY4NBs5wg+jKkvHvq+LBHY8c0i/A50TL0t
	sU+zcTT0FdxRHXAbaRR+5u7oD+OGdcpm667hyS0aYbHgG1ImvlNAk4hmli7Hmm/d5zw=
X-Gm-Gg: AYBFou2oSHxJ2lawXh6LvKJhZtGnYcstJwHE1o2aA8g8swf7ts839yvtPjXvxipujFE
	BXNFZPOvEfMBWfE01vhJILR2+W9tnTT8mmzK/SryMdYQxEFaT0B974V1iKjA+7aehQhLIhXpbbW
	0ArEm+9vxFeNBoLzaP+5x4Y6O4c9DjocvBORUcgW9EfZyTFoL+BiY2UVozKFELMJLXvBBwGqXgg
	zVewB3c6HiMGTZflZK0qrBXIkq8i3ADbxlGPWKq8lseqs+fTFONu/JqMD6Rfa0GcRdGoEUjnIUw
	X/Brd7A2IjciUtpU6q93kyEeIWtI38cJXIhVQLwUlxca3KSXlDicsRRTDZ1h5jux0Bg7V8n8M2E
	dwcQFL3xBB+g6X+iO1NzSdSTUowbDh80Jv9v7eicYFDCdikP9bzueXFK2hcosh1UAudUeKsO7yL
	MJIDhZJVJ7ny6HUhUhtVf/qduRw+NdFnpHa/PeeJ3QNFVdJA8CosCLekUGk5QXcjgD8FYAR5noQ
	DEk53CayFscSByPNSloZf9xf8sRtnuNM8M7G5E1ve2czObA/eDySLCbPA3KuWN42XqYWvviZP4T
	3I9x3uieRM4HS+/m1fqmFsMysVYd8tbVZk7fHFe4joDcL8dOEZI6glCK6LPzNb0P3v9MQtIMuC6
	74TQ7fQ9QbaDBZccJp/bmyNrMP6zyqWP6ihhO8zMWuHh4Ew==
X-Received: by 2002:a05:600c:c4a4:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4b6de4a7678mr23607875e9.5.1793953837813;
        Fri, 06 Nov 2026 00:30:37 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:37 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:28 +0100
Subject: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003040_074079_9F15CA0E 
X-CRM114-Status: GOOD (  17.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 PLL controller provides the fixed PLL with its fclk dividers,
the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.

Add a driver for it. The GP0 and HIFI PLLs are expected to run with
their input divided by 2 (div0p5) and the HDMI PLL without it, as the
firmware and the init sequences set them up.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/Kconfig  |  14 +
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/s7-pll.c | 648 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 663 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index d460514bb8a1..35f2971448af 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -229,6 +229,20 @@ config COMMON_CLK_S4_PERIPHERALS
 	  Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
 	  devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
 
+config COMMON_CLK_S7_PLL
+	tristate "Amlogic S7 SoC PLL controller support"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_MESON
+	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_PLL
+	imply COMMON_CLK_SCMI
+	help
+	  Support for the PLL clock controller on Amlogic S805X3 based
+	  devices, AKA S7. This controller provides the fixed PLL and its
+	  dividers, the GP0, HIFI0 and HIFI1 PLLs and the HDMI PLL. Say Y if
+	  you want the S7 PLL clock controller to work.
+
 config COMMON_CLK_T7_PLL
 	tristate "Amlogic T7 SoC PLL controller support"
 	depends on ARM64
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 56b04254eb1a..9d439106d11c 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -28,5 +28,6 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
 obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
 obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
+obj-$(CONFIG_COMMON_CLK_S7_PLL) += s7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PERIPHERALS) += t7-peripherals.o
diff --git a/drivers/clk/meson/s7-pll.c b/drivers/clk/meson/s7-pll.c
new file mode 100644
index 000000000000..2aa253a5f211
--- /dev/null
+++ b/drivers/clk/meson/s7-pll.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Amlogic S7 PLL Clock Controller Driver
+ *
+ * Copyright (c) 2026 BayLibre, SAS.
+ * Author: Carlo Caione <ccaione@baylibre.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "meson-clkc-utils.h"
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+
+#define FIXPLL_CTRL0			0x040
+#define FIXPLL_CTRL1			0x044
+#define FIXPLL_STS			0x05c
+#define GP0PLL_CTRL0			0x080
+#define GP0PLL_CTRL1			0x084
+#define GP0PLL_CTRL2			0x088
+#define GP0PLL_CTRL3			0x08c
+#define GP0PLL_STS			0x09c
+#define HIFI0PLL_CTRL0			0x100
+#define HIFI0PLL_CTRL1			0x104
+#define HIFI0PLL_CTRL2			0x108
+#define HIFI0PLL_CTRL3			0x10c
+#define HIFI1PLL_CTRL0			0x110
+#define HIFI1PLL_CTRL1			0x114
+#define HIFI1PLL_CTRL2			0x118
+#define HIFI1PLL_CTRL3			0x11c
+#define HIFI0PLL_STS			0x120
+#define HIFI1PLL_STS			0x124
+#define HDMIPLL_CTRL0			0x1c0
+#define HDMIPLL_CTRL1			0x1c4
+#define HDMIPLL_CTRL2			0x1c8
+#define HDMIPLL_CTRL3			0x1cc
+#define HDMIPLL_STS			0x1dc
+
+static struct clk_regmap s7_fixed_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.n = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 11,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = FIXPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll_vco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "fix",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_fixed_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = FIXPLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_fixed_pll_vco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+#define S7_FCLK(_name, _mult, _divider, _reg, _bit)			\
+static struct clk_fixed_factor s7_##_name##_div = {			\
+	.mult = (_mult),						\
+	.div = (_divider),						\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_fixed_factor_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_fixed_pll.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+};									\
+									\
+static struct clk_regmap s7_##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ro_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_##_name##_div.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
+
+/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
+S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
+S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
+S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
+S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
+S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
+S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
+
+static const struct pll_mult_range s7_pll_mult_range = {
+	.min = 134,
+	.max = 265,
+};
+
+static const struct reg_sequence s7_gp0_pll_init_regs[] = {
+	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_div0p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "gp0",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = GP0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = GP0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 131072,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_gp0_pll_init_regs),
+		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = GP0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/* hifi is HIFI0 in the datasheet */
+static const struct reg_sequence s7_hifi_pll_init_regs[] = {
+	{ .reg = HIFI0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_fixed_factor s7_hifi_pll_div0p5 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi_pll_div0p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s7_hifi1_pll_init_regs[] = {
+	{ .reg = HIFI1PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI1PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI1PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI1PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_fixed_factor s7_hifi1_pll_div0p5 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_div0p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi1",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI1PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI1PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi1_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi1_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI1PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct pll_mult_range s7_hdmi_pll_mult_range = {
+	.min = 125,
+	.max = 249,
+};
+
+static const struct reg_sequence s7_hdmi_pll_init_regs[] = {
+	{ .reg = HDMIPLL_CTRL0,	.def = 0x00881000 },
+	{ .reg = HDMIPLL_CTRL1,	.def = 0x2c6011cc },
+	{ .reg = HDMIPLL_CTRL2,	.def = 0x86801000 },
+	{ .reg = HDMIPLL_CTRL3,	.def = 0x00000000 },
+};
+
+static const struct clk_div_table s7_hdmi_pll_div0p5_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ /* sentinel */ }
+};
+
+static struct clk_regmap s7_hdmi_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL1,
+		.shift = 19,
+		.width = 1,
+		.table = s7_hdmi_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hdmi",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HDMIPLL_CTRL3,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HDMIPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s7_hdmi_pll_mult_range,
+		.init_regs = s7_hdmi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hdmi_pll_init_regs),
+		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+/*
+ * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields:
+ * each is two power-of-two dividers.
+ */
+static struct clk_regmap s7_hdmi_pll_od0 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 19,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od0",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_od1 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 21,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od1",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od0.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 15,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od1.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div5 = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div6p25 = {
+	.mult = 4,
+	.div = 25,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div6p25",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div7p5 = {
+	.mult = 2,
+	.div = 15,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div7p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_pix = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = HDMIPLL_CTRL0,
+		.mask = 0x3,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_pix_div5.hw,
+			&s7_hdmi_pll_pix_div6p25.hw,
+			&s7_hdmi_pll_pix_div7p5.hw
+		},
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_hw *s7_pll_hws[] = {
+	[CLKID_FIXED_PLL_VCO]		= &s7_fixed_pll_vco.hw,
+	[CLKID_FIXED_PLL]		= &s7_fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]		= &s7_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV2]		= &s7_fclk_div2.hw,
+	[CLKID_FCLK_DIV3_DIV]		= &s7_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV3]		= &s7_fclk_div3.hw,
+	[CLKID_FCLK_DIV4_DIV]		= &s7_fclk_div4_div.hw,
+	[CLKID_FCLK_DIV4]		= &s7_fclk_div4.hw,
+	[CLKID_FCLK_DIV5_DIV]		= &s7_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV5]		= &s7_fclk_div5.hw,
+	[CLKID_FCLK_DIV7_DIV]		= &s7_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV7]		= &s7_fclk_div7.hw,
+	[CLKID_FCLK_DIV2P5_DIV]		= &s7_fclk_div2p5_div.hw,
+	[CLKID_FCLK_DIV2P5]		= &s7_fclk_div2p5.hw,
+	[CLKID_GP0_PLL_DIV0P5]		= &s7_gp0_pll_div0p5.hw,
+	[CLKID_GP0_PLL_VCO]		= &s7_gp0_pll_vco.hw,
+	[CLKID_GP0_PLL]			= &s7_gp0_pll.hw,
+	[CLKID_HIFI_PLL_DIV0P5]		= &s7_hifi_pll_div0p5.hw,
+	[CLKID_HIFI_PLL_VCO]		= &s7_hifi_pll_vco.hw,
+	[CLKID_HIFI_PLL]		= &s7_hifi_pll.hw,
+	[CLKID_HIFI1_PLL_DIV0P5]	= &s7_hifi1_pll_div0p5.hw,
+	[CLKID_HIFI1_PLL_VCO]		= &s7_hifi1_pll_vco.hw,
+	[CLKID_HIFI1_PLL]		= &s7_hifi1_pll.hw,
+	[CLKID_HDMI_PLL_DIV0P5]		= &s7_hdmi_pll_div0p5.hw,
+	[CLKID_HDMI_PLL_VCO]		= &s7_hdmi_pll_vco.hw,
+	[CLKID_HDMI_PLL_OD0]		= &s7_hdmi_pll_od0.hw,
+	[CLKID_HDMI_PLL_OD1]		= &s7_hdmi_pll_od1.hw,
+	[CLKID_HDMI_PLL]		= &s7_hdmi_pll.hw,
+	[CLKID_HDMI_PLL_PIX_DIV5]	= &s7_hdmi_pll_pix_div5.hw,
+	[CLKID_HDMI_PLL_PIX_DIV6P25]	= &s7_hdmi_pll_pix_div6p25.hw,
+	[CLKID_HDMI_PLL_PIX_DIV7P5]	= &s7_hdmi_pll_pix_div7p5.hw,
+	[CLKID_HDMI_PLL_PIX]		= &s7_hdmi_pll_pix.hw,
+};
+
+static const struct meson_clkc_data s7_pll_clkc_data = {
+	.hw_clks = {
+		.hws = s7_pll_hws,
+		.num = ARRAY_SIZE(s7_pll_hws),
+	},
+};
+
+static const struct of_device_id s7_pll_clkc_match_table[] = {
+	{
+		.compatible = "amlogic,s7-pll-clkc",
+		.data = &s7_pll_clkc_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s7_pll_clkc_match_table);
+
+static struct platform_driver s7_pll_clkc_driver = {
+	.probe		= meson_clkc_mmio_probe,
+	.driver		= {
+		.name	= "s7-pll-clkc",
+		.of_match_table = s7_pll_clkc_match_table,
+	},
+};
+module_platform_driver(s7_pll_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic S7 PLL Clock Controller driver");
+MODULE_AUTHOR("Carlo Caione <ccaione@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_MESON");

-- 
2.56.0


