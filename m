Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD1E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KRkeb89R4pO4+wUvxiUu1aHRCbA0oi7cllK8wJt1rKw=; b=puaivZElPkbT1vwj2w1tOdMYge
	BAnTdJPfe3bzqitwFUbHmniuwWH3Su7mJThJZcO+wGeuEQZ3Ugj1vgHoOBlMopFDlxifYxkaTlkC9
	edqn2LI9s6+5DlCpPcTz5fbvd5iWub5LeguSuy+heeQPxoomsx89Bb0fXXXUEMT+ctN01UwKrgyFC
	7H4Aqn5XsMtoGBmw81AGZZHGLFfg7rokNThtKf76dCBeNrSC7ib+/etWDWldNTutZ9k6z/TQMtluL
	4mR+W1UbBJ1ILNN6KP5ohgE29Llz0lZrBldFMweXDpy/AhNQlMWPa3+9SE+b+l/7DlFmbwh6urknw
	uKBlOSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3DD-0000000BsS1-3hR1;
	Tue, 24 Dec 2024 11:36:31 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3C2-0000000BsMO-09m1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 11:35:19 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=vQMcNV+36WA41MyEq9dmdgdNUty6sb0hi1Ep5Z316ABCZQwY6vh+QEZdvfUVbGm+ilbtNd7F9ifmQNxh2WlAagj1QugHkNKX0NJGTM5iyjLNR1V3JzY+xjjVDaPQzvEJOlP9JThpH208OVi1LHYk/nbh4Di9ovArxLXai89MzBeSi6lN9AnJGaDRbmoH234A4GksMBp/ltjQvBHQ58fCMMEpfY0nKiFpMWiAoaixpvGDRaHyk2olkpEnLwzX8skbAuV3ofn+KxFKxo3xGKCWcB6sJcV54OOQZA3LftWFGQR/8WWAtGiXBe9X8eEg65IDPIGRP/6diqycwvqJMVLhvA==; s=purelymail2; d=purelymail.com; v=1; bh=BcEjN9duK7bqyLwS8CwLOnV9+UNNCICIM2ZvZfW8MWg=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1378732709;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 24 Dec 2024 11:34:50 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Tue, 24 Dec 2024 04:33:36 +0100
Subject: [PATCH v3] arm64: dts: exynos990: Add clock management unit nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-cmu-v3-1-33ca24b2413c@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIAI8ramcC/03Myw6DIBCF4VcxrIsB1Eq66ns0XYCOOgkMZrC3G
 N+9pKsuv+Q/ZxcZGCGLS7ULhidmTFTQnCoxLI5mkDgWC6NMq41p5RAfsvUwAhjrrR9FKVeGCd+
 /l9u9eOIU5bYwuL+t7nSvrGpq3Xdn2ylpJM6Jaw/hlegagTYXwic7guiQAhJwrhPP4ji+KJihM
 KcAAAA=
X-Change-ID: 20241224-cmu-4bedee28b8bd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735011278; l=2843;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=BcEjN9duK7bqyLwS8CwLOnV9+UNNCICIM2ZvZfW8MWg=;
 b=TyehHWEdJUgWYDNPxzvnxwZFbbeyWjpMUlLAZoEiqj36Fj0wfqy3dV8jQb+uDO9UkwGNPxCIm
 yC4ZrUSzwWMBp+MfzAsmoBAWMCb/46Sy7OEGqJ9lDzkPKX5hdVZPuD4
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_033518_200982_ED534CC0 
X-CRM114-Status: GOOD (  10.91  )
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

Add CMU nodes for:
- cmu_top: provides clocks for other blocks
- cmu_hsi0: provides clocks for usb31

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Hi all,

This patchset adds device tree nodes for Exynos990 CMUs (TOP and HSI0).

CMU_TOP is the top block. It provides clocks for other blocks.
CMU_HSI0 is a block for USB31. It provides clocks for the USB phy and
other USB hardware.

This patchset allows these first two implemented CMU blocks to be used.

Changes since v2:
- REALLY fix the stray blank line (Thanks again, Krzysztof!) [0]
- Rewrite cover letter. (Thanks, Krzysztof!)
- Use b4's single patch format.

[0] I didn't amend the commit. Stupid mistake. Sorry for wasting time
with v2.

Changes since v1:
- Fix clock-names formatting (Thanks, Krzysztof!)
- Remove stray blank line (Thanks, Krzysztof!)
- Make clock-names conform with the binding style

Best regards,
Igor
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 2619f821bc7ca8ed7a49ca817f025819201e0e95..8e8baf2e8ced1b716e447515680a1499c83e3e5d 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
  */
 
+#include <dt-bindings/clock/samsung,exynos990.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -199,6 +200,23 @@ pinctrl_peric1: pinctrl@10730000 {
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi0: clock-controller@10a00000 {
+			compatible = "samsung,exynos990-cmu-hsi0";
+			reg = <0x10a00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
+			clock-names = "oscclk",
+				      "bus",
+				      "usb31drd",
+				      "usbdp_debug",
+				      "dpgtc";
+		};
+
 		pinctrl_hsi1: pinctrl@13040000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x13040000 0x1000>;
@@ -245,6 +263,15 @@ pinctrl_cmgp: pinctrl@15c30000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x15c30000 0x1000>;
 		};
+
+		cmu_top: clock-controller@1a330000 {
+			compatible = "samsung,exynos990-cmu-top";
+			reg = <0x1a330000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>;
+			clock-names = "oscclk";
+		};
 	};
 
 	timer {

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241224-cmu-4bedee28b8bd

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


