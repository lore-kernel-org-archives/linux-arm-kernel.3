Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84BFE6B25F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 05:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEgYeru96W039E2RCA5/S32sHLGFjSoPKuvDw4yu09Y=; b=ht3VW0mJHOpMydAzb5nSZcyjeI
	/hZ7niukCAx/jB5KywZMde86jPaPckhi0gzkhNLh+Y2oSiuN41PVb3oByKa86vH+m4YBaHfftKfi6
	Py9slualwH9iIXuo2Qh/gYtg5sYdbalUZlXXUaoryrft83JUrqmXaWj1gXIeTsQvAzUUktHhb10Nw
	kAg9s+LlmjBYZ4fJzrtyFsQ2kaIz8EQskSjUwuFFYHHzr/4oUSajBLSUKM6357hcxwjb83AwTjtri
	2wK8+sVGTr7iv3aajmaoeoRpviUourCicwx8FEAc+TzhnhCPmE5UNG8hEk5Pidv6qYLreynzzF4RM
	IjD57hXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv5A-0000000EXys-2Tc5;
	Tue, 23 Dec 2025 05:37:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv57-0000000EXx3-2MD6;
	Tue, 23 Dec 2025 05:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFBA060153;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D3CAC2BC9E;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766468232;
	bh=3FcJ2Rscs1H5P0gYjlvTTOCZ2mgtYn4iiRY0FuAWTW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g3eKRBQGbqB0GqfawCD9u1wcL2X9cn/oRsTLnyEH2Gkl+2iSdIAc9Z8xtJlq10XMk
	 5pPHQPdEcLe0LRknK8Sy8yHKLEOCxaY6E0J8ztCsMS5vFGwW/BMXsCCT0Gq9C7HM2/
	 JCJ2HXeUeN7lWZYRgVl/wutEP96biPAxjRLjCToZY6sMuD9wA7sBHx1YFubXB7Gde5
	 TZKHh3FFDZK41LpW4CXAarcxoFsAD3JlmeOh0MTZZOiDtkX6MstsoTc99ZIA2JMZVP
	 U3OLjLgOJKfZ0Hs6kaogPjwKsV+ZWe1UJaRJ/8T9NddaCxpCvcNu65OqbhkHXfJRlc
	 Ti5Z86OTXtx5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845F0E6ADF9;
	Tue, 23 Dec 2025 05:37:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 23 Dec 2025 05:37:12 +0000
Subject: [PATCH v2 4/4] arm64: dts: amlogic: Add S7D Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-reset-s6-s7-s7d-v2-4-958f341449f1@amlogic.com>
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766468230; l=4875;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=SQ/+RhX7ekhuQKEJO7YT/ofDufbjSCzRv3EgEaoCzC4=;
 b=Ub3MBC5YyaIU+himfpkVOP5Q8bDpKlARcP8tml9B/2y66FDhQ80E6CczaFlAgXLC9+6ak0Ilp
 +KlBqAvRtcwDlaYT5TcrUe1/uwexbGu9v5qz0gzP7dCCGYd8ZRApO2o
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
S7D reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d-reset.h | 134 ++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi    |   8 ++
 2 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-s7d-reset.h
new file mode 100644
index 000000000000..fb15a93d901e
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d-reset.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2025 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_S7D_RESET_H
+#define _DT_BINDINGS_AMLOGIC_S7D_RESET_H
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
+#define RESET_USBCC			10
+#define RESET_BC			11
+#define RESET_AMFC_APB			12
+/*					13-14	*/
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
+#define RESET_GPU_TS			39
+#define RESET_PLCK_DBG			40
+/*					41-47	*/
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
+#define RESET_SAR_DIG			82
+#define RESET_SAR_ANA			83
+/*					84-85	*/
+#define RESET_AMFC			86
+/*					87	*/
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
+#define RESET_UART_C			140
+#define RESET_UART_D			141
+#define RESET_UART_E			142
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
+#define RESET_BRG_VDEC_PIPE0		160
+/*					161-163	*/
+#define RESET_BRG_GE2D_PIPE0		164
+#define RESET_BRG_DMC_PIPE0		165
+#define RESET_BRG_A55_PIPE0		166
+#define RESET_BRG_MALI_PIPE0		167
+/*					168	*/
+#define RESET_BRG_MALI_PIPE1		169
+/*					170-171	*/
+#define RESET_BRG_HEVCF_PIPE1		172
+#define RESET_BRG_HEVCB_PIPE1		173
+/*					174-182	*/
+#define RESET_BRG_NIC_EMMC		183
+/*					164	*/
+#define RESET_BRG_NIC_SDIOB		185
+#define RESET_BRG_NIC_SDIOA		186
+#define RESET_BRG_NIC_VAPB		187
+#define RESET_BRG_NIC_DSU		188
+#define RESET_BRG_NIC_CLK81		189
+#define RESET_BRG_NIC_MAIN		190
+#define RESET_BRG_NIC_ALL		191
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 0c4417bcd682..bae89ca6c448 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s7d-pwrc.h>
+#include "amlogic-s7d-reset.h"
 
 / {
 	cpus {
@@ -106,6 +107,13 @@ uart_b: serial@7a000 {
 				status = "disabled";
 			};
 
+			reset: reset-controller@2000 {
+				compatible = "amlogic,s7d-reset",
+					     "amlogic,meson-s4-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,pinctrl-s7d",
 					     "amlogic,pinctrl-s7";

-- 
2.52.0



