Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB0CC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GzEe4YiPMqRsswmvE8nr5qcErZuck09XEHOMIdU+Zo=; b=O5AJWN1XLKUI3QZsX0bYrEGKJb
	f1cg004o9p0XMJ2bY6xxk/52Ldy7IiqHD/iN/tx7c4xkt+zN+nhGFNIZ5M4ZyBf47Iy7w+Sic5jy6
	ZspMPedqKf3BgbtarqodaKqTh+cZh5qGdTZIQoFnUXbTqU99LoQkkCBVjiBczt/BSizW1NMTRTehA
	KtMBU29fwiZkBLlROcRs6vYDdlamMoPDfutwxke6/7UwgNLdD+5tTSTbsthqZO97IDZKxlpCQlBfs
	fj8iBagDVL53RoCS8owtFlvweZbbLyRkloAMhR3iE/IPSC3hjmztjbls+YKf7uLVE/MCd15yBkAcw
	UWb9yFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u932H-00000003fUM-1vNh;
	Sun, 27 Apr 2025 14:31:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92wh-00000003ek5-25po;
	Sun, 27 Apr 2025 14:25:28 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30db1bc464dso40735691fa.0;
        Sun, 27 Apr 2025 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763926; x=1746368726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GzEe4YiPMqRsswmvE8nr5qcErZuck09XEHOMIdU+Zo=;
        b=aw6KOCM7ShPXrQuWh+t8uZdw5GGmZ+AN+pArJKcAh+0o5DX76uI8UMofM8oRvlUogx
         bV/1B6gWK27nz7XzSMe6dYistjTbg2vwsc3oK+CIYIzkNqruDIrZhi70fg2zmtUDb4M4
         YQVqepkw6+uSl/NCESoKakYpYcZfP+k1cR9VLlJkX6is6yDxCGogPXht5NdsvUfZPX55
         +ilRVhh3g9W+wfQU7b7StTB3+MunXf/eXbUwcJF9fYET0UxkccfRgBJtPIL9hjw6fA52
         +hERU4mLHwOcEaTA3Fu+IQtlfppFo6L/smc8XFJbp0Qa4bKqtXiPDyM+6ctxTXIbLY4E
         uIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763926; x=1746368726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GzEe4YiPMqRsswmvE8nr5qcErZuck09XEHOMIdU+Zo=;
        b=HWRjHbt5T7D//LUZhogdKEtpkzmC7Hk8N2oGo0vFrjPDm2OAcGayEh8tbpD25wV/D7
         yFAtWEm4eTkkeLEU2ng5DAXUt/iONriI4fhL3HdiTqhrugyb9bvX5LbveNeYovdrCS/9
         VujXMck/0BRUDADSfYTeAH9cJBaP6VskhtoQGjmOSsFiJvMHew7R9KzhSEtBXCO0QRYx
         V2OEpJ+aGexWwP2Dkwzd9OoDlwNpIF/4t+qo9gd0fKVjLS+tI8gRKZixubOwG2lYl31m
         EdMEncGUnw3WgUa2VJBMUWj/KxDXx1XEE9C940Q5JcyRSSngV+Hvk2Ae5EsnN3P9VtbX
         ScJg==
X-Forwarded-Encrypted: i=1; AJvYcCV0rl4hZ2N1GKPUVUpdTSEgMqt3g42PljJYvLGH9+oUujl+JcBq70NDddGp1krPXqAWZE2djvRrrFfFqoQ=@lists.infradead.org, AJvYcCV3npq65VHw0BKQkVvBRPzF6cZP9ENSgqEO8ytNiVD8dtZ3mhgN0iqvcHYMhZmWUS4l++uBSEstOo9/d5mfmOA3@lists.infradead.org
X-Gm-Message-State: AOJu0YyUffh/4bql3GnMsuBjRGvfy7lcKNYenMcByyT516zU349pJi2W
	zbE48w2MmXqA57qfS9linU/R+30NNdoQSuFulC/wu7+046LibNs=
X-Gm-Gg: ASbGncuksusfK2pJsysq+xA6qJZ64WJ3RZC9OpgTl73Ax0gGukA6t1jYhjvfrf0RDy/
	Bpf/3KnTCTVPz0QBFIKfXCi02bLJa9c4ACOF4D80IEyYHOAXNWipfjqn9pMJBI47OB4b+ZKbdXh
	VxtUGaugd4ndmgOvz2uNII0oYR3EsnzLex0dQgrSd8CexTRxxq5GdDsfbI6K48yEu2Nrp9wXg1R
	pWDRepCOP6HCaZtcov0y0gBYVbS/q6MIkvtgRpb/Hid//EEAgOiiB/hgnKFhZAsy14G6bfio2Sr
	cQ6SFCs3FM9uIklHQAL8JnE7J1g0uYY64WeeA+eQQsvxXfkmEQ4j5X8b
X-Google-Smtp-Source: AGHT+IH4FB3aq395wzXxmINJMdYxBYu26wok5HnDsUwCT6VNV3XuZqiQ5mJmESpuRXReLhEDUiN9cA==
X-Received: by 2002:a05:651c:1509:b0:310:856b:6862 with SMTP id 38308e7fff4ca-3190644d8famr27286381fa.12.1745763925616;
        Sun, 27 Apr 2025 07:25:25 -0700 (PDT)
Received: from localhost.localdomain ([178.176.177.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb482b1sm17659191fa.29.2025.04.27.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:25:25 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
Date: Sun, 27 Apr 2025 17:24:54 +0300
Message-Id: <20250427142500.151925-3-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427142500.151925-1-privatesub2@gmail.com>
References: <20250427142500.151925-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_072527_716832_3B1F0139 
X-CRM114-Status: GOOD (  31.03  )
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

Allwinner's D1, T113-S3 and R329 SoCs have a quite different PWM
controllers with ones supported by pwm-sun4i driver.

This patch adds a PWM controller driver for Allwinner's D1,
T113-S3 and R329 SoCs. The main difference between these SoCs
is the number of channels defined by the DT property.

Co-developed-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 drivers/pwm/Kconfig      |  10 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-sun20i.c | 379 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 390 insertions(+)
 create mode 100644 drivers/pwm/pwm-sun20i.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4731d5b90d7e..230a5561385b 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -662,6 +662,16 @@ config PWM_SUN4I
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sun4i.
 
+config PWM_SUN20I
+	tristate "Allwinner D1/T113s/R329 PWM support"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Generic PWM framework driver for Allwinner D1/T113s/R329 SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-sun20i.
+
 config PWM_SUNPLUS
 	tristate "Sunplus PWM support"
 	depends on ARCH_SUNPLUS || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 539e0def3f82..ef7515d2f974 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_PWM_STM32)		+= pwm-stm32.o
 obj-$(CONFIG_PWM_STM32_LP)	+= pwm-stm32-lp.o
 obj-$(CONFIG_PWM_STMPE)		+= pwm-stmpe.o
 obj-$(CONFIG_PWM_SUN4I)		+= pwm-sun4i.o
+obj-$(CONFIG_PWM_SUN20I)	+= pwm-sun20i.o
 obj-$(CONFIG_PWM_SUNPLUS)	+= pwm-sunplus.o
 obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
 obj-$(CONFIG_PWM_TIECAP)	+= pwm-tiecap.o
diff --git a/drivers/pwm/pwm-sun20i.c b/drivers/pwm/pwm-sun20i.c
new file mode 100644
index 000000000000..22486617f1ef
--- /dev/null
+++ b/drivers/pwm/pwm-sun20i.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PWM Controller Driver for sunxi platforms (D1, T113-S3 and R329)
+ *
+ * Limitations:
+ * - When the parameters change, the current running period is not completed
+ *   and new settings are applied immediately.
+ * - The PWM output goes to a HIGH-Z state when the channel is disabled.
+ * - Changing the clock configuration (SUN20I_PWM_CLK_CFG)
+ *   may cause a brief output glitch.
+ *
+ * Copyright (c) 2023 Aleksandr Shubin <privatesub2@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+
+#define SUN20I_PWM_CLK_CFG(pair)		(0x20 + ((pair) * 0x4))
+#define SUN20I_PWM_CLK_CFG_SRC			GENMASK(8, 7)
+#define SUN20I_PWM_CLK_CFG_DIV_M		GENMASK(3, 0)
+#define SUN20I_PWM_CLK_DIV_M_MAX		8
+
+#define SUN20I_PWM_CLK_GATE			0x40
+#define SUN20I_PWM_CLK_GATE_BYPASS(chan)	BIT((chan) + 16)
+#define SUN20I_PWM_CLK_GATE_GATING(chan)	BIT(chan)
+
+#define SUN20I_PWM_ENABLE			0x80
+#define SUN20I_PWM_ENABLE_EN(chan)		BIT(chan)
+
+#define SUN20I_PWM_CTL(chan)			(0x100 + (chan) * 0x20)
+#define SUN20I_PWM_CTL_ACT_STA			BIT(8)
+#define SUN20I_PWM_CTL_PRESCAL_K		GENMASK(7, 0)
+#define SUN20I_PWM_CTL_PRESCAL_K_MAX		field_max(SUN20I_PWM_CTL_PRESCAL_K)
+
+#define SUN20I_PWM_PERIOD(chan)			(0x104 + (chan) * 0x20)
+#define SUN20I_PWM_PERIOD_ENTIRE_CYCLE		GENMASK(31, 16)
+#define SUN20I_PWM_PERIOD_ACT_CYCLE		GENMASK(15, 0)
+
+#define SUN20I_PWM_PCNTR_SIZE			BIT(16)
+
+/*
+ * SUN20I_PWM_MAGIC is used to quickly compute the values of the clock dividers
+ * div_m (SUN20I_PWM_CLK_CFG_DIV_M) & prescale_k (SUN20I_PWM_CTL_PRESCAL_K)
+ * without using a loop. These dividers limit the # of cycles in a period
+ * to SUN20I_PWM_PCNTR_SIZE (65536) by applying a scaling factor of
+ * 1/(div_m * (prescale_k + 1)) to the clock source.
+ *
+ * SUN20I_PWM_MAGIC is derived by solving for div_m and prescale_k
+ * such that for a given requested period,
+ *
+ * i) div_m is minimized for any prescale_k ≤ SUN20I_PWM_CTL_PRESCAL_K_MAX,
+ * ii) prescale_k is minimized.
+ *
+ * The derivation proceeds as follows, with val = # of cycles for requested
+ * period:
+ *
+ * for a given value of div_m we want the smallest prescale_k such that
+ *
+ * (val >> div_m) // (prescale_k + 1) ≤ 65536 (= SUN20I_PWM_PCNTR_SIZE)
+ *
+ * This is equivalent to:
+ *
+ * (val >> div_m) ≤ 65536 * (prescale_k + 1) + prescale_k
+ * ⟺ (val >> div_m) ≤ 65537 * prescale_k + 65536
+ * ⟺ (val >> div_m) - 65536 ≤ 65537 * prescale_k
+ * ⟺ ((val >> div_m) - 65536) / 65537 ≤ prescale_k
+ *
+ * As prescale_k is integer, this becomes
+ *
+ * ((val >> div_m) - 65536) // 65537 ≤ prescale_k
+ *
+ * And is minimized at
+ *
+ * ((val >> div_m) - 65536) // 65537
+ *
+ * Now we pick the smallest div_m that satifies prescale_k ≤ 255
+ * (i.e SUN20I_PWM_CTL_PRESCAL_K_MAX),
+ *
+ * ((val >> div_m) - 65536) // 65537 ≤ 255
+ * ⟺ (val >> div_m) - 65536 ≤ 255 * 65537 + 65536
+ * ⟺ val >> div_m ≤ 255 * 65537 + 2 * 65536
+ * ⟺ val >> div_m < (255 * 65537 + 2 * 65536 + 1)
+ * ⟺ div_m = fls((val) / (255 * 65537 + 2 * 65536 + 1))
+ *
+ * Suggested by Uwe Kleine-König
+ */
+#define SUN20I_PWM_MAGIC			(255 * 65537 + 2 * 65536 + 1)
+#define SUN20I_PWM_DIV_CONST			65537
+
+struct sun20i_pwm_chip {
+	struct clk *clk_hosc, *clk_apb;
+	void __iomem *base;
+};
+
+static inline struct sun20i_pwm_chip *to_sun20i_pwm_chip(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static inline u32 sun20i_pwm_readl(struct sun20i_pwm_chip *chip,
+				   unsigned long offset)
+{
+	return readl(chip->base + offset);
+}
+
+static inline void sun20i_pwm_writel(struct sun20i_pwm_chip *chip,
+				     u32 val, unsigned long offset)
+{
+	writel(val, chip->base + offset);
+}
+
+static int sun20i_pwm_get_state(struct pwm_chip *chip,
+				struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
+	u16 ent_cycle, act_cycle, prescale_k;
+	u64 clk_rate, tmp;
+	u8 div_m;
+	u32 val;
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm / 2));
+	div_m = FIELD_GET(SUN20I_PWM_CLK_CFG_DIV_M, val);
+	if (div_m > SUN20I_PWM_CLK_DIV_M_MAX)
+		div_m = SUN20I_PWM_CLK_DIV_M_MAX;
+
+	/*
+	 * If CLK_CFG_SRC is 0, use the hosc clock;
+	 * otherwise (any nonzero value) use the APB clock.
+	 */
+	if (FIELD_GET(SUN20I_PWM_CLK_CFG_SRC, val) == 0)
+		clk_rate = clk_get_rate(sun20i_chip->clk_hosc);
+	else
+		clk_rate = clk_get_rate(sun20i_chip->clk_apb);
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(pwm->hwpwm));
+	state->polarity = (SUN20I_PWM_CTL_ACT_STA & val) ?
+			   PWM_POLARITY_NORMAL : PWM_POLARITY_INVERSED;
+
+	prescale_k = FIELD_GET(SUN20I_PWM_CTL_PRESCAL_K, val) + 1;
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE);
+	state->enabled = (SUN20I_PWM_ENABLE_EN(pwm->hwpwm) & val) ? true : false;
+
+	val = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_PERIOD(pwm->hwpwm));
+	act_cycle = FIELD_GET(SUN20I_PWM_PERIOD_ACT_CYCLE, val);
+
+	ent_cycle = FIELD_GET(SUN20I_PWM_PERIOD_ENTIRE_CYCLE, val);
+
+	/*
+	 * The duration of the active phase should not be longer
+	 * than the duration of the period
+	 */
+	if (act_cycle > ent_cycle)
+		act_cycle = ent_cycle;
+
+	/*
+	 * We have act_cycle <= ent_cycle <= 0xffff, prescale_k <= 0x100,
+	 * div_m <= 8. So the multiplication fits into an u64 without
+	 * overflow.
+	 */
+	tmp = ((u64)(act_cycle) * prescale_k << div_m) * NSEC_PER_SEC;
+	state->duty_cycle = DIV_ROUND_UP_ULL(tmp, clk_rate);
+	tmp = ((u64)(ent_cycle) * prescale_k << div_m) * NSEC_PER_SEC;
+	state->period = DIV_ROUND_UP_ULL(tmp, clk_rate);
+
+	return 0;
+}
+
+static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
+	u64 bus_rate, hosc_rate, val, ent_cycle, act_cycle;
+	u32 clk_gate, clk_cfg, pwm_en, ctl, reg_period;
+	u32 prescale_k, div_m;
+	bool use_bus_clk;
+
+	pwm_en = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_ENABLE);
+	clk_gate = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_GATE);
+
+	if (!state->enabled) {
+		if (state->enabled != pwm->state.enabled) {
+			clk_gate &= ~SUN20I_PWM_CLK_GATE_GATING(pwm->hwpwm);
+			pwm_en &= ~SUN20I_PWM_ENABLE_EN(pwm->hwpwm);
+			sun20i_pwm_writel(sun20i_chip, pwm_en, SUN20I_PWM_ENABLE);
+			sun20i_pwm_writel(sun20i_chip, clk_gate, SUN20I_PWM_CLK_GATE);
+		}
+		return 0;
+	}
+
+	ctl = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(pwm->hwpwm));
+	clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm / 2));
+	hosc_rate = clk_get_rate(sun20i_chip->clk_hosc);
+	bus_rate = clk_get_rate(sun20i_chip->clk_apb);
+	if (pwm_en & SUN20I_PWM_ENABLE_EN(pwm->hwpwm ^ 1)) {
+		/* If the neighbor channel is enabled, use the current clock settings */
+		use_bus_clk = FIELD_GET(SUN20I_PWM_CLK_CFG_SRC, clk_cfg) != 0;
+		val = mul_u64_u64_div_u64(state->period,
+					  (use_bus_clk ? bus_rate : hosc_rate),
+					  NSEC_PER_SEC);
+
+		div_m = FIELD_GET(SUN20I_PWM_CLK_CFG_DIV_M, clk_cfg);
+	} else {
+		/*
+		 * Select the clock source based on the period.
+		 * Since bus_rate > hosc_rate, which means bus_rate
+		 * can provide a higher frequency than hosc_rate.
+		 */
+		use_bus_clk = false;
+		val = mul_u64_u64_div_u64(state->period, hosc_rate, NSEC_PER_SEC);
+		/*
+		 * If the calculated value is ≤ 1, the period is too short
+		 * for proper PWM operation
+		 */
+		if (val <= 1) {
+			use_bus_clk = true;
+			val = mul_u64_u64_div_u64(state->period, bus_rate, NSEC_PER_SEC);
+			if (val <= 1)
+				return -EINVAL;
+		}
+		div_m = fls(DIV_ROUND_DOWN_ULL(val, SUN20I_PWM_MAGIC));
+		if (div_m > SUN20I_PWM_CLK_DIV_M_MAX)
+			return -EINVAL;
+
+		/* Set up the CLK_DIV_M and clock CLK_SRC */
+		clk_cfg = FIELD_PREP(SUN20I_PWM_CLK_CFG_DIV_M, div_m);
+		clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_SRC, use_bus_clk);
+
+		sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm / 2));
+	}
+
+	/* Calculate prescale_k and determine the number of cycles for a full PWM period */
+	ent_cycle = val >> div_m;
+	prescale_k = DIV_ROUND_DOWN_ULL(ent_cycle, SUN20I_PWM_DIV_CONST);
+	if (prescale_k > SUN20I_PWM_CTL_PRESCAL_K_MAX)
+		prescale_k = SUN20I_PWM_CTL_PRESCAL_K_MAX;
+
+	do_div(ent_cycle, prescale_k + 1);
+
+	/* ent_cycle must not be zero */
+	if (ent_cycle == 0)
+		return -EINVAL;
+
+	/* For N cycles, PPRx.PWM_ENTIRE_CYCLE = (N-1) */
+	reg_period = FIELD_PREP(SUN20I_PWM_PERIOD_ENTIRE_CYCLE, ent_cycle - 1);
+
+	/* Calculate the active cycles (duty cycle) */
+	val = mul_u64_u64_div_u64(state->duty_cycle,
+				  (use_bus_clk ? bus_rate : hosc_rate),
+				  NSEC_PER_SEC);
+	act_cycle = val >> div_m;
+	do_div(act_cycle, prescale_k + 1);
+
+	/*
+	 * The formula of the output period and the duty-cycle for PWM are as follows.
+	 * T period = PWM0_PRESCALE_K / PWM01_CLK * (PPR0.PWM_ENTIRE_CYCLE + 1)
+	 * T high-level = PWM0_PRESCALE_K / PWM01_CLK * PPR0.PWM_ACT_CYCLE
+	 * Duty-cycle = T high-level / T period
+	 */
+	reg_period |= FIELD_PREP(SUN20I_PWM_PERIOD_ACT_CYCLE, act_cycle);
+	sun20i_pwm_writel(sun20i_chip, reg_period, SUN20I_PWM_PERIOD(pwm->hwpwm));
+
+	ctl = FIELD_PREP(SUN20I_PWM_CTL_PRESCAL_K, prescale_k);
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		ctl |= SUN20I_PWM_CTL_ACT_STA;
+
+	sun20i_pwm_writel(sun20i_chip, ctl, SUN20I_PWM_CTL(pwm->hwpwm));
+
+	if (state->enabled != pwm->state.enabled) {
+		clk_gate &= ~SUN20I_PWM_CLK_GATE_BYPASS(pwm->hwpwm);
+		clk_gate |= SUN20I_PWM_CLK_GATE_GATING(pwm->hwpwm);
+		pwm_en |= SUN20I_PWM_ENABLE_EN(pwm->hwpwm);
+		sun20i_pwm_writel(sun20i_chip, pwm_en, SUN20I_PWM_ENABLE);
+		sun20i_pwm_writel(sun20i_chip, clk_gate, SUN20I_PWM_CLK_GATE);
+	}
+
+	return 0;
+}
+
+static const struct pwm_ops sun20i_pwm_ops = {
+	.apply = sun20i_pwm_apply,
+	.get_state = sun20i_pwm_get_state,
+};
+
+static const struct of_device_id sun20i_pwm_dt_ids[] = {
+	{ .compatible = "allwinner,sun20i-d1-pwm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun20i_pwm_dt_ids);
+
+static int sun20i_pwm_probe(struct platform_device *pdev)
+{
+	struct pwm_chip *chip;
+	struct sun20i_pwm_chip *sun20i_chip;
+	struct clk *clk_bus;
+	struct reset_control *rst;
+	u32 npwm;
+	int ret;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "allwinner,npwms", &npwm);
+	if (ret < 0)
+		npwm = 8; /* Default value */
+
+	if (npwm > 16) {
+		dev_info(&pdev->dev, "Limiting number of PWM lines from %u to 16", npwm);
+		npwm = 16;
+	}
+
+	chip = devm_pwmchip_alloc(&pdev->dev, npwm, sizeof(*sun20i_chip));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	sun20i_chip = to_sun20i_pwm_chip(chip);
+
+	sun20i_chip->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sun20i_chip->base))
+		return PTR_ERR(sun20i_chip->base);
+
+	clk_bus = devm_clk_get_enabled(&pdev->dev, "bus");
+	if (IS_ERR(clk_bus))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_bus),
+				     "Failed to get bus clock\n");
+
+	sun20i_chip->clk_hosc = devm_clk_get_enabled(&pdev->dev, "hosc");
+	if (IS_ERR(sun20i_chip->clk_hosc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_hosc),
+				     "Failed to get hosc clock\n");
+
+	ret = devm_clk_rate_exclusive_get(&pdev->dev, sun20i_chip->clk_hosc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get hosc exclusive rate\n");
+
+	sun20i_chip->clk_apb = devm_clk_get_enabled(&pdev->dev, "apb");
+	if (IS_ERR(sun20i_chip->clk_apb))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_apb),
+				     "Failed to get apb clock\n");
+
+	ret = devm_clk_rate_exclusive_get(&pdev->dev, sun20i_chip->clk_apb);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get apb exclusive rate\n");
+
+	if (clk_get_rate(sun20i_chip->clk_apb) <= clk_get_rate(sun20i_chip->clk_hosc))
+		dev_info(&pdev->dev, "APB clock must be greater than hosc clock");
+
+	rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				     "Failed to get reset control\n");
+
+	chip->ops = &sun20i_pwm_ops;
+
+	ret = devm_pwmchip_add(&pdev->dev, chip);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to add PWM chip\n");
+
+	return 0;
+}
+
+static struct platform_driver sun20i_pwm_driver = {
+	.driver = {
+		.name = "sun20i-pwm",
+		.of_match_table = sun20i_pwm_dt_ids,
+	},
+	.probe = sun20i_pwm_probe,
+};
+module_platform_driver(sun20i_pwm_driver);
+
+MODULE_AUTHOR("Aleksandr Shubin <privatesub2@gmail.com>");
+MODULE_DESCRIPTION("Allwinner sun20i PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


