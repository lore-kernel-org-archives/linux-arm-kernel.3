Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997C0CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/iR+Di9sdlHw9T+wwNeZom3Qnq9pNXhcbJmYGkQGC0=; b=SK7ZdfjmyAf7Hv8yIxpr5Of3+U
	ok4ETiKSQqdrSWJmaGfgFnGAG5kee1wdXX4pM4YB8PczKHlhlEfMmFgtegKWlnrtxohHb+fgvb53G
	CBvd8gGyMlvoQFswJlt2SeXBUsJE/Sxg92m5krk+5y8/4BOADpUoqKcEwqyodw7Lddnp4cwb/AaMU
	L5UqlVZvss8Qx8AqHQwvKGOzX127XmS2ap236gNzmLERoYt02JccjBB5nYBH+G6+vS4RlqEPG8IGi
	3CHiDYVj2DZTk0j/qxWnqTC82NEOkpgtmEWaOPWIhcNk4ub8k3xRzorcfgZkLFE93Rr8bsedekmqY
	84WDdgLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaS-0000000ANmN-0Pr2;
	Mon, 12 Oct 2026 11:53:00 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaE-0000000ANhM-3G4x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:52:49 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791805963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/iR+Di9sdlHw9T+wwNeZom3Qnq9pNXhcbJmYGkQGC0=;
	b=MSTIBMPeDFx88fvd6P+RjSgjjksq3xcdW/A3QKJHSAEYFPksMkPcg86W/O0QAieb6A3BMh
	gdTP92ufaUYKemQF9Jek5/UJk3RSCFovla0FvQbxNZO2TkU37P12nJw13AjiSD5KZxwdLO
	YrAquXk7wOF/2B/hpHeenNEVKDSJp0A=
Date: Mon, 12 Oct 2026 13:52:35 +0200
Subject: [PATCH 4/5] arm64: dts: apple: t8140: Add pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-4-6c757966a99e@cyberchaos.dev>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_045247_051680_FE23277F 
X-CRM114-Status: UNSURE (   9.26  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the pin controller nodes present on the Apple Silicon T8140 (A18
Pro) SoC. The pinctrl controllers uses the new apple,t8140-pinctrl
compatible to reflect the requirement for not reading or writing the
registers related to the pins listed in gpio-reserved-ranges.
The pinctrl_ap is a prerequisite for enabling the I2C and PCIe
controllers.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8140.dtsi | 114 +++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 40559da62923..339a6b4f283d 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
 
 / {
 	compatible = "apple,t8140", "apple,arm-platform";
@@ -168,6 +169,29 @@ aic: interrupt-controller@301000000 {
 			power-domains = <&ps_aic>;
 		};
 
+		pinctrl_nub: pinctrl@3081f0000 {
+			compatible = "apple,t8140-pinctrl";
+			reg = <0x3 0x081f0000 0x0 0x4000>;
+			power-domains = <&ps_nub_gpio>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_nub 0 0 30>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 473 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <30>;
+		};
+
 		pmgr_mini: power-management@308280000 {
 			compatible = "apple,t8140-pmgr", "apple,t8103-pmgr",
 			             "syscon", "simple-mfd";
@@ -185,6 +209,96 @@ wdt: watchdog@3082b0000 {
 			interrupts = <AIC_IRQ 507 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pinctrl_smc: pinctrl@30c820000 {
+			compatible = "apple,t8140-pinctrl";
+			reg = <0x3 0x0c820000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_smc 0 0 6>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 572 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 573 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 574 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <6>;
+		};
+
+		pinctrl_aop: pinctrl@310824000 {
+			compatible = "apple,t8140-pinctrl";
+			reg = <0x3 0x10824000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 57>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 380 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 381 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 382 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 383 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 385 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 386 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <57>;
+		};
+
+		pinctrl_mtp: pinctrl@314838000 {
+			compatible = "apple,t8140-pinctrl";
+			reg = <0x3 0x14838000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_mtp 0 0 10>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1128 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 1129 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 1130 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 1131 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 1132 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 1133 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 1134 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <10>;
+		};
+
+		pinctrl_ap: pinctrl@31a000000 {
+			compatible = "apple,t8140-pinctrl";
+			reg = <0x3 0x1a000000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 216>;
+			gpio-reserved-ranges = <134 1>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 263 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
+			             <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <216>;
+		};
+
 		serial0: serial@385200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x3 0x85200000 0x0 0x1000>;

-- 
2.55.0


