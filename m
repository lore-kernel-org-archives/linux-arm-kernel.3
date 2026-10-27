Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D10606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IES1PliL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eu7V8ags
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=; b=IES1PliLGCYAE6
	+7i78zhMS7jz36T2n7XUoBjQbmyMZxtQVaTkGFpvTRoZsdScojE1ONgT4roRdti5yi8mlWEwV7IYs
	ncSPecz4fJvbQxAfvM+Jt1Re4q24OERuiA3bn0P+M297yIJAOCTFkEgJZDkSlAx3lZOwjTELUurfn
	6Byq2uhenDMGIgWwEaZn5JpixWjuv5Yw7x9kBLKfrlvfn47o+wwtosl9luFKKJu7FBswFOH3R3Ky2
	NuuKkxU3R7JVi9UEFLs0Ngh7+W4WbKKiE99RyMcERxrbCV6FetUCRZ9CXpJHdy1okm7l1wjIyWkUa
	BPOWX4oqIEP3cOZBRHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcof-0000000456e-2omJ;
	Tue, 27 Oct 2026 08:45:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcoZ-000000044zO-20Yi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:45:53 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-89ff475a152so1548810b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090750; x=1793695550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=eu7V8ags8tLRlv8uDgb+ujcN+DrTmwRqWXFkPrcPQPXyj34qfR1wCFu0IQzoS0U9xO
         cDZAv6/AObBLt87qsrS+R9My482KrSdqzeN9265PF5mhOBNPqpK/WO0cX8vw1kSpPjpm
         bVN8KT3dANOWSEBuBgxpQupO63s2HJTh/8/PTrYoa0QcYT/dbftr3jRhJGvgQSEf5WCe
         9Txv+VMAuLbwnEpLRm+bB5g/CsmUqicBrbuVHaom3eZl2Hv+ufMpXIz5VWRSxcm5E49/
         XSuyBBwvaminUPCCfLRIXkj/sl+n8l3ugbhTGV5Dx3BFtq+cxACmj9Ze0zHHcJmz8FNw
         +07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090750; x=1793695550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=WfbrKmir9TNYfmrY1LkjfqUGZyLRFOUlAY/IS2L/U9qQXClzgHFdQblAGGRVQ/pjkv
         aqLSgJa7PICOX+fgWdZAMoULiKVRO7vejV359JqVXp3WZASBopwbzJtaeRj+/temsJH2
         Aywd4+VBhcx2/kXqhh//LmTvAaYDwBUEYZxHdMN/rb1rzGu6tjTRTGZh/E8PfQ0COc7r
         00M5Gy65FvNB9H+IGugUJMIg84S0sPACuxs+4xLOARfjwij4AWVngjGzMqaxs24IpbLc
         M7B7foeuYDB7VkydOrO8L0BZq48Punup8No52jZlzbgYRr6RklLjk48c3LJMZcftqe9J
         zw8w==
X-Forwarded-Encrypted: i=1; AKwUvBzPI978Nz+Qv9s4X4u3Ot/GeLdqCJXYu+inpkKNCNeY5hj2Ad40KrBFiOfMZlLb6zHFWqdtapxlVUlmIk00ZhNV@lists.infradead.org
X-Gm-Message-State: AFq9FYJzhIjjrudPxR/2nD+45rc0rGOsj7j4SxW6KsYji3+cKirnbdJQ
	FbJrfqyE2Uh7+zDjlWVdoqA60/wzrEMgtVpRva9FMG7DJ0OUXQrMNhWz
X-Gm-Gg: AYBFou1H4EerSsMgWXywKR6DBZXAiK5APkgxGTXS2qDaRfSjmhUaacTX7z6aBIVKryy
	nPZmOMIXVMZsodKQmEf6MUz1Ynvo+nn8vc8amDu1ka8JcPTV+eF1OenEOjj4i9yZkaj1rgXmLjD
	uMQlVIK94187xoMCL8/A5zablzc9KHJLvBhNzeS+sKqtvz6Ewq2qS+sW5z/UDiEBHyz80rfs21+
	EMx34yGCmXEoo97VR+l/qnsduEpyy6mui0XlGxbWLb7mP5RfKxeOh1MHBNMkSoBBj9lHAkx8sXO
	vFRDkxB6EhnRUv8WtirI6ZxkFc+CfWguDxVqzZDcCxhqNeIlF9dWcYJyOAzB1M2nekBC4kJeToZ
	C7gwEf1a1Z1CsdlQ8mSJgAwpV2rbsqEptH6LDqbCJgXOSuVY9Y5HqZGflVnpv8iQ5LmokrREIeD
	mEmQzpVJB9/PiOehhzs2NQy/MM1YxoXIAXXayCpvjbJJvVD9jBTVXfiWu5LdgsmvC0FR7DTE9z+
	rYuvHpOKZ0o0pdAOdpKfF2tC4vKE7PUxD6TFHLeokw67wCsZtyZHkdVAkwC141Tkkjd
X-Received: by 2002:a05:6a20:ef03:b0:3e2:11bc:6abe with SMTP id adf61e73a8af0-3e7bfa20295mr5839714637.32.1793090750034;
        Tue, 27 Oct 2026 01:45:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:49 -0700 (PDT)
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
Subject: [PATCH v5 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Tue, 27 Oct 2026 16:45:08 +0800
Message-ID: <20261027084511.1992-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014551_567966_6E0ED8A6 
X-CRM114-Status: GOOD (  21.41  )
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


