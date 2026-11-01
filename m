Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0892A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XFVxCddB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOw3K6TN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=; b=XFVxCddBNWmZ8c
	jumkEklPHnSXduaA3bcuwK4y3ehcudygUPBaWlLiOeRhoxP3X9vp8f3FRz/dNKD/6NDMRcPfZcdPF
	u+jWPGvqL++0PW9xIDv6ID8gZrwXK6eXyRrCYaVCobDp5kfsWaxIzF3xPqEnTjg3xjv7jB+w1J78C
	TLJ37pVuLZapsvxnWKV15eOj6tmtdZLdwsrZWWX3vNP34oETxf1djvmPS+vnwWvsNq0OeLcqnMXp/
	98BTv8WHyNXIQEFKKlU2VR/bulitt0whvNyJerhwdN7q0GcokUw20/PDOyhtzHaXk9Z7Sluox/A7m
	HETYQ2J319N/aW848szw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXgQ-0000000EcyH-4Avp;
	Sun, 01 Nov 2026 15:41:24 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXgO-0000000Ecve-0jUV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 15:41:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1283366a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547679; x=1794152479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=hOw3K6TN0HAsjcweAeQkwLy4NWDTJBeky0FwtZ77iYoHDE5uinQLoxVmhrXCK29C7N
         046TMoceMWE9pxhZRdooTCvNHtDpRkuSno+QuChYy8X1wrZNGNFNXZ9XAom+ARu2b8vU
         wXCOz+a6diEV4REnWy8VxXTKGfGKoExNjmvVYua+jlqXI1gPckH87T1LeXbOm6IJumUe
         /HgDMXSBEH+ir34JyrfL5QrguXu8Wj+EAXm30K3LA6A0El2REGTxxyEJewtXOD8w+YV+
         GRRLUblO5pyXieA1e1FwDfQPZh1sHtbxj7IEbXh50V4FKgg+B9FWJTu1HKQMnF2ZuDmw
         CVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547679; x=1794152479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=PLoTk+137EZGDq3HV1fHTvJI3ApeD+QZinni2UKWxdkTQ9SBb2pgdJyW175SugGu4b
         ILoESjgbDlFB27LmmzWKrtNC0CDO15+w98G9l8dcmqzKlQOVmajfQ13J3EvQjBT3jY9T
         rYI/W4KpJhvqDlZf3USXmqNG8BoOE/WTJcA95cpGQChZ2Pn74bIZLBOlikmOkYQvu3L6
         Hrc2BuXV7lHmvXvFd5GyBR50hE5iE6y6xDT+9n/ulH7jjxHXAWxzRbqTBmemspcl7Ffw
         zyZEj8qZxSXCF7r8xE0XgD6gY1hGFjVgz1SGkFZhSsC+ygvupdjwP7NxD/H2FEw2HYJI
         +rNw==
X-Forwarded-Encrypted: i=1; AKwUvBxUw/b07RHegdbgZHGQc4aRmqyg6DjS4VUm0SSwMAnULrqvg1kGFTSVTtlwd0xN1u7XyYXEjICXB+1Z3FXp3+eb@lists.infradead.org
X-Gm-Message-State: APuU4Z8aYhbiWLrIZ1Q/5NRNmdWHyUWwHmACaRbykIkkabVaL9tKSJGj
	oaD6+UZIUne6FAoIVtlDgRzibxCVcIPd2ITYcON0uIXsTtyXaYp8dVvY
X-Gm-Gg: AYBFou06s3X2NmnUG0WoZLJZZjjB8DFI1hOGqKm21Zl6Bedi/f1Bv2LqrSdBleX/Pei
	0fZBxaldaCjxi9m55Giv3fcEtktAldLj2a+cMX2A15wisTZaMIoPFBMNtJy6D+GqCyuKRKDhf6E
	OoRWTT5oJZ9cvPKOq1UDVeNL5HDEc0Ga4/l0fjQPowR18g7y8uGSX4x/Ns3AERIdhkEWffH74RK
	R79+GjMCZssDtB2moYXRASLiQcCis6RwvRGnHnmz/xydqFscXcZYF6fXOKMsM4XchZLTaaBzB0m
	s3KUz3aGg9OodgjRds25ycxZG3tf3bMAR0os9W45zd7Y28ezOl8NRmF9+ljXPaiL8WMuYyeDkzd
	9HwyCE7t1R+2NPKG/OLt7vbF0njNk5OyEaBh1OmPSf6RZFgkysw710/UpAqlOaEj7EEzNPoUOk1
	ET9U/Ls61l3XyoBQ/q+ayXfCyzoiYvplcNqATCIktYTGtZaUFF7r6JWv9z5vUTRxNEIt9Z/qaRz
	suNSBvkCuWi8qxSisSFCPntN1fG/uTgi0nAG6CQSXJRhgIFpwz4pHXcsOdHg6nLdyFnf/BJrR89
	LPSbbUWJAJD5puLBOfD7pe1TSYb9VR6E5ReNV109uA==
X-Received: by 2002:a17:90b:4c08:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3ae8957d253mr6930512a91.5.1793547679213;
        Sun, 01 Nov 2026 07:41:19 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:18 -0800 (PST)
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
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Sun,  1 Nov 2026 23:40:51 +0800
Message-ID: <20261101154053.3874-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_074120_220002_F593EB7E 
X-CRM114-Status: GOOD (  22.29  )
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


