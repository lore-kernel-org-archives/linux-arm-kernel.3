Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B46CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OVDDGTNilO7DKpmYbp+zbfLVR7Ydh5FT9QXt/goZ5cM=; b=S0ZdA2WM3x+SsF5aR6w/1/8WA0
	j1DJMvZmJMlEh2Ie0mufF6wPckBVPNRnJDTfyBbnPB95RjyNR1cdkng76x2oSAurvn5F+AROBqGhT
	wdVHxSmBujHthAttuyA7ZlTnqARB4Zc7GHx/6k83TcFcwBkld7W28AmpKls5SCEiLjgcHzusUPXZh
	s4BqefEq3chezflQaFIPpW68CwpZ4LztjL0ATqohzdWBdLR8D3dDQZc4NJSEqQPBpjLz8wgltiwAK
	yISqv2v3nOm3O9/irLgsT1FxFMTyFHgg6QofDroAK25e3V1uUZ7wZPccKo6+nfaFqmjdpNPbh+PlF
	E3wRc5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoM3i-0000000AX51-2eIb;
	Tue, 19 Aug 2025 13:07:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKHW-0000000AEuj-1uJj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:13:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D91375C5E60;
	Tue, 19 Aug 2025 11:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DB3C4CEF1;
	Tue, 19 Aug 2025 11:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755602013;
	bh=A+ClZFMba5OQu8qT/J08hiEW4Q53nfuS5azTNQ9i1c8=;
	h=From:To:Cc:Subject:Date:From;
	b=GgdKJWaZ2pNTWZrymGcdopualb+xGHE2jJQbioAWxgvRbAaPedFylqaZyXSaR7jX9
	 ZIEfjN2YBPr6pY1inDpBI5RUITo+z6JC0KJo83epVo8kF7qK7c4qCVtJIRhck2XP7c
	 6yfvsprIaTeqZV8zNbnVbqfC7UCJ7qe2TMtROLt0qrg5ArazPvHrRxmN08HXjKAwCg
	 1oZ/1tdQPwtKtBQuI6P4w1Xy35TLDZouBDkmL9Ogu1C9dOGhTAjCyGvAoBYunjuZLY
	 DFRByWTb0pOLYlOVQa2pgCHxWhUph/B1//pA+vSdY3zAI06Gq88+3nZUw2npzAXWtG
	 4dwJSlC/LCxAw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-j722s-main: add legacy PCIe interrupts
Date: Tue, 19 Aug 2025 13:13:17 +0200
Message-Id: <20250819111317.1082515-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_041334_528682_355F59FC 
X-CRM114-Status: GOOD (  13.05  )
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

The kernel will try to map the legacy interrupt pins, but the
interrupt mapping is missing from the device tree and thus that
fails with:

   pcieport 0000:00:00.0: of_irq_parse_pci: failed with rc=-22

Add the node for the legacy PCIe interrupts to fix that. This is just
compile-time tested.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index ab2e7b6eb98e..3e10b78d5bf3 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -119,7 +119,20 @@ pcie0_rc: pcie@f102000 {
 		cdns,no-bar-match-nbits = <64>;
 		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 		msi-map = <0x0 &gic_its 0x0 0x10000>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie0_intc 0>, /* INT A */
+				<0 0 0 2 &pcie0_intc 0>, /* INT B */
+				<0 0 0 3 &pcie0_intc 0>, /* INT C */
+				<0 0 0 4 &pcie0_intc 0>; /* INT D */
 		status = "disabled";
+
+		pcie0_intc: interrupt-controller {
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_EDGE_RISING>;
+		};
 	};
 
 	usbss1: usb@f920000 {
-- 
2.39.5


