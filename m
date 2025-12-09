Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B04D3B981
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCmuNRYqzxyrZnYoRdFbmkwgOStAUDsnYIq1rNUp/zM=; b=IO+BYwsMHhfiwsniV+FH2RlY4e
	FMTy/AXpQmQ+RDGgm+53ga0LMS6eRl8UcH3ASqoDITWCpEDC/cd6b+aKmIlLRxr+XYO5fqwcT7LqA
	ci5zVHZ5eYgKc8QKc62tjEYXHo0YKzk0Z5NpZrEl+GsuQEGN29RMyshzzeZNBzwDE4/zqstreKRib
	gVWAVncjJZRdP0P7dSXcRhDuV2K0VCUvB/YPMNEOt5m5FLG3orvT8pR0CWaeqlXi5eWYME3Z/5yWi
	IyaSeLJJSLwZOq0enEoyPouJqbm4gIh/GREeLwUDbA8t8JoNhgzXWA7jnBSOoUe/DeoPZfmc5pHo3
	TqjRyxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0g0-0000000EWmp-0uud;
	Tue, 09 Dec 2025 16:35:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fs-0000000EWZp-2IiP;
	Tue, 09 Dec 2025 16:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298089;
	bh=qX5XyIOYv+b2ax3FxX/MNYKL4WF0tdZx7pCW9mbbTu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ousl20UD79EU7W0z7h+GsoUC9VjnAn0LYw8LT7fF9Myf5cnecp4WRXkFRV8rJOCF6
	 8LowOd12XejKxJUi250kNd26RVUCi9hbCKEu6v1uoVEgOvpPOhe0hlr0hkUV+wET2u
	 BDtnoFlyemMPF2tfAmwsGJ4AI+HZU8tyoCWOeI/jLKzwMRX9VwYV2bWZRT2hBHgMsl
	 TfYZICVSFEUw/gyeY2wF/gqvmfkAHNcmgg/mzwgw4gB0xUorAEaTk+5wo8EV7AeTAN
	 b7extGuedJwEg5LEDBHlJ5iVTORHhGtDINsm+Ck5LmZltg17GWiDuO2UnTO60BPrzF
	 Y/JPN9jbOVgaA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7283A17E1546;
	Tue,  9 Dec 2025 17:34:48 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 17:34:35 +0100
Subject: [PATCH 05/12] arm64: dts: mediatek: mt8188: Add DPI1, HDMI, HDMI
 PHY/DDC nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-5-9a6106effba6@collabora.com>
References: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
In-Reply-To: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765298083; l=3935;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=kpw0b8yueUuZaNO1KJHETqOqEfGoas9Skta7fvnHXNY=;
 b=LyRMPXwXkll1igIAjdIQpOJKgCuJzMXdlw4ULyhAxCufAYRPyP0udq3DhJJEV8lQkqrfnuUWu
 tveqNf7T2XPAzL3r3YrewaP2twwKSQeTJtjwwJRIyp+3LLVwRHdyHEm
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083452_907255_1D31B53D 
X-CRM114-Status: UNSURE (   9.71  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add all of the nodes that are required to enable HDMI output,
including ones describing the HDMI PHY, Controller and DDC,
and the Digital Parallel Interface instance that is internally
connected to the HDMI Controller.

All of the added nodes are disabled by default as usage is
board dependent.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
[Louis-Alexis Eyraud: reworded subject and description]
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 90c388f1890f5139be6a9513c4cd9b683a501279..e2a17359e407f0bdd3ae6ef8ade668e67a9bd493 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -26,6 +26,7 @@ / {
 	aliases {
 		dp-intf0 = &dp_intf0;
 		dp-intf1 = &dp_intf1;
+		dpi1 = &dpi1;
 		dsc0 = &dsc0;
 		ethdr0 = &ethdr0;
 		gce0 = &gce0;
@@ -2038,6 +2039,19 @@ pcieport: pcie-phy@0 {
 			};
 		};
 
+		hdmi_phy: hdmi-phy@11d5f000 {
+			compatible = "mediatek,mt8188-hdmi-phy", "mediatek,mt8195-hdmi-phy";
+			reg = <0 0x11d5f000 0 0x100>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_HDMI_26M>;
+			clock-names = "pll_ref";
+			clock-output-names = "hdmi_txpll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			mediatek,ibias = <0xa>;
+			mediatek,ibias_up = <0x1c>;
+			status = "disabled";
+		};
+
 		mipi_tx_config0: dsi-phy@11c80000 {
 			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
 			reg = <0 0x11c80000 0 0x1000>;
@@ -3406,6 +3420,34 @@ merge5: merge@1c110000 {
 			mediatek,merge-fifo-en;
 		};
 
+		dpi1: dpi@1c112000 {
+			compatible = "mediatek,mt8188-dpi", "mediatek,mt8195-dpi";
+			reg = <0 0x1c112000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DPI1>,
+				 <&vdosys1 CLK_VDO1_DPI1_MM>,
+				 <&vdosys1 CLK_VDO1_DPI1_HDMI>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			resets = <&vdosys1 MT8188_VDO1_RST_DPI1_MM_CK>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dpi1_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+					dpi1_out: endpoint { };
+				};
+			};
+		};
+
 		dp_intf1: dp-intf@1c113000 {
 			compatible = "mediatek,mt8188-dp-intf";
 			reg = <0 0x1c113000 0 0x1000>;
@@ -3530,6 +3572,46 @@ padding7: padding@1c124000 {
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x4000 0x1000>;
 		};
 
+		hdmi: hdmi@1c300000 {
+			compatible = "mediatek,mt8188-hdmi-tx";
+			#sound-dai-cells = <1>;
+			reg = <0 0x1c300000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_HDMI_APB>,
+				 <&topckgen CLK_TOP_HDCP>,
+				 <&topckgen CLK_TOP_HDCP_24M>,
+				 <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>;
+			clock-names = "bus", "hdcp", "hdcp24m", "hdmi-split";
+			assigned-clocks = <&topckgen CLK_TOP_HDCP>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4_D8>;
+			interrupts = <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_HDMI_TX>;
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi";
+			status = "disabled";
+
+			hdmi_ddc: i2c {
+				compatible = "mediatek,mt8188-hdmi-ddc",
+					     "mediatek,mt8195-hdmi-ddc";
+				clocks = <&clk26m>;
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					hdmi0_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+					hdmi0_out: endpoint { };
+				};
+			};
+		};
+
+
 		edp_tx: edp-tx@1c500000 {
 			compatible = "mediatek,mt8188-edp-tx";
 			reg = <0 0x1c500000 0 0x8000>;

-- 
2.52.0


