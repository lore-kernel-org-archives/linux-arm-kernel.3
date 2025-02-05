Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E73C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSQeWzSgrb+Bgv6s0GnYuvjzz6MyzXd89J++ZXTBfTQ=; b=4EKPadHdYTxDhO5qr/ta1Gb8SI
	VMOXBeHY2L6LfmY2YYflH0Vrfn/kI7xydCsy+GLIKY2yvyNas2SN4O5AuTNO6eQScuWgZyDUdyCET
	GRQ1roM0DwOFUIPj4QhHbBf2ngdR8Z3xHOYrCHS91gMXwx5xjeVWcpHUK+QOUjVkuFEe6W63i2jEf
	B6C3isZyEZZHAOWdM1Og7ej73aBvykmXeekkfUzZSIX8bFydNO6f67U8z1+pf8hww8pbPREC3jNHb
	zetOC9AdwvXpmCU22Q1S1GSKpBgDHkV1iEsHfXwCKgw2dg6IdTdLf0DFWmYFJjQaXNzYP+EyUBXO8
	NrbyQddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeyt-00000003JGE-0T8d;
	Wed, 05 Feb 2025 12:58:15 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetM-00000003Hnj-1ShO;
	Wed, 05 Feb 2025 12:52:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa67ac42819so1007813266b.0;
        Wed, 05 Feb 2025 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759950; x=1739364750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSQeWzSgrb+Bgv6s0GnYuvjzz6MyzXd89J++ZXTBfTQ=;
        b=JUdTkdqB9iah+3ngkUCUcky7DK1JmNODTAlE64vfPjAShsD2kNo+3A82Uo6C85d2Ee
         rQXDhc8cA/N6ISlaTu2RXO4UMg6ywH2pTrjOVcJPqhMReiXEgCJQ6oN3TAO8eXQOGnao
         eBus2Ze5n876pmFoG/DZHG1/AF9PUiGnMwztNazaeu3mKtnBHqbGuC6tZ2zGoLh/rqpr
         x0DJBMw/5EKuPpv+6zmLgJSH4Llsjq355mZPOEHiLamDWAPi1s+Qp1Whjkg13RBHGwkJ
         zmwO7BKOmCoxs1M3WA7zFicd+w7e72lN295Dq18k5S5UXf/XXsQ95OopIsCJKRCmNBgY
         k85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759950; x=1739364750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSQeWzSgrb+Bgv6s0GnYuvjzz6MyzXd89J++ZXTBfTQ=;
        b=oyRvDjjzD/dkZsXSgyVa9Yom1jAQ2hrW0jZUuROh8oNPJpbtr0wLDB+kOSW+ejvstN
         FDjWi7+FsdNHiEUdoFDiwEUOZ7WE0VqoVWjY1SGLlpMzbvpbXddc61b18zSOWl1Ev3oQ
         Hs6XRgYF9S0XrzG5SpAvyo8c0fWtejUfZBSZ3E7szFjU70Hr+xjbLYj/EnNvYdncvhrf
         hWd7HwI3m8TCLPtEdNY7jyJodeVoBSgZjAreh7iNGAkInZM2c1sJr7cokandbB7QNFzt
         MB71ClZuL3RLs9ZKLa+DnSwdI+DlUCguoSxsUT9MvdQzaKzvuHGJqEtnZNcvsuXD0FPl
         GZEg==
X-Forwarded-Encrypted: i=1; AJvYcCUSOIPdTGvbW3wMweqc7O9HjgQ9Ca4hSvpJlIQbcoplctUob1dQbgXGcMp8eXTuwl2/YeuKBruSiy0+@lists.infradead.org, AJvYcCWQlXo3O3TPZOEpZvEiVxoo4Gjlt6avglE3NquaLQSt5WDoDkV7cNGTBi0bWSx/2ajqSnICaf3DEb+Mtkk=@lists.infradead.org, AJvYcCX5FvKLOp31NK7gtgbIO7U9a0F5HDwSKvD4u2I4UXe0Idnko4EvUxtRZiCtmDquNrTi4gcjktQy69NljGNBNZ67@lists.infradead.org
X-Gm-Message-State: AOJu0YwOlAbEcGcvZQwfqNYZPtJqF9F1g1JyDwjkt97Iv3YY7X5GTzlB
	8K459nXDtC4qiINILwCjSEJi8l4ECmzjEAkzbUbougkcLJpJQRit
X-Gm-Gg: ASbGncsBBdhgWTt+YW5uFp1dfR/ybPXTUv4404w6pkUs19bX3f/ocEjVYuJu2Sc7O10
	cn/hkB4MNMxWBJfWvQA7VxRpRUEW8vMBnMv++fmEJLsWyjQ/1NmCr6o2XcuhXtFWrM+XXZXb5CR
	UlXBdWVH0eP9woHGLjC4TzeJOXAMAwelEZk4NBerj40Q7NNrgxqnBL78j1v5f4LHKLBHY9JGRL4
	R3Ewpttobesd8GP10VKb7n7fUJpt/ZJstOg+igWgYCknWw09EkaIjDh5TejBxK2V351UxsO7sWa
	TTDIsCHQIA32xMGA+4NWZypVix9JiF0VxH9XqaXuQwMm0A==
X-Google-Smtp-Source: AGHT+IGecgfsMcG35UqT0e1WE5j5jytX3/spRmqUEZGqCE6i0UxnZyh0jUtBcSjoqCNwAvn31NH/Fg==
X-Received: by 2002:a17:907:7254:b0:aab:740f:e467 with SMTP id a640c23a62f3a-ab75e214c28mr230820566b.8.1738759950159;
        Wed, 05 Feb 2025 04:52:30 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:29 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 01/10] clk: sunxi-ng: allow key feature in ccu reset and gate
Date: Wed,  5 Feb 2025 13:52:16 +0100
Message-Id: <20250205125225.1152849-2-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045232_409715_7CE0DA53 
X-CRM114-Status: GOOD (  16.00  )
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

Some newer SoCs, like V853 has reset and gate registers, what can be write only
with fixed key value. Move this value from ccu_mux and reuse
in the reset code, and also introduce a new macro to support writing gate
registers with a key.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/clk/sunxi-ng/ccu_common.h |  2 ++
 drivers/clk/sunxi-ng/ccu_gate.c   |  6 ++++++
 drivers/clk/sunxi-ng/ccu_gate.h   | 14 ++++++++++++++
 drivers/clk/sunxi-ng/ccu_mux.c    |  4 +---
 drivers/clk/sunxi-ng/ccu_reset.c  |  7 +++++++
 drivers/clk/sunxi-ng/ccu_reset.h  |  2 +-
 6 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index dd330426a6e5..36132cb8b920 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -23,6 +23,8 @@
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
 
+#define CCU_KEY_VALUE			0x16aa0000
+
 struct device_node;
 
 struct ccu_common {
diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index ac52fd6bff67..a7ffaa8d3cb6 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -20,6 +20,9 @@ void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
+	if (common->features & CCU_FEATURE_KEY_FIELD)
+		reg |= CCU_KEY_VALUE;
+
 	writel(reg & ~gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
@@ -44,6 +47,9 @@ int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
+	if (common->features & CCU_FEATURE_KEY_FIELD)
+		reg |= CCU_KEY_VALUE;
+
 	writel(reg | gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
diff --git a/drivers/clk/sunxi-ng/ccu_gate.h b/drivers/clk/sunxi-ng/ccu_gate.h
index dc05ce06737a..37e21fcdd931 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.h
+++ b/drivers/clk/sunxi-ng/ccu_gate.h
@@ -68,6 +68,20 @@ struct ccu_gate {
 		}							\
 	}
 
+#define SUNXI_CCU_GATE_HWS_WITH_KEY(_struct, _name, _parent, _reg,	\
+				       _gate, _flags)			\
+	struct ccu_gate _struct = {					\
+		.enable	= _gate,					\
+		.common	= {						\
+			.reg		= _reg,				\
+			.features	= CCU_FEATURE_KEY_FIELD,	\
+			.hw.init	= CLK_HW_INIT_HWS(_name,	\
+							  _parent,	\
+							  &ccu_gate_ops, \
+							  _flags),	\
+		}							\
+	}
+
 #define SUNXI_CCU_GATE_HWS_WITH_PREDIV(_struct, _name, _parent, _reg,	\
 				       _gate, _prediv, _flags)		\
 	struct ccu_gate _struct = {					\
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index d7ffbdeee9e0..127269ab20ea 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -12,8 +12,6 @@
 #include "ccu_gate.h"
 #include "ccu_mux.h"
 
-#define CCU_MUX_KEY_VALUE		0x16aa0000
-
 static u16 ccu_mux_get_prediv(struct ccu_common *common,
 			      struct ccu_mux_internal *cm,
 			      int parent_index)
@@ -196,7 +194,7 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 
 	/* The key field always reads as zero. */
 	if (common->features & CCU_FEATURE_KEY_FIELD)
-		reg |= CCU_MUX_KEY_VALUE;
+		reg |= CCU_KEY_VALUE;
 
 	reg &= ~GENMASK(cm->width + cm->shift - 1, cm->shift);
 	writel(reg | (index << cm->shift), common->base + common->reg);
diff --git a/drivers/clk/sunxi-ng/ccu_reset.c b/drivers/clk/sunxi-ng/ccu_reset.c
index 55bc7c7cda0f..a9aee35c6617 100644
--- a/drivers/clk/sunxi-ng/ccu_reset.c
+++ b/drivers/clk/sunxi-ng/ccu_reset.c
@@ -9,6 +9,7 @@
 #include <linux/reset-controller.h>
 
 #include "ccu_reset.h"
+#include "ccu_common.h"
 
 static int ccu_reset_assert(struct reset_controller_dev *rcdev,
 			    unsigned long id)
@@ -21,6 +22,9 @@ static int ccu_reset_assert(struct reset_controller_dev *rcdev,
 	spin_lock_irqsave(ccu->lock, flags);
 
 	reg = readl(ccu->base + map->reg);
+	if (map->features & CCU_FEATURE_KEY_FIELD)
+		reg |= CCU_KEY_VALUE;
+
 	writel(reg & ~map->bit, ccu->base + map->reg);
 
 	spin_unlock_irqrestore(ccu->lock, flags);
@@ -39,6 +43,9 @@ static int ccu_reset_deassert(struct reset_controller_dev *rcdev,
 	spin_lock_irqsave(ccu->lock, flags);
 
 	reg = readl(ccu->base + map->reg);
+	if (map->features & CCU_FEATURE_KEY_FIELD)
+		reg |= CCU_KEY_VALUE;
+
 	writel(reg | map->bit, ccu->base + map->reg);
 
 	spin_unlock_irqrestore(ccu->lock, flags);
diff --git a/drivers/clk/sunxi-ng/ccu_reset.h b/drivers/clk/sunxi-ng/ccu_reset.h
index 941276a8ec2e..8da721ac3a7d 100644
--- a/drivers/clk/sunxi-ng/ccu_reset.h
+++ b/drivers/clk/sunxi-ng/ccu_reset.h
@@ -12,9 +12,9 @@
 struct ccu_reset_map {
 	u16	reg;
 	u32	bit;
+	u32	features;
 };
 
-
 struct ccu_reset {
 	void __iomem			*base;
 	const struct ccu_reset_map	*reset_map;
-- 
2.39.5


