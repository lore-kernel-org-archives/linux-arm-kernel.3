Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCA8C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mn6pcPJBp4ApPTBGpIpw2vCHYVHSs54t1w5bAQYaC4=; b=TZP2RlfwVyYj9+eETlNwFMDk4g
	t0++fw3w/KngQFQWk10BMD+Mvai+eW94feNfpKvcKYwU7UJZDMZT3zSqbEEEWCNGCms8id1iQkocm
	kUlGpxv4ebGxNGf/pnHJxvJJefDRPDSQgoYLIRtwvTJ/8q+43wg2YJ5GAMshs5Mjg7px+t1HOUfTO
	24eSndYMUtd30vO6F5d0h5BTFTtov8BXLddU1g17bG3X4DejS6Byaw5omnhO9aAhfGz9WOStL8zF6
	9R8stzjU+WwX8W1Wzxrf7Q9nJX4bYk5baWCVgX7Y3oNxQe3GCV41v5SKbk7iVPSHXnhDQGAUdL4Cx
	iLy5npbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iHW-0000000EMTL-3a3M;
	Wed, 02 Sep 2026 10:33:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iHS-0000000EMQR-1TCE;
	Wed, 02 Sep 2026 10:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788345196;
	bh=RWSRig3pEVMzsYGesmOpivAJXUThe/cZY50LLkR/vVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GsNmnDEja+/dvsAD/Byoo+V8kmTBCxw39zVyIdMfVNAqqNRkQKZFnUuIUyBKBzSns
	 Irg/yufqQovUVxekvB+mxWh13B9Qh14AaLsn/8YnfxlcE5G6llwE/87bLylJTKrZcp
	 Ui5fz+azhFf73xLUl5QyfihyuVde5JIX3sWZCgFECsey8nG38gtvSOVD7Y8AHF+R0Q
	 am2mEpFm5nqUJqT2ZYs9gRSJZOimtkzNmwbwNno/YBc3UKKaTvLS8aqlZ1dPJ7si3z
	 I2V3ymCkQ6qRNK23fA23OQXVZlS4dPs6vZB8Bfxor+hT/47hKx/yeNDEsyJr0w9JZi
	 kIeaYZw0CUQeg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A52DF17E0DE8;
	Wed, 02 Sep 2026 12:33:15 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 02 Sep 2026 12:32:44 +0200
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8195: Align ufshci node to
 dt-bindings changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mediatek-ufs-cleanup-dts-v1-1-7876e7a27a9d@collabora.com>
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788345194; l=2631;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=RWSRig3pEVMzsYGesmOpivAJXUThe/cZY50LLkR/vVg=;
 b=cDdCVSWaq4OT1Hmpzki3SR7PXBlNI28UIgCYCTTZup3GH5TN/84kFEiKNGs3tm2XetaMSYGYr
 UYEn/GTMQ70DoRtm68+MN8s146JXz1ljcHWiAMETKAGaaTbDp26zK2x
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_033322_554292_81799B91 
X-CRM114-Status: GOOD (  11.45  )
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

The MT8195 UFS host controller dt bindings now describe several extra
required clocks that were previously missing from clock description
and deprecates the freq-table-hz property use in favour of
operating-points-v2 instead.

So, add in ufshci node the rx_symbol clocks in clock list and replace
freq-table-hz property by operating-points-v2 one with a valid OPP
table.
Also reorder properties in node.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 35 ++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..c859f4283388 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1472,8 +1472,7 @@ mmc2: mmc@11250000 {
 		ufshci: ufshci@11270000 {
 			compatible = "mediatek,mt8195-ufshci";
 			reg = <0 0x11270000 0 0x2300>;
-			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&ufsphy>;
+
 			clocks = <&infracfg_ao CLK_INFRA_AO_AES_UFSFDE>,
 				 <&infracfg_ao CLK_INFRA_AO_AES>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_TICK>,
@@ -1481,17 +1480,31 @@ ufshci: ufshci@11270000 {
 				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_TICK>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_MP_SAP_B>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_TX_SYMBOL>,
-				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>;
-			clock-names = "ufs", "ufs_aes", "ufs_tick",
-					"unipro_sysclk", "unipro_tick",
-					"unipro_mp_bclk", "ufs_tx_symbol",
-					"ufs_mem_sub";
-			freq-table-hz = <0 0>, <0 0>, <0 0>,
-					<0 0>, <0 0>, <0 0>,
-					<0 0>, <0 0>;
-
+				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>,
+				 <&topckgen CLK_TOP_UFS_RX_SYMBOL>,
+				 <&topckgen CLK_TOP_UFS_RX_SYMBOL1>;
+			clock-names = "main", "aes", "tick", "unipro_sysclk",
+				      "unipro_tick", "unipro_mp_bclk",
+				      "tx_symbol", "mem_sub", "rx_symbol0",
+				      "rx_symbol1";
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+			operating-points-v2 = <&ufs_opp_table>;
+			phys = <&ufsphy>;
 			mediatek,ufs-disable-mcq;
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-26000000 {
+					opp-hz = /bits/ 64 <26000000>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+				};
+			};
 		};
 
 		lvts_mcu: thermal-sensor@11278000 {

-- 
2.55.0


