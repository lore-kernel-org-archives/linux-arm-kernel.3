Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA72ACFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNq86a85UqrsUtxqs6944opl/EC67vOXgLpRr3Z76qA=; b=1nqbrHtU+NJW2k5icCWFQQ5e6l
	AxFoVfyybppRPHfpZYQ7gsOdIEKReaynQQ95rsez3F9IKs73WBQef6y0VY2VkRh8a/nKdPMZTOiz9
	JuY4SACiYAxUsxyvTNYQvl0e88/A1ZrzN5QAX1xSrMTy3rllqZeRpZUF6K9wEnFBHMAIrtevLNAGm
	UQDJM0jmm3mxIwnoR33Ccfakf6U7NoOzx0WiJ4pvZPKg1t+ziUzQgg6WFm8kcgdgQHmKfLfQLe5wY
	Bc2ywHDQSg8w2lB1ZYyJjMTk49onHs+o40IBi5Ruewn814ITPkCGIKNLqu3BnVQ7hf7Q29ZiIMOzo
	rf6fgp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSw-0000000G7gL-09qH;
	Thu, 27 Nov 2025 07:30:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSj-0000000G7Za-0nDB;
	Thu, 27 Nov 2025 07:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35929441D3;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 117DAC4AF0D;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228644;
	bh=rnTZ3qIjWcMsJ3cYnRysq+ukPVb+rEOjEzbD5jYVBCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s2oreS8SXOcrT3/AIqdkADfy/HyiLQ4xsn4WA3M88N7cyrnU2ozKs951Zp+cky/dC
	 9s6+y9SndV8EDvHzXiWf8ehnQzMsy68YENuey9GyHWmHEzLucEY+UBUDBsHnGls0YW
	 aAawSX5HONEkTi932DXc97dPxhz8xD8QpvpoEtB4eJ3agZxQw1dMURS3rE30L4sbBQ
	 mBmNvy3TWmX5zmt/WwbNj1vgwYSJk2u60wneerAKXE5Z8aHwn1UQHSUhVbuDsZSASh
	 0pVEmUCDKuZdQNxFk38uWEqXKkGXtTbd7DYM+wxPPL0W1dYA81fO2qce4VM06/OHJq
	 iFHQfu2fyMJzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019C8D116F5;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Nov 2025 15:30:33 +0800
Subject: [PATCH 3/4] arm64: dts: amlogic: Add S7 Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-reset-s6-s7-s7d-v1-3-879099ad90d3@amlogic.com>
References: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com>
In-Reply-To: <20251127-reset-s6-s7-s7d-v1-0-879099ad90d3@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764228641; l=4612;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=TRAbnAsG5qp7o1oyDaLD3O0/zrNkGqT68+e2GGMTN/I=;
 b=oM8lBnMRBFLykaU8vgPCBg9LAlANyvWqIdqwI340EgFW/6f5UaA1ewHsxgF9JrO+tPgI9LHhb
 UnEa60O3vD6BSZ17YapfTAGXe1eOJFfltDZOj3aLV3BPlwPL6gulcf5
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_233045_288048_06917F97 
X-CRM114-Status: GOOD (  12.34  )
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

Add the device node and related header file for Amlogic
S7 reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h | 124 +++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi    |   8 ++
 2 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h
new file mode 100644
index 000000000000..485c28221359
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7-reset.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2025 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_S7_RESET_H
+#define _DT_BINDINGS_AMLOGIC_S7_RESET_H
+
+/* RESET0 */
+#define RESET_USB_DDR0			0
+#define RESET_USB_DDR1			1
+#define RESET_USB_DDR2			2
+#define RESET_USB_DDR3			3
+#define RESET_USB1			4
+#define RESET_USB0			5
+#define RESET_USB1_COMB			6
+#define RESET_USB0_COMB			7
+#define RESET_USBPHY20			8
+#define RESET_USBPHY21			9
+/*					10-14	*/
+#define RESET_HDMI20_AES		15
+#define RESET_HDMITX_CAPB3		16
+#define RESET_BRG_VCBUS_DEC		17
+#define RESET_VCBUS			18
+#define RESET_VID_PLL_DIV		19
+#define RESET_VIDEO6			20
+#define RESET_GE2D			21
+#define RESET_HDMITXPHY			22
+#define RESET_VID_LOCK			23
+#define RESET_VENCL			24
+#define RESET_VDAC			25
+#define RESET_VENCP			26
+#define RESET_VENCI			27
+#define RESET_RDMA			28
+#define RESET_HDMI_TX			29
+#define RESET_VIU			30
+#define RESET_VENC			31
+
+/* RESET1 */
+#define RESET_AUDIO			32
+#define RESET_MALI_CAPB3		33
+#define RESET_MALI			34
+#define RESET_DDR_APB			35
+#define RESET_DDR			36
+#define RESET_DOS_CAPB3			37
+#define RESET_DOS			38
+/*					39-47	*/
+#define RESET_ETH			48
+/*					49-63	*/
+
+/* RESET2 */
+#define RESET_AM2AXI			64
+#define RESET_IR_CTRL			65
+/*					66	*/
+#define RESET_TEMPSENSOR_PLL		67
+/*					68-71	*/
+#define RESET_SMART_CARD		72
+#define RESET_SPICC0			73
+/*					74-79	*/
+#define RESET_MSR_CLK			80
+/*					81	*/
+#define RESET_SARADC			82
+/*					83-87	*/
+#define RESET_ACODEC			88
+#define RESET_CEC			89
+/*					90	*/
+#define RESET_WATCHDOG			91
+/*					92-95	*/
+
+/* RESET3 */
+/* 96 ~ 127 */
+
+/* RESET4 */
+/*					128-131	*/
+#define RESET_PWM_A			128
+#define RESET_PWM_B			129
+#define RESET_PWM_C			130
+#define RESET_PWM_D			131
+#define RESET_PWM_E			132
+#define RESET_PWM_F			133
+#define RESET_PWM_G			134
+#define RESET_PWM_H			135
+#define RESET_PWM_I			136
+#define RESET_PWM_J			137
+#define RESET_UART_A			138
+#define RESET_UART_B			139
+/*					140-143	*/
+#define RESET_I2C_S_A			144
+#define RESET_I2C_M_A			145
+#define RESET_I2C_M_B			146
+#define RESET_I2C_M_C			147
+#define RESET_I2C_M_D			148
+#define RESET_I2C_M_E			149
+/*					150-151	*/
+#define RESET_SD_EMMC_A			152
+#define RESET_SD_EMMC_B			153
+#define RESET_SD_EMMC_C			154
+/*					155-159	*/
+
+/* RESET5 */
+#define RESET_BRG_VDEC_PIPL0		160
+#define RESET_BRG_HEVCF_PIPL0		161
+/*					162-163	*/
+#define RESET_BRG_GE2D_PIPL0		164
+#define RESET_BRG_DMC_PIPL0		165
+#define RESET_BRG_A53_PIPL0		166
+#define RESET_BRG_MALI_PIPL0		167
+/*					168	*/
+#define RESET_BRG_MALI_PIPL1		169
+/*					170-171	*/
+#define RESET_BRG_HEVCF_PIPL1		172
+#define RESET_BRG_HEVCB_PIPL1		173
+/*					174-182	*/
+#define RESET_BRG_NIC_EMMC		183
+#define RESET_BRG_NIC_RAMA		184
+#define RESET_BRG_NIC_SDIOB		185
+#define RESET_BRG_NIC_SDIOA		186
+#define RESET_BRG_NIC_VAPB		187
+#define RESET_BRG_NIC_DSU		188
+#define RESET_BRG_NIC_CLK81		189
+#define RESET_BRG_NIC_MAIN		190
+#define RESET_BRG_NIC_ALL		191
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index a3faf4d188e1..0b2ac24e8dbc 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
+#include "amlogic-s7-reset.h"
 
 / {
 	cpus {
@@ -142,6 +143,13 @@ uart_b: serial@7a000 {
 				status = "disabled";
 			};
 
+			reset: reset-controller@2000 {
+				compatible = "amlogic,s7-reset",
+					     "amlogic,meson-s4-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,pinctrl-s7";
 				#address-cells = <2>;

-- 
2.37.1



