Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91497606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e54oV08V;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=bDDHmXH6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RBz08268AVURbWerFfGZQvoJEMhx0Fe3EfTMgya6HMo=; b=e54oV08VOGHtpL
	fyFk9LWfustqxdIKWFwoRoS5a3KDwhfInSYe5MGOErKL8iOZM2FnFKQi5UkoCofpkSr/Hb/aZNBWW
	maOtcF7WcF3jvQHWuXDy/R2fnrhfA9GpSQxw6aIJQmlJut+rqruoDFboKgxYt9ushovSnT2i0ie5U
	RK1H5ezx1Sp6VWzW40o6/0ouwAUB4NgG80rJgfhSSLg9vg014Z7K0q0NwEVYnn4vVyiuV0BmOyaLD
	EnF3POdw9FEOz3UzUd/f+TA3hb+fLJphRQ+g92+Vw+oC836g6xjMk7GNVeOIumva5v213fmKOS2wS
	JDjQcdnrVa6DTgbN7K5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4Bg-0000000795I-0jwq;
	Wed, 28 Oct 2026 13:59:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4BY-0000000790X-485n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:59:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so6694165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195963; x=1793800763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBz08268AVURbWerFfGZQvoJEMhx0Fe3EfTMgya6HMo=;
        b=bDDHmXH6OQJm0VhiC85/kHryZ/sz+AnlilsrTDhzUP9oW3pAOpRYEByzOXTOQtIbKn
         nycXTbrdB5moln6p4YsnXeFQvwsnt3TBQSuzQ/qtSs+mZV/h3/tkcdJW7jxt+tz4yn/k
         HsaxLDg+mAokYGSR3jJgC/zihyU2IW8wluX7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195963; x=1793800763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBz08268AVURbWerFfGZQvoJEMhx0Fe3EfTMgya6HMo=;
        b=eShdP6SZ2CSnl0/y+24rVTJDCbIWaSac68b1lrjRoSRTgdASksiTxiwLeP8loIiH1H
         sQHNociaI8NzhNUfXWX+POK5RKUGZv+hJN/RFZFQskFraFlEdLKzqmF1WgLIpRKGJuYA
         G3kn2eNIDvATXA0NFK/tMxYfCz21iwIw7pwtXVcl+MzuLlaB0+r7oUTYatkbJjbhw2oj
         GTKCyFwHFk3Y2y/84XmtK2Swz5fxL0qhrfv/SIrmD/wzAPx5m6Ub+wWeLsEDoPDf0x9Q
         2q2IGoDXbNPFknhjM1bVrgAS4l6TJhUMqr/uNEhq9amQp+r/X5Mrb7757uK7i3ZUPQy8
         OwHw==
X-Forwarded-Encrypted: i=1; AKwUvByi8r0GNmJIu7wnKS29G2vowaiFeHZT2fJDhvmdbssfdTiuxVwoR2QD7Ss3HM+K1Z0vb+SJ6RVADr3w2cRiqR4R@lists.infradead.org
X-Gm-Message-State: AFq9FYI8uUgm8aYfMaJNG1tKp8ixsdfxn6O6TzwSQOnjTAfoXufvSCyq
	7L8swnLNHbJqhctDx2ezSHa96W0eS+HDJGrvLID/e3lbtYtaGDFtkiD1zHk4rivktZA=
X-Gm-Gg: AYBFou3tIhYLBVsAags71Hvh54SHM/JGFnBhrFmCiCtS3aWB+6aSBz6VGF6VHrIZhGa
	xQ/lPsUQLBEnw+rEqMfmhyfyzukM46dILWk0MeRYaPMadLt51ukmNDztkI1cYw28P8Pv4gpKInd
	m/TEIaJ0hss5HIyPLxW9H1xnlI0B133FMZ/cx4g2+mm5eYWj6uctcdW5oBG54FO86Q35CCWE8F5
	NbPcPtRaFzT+MISZX7Qf/D34KUYHVdHN021EwIeoj86zDio8fNLyCF5phXbiGZT3VSekZsTNYN/
	SUd4whx8h7AtTPLTqzHox/3xkwmkDwITcBz02/BDRD2B539J96JrMptGs0LwdhVYDPbg5Q2PZlV
	NS1XaYZSN2GURB1AV6mO5J4zB83IJexjDE/K6sD1Hgh0LCqCB16m1IHNlD2bbei9MnlagBanh/d
	PE+J874jzCHrO4dtv4DVX71vKXDcfG0HQSfNTi4w8dQOEAF/hOn3f0yjWlEMHJYHktdZ2xvzsL8
	/vO/ZEWR0mcwcRwUh5w777iHtt0MXETSecsiE2Kh19nHvtb3yEVLkzxKgAsw2MZIvp51/U61ZU6
	unuhfersApGMt7/FuRUCqv9QxO6G+NMi9L2ia8Hk2wBM+Rg5dsSJ2jDEpgedHk01UA6eAfWEsj0
	SLghKgZQ/Z3i/elYAyhkB/LjodHMtA2OMmN6JDYCIEme9fjWu
X-Received: by 2002:a05:600c:19c8:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4a966e2a979mr54893215e9.24.1793195963058;
        Wed, 28 Oct 2026 06:59:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 2/4] clk: stm32: add STM32MP25 SYSCFG clock driver
Date: Wed, 28 Oct 2026 14:59:06 +0100
Message-ID: <20261028135915.2665857-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065925_071149_2981B941 
X-CRM114-Status: GOOD (  23.34  )
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

On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
clock (reset value) and the LTDC kernel clock, the latter being the one
needed by the RGB (DPI) output.

The SYSCFG node already provides this clock ("#clock-cells = <0>"),
referenced by the LTDC as "ref" clock, but no driver registers it, so
the selection is stuck at the reset value and a display connected to
the LTDC RGB output can't work.

Add a driver registering this clock as a mux. The SYSCFG node is
already bound to the STM32MP2 SYSCFG driver, so the clock driver is
bound to an auxiliary device created by the latter, which shares the
SYSCFG node and regmap.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/stm32/Kconfig                |  12 +++
 drivers/clk/stm32/Makefile               |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c | 111 +++++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 5dbd75cde657..906044aacaa1 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -39,5 +39,17 @@ config COMMON_CLK_STM32MP257
 	help
 	  Support for stm32mp25x SoC family clocks.
 
+config COMMON_CLK_STM32MP25_SYSCFG
+	tristate "Clock driver for stm32mp25x SYSCFG clocks"
+	depends on COMMON_CLK_STM32MP257
+	select AUXILIARY_BUS
+	select MFD_SYSCON
+	default COMMON_CLK_STM32MP257
+	help
+	  Support for the clocks provided by the stm32mp25x SYSCFG, i.e.
+	  the LTDC pixel clock source selection between the LTDC kernel
+	  clock (RGB output), the LVDS PHY pixel clock and the DSI byte
+	  lane clock.
+
 endif
 
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index e04727b59449..8088d172651f 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-st
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP25_SYSCFG)	+= clk-stm32mp25-syscfg.o
diff --git a/drivers/clk/stm32/clk-stm32mp25-syscfg.c b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
new file mode 100644
index 000000000000..1cb2459f0370
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STM32MP25 SYSCFG clocks
+ *
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define SYSCFG_DISPLAYCLKCR		0x5000
+#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
+
+/*
+ * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
+ * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
+ * the LTDC kernel clock, which is used with the RGB (DPI) output.
+ */
+static const char * const clk_pix_ltdc_parents[] = {
+	"txbyteclk", "clk_pix_lvds", "ck_ker_ltdc",
+};
+
+struct stm32mp25_syscfg_mux {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+static inline struct stm32mp25_syscfg_mux *to_syscfg_mux(struct clk_hw *hw)
+{
+	return container_of(hw, struct stm32mp25_syscfg_mux, hw);
+}
+
+static u8 stm32mp25_syscfg_mux_get_parent(struct clk_hw *hw)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+	unsigned int val;
+
+	regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);
+
+	return FIELD_GET(DISPLAYCLKCR_DPIVSLVDS, val);
+}
+
+static int stm32mp25_syscfg_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+
+	return regmap_update_bits(mux->regmap, SYSCFG_DISPLAYCLKCR,
+				  DISPLAYCLKCR_DPIVSLVDS,
+				  FIELD_PREP(DISPLAYCLKCR_DPIVSLVDS, index));
+}
+
+static const struct clk_ops stm32mp25_syscfg_mux_ops = {
+	.get_parent = stm32mp25_syscfg_mux_get_parent,
+	.set_parent = stm32mp25_syscfg_mux_set_parent,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
+};
+
+static int stm32mp25_syscfg_clk_probe(struct auxiliary_device *adev,
+				      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct clk_init_data init = { };
+	struct stm32mp25_syscfg_mux *mux;
+	int ret;
+
+	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	mux->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(mux->regmap))
+		return dev_err_probe(dev, PTR_ERR(mux->regmap),
+				     "failed to get the SYSCFG regmap\n");
+
+	init.name = "clk_pix_ltdc";
+	init.ops = &stm32mp25_syscfg_mux_ops;
+	init.parent_names = clk_pix_ltdc_parents;
+	init.num_parents = ARRAY_SIZE(clk_pix_ltdc_parents);
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
+	mux->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &mux->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register %s\n",
+				     init.name);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &mux->hw);
+}
+
+static const struct auxiliary_device_id stm32mp25_syscfg_clk_ids[] = {
+	{ .name = "stm32mp2_syscfg.clk" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, stm32mp25_syscfg_clk_ids);
+
+static struct auxiliary_driver stm32mp25_syscfg_clk_driver = {
+	.probe = stm32mp25_syscfg_clk_probe,
+	.id_table = stm32mp25_syscfg_clk_ids,
+};
+module_auxiliary_driver(stm32mp25_syscfg_clk_driver);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_DESCRIPTION("STM32MP25 SYSCFG clock driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


