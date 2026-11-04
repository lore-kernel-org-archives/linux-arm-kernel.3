Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76954607BC33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vBCVcLNU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZqzGD/Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W9WQdjXi6TY9dJIm31sodN+zbfnNOMbsy6mb4cShhQ4=; b=vBCVcLNUOEm4tf
	5n6eJ/kH9daF1gGxff9cDO7g2TrvGWeFyKrHYenFQQSPNhrrV50MF8nNxNY4EhsplU0QEtry6qkZY
	y6u4yJKYpTB/7tGDIx65XozJRlK8CmrX8K0zT27awKYEoVqcyvOHK5sRdazvoYSS+cqEPvYbToHzi
	glooawpCAiK10trh73lU3Z8xoB3KifX8O9zreEB+Ecq7EPTJQbUPqDiuooCBJYNNGEHPVuSHIET5I
	mmigbPDpt+IjsEmlyBl+Z8qfmHgaqRTjzOTurDtmzgOE9bvyMFrOM8+JHyngj3uO4gp20maDQBB47
	LommTxzxVTnqo3aF/ykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbf-00000006b72-0mb6;
	Wed, 04 Nov 2026 19:25:11 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbd-00000006b4u-0Esv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:25:10 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4f55a53898cso590104b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820308; x=1794425108; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9WQdjXi6TY9dJIm31sodN+zbfnNOMbsy6mb4cShhQ4=;
        b=kZqzGD/Qa4a7dO6ZK/REqyVjfeftXEyZgNNzGqNH/j8MHpl6wVqHOuSn/o6BUE+ZCD
         9ui3w5Ly50YsBjRw9jJnE6ybF5mfFimBHtIT1foKRvz+utPSDhIYOsEQq2o1Flvz4EuN
         hPqtoEq6x5vdUbiLli+N/2AlRnO9m6UWGAfcvegIRJ3maDivF5VmTDnMQoqrqM5VyiXo
         XZKAjqsbIO3zmkVkJu7pVv1L7BI3H3X5cdlCEMILgo/Jx3IhQSwyT7Cr4Y71J31KrcGY
         Wr/IL4EZ+iGtgO6vfvk/+U3Ettp2niR2SbBv9J9TlPBsCw/SCO031ojBiN9yUiJ9TgdP
         EOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820308; x=1794425108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9WQdjXi6TY9dJIm31sodN+zbfnNOMbsy6mb4cShhQ4=;
        b=v2IQICxolhWkdop8uDth3wB2862YyoXvHDqBMMMjMgM0I8qmTOXZNcIC/6PNEBaZoJ
         sFAtfN3QSbfAwH4shddtnlZ6WaYWWEmYGWjCyCuDNLybQgIo0cNS4Mp+t8R3zUYDdb0D
         6iFZ6hKYFtRR96Gy4bu6lndo/SGTyv4bCNruckKlVhOIb8vxT8cg1Z5BPGbgJ/Z2J6eo
         2jgY0gIcJwJakHauiTJhm+9YNb9b772RBwM6GWt3o89MJLRvwKMD9r1xx91Ic5L7AQ1p
         38NE82lcHI5XEdnRRb4UdBFuxK9EhtDRxDRDF5avOSx/4etLj2nIxu+Jj9z1qLXC/TkY
         3rSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrJSKDPjQWWm0kD9jzvyguyH6urgIXeAiaCyeygr5YFHn+kDdzxw9FqKL0ES/IfKur7x1b7PTXyZYp8fVKZm3L@lists.infradead.org
X-Gm-Message-State: APuU4Z8pLOJLGYsJIbiH/aC5EYRGftU8gyAIV7uJ7iAarjUI+iy7DPfj
	elBawGexcRR/uKgeq/GAgtiC0syBKB47LMWzpbMhJvhcM6dC1YDlKWVY
X-Gm-Gg: AYBFou0X1gJROy0Irxz3OCamiFW0s6f7jsIEWGj/ndGnAhuGC2n/fFtR4/W3sV2smWh
	0m5bIzhC4ZJUrr4dVIwHSH27hgisrmBRxCsey0MZUznnUDfKsQf6b52DoCfH723A47osdiWhFui
	OvSv2D6jUmBo1SbWeyhhdsCq9gh5wV6Gs6QZAeK69H64GKPseAQP1bPeNHb7DYRYwzJhL49w88F
	eu0mhbAgkurVXcuDI9niC/aS/kxXuCM6uDkndKs1IDsWMoMPHZPo261mn9IvUBMwxeMj4FiS2Ft
	daRyPA7og4lueAEGcgdCsGrps6T1gkdXqei9x7e9vDy9MtA7WrH+0HzdT0yB7Ko8ZgjA39ihw+R
	gaZy6fkLZVmpsn0v4m+DZ2V5UjXAveVlLDxHYxj0WP2MHR9Tt3LFsCi5IOy8pAzWW2nIcfrEr5a
	I+1oJEwEH1t8dCT6kutAAJ4dGBSdagdhCeTFMmE/jPvgwe5VyQK/1kfk0zHYaNCtx2LUCP9ZH4I
	tAVDqTuygtNwrpN94PUqdF3s51zS+36zVRDbVZbhM2LnICx+1n9t8y1SEhakFuo5ya8x0Qa5DmR
	SGf3JDWAHZWOeDaQ34rtXzUlod0P13n4eFUeO6hq14ZsaXVcxGSH/OmxUlv+7m1edFY/1EiERnw
	Nfa0CvMGuVgjXv0CCI6OD0kyw1s9T/H9NYVR9y/BWMqJVcuTmB6qXsfp2cRfnMOBpbW/Md/6Z2M
	edi4AV3nZyV82feMCXSUw4jvERz51rNgQEv0MnO/1BdOZjGgBpZb7m
X-Received: by 2002:a05:6808:14ca:b0:4e8:18ee:eb4d with SMTP id 5614622812f47-5640dce42ddmr14479773b6e.20.1793820307724;
        Wed, 04 Nov 2026 11:25:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:53 -0700
Subject: [PATCH v12 3/5] pwm: sun8i: export the bypass outputs as clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-h616-pwm-v8-v12-3-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_112509_159797_AA0119F0 
X-CRM114-Status: GOOD (  27.16  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Richard Genoud <richard.genoud@bootlin.com>

Expose each H616 PWM channel's hardware bypass as a CCF clock. Consumers
such as the co-packaged AC200/AC300 PHY need a clock rather than PWM duty
or polarity control. Keep the pair source protected for the complete
prepared lifetime, and arbitrate ownership between PWM requests and clock
prepare so both interfaces cannot drive the same output.

drivers/clk/clk-pwm.c advertises a fixed frequency without reading back the
rounded PWM rate. A 42 ns, 21 ns request does select 24 MHz bypass when it
is available. However, with the pair constrained to 100 MHz by its sibling,
the PWM rounding rules select a 40 ns, 20 ns waveform (25 MHz), while a
pwm-clock configured for 24 MHz still reports 24 MHz. The direct provider
instead reports the actual pair rate and makes its shared-rate protection
visible to CCF. Consumers must still check the rate they receive.

Use CLK_IGNORE_UNUSED to preserve unclaimed firmware bypass outputs, just
as the PWM path preserves inherited waveforms. Normal consumer disable
still turns the output off and releases its shared gate reference.

Readback also runs on unrequested channels exposed through PWM debugfs.
An exported-clock consumer can retune and enable a disabled output between
the rate query and register snapshot. Retry when the pair's notification
generation changes so the returned waveform uses a consistent rate and
register state. The CCF rate read waits for changes already in progress;
the locked generation check detects changes that start afterward.

A temporary exclusive rate hold would instead clamp concurrent clock
requests to the old rate, potentially returning success at the wrong
frequency. Keep readback non-intrusive and leave sleeping CCF calls outside
the register spinlock. PRE notifications invalidate snapshots even if a
provider failure does not produce POST_RATE_CHANGE.

Rate exclusivity protects frequency, whereas prepare/request arbitration
owns an output. An unprepared clock's rate hold therefore constrains PWM
rounding without reserving the channel. A consumer taking over an inherited
output can prepare and enable it at its current rate, then disable and
unprepare it before selecting a different rate.

Link: https://lore.kernel.org/all/sashiko-outbox-194955@kernel.org/
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/pwm/Kconfig     |   3 +-
 drivers/pwm/pwm-sun8i.c | 206 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 202 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index c7c964406da4..48dfb8a8d1e9 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -744,7 +744,8 @@ config PWM_SUN8I
 	depends on HAS_IOMEM && COMMON_CLK
 	help
 	  PWM framework driver for Allwinner controllers whose channels share
-	  paired source clocks.
+	  paired source clocks. In addition to PWM operation, each channel's
+	  hardware bypass path can be exported as a clock output.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sun8i.
diff --git a/drivers/pwm/pwm-sun8i.c b/drivers/pwm/pwm-sun8i.c
index 08d92d0da291..fa81330162bc 100644
--- a/drivers/pwm/pwm-sun8i.c
+++ b/drivers/pwm/pwm-sun8i.c
@@ -114,6 +114,9 @@
  * The bypass in PWM mode is used to achieve a 1/2 relative duty cycle with the
  * fastest clock.
  *
+ * SUN8I_PWM_clock_x/y serve for the PWM purpose.
+ * SUN8I_PWM_bypass_clock_x/y serve for the clock-provider purpose.
+ *
  */
 
 /* /div_m is a power-of-two divider limited to /256. */
@@ -130,6 +133,12 @@ static const struct clk_div_table sun8i_pwm_div_m_table[] = {
 	{ /* sentinel */ }
 };
 
+enum sun8i_pwm_mode {
+	SUN8I_PWM_MODE_NONE,
+	SUN8I_PWM_MODE_PWM,
+	SUN8I_PWM_MODE_CLK,
+};
+
 struct sun8i_pwm_chip;
 
 struct sun8i_pwm_pair {
@@ -144,8 +153,12 @@ struct sun8i_pwm_pair {
 };
 
 struct sun8i_pwm_channel {
+	struct clk_hw bypass_hw;
+	struct sun8i_pwm_chip *chip;
+	unsigned int index;
 	/* Separate CCF consumer, held only from PWM request to free. */
 	struct clk *pair_clk;
+	enum sun8i_pwm_mode mode;
 	u64 pending_period_ns;
 	bool rate_exclusive;
 };
@@ -155,7 +168,7 @@ struct sun8i_pwm_chip {
 	struct sun8i_pwm_channel channels[SUN8I_PWM_NPWM];
 	struct clk *bus_clk;
 	void __iomem *base;
-	/* Protects shared registers and rate_exclusive. */
+	/* Protects shared registers, channel ownership and rate_exclusive. */
 	spinlock_t lock;
 };
 
@@ -329,6 +342,101 @@ static int sun8i_pwm_pair_rate_notifier(struct notifier_block *nb,
 	return active ? NOTIFY_BAD : NOTIFY_OK;
 }
 
+static inline struct sun8i_pwm_channel *
+sun8i_pwm_channel_from_hw(struct clk_hw *hw)
+{
+	return container_of(hw, struct sun8i_pwm_channel, bypass_hw);
+}
+
+static int sun8i_pwm_bypass_prepare(struct clk_hw *hw)
+{
+	struct sun8i_pwm_channel *chan = sun8i_pwm_channel_from_hw(hw);
+	struct sun8i_pwm_chip *sun8i_chip = chan->chip;
+
+	guard(spinlock_irqsave)(&sun8i_chip->lock);
+	if (chan->mode != SUN8I_PWM_MODE_NONE)
+		return -EBUSY;
+
+	chan->mode = SUN8I_PWM_MODE_CLK;
+	return 0;
+}
+
+static void sun8i_pwm_bypass_unprepare(struct clk_hw *hw)
+{
+	struct sun8i_pwm_channel *chan = sun8i_pwm_channel_from_hw(hw);
+	struct sun8i_pwm_chip *sun8i_chip = chan->chip;
+
+	guard(spinlock_irqsave)(&sun8i_chip->lock);
+	if (chan->mode != SUN8I_PWM_MODE_CLK)
+		return;
+
+	chan->mode = SUN8I_PWM_MODE_NONE;
+}
+
+static int sun8i_pwm_bypass_enable(struct clk_hw *hw)
+{
+	struct sun8i_pwm_channel *chan = sun8i_pwm_channel_from_hw(hw);
+	struct sun8i_pwm_chip *sun8i_chip = chan->chip;
+	unsigned int pair = SUN8I_PWM_PAIR_IDX(chan->index);
+	u32 pccr, per;
+
+	guard(spinlock_irqsave)(&sun8i_chip->lock);
+	if (chan->mode != SUN8I_PWM_MODE_CLK)
+		return -EBUSY;
+
+	pccr = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PCCR(pair));
+	per = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PER);
+	if (!(pccr & BIT(SUN8I_PWM_PCCR_BYPASS_BIT(chan->index))) ||
+	    !(per & SUN8I_PWM_ENABLE(chan->index))) {
+		sun8i_pwm_set_enabled_locked(sun8i_chip, chan->index, false);
+		sun8i_pwm_set_bypass_locked(sun8i_chip, chan->index, true);
+		sun8i_pwm_set_enabled_locked(sun8i_chip, chan->index, true);
+	}
+
+	return 0;
+}
+
+static void sun8i_pwm_bypass_disable(struct clk_hw *hw)
+{
+	struct sun8i_pwm_channel *chan = sun8i_pwm_channel_from_hw(hw);
+	struct sun8i_pwm_chip *sun8i_chip = chan->chip;
+
+	guard(spinlock_irqsave)(&sun8i_chip->lock);
+	if (chan->mode != SUN8I_PWM_MODE_CLK)
+		return;
+
+	sun8i_pwm_set_enabled_locked(sun8i_chip, chan->index, false);
+	sun8i_pwm_set_bypass_locked(sun8i_chip, chan->index, false);
+}
+
+static int sun8i_pwm_bypass_is_enabled(struct clk_hw *hw)
+{
+	struct sun8i_pwm_channel *chan = sun8i_pwm_channel_from_hw(hw);
+	struct sun8i_pwm_chip *sun8i_chip = chan->chip;
+	unsigned int pair = SUN8I_PWM_PAIR_IDX(chan->index);
+	bool enabled;
+	u32 val;
+
+	guard(spinlock_irqsave)(&sun8i_chip->lock);
+
+	val = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PCCR(pair));
+	enabled = (val & SUN8I_PWM_PCCR_GATE) &&
+		  (val & BIT(SUN8I_PWM_PCCR_BYPASS_BIT(chan->index)));
+
+	val = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PER);
+	enabled = enabled && (val & SUN8I_PWM_ENABLE(chan->index));
+
+	return enabled;
+}
+
+static const struct clk_ops sun8i_pwm_bypass_ops = {
+	.prepare = sun8i_pwm_bypass_prepare,
+	.unprepare = sun8i_pwm_bypass_unprepare,
+	.enable = sun8i_pwm_bypass_enable,
+	.disable = sun8i_pwm_bypass_disable,
+	.is_enabled = sun8i_pwm_bypass_is_enabled,
+};
+
 static void sun8i_pwm_put_rate(struct sun8i_pwm_chip *sun8i_chip,
 			       unsigned int idx)
 {
@@ -355,8 +463,12 @@ static int sun8i_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 	int ret;
 
 	scoped_guard(spinlock_irqsave, &sun8i_chip->lock) {
+		if (chan->mode != SUN8I_PWM_MODE_NONE)
+			return -EBUSY;
+
 		was_enabled =
 			sun8i_pwm_channel_is_enabled_locked(sun8i_chip, idx);
+		chan->mode = SUN8I_PWM_MODE_PWM;
 	}
 
 	chan->pair_clk = clk_hw_get_clk(parent, NULL);
@@ -385,6 +497,8 @@ static int sun8i_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 	clk_put(chan->pair_clk);
 err_clear_clock:
 	chan->pair_clk = NULL;
+	scoped_guard(spinlock_irqsave, &sun8i_chip->lock)
+		chan->mode = SUN8I_PWM_MODE_NONE;
 
 	return ret;
 }
@@ -395,6 +509,9 @@ static void sun8i_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	struct sun8i_pwm_channel *chan = &sun8i_chip->channels[pwm->hwpwm];
 
 	scoped_guard(spinlock_irqsave, &sun8i_chip->lock) {
+		if (chan->mode != SUN8I_PWM_MODE_PWM)
+			return;
+
 		sun8i_pwm_set_enabled_locked(sun8i_chip, pwm->hwpwm, false);
 		sun8i_pwm_set_bypass_locked(sun8i_chip, pwm->hwpwm, false);
 	}
@@ -403,6 +520,9 @@ static void sun8i_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	clk_disable_unprepare(chan->pair_clk);
 	clk_put(chan->pair_clk);
 	chan->pair_clk = NULL;
+
+	scoped_guard(spinlock_irqsave, &sun8i_chip->lock)
+		chan->mode = SUN8I_PWM_MODE_NONE;
 }
 
 static int sun8i_pwm_read_waveform(struct pwm_chip *chip,
@@ -412,21 +532,39 @@ static int sun8i_pwm_read_waveform(struct pwm_chip *chip,
 	struct sun8i_pwm_waveform *wfhw = _wfhw;
 	struct sun8i_pwm_chip *sun8i_chip = sun8i_pwm_from_chip(chip);
 	unsigned int pair = SUN8I_PWM_PAIR_IDX(pwm->hwpwm);
+	struct clk *pair_clk = sun8i_chip->pairs[pair].hw->clk;
 	unsigned long pair_rate;
 	u32 pccr, pcr, pdzcr, per, ppr;
 
-	pair_rate = sun8i_pwm_get_pair_rate(sun8i_chip, pwm->hwpwm);
-	if (pair_rate > U32_MAX)
-		return -ERANGE;
+	/*
+	 * An unrequested channel can be retuned and enabled by a clock
+	 * consumer. Retry if its rate changed between the CCF read and the
+	 * register snapshot. A temporary exclusive hold would instead clamp
+	 * concurrent bypass-clock rate requests to the old pair rate.
+	 */
+	for (;;) {
+		unsigned int generation;
+
+		cond_resched();
+		generation = sun8i_pwm_get_rate_generation(sun8i_chip, pwm->hwpwm);
+		/* This waits for any rate change already in progress to finish. */
+		pair_rate = clk_get_rate(pair_clk);
+
+		guard(spinlock_irqsave)(&sun8i_chip->lock);
+		if (generation != sun8i_chip->pairs[pair].rate_generation)
+			continue;
 
-	scoped_guard(spinlock_irqsave, &sun8i_chip->lock) {
 		pccr = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PCCR(pair));
 		per = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PER);
 		pcr = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PCR(pwm->hwpwm));
 		ppr = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PPR(pwm->hwpwm));
 		pdzcr = sun8i_pwm_readl(sun8i_chip, SUN8I_PWM_PDZCR(pair));
+		break;
 	}
 
+	if (pair_rate > U32_MAX)
+		return -ERANGE;
+
 	*wfhw = (struct sun8i_pwm_waveform) {
 		.enabled = !!(pccr & SUN8I_PWM_PCCR_GATE) &&
 			   !!(per & SUN8I_PWM_ENABLE(pwm->hwpwm)),
@@ -523,7 +661,8 @@ sun8i_pwm_pair_rate_constrained(struct sun8i_pwm_chip *sun8i_chip,
 	unsigned int sibling = idx ^ 1;
 
 	guard(spinlock_irqsave)(&sun8i_chip->lock);
-	return sun8i_chip->channels[sibling].rate_exclusive ||
+	return sun8i_chip->channels[sibling].mode == SUN8I_PWM_MODE_CLK ||
+	       sun8i_chip->channels[sibling].rate_exclusive ||
 	       sun8i_pwm_channel_is_enabled_locked(sun8i_chip, sibling);
 }
 
@@ -1075,6 +1214,42 @@ static int sun8i_pwm_register_pair_clocks(struct device *dev,
 	return 0;
 }
 
+/* Register the bypass clock for each channel. */
+static int sun8i_pwm_register_bypass_clocks(struct device *dev,
+					    struct sun8i_pwm_chip *sun8i_chip)
+{
+	for (unsigned int i = 0; i < SUN8I_PWM_NPWM; i++) {
+		struct sun8i_pwm_channel *chan = &sun8i_chip->channels[i];
+		struct clk_hw *parent = sun8i_chip->pairs[SUN8I_PWM_PAIR_IDX(i)].hw;
+		const char *name;
+		int ret;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s#pwm-bypass%u",
+				      dev_name(dev), i);
+		if (!name)
+			return -ENOMEM;
+
+		chan->chip = sun8i_chip;
+		chan->index = i;
+		/*
+		 * Protect the shared rate while prepared. Preserve unclaimed
+		 * firmware outputs through CCF's unused-clock cleanup, as for
+		 * PWM waveforms; only a consumer may turn them off.
+		 */
+		chan->bypass_hw.init =
+			CLK_HW_INIT_HW(name, parent, &sun8i_pwm_bypass_ops,
+				       CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE |
+				       CLK_IGNORE_UNUSED);
+
+		ret = devm_clk_hw_register(dev, &chan->bypass_hw);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register bypass clock %u\n", i);
+	}
+
+	return 0;
+}
+
 /*
  * A disabled pair gate makes any set PER bits ineffective. Clear those stale
  * enables before a clock consumer can turn the shared gate on and expose an
@@ -1103,6 +1278,17 @@ sun8i_pwm_sanitize_disabled_pairs(struct sun8i_pwm_chip *sun8i_chip)
 	sun8i_pwm_writel(sun8i_chip, per, SUN8I_PWM_PER);
 }
 
+static struct clk_hw *sun8i_pwm_get_clk_hw(struct of_phandle_args *clkspec,
+					   void *data)
+{
+	struct sun8i_pwm_chip *sun8i_chip = data;
+
+	if (clkspec->args_count != 1 || clkspec->args[0] >= SUN8I_PWM_NPWM)
+		return ERR_PTR(-EINVAL);
+
+	return &sun8i_chip->channels[clkspec->args[0]].bypass_hw;
+}
+
 static int sun8i_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1141,6 +1327,14 @@ static int sun8i_pwm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = sun8i_pwm_register_bypass_clocks(dev, sun8i_chip);
+	if (ret)
+		return ret;
+
+	ret = devm_of_clk_add_hw_provider(dev, sun8i_pwm_get_clk_hw, sun8i_chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add HW clock provider\n");
+
 	ret = devm_pwmchip_add(dev, chip);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");

-- 
2.53.0


