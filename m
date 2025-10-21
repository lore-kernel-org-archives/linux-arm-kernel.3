Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB0ACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2A3cog2Se4Y8e8z5DY+lKAMo1gWthYiTVE6Wcpod04=; b=mJrspU+v/s/n9FcHuHZKVSJY9U
	D+BmteBGxUAq+uKmnu/mIyW7IEJ8DEoXeKh+3xdbjF0VLueSc6w8YWLip8n2cUticsYe6RSEbWwvY
	ZKaBGfu1p8lmGgzLY55VGRdw2AAmDnZ8sIe7PseELpuybds7KJLRJXIniTOeVBUiIeG5U7cc48es4
	QHxnLNVyjd+n0mfltEcGWiosdknSE0VgGi3KJQBJHNSE1PGQlpWe6kCo6U1lwITLoj+ovmbUVdkd0
	ZkT+gmvV6AwkDWuTQ0nJaINL3fsu0Cp6CZCtxVU9kE/7wDRJ238Fqs2F2jAWx/Pvt7DnQtLWNkCN0
	fhX3USPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6qc-0000000G4uo-0J3q;
	Tue, 21 Oct 2025 07:31:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6qW-0000000G4oM-23ef;
	Tue, 21 Oct 2025 07:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761031907;
	bh=u+G8Mt1dpRFClpUAKvKbFwgypYjcR8NzUmnmamS1YxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hy3dnRt3eGLK9sJNQcn2Pt6rxou3kv6Wfv2SP/N/THo1eNPYIzy9TRnq63NrEe4wM
	 3d0cKnRe9qgCTziRmCs+3GxI/w15CJl941+Z3ktXdfq/GWSexB2keIn2YeTgglJqQd
	 xQv04P2xssQLfgyP4AVJ/tJ20JJllo4EuuLKDjyNKJllhPKO271r3IS9m//4ynms0i
	 zl75+KqwwF7Qdq12kbfhNk46A+POCAp9k+aIDz6qJ9ubhe3tUMINsDzVQhIIdLZgYm
	 a3dI8YlQBaScUvg85jgXwWmLp6lFcqrzXqHEq88bJgmn2zWhnvevXiMw/L0tgWWDa8
	 9wBba5oa2yjVA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0EA417E1305;
	Tue, 21 Oct 2025 09:31:46 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 21 Oct 2025 09:30:52 +0200
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8365: Add GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-mt8365-enable-gpu-v2-2-17e05cff2c86@collabora.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761031905; l=2580;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=u+G8Mt1dpRFClpUAKvKbFwgypYjcR8NzUmnmamS1YxM=;
 b=y05pIlBN0LFY95ArJuuCsCuEONmMvdyrcfp3eGfkpqGJkcEnRG5trecSjXqSwe1G06oqT2A7H
 LCL+qahdJMeCBNOr/GGmvc/3avl+W9OykjeO9G1siKKpKZItu8jez8d
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_003152_680477_D0F0F19A 
X-CRM114-Status: GOOD (  11.02  )
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

The Mediatek MT8365 SoC has an integrated Arm Mali G52 MC1 GPU
(Bifrost).
Add gpu, OPP table, and MFG clock driver nodes in mt8365.dtsi to support
it using the Panfrost driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 +++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e6d2b3221a3b7a855129258b379ae4bc2fd05449..a5ca3cda6ef30d59a106222549dc15bcb6ce503d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -267,6 +267,26 @@ clk26m: oscillator {
 		clock-output-names = "clk26m";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-450000000 {
+			opp-hz = /bits/ 64 <450000000>;
+			opp-microvolt = <650000>;
+		};
+
+		opp-560000000 {
+			opp-hz = /bits/ 64 <560000000>;
+			opp-microvolt = <700000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -292,6 +312,27 @@ gic: interrupt-controller@c000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		mfgcfg: syscon@13000000 {
+			compatible = "mediatek,mt8365-mfgcfg", "syscon";
+			reg = <0 0x13000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		gpu: gpu@13040000 {
+			compatible = "mediatek,mt8365-mali", "arm,mali-bifrost";
+			reg = <0 0x13040000 0 0x4000>;
+
+			clocks = <&mfgcfg CLK_MFG_BG3D>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MFG>;
+			status = "disabled";
+		};
+
 		topckgen: syscon@10000000 {
 			compatible = "mediatek,mt8365-topckgen", "syscon";
 			reg = <0 0x10000000 0 0x1000>;
@@ -398,7 +439,7 @@ power-domain@MT8365_POWER_DOMAIN_CONN {
 					mediatek,infracfg = <&infracfg>;
 				};
 
-				power-domain@MT8365_POWER_DOMAIN_MFG {
+				mfg: power-domain@MT8365_POWER_DOMAIN_MFG {
 					reg = <MT8365_POWER_DOMAIN_MFG>;
 					clocks = <&topckgen CLK_TOP_MFG_SEL>;
 					clock-names = "mfg";

-- 
2.51.0


