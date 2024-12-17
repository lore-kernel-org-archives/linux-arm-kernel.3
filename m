Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C5FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcFZcjlJOep/8l7LtjklgvNKC15bse6OW+TbhR/p1x0=; b=w4ofyFCnLhVpXNEqHtpObXP/TH
	4LzqtORTXyak5LbInGJVrnO81LvcVePL+cmVFD3+WFr9OJzb0/KTQaI/IJ5WuW807l3rw832R1eD+
	VBm10aHdgVzfU9MQd6b/SpZVCkEQYVe1i43JZYeQf1pyppAjF7wQVy6TCtOPqEX2PMdv+zjYxVsT9
	7gu+zIRHydZCWGyFsl56U5qIfWi4TVPpdDJuI1G5zKuzqy6RHktpuURRYzBJbolvt5Z92JHh/1yWy
	DCESsbNU981oTOxGu0qM0Xvy4KsdGkgXyUagfcpOP1ajMC0HgAfFBIhDt3TaXTCYlvhfGpWzG1byG
	mrxtSnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU9j-0000000CyrJ-32XM;
	Tue, 17 Dec 2024 09:46:19 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdc-0000000Cr9Z-3FCD;
	Tue, 17 Dec 2024 09:13:10 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 75177100827;
	Tue, 17 Dec 2024 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcFZcjlJOep/8l7LtjklgvNKC15bse6OW+TbhR/p1x0=;
	b=mPfvDYcZMx2zZoxTK+XTVluWS0dIdC4zAE0M2MWyQWHEvelPbVkphCaiHTRfeqvm2dicfm
	ATESWCWhZcyfq8CDuP49/MyOi6JUt4GpmdFuQ/DVEHii2ZwXmRyHVZ4REWmZvqi9xg/DY1
	2gRc6eyzhrOHCAvfIFIq1VCCgg0paDc=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id B14FC10052A;
	Tue, 17 Dec 2024 09:13:06 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 22/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable pcie
Date: Tue, 17 Dec 2024 10:12:36 +0100
Message-ID: <20241217091238.16032-23-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ef1f3959-efcf-4e62-9204-a040f3477067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011308_952211_9C4F9680 
X-CRM114-Status: UNSURE (   9.37  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Enable the pci controllers on BPI-R4.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 20 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  8 ++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 4b1eaf818b66..d6f1fca3323c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -113,6 +113,26 @@ i2c_sfp2: i2c@2 {
 	};
 };
 
+/* mPCIe SIM2 */
+&pcie0 {
+	status = "okay";
+};
+
+/* mPCIe SIM3 */
+&pcie1 {
+	status = "okay";
+};
+
+/* M.2 key-B SIM1 */
+&pcie2 {
+	status = "okay";
+};
+
+/* M.2 key-M SSD */
+&pcie3 {
+	status = "okay";
+};
+
 &pio {
 	mdio0_pins: mdio0-pins {
 		mux {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 6f6a1a1c1d78..7a5e16a97476 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -373,7 +373,7 @@ mmc0: mmc@11230000 {
 			status = "disabled";
 		};
 
-		pcie@11280000 {
+		pcie2: pcie@11280000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
 			device_type = "pci";
@@ -411,7 +411,7 @@ pcie_intc2: interrupt-controller {
 			};
 		};
 
-		pcie@11290000 {
+		pcie3: pcie@11290000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
 			device_type = "pci";
@@ -449,7 +449,7 @@ pcie_intc3: interrupt-controller {
 			};
 		};
 
-		pcie@11300000 {
+		pcie0: pcie@11300000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
 			device_type = "pci";
@@ -487,7 +487,7 @@ pcie_intc0: interrupt-controller {
 			};
 		};
 
-		pcie@11310000 {
+		pcie1: pcie@11310000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
 			device_type = "pci";
-- 
2.43.0


