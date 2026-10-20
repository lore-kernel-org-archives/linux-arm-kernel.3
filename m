Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149F6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=igstU4+Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XSNHTeNB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qek6znER
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=; b=igstU4+QnCnSXQ0dUSAvtX4trt
	GnsqG8TdtvJYECL6R6gvYr5V+Yt/+nCBpZhfZ04fAdCnHypnkxAhmB749Sb6MM0+fgDHUWBdLihqS
	Y938z4kLSf6PO8F68vo6/QTo9Poi7Z6IpZBuZjSLnmq4sJ2MX006sV7DAZyrHU5JchZGUtT4wI+fS
	Nj23sDtmSRZ/9yk1lwclTs3W6BTdMF+B1Sw6uq9ia2iJ7te7GnMxGdShJeyrYI2ZRSsR1hXV/RGnF
	qsiNft14wU1e7uuwINqyPOMFW7NKQAq7In0gt+4NCfFVmWp0dbLo1MHFmwhXq3F9XEyCKu9aUMdo/
	i2T2oGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJARN-00000009s9n-193X;
	Tue, 20 Oct 2026 14:03:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJARL-00000009s80-2Kbs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Oct 2026 14:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=; b=XSNHTeNB4YBaLjiZZ9mukZ5SDn
	7uqLpEUOF/XUvuegJ++MhEsGZMUa/fl4Z0zw1OABA3YoYsiVjMC+/Q2CCPbyJcZrtteZUj896a6Ah
	0ssOs+ZOxjH+l2ZRR8GEuAJkLPaRMzmX4+ut8BP5a+/KODUKjJNhJIe9hlLuVASWJbJSW7wvNqUlM
	UW7LEGuUYGrXH1OjFSJEvQPu7gmnQf0LMmoStFE9SoaAr4pfOylGCM8H8yQf3nRm+3gHRY4mtOiGz
	J1SbIs/OujrbY3r8iBrs5ur7+OYvSbApokpjlorWhSugg0ejqjQwMi9Tk8Jf+/1tXa7YygKg76kN0
	5+YCl22A==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJARI-00000004nZF-1EkN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:03:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e7e742a2c7so4805595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505016; x=1793109816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=qek6znERP3vjuUM4VFI3UaNEJ1M6P/01b/4tGZ+31ihXlsEEhFEwErPBSo1ec2GBgJ
         FjsIfb2Rk8fqEBUMiM7X+7zj2y7Ytx1GmXK0pf31JmbovX2zQ/jgXuXSFyWrzGGminMr
         hwySSYsjUVryVQvOXq3/8XEZMQwqLeoMm7AWnDilONBo7rK7tGlnYpno73CESL55g4DN
         8HHBD99dCBhh2C/v8KvYXLRAGDYp0GzHI8a3o06XFcIxK/dgVDEKNa+6v98BnCQPm+Tr
         H/P7351KUGm8lGxQb228jfDirMvxsbaqmMaT6+XVMlQ+NcmW7IZrTSS0kmdSYldZ1qMH
         3AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505016; x=1793109816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=K7PL258EAMs1P1H6x+PfEOkAXVBNDFwvaqEBSae3axf5smS86StYpveBvKqT52noiI
         svT8oLp5Kqqh1ur2adDSLzgTjAUjfM4SNwcsKVoGw4qa1VG/9HDrvB4psaN6DKX6suR0
         7QHpYIzUwi6NzJaFzEMMW0vAmTtKnMhx2FYTOtVifI9w5ZcCgRfB7WQ+rYAeFKjlYF4t
         zb4J+3FlbzUv6SJalni/EWzhlIQFmVjR5fvo1/Z+3JLrQG3yyDfLbpQO40eGDw7duqjP
         wGnyGG1wMgE5pRiqK5D/tjw7jWFWm/KaTzwNxxJr8HMs2PW/aFwL8stcugxw7oAhIgsb
         c1XA==
X-Forwarded-Encrypted: i=1; AKwUvBzvWpbUOsoJiyS8tbgl3p+yZNgmMR+P8NGRV6cIQ/dGXp64CQpwOaL5//shDYuN2iNMqnXuAnScXbDRzOAK2xRk@lists.infradead.org
X-Gm-Message-State: AFq9FYJihMbQsEdNc5LIQpBo8pFAiPaeua4ZT2S33Awry/pVfx4A2zbf
	j0wca9GagxU32JxC0V5WY4FUufNG7bjyFnDma8znwc6bx7LD6ufa4TwT
X-Gm-Gg: AYBFou3pZY0uaErZaPC7LMkA1W+WvZM475FRN5VgnZcYFP1sNnhi21507BahCvejNMo
	Q08djZbZ4N1Pvz91KS5MGS5rdqfZPWf2v7cVh/st4eAN1Fut6N8beKIrTNgzaxKse8D/OX276WI
	gf8RW208WTJOEDpenpyt9BngsoGer5w1wMHl+aZwSMXPJH3lqrpvlc4fyR2uzRfEwZL7PPSKxWj
	oitsMraW85LeYkjZkU3pOzRogA5JoQAU2BJpgivsf5u+6TRiSFOy/LUMLSwSO3vf5Nczgmcxqxw
	cCJeN9mUpTd93wFw6f0+QR15WH1VJqKs1xj1eeJXiF//kjVwK1xjLXV6LaOTg63eDCv5zpNvYlH
	pQhRuZ/1cFCZBhbE9zFcAnKbZa7T8a3e9aEZVrh3TfN1oZZrXS3ac6GOBqjaOrTlNEBdQahs4Pi
	clds5Pnx4Xt3wCCiI7tYryOs16rW4ej9SGZFx87eHDxmKKI0ldrGfIDuRy5VBtUkHsVsCvtcUYx
	0H/2oFWByI=
X-Received: by 2002:a17:902:dacb:b0:2ea:1e40:624 with SMTP id d9443c01a7336-2ea1e400e03mr14007165ad.17.1792505015392;
        Tue, 20 Oct 2026 07:03:35 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:35 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Tue, 20 Oct 2026 22:01:13 +0800
Message-ID: <20261020140127.720-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_150340_531656_848A6ADC 
X-CRM114-Status: GOOD (  23.04  )
X-Spam-Score: -0.2 (/)
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

rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
lines driven by the SoC gate the PMIC's power-off path, a shutdown
performed this way does not stick: the rails drop and immediately come
back up, so the board restarts instead of staying off. U-Boot reports the
result as a power-on reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

The array is claimed before any child device is registered, so that a
-EPROBE_DEFER from the GPIO provider does not tear down the regulators,
RTC and clocks that devm_mfd_add_devices() has already registered.

On a Firefly-RK3399 the shutdown stuck when such a line went from high to
low before the shutdown bit was written, and did not when the line was
never driven.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 49 +++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/rk808.h |  3 +++
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..137ab20 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -11,6 +11,8 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/rk808.h>
 #include <linux/mfd/core.h>
@@ -703,6 +705,22 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written,
+	 * otherwise the rails can drop and come back up instead of staying
+	 * off. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		for (unsigned int line = 0; line < rk808->power_hold_gpios->ndescs; line++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[line], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -766,6 +784,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	struct rk808 *rk808;
 	const struct rk808_reg_data *pre_init_reg;
 	const struct mfd_cell *cells;
+	bool system_power_controller;
 	int dual_support = 0;
 	int nr_pre_init_regs;
 	u32 rst_fun = 0;
@@ -851,6 +870,33 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	system_power_controller =
+		device_property_read_bool(dev, "system-power-controller") ||
+		device_property_read_bool(dev, "rockchip,system-power-controller");
+
+	/*
+	 * Claim the optional power hold GPIOs before any child device is
+	 * registered. A -EPROBE_DEFER from the GPIO provider at this point
+	 * costs nothing, whereas deferring after devm_mfd_add_devices()
+	 * would tear the freshly registered children down again on every
+	 * retry.
+	 */
+	if (system_power_controller) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev, "power-hold",
+									GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "Failed to get power hold GPIOs\n");
+
+		/*
+		 * The settle time is optional. rk808 is zero initialised and
+		 * the binding documents 0 as the default, so an absent property
+		 * means the shutdown request follows the release with no wait.
+		 */
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+	}
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -872,8 +918,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
 
-	if (device_property_read_bool(dev, "system-power-controller") ||
-	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+	if (system_power_controller) {
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..e56d595 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -15,6 +15,7 @@
 #ifndef __LINUX_REGULATOR_RK808_H
 #define __LINUX_REGULATOR_RK808_H
 
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
 
@@ -1466,6 +1467,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3


