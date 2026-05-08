Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CECCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSbOgioLncIMNsfFzQftgUGUWl8Whoz+0xOjIU7gJ8s=; b=SRH8X190jl785rWRyqb1fbWzxU
	slNectq67Es8y2mM5dpDNqV95kCc7RGWnqvaB/aXQXn1LXxhQCf28UQhsYxaLNENlTPszfFvNfoMA
	MNZmouyZ03ko2XVTtXa1ViYQ70HL53+vXQaClMhoa3WxHczQoXScAN7PjVCi/zhwM4ph/5VoRhK2o
	zDcx+HkJSQNZDWif2DmGzG4t6d/UxzaPL+PIIEFtQLEHCwl1j/mpQlNKMDhmWU17aV8Jz772W7xM9
	oGOVgNAYR3oCofGbFsf7Uk2T73+CdELq2z5Nk6mU46ZtiD/rj0PR7zcYxhJfo0Yf9CF+v9rVtpSIE
	bEDenJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFmB-00000005s5D-0W0T;
	Fri, 08 May 2026 07:37:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFm3-00000005ry2-1pap;
	Fri, 08 May 2026 07:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=DSbOgioLncIMNsfFzQftgUGUWl8Whoz+0xOjIU7gJ8s=; b=U6KN0J0HzTHuGrszJupTRK29LK
	i1Jxawe3bExCFk/6JVpOPT/pqOLFob1ogmJozVil7+okPlbPkfBX82STAqMaKYXSeCodSEAAab0LR
	17kC5eLSVdHeNzrtFiVVwEPNeEctaVjORiDh5Ulhs73chCt9TTVtop7qLAX0Sx6sO42CEbx58CKFq
	2xvS4tBXbPB9HV4TFEJA8vx7JSe9/VsQwL7aVzHX3pch33ccMgadKNVrKYnrtdqTpkSAABvnYpVz1
	g/5/MfyXC1utEF+EMOIg0S8ex5+Ws7snqaRq9aHvvyaTeiWXBVDrqZA7A0cOZz79Yys8Mq1n2AgNk
	SrntM7Bw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlg-00000005bKB-07a8;
	Fri, 08 May 2026 07:37:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F09744458;
	Fri,  8 May 2026 07:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3513C2BCF4;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778225817;
	bh=6orjSlY4lQ5CFkC+hhWVFf1lnIC3pYaTmYzO8tYxwmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VulP8Exm/qXA4VrKShU5O687SxxYmxF41/41De5w10oEgby2sQ3x1nrVkCQV7jWWo
	 d8HAlsTnpZLjmb3oeXSwL0JuA7Ym/O9f0rpTzIAzbzfLgo0C+LDDcyg9uXphRdGjd0
	 vvPlAsQb7I0++yieL7afAS0WRz/igNcSnlP83NBxG357u3XfqqwbmhNLeIwlbjHkEA
	 PHb7+2DDLp28QV+NpgQjJxodT1q2m5EmuW9ZL1I9gDasIbxhNwz8evkERSr9jehYzD
	 RhIKbVxlmTzRCOhRFgCLVQxdONf5JPRlu0JWYCY0GwzxUa19uFyJUdxF7ltcFp5gUf
	 R2L0ujltuqcrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DC5CD342F;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 May 2026 07:36:56 +0000
Subject: [PATCH 3/3] irqchip/meson-gpio: Add support for Amlogic A9 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-a9-gpio-irqchip-v1-3-9dc5f3e022e0@amlogic.com>
References: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
In-Reply-To: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778225816; l=5139;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=nAfHIz6N7m4oMjB9PiZJjp678ZGWzDBR5xK3MB5dJRI=;
 b=LQqjSXVX5QTASAePP+dTc5VePmsxGw865S8yEFVsPZYttboDVp/QTlPgVoCGnoRWa2qnYkkxQ
 DSMvkv5e2qJAdEt0U+nTcK7fleZv3bDwgY8ic4O05kPcarkQYcRghC/
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083705_609858_831B9756 
X-CRM114-Status: GOOD (  15.41  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

The Amlogic A9 SoCs support GPIO interrupt lines:
	A9 IRQ Number:
        - 95:86   10 pins on bank Y
        - 85:84    2 pins on bank CC
        - 83:64   20 pins on bank A
        - 63:48   16 pins on bank Z
        - 47:30   18 pins on bank X
        - 29:22    8 pins on bank H
        - 21:14    8 pins on bank M
        - 13:0    14 pins on bank B

	A9 AO IRQ Number:
        - 38       1 pins on bank TESTN
        - 37:31    7 pins on bank C
        - 30:13   18 pins on bank D
        - 12:0    13 pins on bank AO

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 75 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 74a376ef452e..f68476b2c538 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -27,6 +27,10 @@
 /* use for A1 like chips */
 #define REG_PIN_A1_SEL	0x04
 
+/* use for A9 like chips */
+#define REG_A9_AO_POL	0x00
+#define REG_A9_AO_EDGE	0x30
+
 /*
  * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
  * bits 24 to 31. Tests on the actual HW show that these bits are
@@ -53,6 +57,8 @@ static void meson_a1_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
 static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl);
 static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 				    unsigned int type, u32 *channel_hwirq);
+static int meson_a9_ao_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
+					 unsigned int type, u32 *channel_hwirq);
 static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 				      unsigned int type, u32 *channel_hwirq);
 
@@ -116,6 +122,18 @@ struct meson_gpio_irq_params {
 	.pin_sel_mask = 0xff,					\
 	.nr_channels = 2,					\
 
+#define INIT_MESON_A9_AO_COMMON_DATA(irqs)			\
+	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
+			  meson_a1_gpio_irq_sel_pin,		\
+			  meson_a9_ao_gpio_irq_set_type)	\
+	.support_edge_both = true,				\
+	.edge_both_offset = 0,					\
+	.edge_single_offset = 0,				\
+	.edge_pol_reg = 0x2c,					\
+	.pol_low_offset = 0,					\
+	.pin_sel_mask = 0xff,					\
+	.nr_channels = 20,					\
+
 #define INIT_MESON_S4_COMMON_DATA(irqs)				\
 	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
 			  meson_a1_gpio_irq_sel_pin,		\
@@ -170,6 +188,14 @@ static const struct meson_gpio_irq_params a5_params = {
 	INIT_MESON_S4_COMMON_DATA(99)
 };
 
+static const struct meson_gpio_irq_params a9_params = {
+	INIT_MESON_S4_COMMON_DATA(96)
+};
+
+static const struct meson_gpio_irq_params a9_ao_params = {
+	INIT_MESON_A9_AO_COMMON_DATA(39)
+};
+
 static const struct meson_gpio_irq_params s4_params = {
 	INIT_MESON_S4_COMMON_DATA(82)
 };
@@ -203,6 +229,8 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
 	{ .compatible = "amlogic,a4-gpio-ao-intc", .data = &a4_ao_params },
 	{ .compatible = "amlogic,a4-gpio-intc", .data = &a4_params },
 	{ .compatible = "amlogic,a5-gpio-intc", .data = &a5_params },
+	{ .compatible = "amlogic,a9-gpio-ao-intc", .data = &a9_ao_params },
+	{ .compatible = "amlogic,a9-gpio-intc", .data = &a9_params },
 	{ .compatible = "amlogic,s6-gpio-intc", .data = &s6_params },
 	{ .compatible = "amlogic,s7-gpio-intc", .data = &s7_params },
 	{ .compatible = "amlogic,s7d-gpio-intc", .data = &s7_params },
@@ -375,6 +403,53 @@ static int meson8_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 	return 0;
 }
 
+/*
+ * gpio irq relative registers for a9_ao
+ * -PADCTRL_GPIO_IRQ_CTRL0
+ * bit[31]:    enable/disable all the irq lines
+ * bit[0-19]:  polarity trigger
+ *
+ * -PADCTRL_GPIO_IRQ_CTRL[X]
+ * bit[0-5]: 6 bits to choose gpio source for irq line 2*[X] - 2
+ * bit[16-21]:6 bits to choose gpio source for irq line 2*[X] - 1
+ * where X = 1-10
+ *
+ * -PADCTRL_GPIO_IRQ_CTRL[11]
+ * bit[0-19]: both edge trigger
+ *
+ * -PADCTRL_GPIO_IRQ_CTRL[12]
+ * bit[0-19]: single edge trigger
+ */
+static int meson_a9_ao_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
+					 unsigned int type, u32 *channel_hwirq)
+{
+	const struct meson_gpio_irq_params *params = ctl->params;
+	unsigned int idx;
+	u32 val = 0;
+
+	idx = meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
+
+	type &= IRQ_TYPE_SENSE_MASK;
+
+	meson_gpio_irq_update_bits(ctl, params->edge_pol_reg, BIT(idx), 0);
+
+	if (type == IRQ_TYPE_EDGE_BOTH) {
+		val = BIT(ctl->params->edge_both_offset + idx);
+		meson_gpio_irq_update_bits(ctl, params->edge_pol_reg, val, val);
+		return 0;
+	}
+
+	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
+		val = BIT(idx);
+	meson_gpio_irq_update_bits(ctl, REG_A9_AO_POL, BIT(idx), val);
+
+	val = 0;
+	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+		val = BIT(idx);
+	meson_gpio_irq_update_bits(ctl, REG_A9_AO_EDGE, BIT(idx), val);
+
+	return 0;
+};
 /*
  * gpio irq relative registers for s4
  * -PADCTRL_GPIO_IRQ_CTRL0

-- 
2.52.0



