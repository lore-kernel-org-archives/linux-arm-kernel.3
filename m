Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08733C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 02:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7olQeFiCm6NAZgNHylwR+2UgCnWkQnhvWRgAXmfMV0=; b=Shh4mTt8okwJBA2bNvygi7EKco
	K+eMPQl+Efk4EcLV0WFDFBxY8fjFz/kON6pEx11AOO9wx+EwCxTu0Etm8NVNfS7HeGV6qwY75YWDO
	7bzFBkAwTFnk2i3bwSAaBmVdA5ADPR+JSRdLpdMWJwjKI3iI1Bt4sphrUf21qvu/r4WkM5gAgxqbt
	lwVcuEl9kumWkphGJCaJhSGf3GvD/PcW0Zr5sgB2ei5BlK9CrTb+frOsAVJ0ozGBX6bHzArND40hd
	JGBfxizdXXCaJ5qlGmIVjBx+k/b/WPtPoe52UGgjp1Kwm8DGbBqzKld4M2IYP6J5+FkjU0PvTIQj3
	0pEyqI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzR6V-00000001lum-43l2;
	Tue, 01 Apr 2025 02:11:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzR1G-00000001lEj-09ce;
	Tue, 01 Apr 2025 02:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A76A55C5AFC;
	Tue,  1 Apr 2025 02:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 113FAC4CEEB;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743473183;
	bh=cYPE4hxj2E/+XBZrJpUbI6pIfd/alhO++G3MPN6trQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AqPMWzwlWsUqmZy83x3slIc6sQteWFh83eKySr9JZg6qzB1ouy0uNnggC20Ak5FMo
	 O44zo+zJokKWYXyNdudv2Bq5l/OMohhp+jqPdyoRSCRPl1yzJHosGdOjYcPaRU3G2a
	 F6lCnIDzMAIUmF+93vY/beKvHW4ZWesMqnRduM0tAWwtDtQ4xxfreYJ0MmNOIDX3lv
	 ibrXZc5PnRSwSbFoDfbxK3FufRWGaeJqAeCut2orc2kWG4/qxVTZ3o66jTJ4ROcS4b
	 +2D/0E///XqJ1jlmFZftXAYkEpt3QFoY8X5D1YzoQx3N+OUOPOZ+WbuIuvlG0z2a0U
	 Eeg677g9SCClw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01306C36018;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 01 Apr 2025 10:06:22 +0800
Subject: [PATCH v2 2/2] dts: arm64: amlogic: add a5 pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-a5-pinctrl-v2-2-a136c1058379@amlogic.com>
References: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
In-Reply-To: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743473181; l=3211;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=zTXCd3mjrQB2UAQ+DUxS9Et3VYgrEbPO04Lv0RVd3Dc=;
 b=NexDqmE4GpUbjiTbbLNR2qLQAsmCioHre9r9chGGwjRm9ULldqqOwImf0F8J+gzlrHik+F1CA
 ERHpBOEyZRnBEQE5MIpElVYAw2cvS8U6Z1Z1icqyRl4iW7LJi2o5hdC
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_190626_203457_41A14D5D 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

Add pinctrl device to support Amlogic A5.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 32ed1776891b..844302db2133 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "amlogic-a4-common.dtsi"
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 / {
 	cpus {
@@ -50,6 +51,95 @@ pwrc: power-controller {
 };
 
 &apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,pinctrl-a5",
+			     "amlogic,pinctrl-a4";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
+
+		gpioz: gpio@c0 {
+			reg = <0x0 0xc0 0x0 0x40>,
+			      <0x0 0x18 0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
+		};
+
+		gpiox: gpio@100 {
+			reg = <0x0 0x100 0x0 0x40>,
+			      <0x0 0xc   0x0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
+		};
+
+		gpiot: gpio@140 {
+			reg = <0x0 0x140 0x0 0x40>,
+			      <0x0 0x2c  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 14>;
+		};
+
+		gpiod: gpio@180 {
+			reg = <0x0 0x180 0x0 0x40>,
+			      <0x0 0x40  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
+		};
+
+		gpioe: gpio@1c0 {
+			reg = <0x0 0x1c0 0x0 0x40>,
+			      <0x0 0x48  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
+		};
+
+		gpioc: gpio@200 {
+			reg = <0x0 0x200 0x0 0x40>,
+			      <0x0 0x24  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 11>;
+		};
+
+		gpiob: gpio@240 {
+			reg = <0x0 0x240 0x0 0x40>,
+			      <0x0 0x0   0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+		};
+
+		gpioh: gpio@280 {
+			reg = <0x0 0x280 0x0 0x40>,
+			      <0x0 0x4c  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 5>;
+		};
+
+		gpio_test_n: gpio@2c0 {
+			reg = <0x0 0x2c0 0x0 0x40>,
+			      <0x0 0x3c  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+		};
+	};
+
 	gpio_intc: interrupt-controller@4080 {
 		compatible = "amlogic,a5-gpio-intc",
 			     "amlogic,meson-gpio-intc";

-- 
2.37.1



