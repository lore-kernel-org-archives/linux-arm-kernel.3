Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FD4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 22:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omYq6PecBpZUkuPCrtO4iUuY+5XsWIH+VdKDw8lCeP4=; b=sgeBtuXwUG5ox9p9iSKyebJRW4
	Gi3O7bNfbdpSX5IsMsJBuwTB+t8iQ4fJXm4YaTvk4JEnpC7HyAQb0x3+sl2cp77CjN510RB59q880
	6j+0lEwqeWk+MMmqR/yeLWBLm6atp0vhz5XMCDYWF6KxHIPJXTJ5Dnj0tRrBXCqQh7In5OlEi7sYl
	8+5EYs2SXqw5c1/M67EAhkYbzpi0ARha5P9zMbx7Y1as6a330TmTFwSshpIqNfzQWbKxDKfhUc99S
	5B5wG1LBVPkg4t2SXMapkKGPXfKOAtWl5nZ9T2REu9KOxGDGhfIMwBCtrlWv9aIJTQ6RkuaFnnnmc
	hinExdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trlMt-000000045pT-3XzG;
	Mon, 10 Mar 2025 22:13:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trlI2-000000045E0-41NP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 22:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 836B2A464F4;
	Mon, 10 Mar 2025 22:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7888C4CEF4;
	Mon, 10 Mar 2025 22:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741644480;
	bh=FmBWfKgtkrA7kVFNMhyDWV+nuxm8zwZ6nWuvPNtzkKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JpWJkz3k4tjE9o+oUUtQ8mQ8lkMnsUCqEAi3X85nXrrwRuc8kHYZ/1l28PI5tFKni
	 AAdrDZozazntpspNu/2/QEvFwgcDQSwfnP4l0o+f93JbU1ggiftJ7I+ca/EFIstnX2
	 iTsdFCo6f41pDJbU0jNffuWg1IpjHksVaWxN4p0piCJtvJhMp1X+rxOv5aBpmRAJba
	 uVygJFX5qhPAtCEojrBZ6i6MuKD/B4pzPGvoF0yM5mzj9PkkFFq9k+RtdUjBbHztQs
	 GQHPtinMY9l3yxOeBcSfUsyOf++ndu80S8tenC/3hCVh5W0xfj+o27GzOLBq86z+cr
	 bNHyrTxJc724w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5CCC28B30;
	Mon, 10 Mar 2025 22:08:00 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 10 Mar 2025 23:08:00 +0100
Subject: [PATCH v3 3/3] arm64: dts: apple: Add SPMI controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-spmi-v3-3-92a82e7d9f0d@gmail.com>
References: <20250310-spmi-v3-0-92a82e7d9f0d@gmail.com>
In-Reply-To: <20250310-spmi-v3-0-92a82e7d9f0d@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741644479; l=2708;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=Pa8VSPAfUl5rQWcSmiEYDiYAy3MCXTK35oo91BheHOg=;
 b=GOd8zWco/1HabLA5aHDW6D1sJ33ybbnjoVDC+caUzRNKsUkXPPsrIOcdLLp+IHdKIJkQEUa3P
 4iebaR/tpqwBdnnuk5Px2vlaS0qWgeJz8kJYHVfMf3kdbnhUqMwM1tz
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_150803_128784_E5573EE7 
X-CRM114-Status: GOOD (  10.02  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add device tree entries for the SPMI controller

Reviewed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 8 ++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 7 +++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index b1c875e692c8fb9c0af46a23568a7b0cd720141b..64d4f301ca850ddb043bccc087e0b874fb96da9b 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,13 @@ pinctrl_smc: pinctrl@290820000 {
 				<AIC_IRQ 0 749 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	nub_spmi0: spmi@2920a1300 {
+		compatible = "apple,t6000-spmi", "apple,spmi";
+		reg = <0x2 0x920a1300 0x0 0x100>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+	};
+
 	wdt: watchdog@2922b0000 {
 		compatible = "apple,t6000-wdt", "apple,wdt";
 		reg = <0x2 0x922b0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..0f03dc808cf7c6b7d71afc79dd29d368f957f979 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	compatible = "apple,t8103", "apple,arm-platform";
@@ -604,6 +605,13 @@ pcie_pins: pcie-pins {
 			};
 		};
 
+		nub_spmi: spmi@23d0d9300 {
+			compatible = "apple,t8103-spmi", "apple,spmi";
+			reg = <0x2 0x3d0d9300 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@23d1f0000 {
 			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3d1f0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..fa4309bb92975c4edbc11c998496f125267f2353 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -679,6 +679,13 @@ wdt: watchdog@23d2b0000 {
 			interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		nub_spmi: spmi@23d714000 {
+			compatible = "apple,t8112-spmi", "apple,spmi";
+			reg = <0x2 0x3d714000 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@23e820000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3e820000 0x0 0x4000>;

-- 
2.48.1



