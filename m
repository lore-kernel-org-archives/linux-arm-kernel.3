Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB00C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZXc/rYn15EddB7CP/7l0eTDJIAGXvnnYj8DuU4OJas=; b=W10anmPCD4kQLe75QdV0EVK829
	vlJXSgplm6aszZBlupffXjOx1CpLvs8Sj3dRM7w+yK80RFZQ9gXBunJyR0FhzOIQTKqB4l7v5toqo
	qmNaCT1hKNMeEtQUP0ZZL7F+imC+fUC2z/qrGojfRWgO0wa5VwEToJRuUFPYJTuPmBtg5A+FroMj0
	1lP8SuKT6CwPhI30j8to/x3fsz9Xad3w6OlCWLoajdLZ5U8mjg6SAEcbjpGQ7lwNTzroSd1ODs8tA
	i7UEuZjM+Bk5Q13C0h+OGRg4uXVanyt7wI5CSKQqdbN5RwVZb55PlzP+zwRdlvn6u1CtQeK0P42OA
	X3+SaSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Cdb-0000000Da6C-03po;
	Fri, 11 Apr 2025 11:33:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CY6-0000000DYfu-2CZc;
	Fri, 11 Apr 2025 11:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DC8B68459;
	Fri, 11 Apr 2025 11:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12044C4CEE7;
	Fri, 11 Apr 2025 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744370873;
	bh=nSJeRVzzaivIB88gKQyatucRpKgXoP8b+63uudU5lDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y6RO9GXLFty+I45/ekuqeT3TkgFJGgJcE99zEuxeiu/BiEWSREtHg5QuIDfAntojZ
	 DazL/mpYZLvGCLA7EHVQ0bj8S/VRHn8MJtasaRbWpyW9EyoCiDVqrxQI1oa3JdzCxx
	 tuO2x7WxqbgkhTspP247dKGWo31RmofEsL2vYnuAVmx98jBQedmvdYA5U+OpvSiIoq
	 W2DnM+sRaxxglgxJD8hSnqJaOeOyJTvlAbHPiBHyTlIsVarqySO2mQSbvuOeB1YVEV
	 rs4HLQ7lfjzvtNaM01XIbpdZ+xsQ1tbv79a2MKiRg02KKqzBj3u6fmZnhePs4hM1d8
	 IfImtBzEpnsmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007CEC369AC;
	Fri, 11 Apr 2025 11:27:53 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 19:27:51 +0800
Subject: [PATCH v5 2/3] arm64: dts: amlogic: Add A4 Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-a4-a5-reset-v5-2-24812538dce6@amlogic.com>
References: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
In-Reply-To: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744370870; l=3908;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=oF2MZH3lmYKfr/9G4rTMkISCrbGCYT5binySnJgFGrM=;
 b=A2QGLQYcs37msHVMzUNvooic7mkC7zLC/nalb8cuf0yjqhKGflkHBxr5xfi1B+zW7P00FtJsS
 O8JETqqEVlzC/jyWe0Iw9tQ5miOxs+nsCNANkmlZYtEkJW+KnR0FmVl
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
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
Reply-To: kelvin.zhang@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zelong Dong <zelong.dong@amlogic.com>

Add the device node and related header file for Amlogic
A4 reset controller.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Link: https://lore.kernel.org/r/20240918074211.8067-3-zelong.dong@amlogic.com
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h | 93 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi    |  8 +++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
new file mode 100644
index 0000000000000000000000000000000000000000..f6a4c90bab3cf7cfaa3c98c522bed5e455b73bd3
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __DTS_AMLOGIC_A4_RESET_H
+#define __DTS_AMLOGIC_A4_RESET_H
+
+/* RESET0 */
+/*						0-3 */
+#define RESET_USB				4
+/*						5-6*/
+#define RESET_U2PHY22				7
+#define RESET_USBPHY20				8
+#define RESET_U2PHY21				9
+#define RESET_USB2DRD				10
+#define RESET_U2H				11
+#define RESET_LED_CTRL				12
+/*						13-31 */
+
+/* RESET1 */
+#define RESET_AUDIO				32
+#define RESET_AUDIO_VAD				33
+/*						34*/
+#define RESET_DDR_APB				35
+#define RESET_DDR				36
+#define RESET_VOUT_VENC				37
+#define RESET_VOUT				38
+/*						39-47 */
+#define RESET_ETHERNET				48
+/*						49-63 */
+
+/* RESET2 */
+#define RESET_DEVICE_MMC_ARB			64
+#define RESET_IRCTRL				65
+/*						66*/
+#define RESET_TS_PLL				67
+/*						68-72*/
+#define RESET_SPICC_0				73
+#define RESET_SPICC_1				74
+/*						75-79*/
+#define RESET_MSR_CLK				80
+/*						81*/
+#define RESET_SAR_ADC				82
+/*						83-87*/
+#define RESET_ACODEC				88
+/*						89-90*/
+#define RESET_WATCHDOG				91
+/*						92-95*/
+
+/* RESET3 */
+/*						96-127 */
+
+/* RESET4 */
+/*						128-131 */
+#define RESET_PWM_AB				132
+#define RESET_PWM_CD				133
+#define RESET_PWM_EF				134
+#define RESET_PWM_GH				135
+/*						136-137*/
+#define RESET_UART_A				138
+#define RESET_UART_B				139
+/*						140*/
+#define RESET_UART_D				141
+#define RESET_UART_E				142
+/*						143-144*/
+#define RESET_I2C_M_A				145
+#define RESET_I2C_M_B				146
+#define RESET_I2C_M_C				147
+#define RESET_I2C_M_D				148
+/*						149-151*/
+#define RESET_SDEMMC_A				152
+/*						153*/
+#define RESET_SDEMMC_C				154
+/*						155-159*/
+
+/* RESET5 */
+/*						160-175*/
+#define RESET_BRG_AO_NIC_SYS			176
+/*						177*/
+#define RESET_BRG_AO_NIC_MAIN			178
+#define RESET_BRG_AO_NIC_AUDIO			179
+/*						180-183*/
+#define RESET_BRG_AO_NIC_ALL			184
+/*						185*/
+#define RESET_BRG_NIC_SDIO			186
+#define RESET_BRG_NIC_EMMC			187
+#define RESET_BRG_NIC_DSU			188
+#define RESET_BRG_NIC_CLK81			189
+#define RESET_BRG_NIC_MAIN			190
+#define RESET_BRG_NIC_ALL			191
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index c02fa5ee9fd22285ebad2ef52939e2fc4c4dd019..563bc2e662fac5f2ec3d0b9cc3fca0de39ec0553 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "amlogic-a4-common.dtsi"
+#include "amlogic-a4-reset.h"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
@@ -51,6 +52,13 @@ pwrc: power-controller {
 };
 
 &apb {
+	reset: reset-controller@2000 {
+		compatible = "amlogic,a4-reset",
+			     "amlogic,meson-s4-reset";
+		reg = <0x0 0x2000 0x0 0x98>;
+		#reset-cells = <1>;
+	};
+
 	periphs_pinctrl: pinctrl@4000 {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;

-- 
2.37.1



