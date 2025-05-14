Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FB5C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcxj34XQcV42Az5rrgXQ70Ua4QWjeMWheZ1dGwJRy+I=; b=tei5hVSZVrR2ht9GRFHHD6fSe+
	OUFeBvtfEZpdmQGx4hSTIQ8FBB63XM/jFi0cEp/lVgNlPIlluDRjN5o/Tego1UyIBlhTWR4tswWf1
	hYPCjquyfat4rv0IGbay6cCwOky9rDDcJB0roWCq1X8pX5fU7oJLEkZ3bJZZ+W1XGuEMXoZTYS/ki
	vX77c9cDxNw7MQ7/q9KmE3aXNLSC7B38FN8MkFXG9zCY3yC7usHqy37YsNTFswT4mB4j/kmHGJXOJ
	epYISVEInu8oTyMHKPlgoXk6o74w2VC7+nftvKi202pWxC5tw4sPKWaXMJurj1jgiXQuLtxJe+RMu
	N/rKMz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3z-0000000F0US-3482;
	Wed, 14 May 2025 12:18:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8KU-0000000Eec3-1dbM;
	Wed, 14 May 2025 09:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747214588;
	bh=ah8+8P/PfzX/0kPiZRxkWdrUTZdj+/r/e9JqURY6yMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ha8VZ5iW/q/LYCSxhqfgQGboOrfMa3CuYZPHdKE7aqk7mvFDYpPXD5888WY4ypAWr
	 cMWrMOJVZ5WogJ1Ls8zUraR4KMbYCetQpAzBnaTLpUxTWlpy/7D0DurndZGJgqzHrk
	 HeZxyw6bEHHh6WyE3Ui5R9UO+1P0iN5ZkfzUXt90v5D6ZxCYQ6QHy8TiG14muuxX/C
	 Hi1/NfikFeowU4NMQ76tfe9SkpubAkBYn0bJiXmYfT621N17j6srN4hqJpPItaWaFr
	 oYEA3KFSrffpTkZYAPFxgG+4VfAcUnxxQME4Iu7RYu+XI+75chyBZ4I2mISKj6BGjt
	 7qO7Rm/jpji+Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 485E617E09F5;
	Wed, 14 May 2025 11:23:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
Date: Wed, 14 May 2025 11:22:59 +0200
Message-ID: <20250514092259.47035-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
References: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_022310_720946_95DC635F 
X-CRM114-Status: UNSURE (   7.92  )
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

Add all of the Multimedia Data Path 3 (MDP3) related nodes
including its Mutex instances, one for each VPPSYS block, and
all of its DMA controllers, Film Grain (FG), HDR, Adaptive Ambient
Light (AAL), Frame Resizer (RSZ), Tone Curve Conversion (TCC),
Two-Dimensional Sharpness (TDSHP), and others, enabling the entire
MDP3 macro-block.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 299 +++++++++++++++++++++++
 1 file changed, 299 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 29d35ca94597..55260357ac66 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2224,6 +2224,118 @@ vppsys0: syscon@14000000 {
 			#clock-cells = <1>;
 		};
 
+		dma-controller@14001000 {
+			compatible = "mediatek,mt8188-mdp3-rdma";
+			reg = <0 0x14001000 0 0x1000>;
+			#dma-cells = <1>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>;
+			mboxes = <&gce0 13 CMDQ_THR_PRIO_1>,
+				 <&gce0 14 CMDQ_THR_PRIO_1>,
+				 <&gce0 16 CMDQ_THR_PRIO_1>,
+				 <&gce0 21 CMDQ_THR_PRIO_1>,
+				 <&gce0 22 CMDQ_THR_PRIO_1>;
+			iommus = <&vpp_iommu M4U_PORT_L4_MDP_RDMA>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
+					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
+			mediatek,scp = <&scp>;
+		};
+
+		display@14002000 {
+			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
+			reg = <0 0x14002000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
+		};
+
+		display@14004000 {
+			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
+			reg = <0 0x14004000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
+		};
+
+		display@14005000 {
+			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
+			reg = <0 0x14005000 0 0x1000>;
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
+		};
+
+		display@14006000 {
+			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14006000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_RSZ>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RSZ_IN_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP0_MDP_RSZ_FRAME_DONE>;
+		};
+
+		display@14007000 {
+			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
+			reg = <0 0x14007000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
+		};
+
+		display@14008000 {
+			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
+			reg = <0 0x14008000 0 0x1000>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x8000 0x1000>;
+		};
+
+		display@14009000 {
+			compatible = "mediatek,mt8188-mdp3-ovl", "mediatek,mt8195-mdp3-ovl";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
+			iommus = <&vpp_iommu M4U_PORT_L4_MDP_OVL>;
+		};
+
+		display@1400a000 {
+			compatible = "mediatek,mt8188-mdp3-padding", "mediatek,mt8195-mdp3-padding";
+			reg = <0 0x1400a000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_PADDING>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
+		};
+
+		display@1400b000 {
+			compatible = "mediatek,mt8188-mdp3-tcc", "mediatek,mt8195-mdp3-tcc";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
+		};
+
+		display@1400c000 {
+			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x1400c000 0 0x1000>;
+			#dma-cells = <1>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_WROT>;
+			iommus = <&vpp_iommu M4U_PORT_L4_MDP_WROT>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xc000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_WROT_SOF>,
+					      <CMDQ_EVENT_VPP0_MDP_WROT_VIDO_WDONE>;
+		};
+
+		mutex@1400f000 {
+			compatible = "mediatek,mt8188-vpp-mutex";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xf000 0x1000>;
+		};
+
 		vpp_smi_common: smi@14012000 {
 			compatible = "mediatek,mt8188-smi-common-vpp";
 			reg = <0 0x14012000 0 0x1000>;
@@ -2255,6 +2367,184 @@ vpp_iommu: iommu@14018000 {
 			mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb7 &larb23>;
 		};
 
+		dma-controller@14f09000 {
+			compatible = "mediatek,mt8188-mdp3-rdma";
+			reg = <0 0x14f09000 0 0x1000>;
+			#dma-cells = <1>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RDMA>;
+			iommus = <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_RDMA>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x9000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_FRAME_DONE>;
+		};
+
+		dma-controller@14f0a000 {
+			compatible = "mediatek,mt8188-mdp3-rdma";
+			reg = <0 0x14f0a000 0 0x1000>;
+			#dma-cells = <1>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RDMA>;
+			iommus = <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_RDMA>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xa000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_FRAME_DONE>;
+		};
+
+		display@14f0c000 {
+			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
+			reg = <0 0x14f0c000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_FG>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xc000 0x1000>;
+		};
+
+		display@14f0d000 {
+			compatible = "mediatek,mt8188-mdp3-fg", "mediatek,mt8195-mdp3-fg";
+			reg = <0 0x14f0d000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_FG>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xd000 0x1000>;
+		};
+
+		display@14f0f000 {
+			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
+			reg = <0 0x14f0f000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_HDR>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xf000 0x1000>;
+		};
+
+		display@14f10000 {
+			compatible = "mediatek,mt8188-mdp3-hdr", "mediatek,mt8195-mdp3-hdr";
+			reg = <0 0x14f10000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_HDR>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0 0x1000>;
+		};
+
+		display@14f12000 {
+			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
+			reg = <0 0x14f12000 0 0x1000>;
+			interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_AAL>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x2000 0x1000>;
+		};
+
+		display@14f13000 {
+			compatible = "mediatek,mt8188-mdp3-aal", "mediatek,mt8195-mdp3-aal";
+			reg = <0 0x14f13000 0 0x1000>;
+			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_AAL>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x3000 0x1000>;
+		};
+
+		display@14f15000 {
+			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14f15000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x5000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_FRAME_DONE>;
+		};
+
+		display@14f16000 {
+			compatible = "mediatek,mt8188-mdp3-rsz", "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14f16000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_FRAME_DONE>;
+		};
+
+		display@14f18000 {
+			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
+			reg = <0 0x14f18000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_TDSHP>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x8000 0x1000>;
+		};
+
+		display@14f19000 {
+			compatible = "mediatek,mt8188-mdp3-tdshp", "mediatek,mt8195-mdp3-tdshp";
+			reg = <0 0x14f19000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_TDSHP>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x9000 0x1000>;
+		};
+
+		display@14f1a000 {
+			compatible = "mediatek,mt8188-mdp3-merge", "mediatek,mt8195-mdp3-merge";
+			reg = <0 0x14f1a000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xa000 0x1000>;
+		};
+
+		display@14f1b000 {
+			compatible = "mediatek,mt8188-mdp3-merge", "mediatek,mt8195-mdp3-merge";
+			reg = <0 0x14f1b000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_MERGE>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xb000 0x1000>;
+		};
+
+		display@14f1d000 {
+			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
+			reg = <0 0x14f1d000 0 0x1000>;
+			interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_COLOR>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xd000 0x1000>;
+		};
+
+		display@14f1e000 {
+			compatible = "mediatek,mt8188-mdp3-color", "mediatek,mt8195-mdp3-color";
+			reg = <0 0x14f1e000 0 0x1000>;
+			interrupts = <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_COLOR>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xe000 0x1000>;
+		};
+
+		display@14f21000 {
+			compatible = "mediatek,mt8188-mdp3-padding",
+				     "mediatek,mt8195-mdp3-padding";
+			reg = <0 0x14f21000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_PAD>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x1000 0x1000>;
+		};
+
+		display@14f22000 {
+			compatible = "mediatek,mt8188-mdp3-padding",
+				     "mediatek,mt8195-mdp3-padding";
+			reg = <0 0x14f22000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_PAD>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x2000 0x1000>;
+		};
+
+		display@14f24000 {
+			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x14f24000 0 0x1000>;
+			#dma-cells = <1>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_WROT>;
+			iommus = <&vdo_iommu M4U_PORT_L5_SVPP2_MDP_WROT>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x4000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_FRAME_DONE>;
+		};
+
+		display@14f25000 {
+			compatible = "mediatek,mt8188-mdp3-wrot", "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x14f25000 0 0x1000>;
+			#dma-cells = <1>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_WROT>;
+			iommus = <&vpp_iommu M4U_PORT_L6_SVPP3_MDP_WROT>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x5000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_FRAME_DONE>;
+		};
+
 		wpesys: clock-controller@14e00000 {
 			compatible = "mediatek,mt8188-wpesys";
 			reg = <0 0x14e00000 0 0x1000>;
@@ -2284,6 +2574,15 @@ vppsys1: syscon@14f00000 {
 			#clock-cells = <1>;
 		};
 
+		mutex@14f01000 {
+			compatible = "mediatek,mt8188-vpp-mutex";
+			reg = <0 0x14f01000 0 0x1000>;
+			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x1000 0x1000>;
+		};
+
 		larb5: smi@14f02000 {
 			compatible = "mediatek,mt8188-smi-larb";
 			reg = <0 0x14f02000 0 0x1000>;
-- 
2.49.0


