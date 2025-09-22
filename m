Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA71BCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lfz2UZ8ldaU0z35qQPG4bqU3TgLJWNRu6p19U+8Usms=; b=jfn5UEvUB4IzfieyQNC8ukoO09
	OQi1keh/nrwSMdejOOqNxxKHTznXqDWr08N3GY47SDR9eo0hwzBaIBfZ8kcXQnVqcVxN+EsfHHiTw
	GfLEc+Pg3O9bcVfAIIRcYTCXdf+F5vnQs0FvUG99BG9F61qpvbd5FT251vBdHXmicUDLcPjlNjw31
	t5tyPXGKrrNyBdWsjXsQ7Cgg4VYNZipNCexMPvg0F6nuUWDp68MaD5tS8/YnHMU3pTlmUrf9Ot2D+
	OqkErbCOer/4xu8m2/ROaj/sWcr18dUMega4PVRRc7PZFf7PW9KIGplerDWjsla2lLZ8yWWVzMID3
	eggyTVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gKO-0000000AQfV-1iMc;
	Mon, 22 Sep 2025 13:11:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gKN-0000000AQfE-2mGP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E9D0601AF;
	Mon, 22 Sep 2025 13:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95660C4CEF0;
	Mon, 22 Sep 2025 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546694;
	bh=m1F+2phx7Lb5XyIK23kbVO9XUbG8qwxx1BZm/gVYwWI=;
	h=From:To:Cc:Subject:Date:From;
	b=PYAzbIzQvSb8RcK7j23d8PVZmI4mNgOMCkEtwsd8DhOZVNRht7ukIO6EfT10M0YC/
	 xXSG8tvqaxxZrgVQdMPT808SJStUzIGTWj4Qw60amA+z8KlnZlsPwMerisBRGAO6RC
	 UDq5llW6dhBV+gZVtJGjWETX/tAUO4DCOpshcZUJwcRA6nADcwNL/nFzM6gFxDzFVU
	 q7YaO7b5Log3c/Yyy8Hpfgy8GYN4Yva3VmE9Xgb1w3tkKxIqxFq0KZh7wfp8+xicA9
	 BYf7gYuTHu/YayC8m/J20wiwKot26quLv4SIxtOAdmuj3KP5tV5WprDEIhaQnoHaKK
	 3Ml8KR2cedhlQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Bryan Brattlof <bb@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-j722s: add OPP table
Date: Mon, 22 Sep 2025 15:11:05 +0200
Message-Id: <20250922131105.2670932-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add the A53 frequency operation points. The frequencies where taken from
the AM62P SoC and seem to be chosen rather arbitrary.
The SoC doesn't contain it's speed grade in the JTAG USER ID efuse
register, thus it has to be hardcoded in the SoC dtsi and/or board dts.

The SoC is binned into just two speed grades with different core
voltages: J (0.75V, 1.25GHz) and K (0.85V, 1.4GHz). Add the frequencies
that both speed grades support to the SoC dtsi and if a board has a
speed grade K SoC add it to the board device tree.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../arm64/boot/dts/ti/k3-am67a-beagley-ai.dts |  7 ++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       |  7 ++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi          | 40 +++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index b697035df04e..464dffd46e59 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -148,6 +148,13 @@ led-1 {
 	};
 };
 
+&a53_opp_table {
+	opp-1400000000 {
+		opp-hz = /bits/ 64 <1400000000>;
+		clock-latency-ns = <6000000>;
+	};
+};
+
 &main_pmx0 {
 	main_i2c0_pins_default: main-i2c0-default-pins {
 		pinctrl-single,pins = <
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e0e303da7e15..ce3ed1b0f24d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -228,6 +228,13 @@ csi23_mux: mux-controller-1 {
 	};
 };
 
+&a53_opp_table {
+	opp-1400000000 {
+		opp-hz = /bits/ 64 <1400000000>;
+		clock-latency-ns = <6000000>;
+	};
+};
+
 &cpsw_mac_syscon {
 	bootph-all;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 0165db6e4437..acb15307addc 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -55,6 +55,7 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
 			#cooling-cells = <2>;
 		};
@@ -71,6 +72,7 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
 			#cooling-cells = <2>;
 		};
@@ -87,6 +89,7 @@ cpu2: cpu@2 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
 			#cooling-cells = <2>;
 		};
@@ -103,11 +106,48 @@ cpu3: cpu@3 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
 			#cooling-cells = <2>;
 		};
 	};
 
+	a53_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			clock-latency-ns = <6000000>;
+			opp-suspend;
+		};
+	};
+
 	l2_0: l2-cache0 {
 		compatible = "cache";
 		cache-unified;
-- 
2.39.5


