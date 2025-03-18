Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9317EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzinidswk0/weqzLwAiyI4S8kkx9Uwp/rDUb5IqXKOA=; b=qRrTcWpMkOGyw3MUJEA4amnBT7
	5egaEGVHJF6mW7bCXDTO97RjfX83n5daDMDoK9b3yNYxpc9Sfoijk+CeOS6SQkliw2RXgyzqA53LC
	0cKf6ScNRHeiwqNUpJAw9uhvGn5kNMRA4V4FvjUmTRCUsaY3CMWbBVDWqDrO3Pbs4RwsQrnwEr67V
	Rlgkr3zKakicHbPOfg5IH/+YlYIm6v4YcfECIRn4K4J2s/EUX7ayE97U6uLvbOVWk8AI0pTwwdrxL
	1ta9d9DknfKFvq+QeQ8vpqeTPVTV2YJ4gyWi7jdkwr9XZn0rGmNxvp8TZyDimrbwPWdZ4lrr5OoSL
	OMHnphZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufT8-00000007GB3-2Qfe;
	Tue, 18 Mar 2025 22:31:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufMb-00000007FB3-2NKe;
	Tue, 18 Mar 2025 22:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336684;
	bh=zddfv7Unlpv7e7XjDPUtNK+iuLo3QIUPOxRhAKw0r+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T3mN/OX8hYgd1KewZ7noslsjjuGUgedtWb7ODGQDv6UlWn0o4DhrUihcJn/qoAdvK
	 vKBXVSCpLarFOW7oRTj9iKF/SX4dIPjVdBt3xD+ao/DcThuVbA0bR/USZ2gbJqdZDe
	 xa6TAJ9WSJjDLmXWlHz6bNpFgFRxb3Fzy/HFmrXdcC4e//r64CR2+B2M3NJG52oh8I
	 YwUSaOR8HdFxKyPJkOhqJW7brPA5X/Va9L1yzvj+/DxtlDJLhji5fX204N2LuseZhJ
	 xJwJT4j70KfPcdsyL19xpCTkqTWZPeJt45k9O0dx4e72QsVNC+OLAtHjiPQ0MtXXnl
	 1ox0e7XJnXIxQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B7A217E09F6;
	Tue, 18 Mar 2025 23:24:41 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Mar 2025 18:22:17 -0400
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8188: Describe SCP as a
 cluster with two cores
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-scp-dual-core-mt8390-v1-3-8733e192cc73@collabora.com>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_152445_892621_C9DDD7A5 
X-CRM114-Status: GOOD (  10.73  )
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

The SCP is currently described in the Devicetree as a single-core
processor, but really it is a cluster with two cores. Describe the full
cluster but enable only core0 on the current mt8188 platforms since
that's the only one usable with the upstream firmware.

Co-developed-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Co-developed-by: Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
Signed-off-by: Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts        |  6 +++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 36 ++++++++++++++++------
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  6 +++-
 3 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
index f89835ac36f36f86e2054ae0c332172be97b049a..f4c207d65b877e1eefaa26540446c3c06369ca21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
@@ -331,7 +331,11 @@ &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
-&scp {
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
 	memory-region = <&scp_mem_reserved>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 4437b1820f2685281c3a373bf626f72b53503e62..bea3cee9b8e8f0dc656edd85e63f4f6f6645607f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1382,12 +1382,30 @@ gce1: mailbox@10330000 {
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
 		};
 
-		scp: scp@10500000 {
-			compatible = "mediatek,mt8188-scp";
-			reg = <0 0x10500000 0 0x100000>,
-			      <0 0x10720000 0 0xe0000>;
-			reg-names = "sram", "cfg";
-			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+		scp_cluster: scp@10720000 {
+			compatible = "mediatek,mt8188-scp-dual";
+			reg = <0 0x10720000 0 0xe0000>;
+			reg-names = "cfg";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x10500000 0x100000>;
+			status = "disabled";
+
+			scp_c0: scp@0 {
+				compatible = "mediatek,scp-core";
+				reg = <0x0 0xd0000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			scp_c1: scp@d0000 {
+				compatible = "mediatek,scp-core";
+				reg = <0xd0000 0x2f000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
 		};
 
 		afe: audio-controller@10b10000 {
@@ -2249,7 +2267,7 @@ dma-controller@14001000 {
 			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
 					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 		};
 
 		display@14002000 {
@@ -2704,7 +2722,7 @@ video_decoder: video-decoder@18000000 {
 			iommus = <&vpp_iommu M4U_PORT_L23_HW_VDEC_UFO_ENC_EXT>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 
 			video-codec@10000 {
 				compatible = "mediatek,mtk-vcodec-lat";
@@ -2828,7 +2846,7 @@ video_encoder: video-encoder@1a020000 {
 				 <&vdo_iommu M4U_PORT_L19_VENC_SUB_W_LUMA>,
 				 <&vdo_iommu M4U_PORT_L19_VENC_SUB_R_LUMA>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VENC>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 		};
 
 		jpeg_encoder: jpeg-encoder@1a030000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 60139e6dffd8e0e326690d922f3360d829ed026b..65952bcf5d03e3b22984dd3e997e7107e74dac72 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1055,7 +1055,11 @@ power-key {
 	};
 };
 
-&scp {
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
 	memory-region = <&scp_mem>;
 	status = "okay";
 };

-- 
2.49.0


