Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460B3D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si80KY9V4CM8WTG0ae1zt14Ur2gGrFl2IqFLbLjRGiU=; b=y6WE5/z+tTSozaeuKf5ukHrScE
	5iSPqhVkhceoz4dN+Hh/I1bCANYD+kSF50gS3+z8icEwBbhVm6RaL9ZnQkEgnG0mN9l+zHOX9jppL
	1+rQRuMYNsNFY1MIkue0qjxlEeK7SrutapeJvf0CgwHM8OgWwc1/NCH2Nu0NveuLNDMOJY5Lw/Ubt
	lcPdiYMa99GOJL4dSP4Ln23mD83R6IXNB4p+tzv2VFcPKy/zkospicdSPepe3CGHz1BrqEoOm7pmI
	cAkH4M8drBcyDsp0tkQetmDnHlNHuTxSn7Ry6TzbN4W5TjmNFwRE9fkiVRsZTlXC3wnGfhAEAJzx+
	YRyRKbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSw-0000000G7hX-3H0B;
	Thu, 27 Nov 2025 07:30:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWSj-0000000G7Zc-2Czq;
	Thu, 27 Nov 2025 07:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40A98442B5;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D54BC19424;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228644;
	bh=fbTsUCQj1RD8qwzKO52ZApznPD7wF9elZFv8cipPVHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rz1p0kHDMnlMYm1Uc14gzEwUjGXTQmzL+IHP0en/wlg2mKyAi6cDaVG6GRFETHdz7
	 v5Dmvl8svW60JwFVU1STsj15zZ8tEf1NT2n+TFIcoL1qQheeFClrYiWZl6b72HozIY
	 LZ/YenSOBFc/UY66ULkLWJx+Pj+6Gj1SLgPOy5DHvevk+NnXMBpWWLnxDg0TB8gaeX
	 vbdtgAsg3h/bsvSlEEndAX78ybEh8WtN5mMep5fCChDDmygyrqZahn3dfyPc0762vM
	 /e2mPfq8A11PE2dLDxHQ9C7Ont5+QZ6aH6XQRtoHuu763nfQsMRFZi/79i1WhXO/wi
	 TzmsLIisaBiiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CFCCFD2F6;
	Thu, 27 Nov 2025 07:30:44 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Nov 2025 15:30:34 +0800
Subject: [PATCH 4/4] arm64: dts: amlogic: Add S7D Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-reset-s6-s7-s7d-v1-4-879099ad90d3@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764228641; l=4875;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=5wwrW6KjOWT339f03AVM4w+kKKlwXFASNHk49oi+itI=;
 b=TcG6ixepJGEJNUVljr+70oZ4T6oh5hBDOVvFVYX7fEpMOOxApf1p3OZNTj+myfpTUPCBjaJW7
 fOGUj3ZVJ/HAHs+nAoGc2IGUsZb954kEjMCHXzk1bC0LAZHArzXYT7d
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_233045_636194_0CC28B09 
X-CRM114-Status: GOOD (  12.13  )
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
index 000000000000..02deea1c1fe5
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
+#define RESET_BRG_VDEC_PIPL0		160
+/*					161-163	*/
+#define RESET_BRG_GE2D_PIPL0		164
+#define RESET_BRG_DMC_PIPL0		165
+#define RESET_BRG_A55_PIPL0		166
+#define RESET_BRG_MALI_PIPL0		167
+/*					168	*/
+#define RESET_BRG_MALI_PIPL1		169
+/*					170-171	*/
+#define RESET_BRG_HEVCF_PIPL1		172
+#define RESET_BRG_HEVCB_PIPL1		173
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
2.37.1



