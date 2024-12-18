Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319E2E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L0KoZZLbfG4xP5IMoNb82ijioLLjSorm1hScwUhK2dA=; b=BjxHXZUpVOqOeB2BUCXYypCvXR
	+nhHq4IeorxtSeOH4u9ey2mo+aykJmCd/gr+5dLck+ZNpRXkS3TfjaGs+IlMPiMvXuNYFNAytsTo7
	xirs91CXzU5Iv7vYWqfmjQ2dA2u+33dBHo6gPqsYtKlH/Dj7LI4Dr8I3g3KfKytlfVvB2H8MK+cMH
	7zD0zeCiBnbSyhkTlw66NvfMOySsqt8dot36JR9Jh+PiweABSeYjqiRFW+PwpUJvRAt2jjiFTwqFD
	pzjSy45mJV+WDh4CvajZe2LAdQXchVLHSSnw6/nFTP0+qYsQY1RWIuaHwLnBKO2mgeHJjtsIT8P5L
	1sJQP6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrlm-0000000GNDt-3Xvl;
	Wed, 18 Dec 2024 10:59:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrgs-0000000GLDY-3AXA;
	Wed, 18 Dec 2024 10:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519245;
	bh=lwa2Aanvu6wwjTw0UAbbus9QalNA9gO3+PoHt/GT5XQ=;
	h=From:To:Cc:Subject:Date:From;
	b=eeH5vW/0G8EO1jJeMkoLkYW4J8aP/VE9sgVvobyXuae49rwS4jW8lD6ojjOYPZZmI
	 E6EXtSLSo0uaJDc6GfHvUJ3mJE5IF7jkN4gPnOcNr9+W2pUou06P1U2OOyV6OF4WkX
	 BLS9XCIQuSsvM36v6HY42d89nfjLWfK1sJy8+VrnLfLraHT1JuJuzVCQBTac8381HY
	 3Tbbq7HBLREtm0mEPFl9/7LmX7TDHM/Z2VjOr9oR6xZYhBd7MiJQVUEWFnBSIy+tiu
	 GJHiqDbQhzaUo7bTYLEwuveBr7q0EbDFEY/juj2pvs4CSY1hx9dBoi517ZJDGf6+2U
	 wSy377bOKDL5g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B85D17E3612;
	Wed, 18 Dec 2024 11:54:04 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH] arm64: dts: mediatek: mt8188: Add VDO0's DSC and MERGE block nodes
Date: Wed, 18 Dec 2024 11:53:56 +0100
Message-ID: <20241218105356.39111-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025406_960734_1B07BDF8 
X-CRM114-Status: UNSURE (   8.80  )
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

Add nodes for the DSC0 and MERGE0 blocks, located in VDOSYS0 and
necessary to add support for Display Stream Compression with a
display pipeline that looks like:

    [other components] -> DSC0 -> MERGE0 -> Display Interface

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 137bd39808ea..6ef385072c9f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -26,9 +26,11 @@ / {
 	aliases {
 		dp-intf0 = &dp_intf0;
 		dp-intf1 = &dp_intf1;
+		dsc0 = &dsc0;
 		ethdr0 = &ethdr0;
 		gce0 = &gce0;
 		gce1 = &gce1;
+		merge0 = &merge0;
 		merge1 = &merge1;
 		merge2 = &merge2;
 		merge3 = &merge3;
@@ -2880,6 +2882,15 @@ disp_dsi0: dsi@1c008000 {
 			status = "disabled";
 		};
 
+		dsc0: dsc@1c009000 {
+			compatible = "mediatek,mt8188-disp-dsc", "mediatek,mt8195-disp-dsc";
+			reg = <0 0x1c009000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x9000 0x1000>;
+		};
+
 		disp_dsi1: dsi@1c012000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c012000 0 0x1000>;
@@ -2895,6 +2906,17 @@ disp_dsi1: dsi@1c012000 {
 			status = "disabled";
 		};
 
+		merge0: merge0@1c014000 {
+			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c014000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>,
+				 <&vdosys1 CLK_VDO1_MERGE_VDO1_DL_ASYNC>;
+			clock-names = "merge", "merge_async";
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0x4000 0x1000>;
+		};
+
 		dp_intf0: dp-intf@1c015000 {
 			compatible = "mediatek,mt8188-dp-intf";
 			reg = <0 0x1c015000 0 0x1000>;
-- 
2.46.1


