Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5EAC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omFehYc7Q33/qwXtTiF1IHrue6VFX/SX9lIYDRsjCbU=; b=0Lut3SBkMDfmE4+5tOLbEZOlXG
	EGE8L1ax63bAXqqSn0ER6Jm67Xh0l7XeGeP/hycjjE0iCuukN40HkvpxBqu4DTjP0E73DVnkqZwn3
	wtGTY7a2qkCiSj9SzuSY81c70HPNg7IULVWs7w8oJv/qe8OqDJu7OfzqkQg/cTThl1v3sEUNolmCH
	S2rh3qLKPWLOCt9ohUdUYj7YSoXOfnH5kXgfkQXkxw0jZaDHSef8UoO/i0g3Cu0mrl8XWYAUxU1TK
	w8P1YIGLMeGUdtFj3XQ9cFN7sSJ1tBGOq4/BiJo/kMgWWP5WjLWMdCXwLHXFCH1jV6YguCgcHNLN8
	TeWIecrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1gj-0000000Cwxn-113H;
	Fri, 25 Sep 2026 08:53:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1gh-0000000Cwwr-1Wds
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA10F6022F;
	Fri, 25 Sep 2026 08:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6E61F00893;
	Fri, 25 Sep 2026 08:53:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a78000: Add MSIOF nodes
Date: Fri, 25 Sep 2026 10:53:30 +0200
Message-ID: <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790325809.git.geert+renesas@glider.be>
References: <cover.1790325809.git.geert+renesas@glider.be>
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

Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
(MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 104 ++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 9a07753b221541ed..d75a9e43f772f871 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -1000,6 +1000,110 @@ mdlc_aon: system-controller@c1338000 {
 			bootph-all;
 		};
 
+		msiof0: spi@c1700000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1700000 0 0x100>;
+			interrupts = <GIC_ESPI 744 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x50>;
+			resets = <&mdlc_scp 0x50>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@c1710000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1710000 0 0x100>;
+			interrupts = <GIC_ESPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x51>;
+			resets = <&mdlc_scp 0x51>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@c1720000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1720000 0 0x100>;
+			interrupts = <GIC_ESPI 746 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x52>;
+			resets = <&mdlc_scp 0x52>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@c1730000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1730000 0 0x100>;
+			interrupts = <GIC_ESPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x53>;
+			resets = <&mdlc_scp 0x53>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof4: spi@c0600000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0600000 0 0x100>;
+			interrupts = <GIC_ESPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x4f>;
+			resets = <&mdlc_perw 0x4f>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof5: spi@c0608000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0608000 0 0x100>;
+			interrupts = <GIC_ESPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x50>;
+			resets = <&mdlc_perw 0x50>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof6: spi@c0610000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0610000 0 0x100>;
+			interrupts = <GIC_ESPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x51>;
+			resets = <&mdlc_perw 0x51>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof7: spi@c0618000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0618000 0 0x100>;
+			interrupts = <GIC_ESPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x52>;
+			resets = <&mdlc_perw 0x52>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		mdlc_cmnn: system-controller@ca410000 {
 			compatible = "renesas,r8a78000-mdlc";
 			reg = <0 0xca410000 0 0x1000>;
-- 
2.43.0


