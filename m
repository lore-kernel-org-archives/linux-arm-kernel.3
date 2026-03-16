Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45956F53D86
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 18:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWt7h8gHa+M1e9isW0ffqqjy8H2ff0nk0SgNtygnz9k=; b=G5bLaRovdven0bMCXszFTavjYH
	HqWUqXJuK0n26mGbZQy6R7zgqPG2a5AQoShXdV62FUA7KpsVEbWxdwSH9KU/obPOg02xf/cBH1vhF
	39HB31QpS4MT/bqT8UD+/+G4e2RUN/KkoLqaJ27ee+WPRzI+53UFhajxwBLUsxZW6GxLznCEpG2ML
	jc13F93jQ1a6HDClpz5kZGd5ZKH1k1WbaaLGo4s7npgSBNjJdC7PsIVFU+MqpLzJFMvrlQLyO415C
	pRkc7Fg0R4XH1ZnQCiOKWJt60yV+JFwKBbcCGINQIfXzQIOU93OcFacdJJoQ3PWi24jIxybw1jAZB
	9bufb8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Cb1-00000004fru-06MK;
	Mon, 16 Mar 2026 18:23:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Cax-00000004fqB-1sEz;
	Mon, 16 Mar 2026 18:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773685391;
	bh=4dH9UQ/Y/hWeLPTbKSBpRwN52HqohB9Y7AqIn1h0Dx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xui+5kcVrdO0l0dkaQ7NbCdgSdW2VAQJM+5RS1/fXwh/SX7xvxjFf2SHud0L7lAGF
	 YTxMw/acJXH1MOZImOHI7Lu2AUzgqa/o5ikN6P/vO/JqexjkYmbT3hcuY2f4XNdtyk
	 YhryTunFTjy/ROeRREn0c1RmpRSE0W1Ntl5QHQdu9NVrWdiDR0SmemQ2bsoMAtGwpo
	 a0/87PCYzW6gEutMX49KFzU45PkMp+vXipSppcI06odAHl7hrd/T7Px9Ih/EFEBpxR
	 nHYRfShOBDz6VvO5CXrM977sBTntZ2Vrlu2INXbIxIkvWw27rfxTBgUSKdy9LaWgNi
	 7FRg8Q45HXXFg==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F87017E1380;
	Mon, 16 Mar 2026 19:23:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12669480028; Mon, 16 Mar 2026 19:23:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 19:23:01 +0100
Subject: [PATCH 2/2] arm64: dts: rockchip: Add SPDIF nodes to RK3576 device
 tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rk3576-spdif-v1-2-acb75088b560@collabora.com>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
In-Reply-To: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4648;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4dH9UQ/Y/hWeLPTbKSBpRwN52HqohB9Y7AqIn1h0Dx4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4So/gVYMrkePdwL9rdxDNwgd39fV1f1SYv
 2eEPAFT78bBFokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuEqPAAoJENju1/PI
 O/qapWMP/3PIG6oPr0grGiMDB8TpeQJ0ppmkrxqrRe4i7o643N690u6uahI1Lwt3/vXDY95XyXf
 +8yIN2++okLfkPRll0QTF+L+INslu4kpHBDgFf3135VW5SECcAXMUZja5DYPBruZNr/rHmQkm2U
 iSV2LjJ8jNSc92dEyyLMEIVJ6TSvMZsDouCtmo9B/yURT3NM3FbI3umm3wWev6srq+NynicNd9r
 6Jj5p9okRazQEbPcf3kbyud7uo2DvHqg78oRkgfbpeo7zqdtqiw9jMzy2oeZbtPnfQehus/NjOi
 3AstllPtqTKPDBphZtEVE3FAIMHqLmtrQttTimnDxKl0yMnQ2fNH+ASx3aDVuHzU0nQBwpjHgYc
 FoZBD3iQEP+n9qvws3J1MkRcqTNFm8xvyPBSQA+8jklkcJzCLKAqZOoHaQEEODNXyKvrXXcv4Um
 ipT2evOPSw+up81AFnwZw2fqS4uM8jKplqURdozn77hkygnhb4RXYtLBKiVJiQEg9Z8jlIWGu45
 Nw/FcjJf8F46LcmpxqARrbe3kUUQsq9wsuoKHW4EVclyFc0GNxtSRwMd0P6OjbKJA/fLeXok8yI
 wHm8eCx9tE8YQnTw30m4lEaYRgsrxkvyYQGxLw5C3HXGCwuKeUz935C2MIZw2ATcbYh5mDO243b
 QaFx+o9VjctN+V/XJB1Uzug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_112315_651588_26184E7E 
X-CRM114-Status: GOOD (  13.43  )
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

Add support for all six SPDIF transmitters found in the RK3576.
The nodes have been taken over from the BSP kernel and checked
against the TRM (power domain descriptions from chapter 6.3.2,
addresses from "Table 1-1 Address Mapping", interrupt from
"Table 1-3 RK3576 Interrupt Connection List" (TRM numbers are
off by 32 due to SGI/PPI not being numbered separately). The
TRM lacks a proper clock tree, but fortunately are quite obvious
for the SPDIF IP.

Note, that the RK3576 also has 3 SPDIF receivers, which need their
own binding and are not handled in this patch.

A typical use case for the SPDIF transmitters is audio support for
the Displayport (DP) controller. DP requires inserting PCUV control
bits, which requires software support when using I2S. The SPDIF IP
can add it automatically and thus is preferred.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 53ff6bd027af..b03dd69eca3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1379,6 +1379,19 @@ vop_mmu: iommu@27d07e00 {
 			status = "disabled";
 		};
 
+		spdif_tx2: spdif-tx@27d20000 {
+			compatible = "rockchip,rk3576-spdif", "rockchip,rk3568-spdif";
+			reg = <0x0 0x27d20000 0x0 0x1000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SPDIF_TX2>, <&cru HCLK_SPDIF_TX2>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 28>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO0>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		sai5: sai@27d40000 {
 			compatible = "rockchip,rk3576-sai";
 			reg = <0x0 0x27d40000 0x0 0x1000>;
@@ -1511,6 +1524,45 @@ dp0_out: port@1 {
 			};
 		};
 
+		spdif_tx3: spdif-tx@27ea0000 {
+			compatible = "rockchip,rk3576-spdif", "rockchip,rk3568-spdif";
+			reg = <0x0 0x27ea0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SPDIF_TX3>, <&cru HCLK_SPDIF_TX3>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac2 29>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		spdif_tx4: spdif-tx@27eb0000 {
+			compatible = "rockchip,rk3576-spdif", "rockchip,rk3568-spdif";
+			reg = <0x0 0x27eb0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SPDIF_TX4>, <&cru HCLK_SPDIF_TX4>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 6>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		spdif_tx5: spdif-tx@27ec0000 {
+			compatible = "rockchip,rk3576-spdif", "rockchip,rk3568-spdif";
+			reg = <0x0 0x27ec0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SPDIF_TX5>, <&cru HCLK_SPDIF_TX5>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 25>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_VO1>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		sai7: sai@27ed0000 {
 			compatible = "rockchip,rk3576-sai";
 			reg = <0x0 0x27ed0000 0x0 0x1000>;
@@ -2166,6 +2218,36 @@ &sai4m0_sdi
 			status = "disabled";
 		};
 
+		spdif_tx0: spdif-tx@2a670000 {
+			compatible = "rockchip,rk3576-spdif", "rockchip,rk3568-spdif";
+			reg = <0x0 0x2a670000 0x0 0x1000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SPDIF_TX0>, <&cru HCLK_SPDIF_TX0>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac0 5>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spdifm0_tx0>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		spdif_tx1: spdif-tx@2a680000 {
+			compatible = "rockchip,rk3576-spdif", "rockchip,rk3568-spdif";
+			reg = <0x0 0x2a680000 0x0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru MCLK_SPDIF_TX1>, <&cru HCLK_SPDIF_TX1>;
+			clock-names = "mclk", "hclk";
+			dmas = <&dmac1 5>;
+			dma-names = "tx";
+			power-domains = <&power RK3576_PD_AUDIO>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spdifm0_tx1>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@2a701000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0x2a701000 0 0x10000>,

-- 
2.51.0


