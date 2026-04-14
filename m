Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A26CF9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20J7pBiYLtoZd6MdKHXxjIN2c5O9tLHXvvEZJVOIqQY=; b=VTb5QSp2PQ0OIiVUmuoM9oiGoj
	HLI0Uagq7cQlRnnCsJaVBKD0vdh510omSKmrTrUmNp3tNykgQWStlkPFoM5GKJCjpXkY4ZQNnNMEM
	Nwau+1kPilo8+pLNXrfd9d9nMvliiDT62DKRmArb6T2fN52g6w7ofCm/bHs8fGUjanNcT+bIpJSzt
	D6GGRbV4JpM3nHfPFO+OQ89bJ/bufopMNqL1sBz8WpkZA+DFu4mf9OsCD3wGdvp+lwrPQY49mxBp+
	ahY4s7XIIXSgt7dITLP/Ixehf5d1PGks5kkls2QGewZIsow3rZ1Xx6Ao5I0+l113Ss+QygOOpZVOW
	L3FkKHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcD0-0000000HFhS-0bR2;
	Tue, 14 Apr 2026 11:45:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcCu-0000000HFcN-2pFK;
	Tue, 14 Apr 2026 11:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776167126;
	bh=HVLzJGaJ0+BYeNYwP5IDRAFG2m2mw5RzVzYdIRE2r+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iKaU5fLCPy+7+iQS1BjodT5WeZ579OOE/zF8YqKrPGFbKzksfbiRuOuX+4lvEaGIi
	 +3EVMkSoyCBiRwYesoLUBaF1qXpG0TL55CPA5Z7UL165rA6nM6WEYWwwiKQQLtrXSu
	 qjls9RHOIfcg1bQ/EZgQTi0MZP3kqFMiOvz10421WgkVthcjArmMgm3exqXzoImvqW
	 bvVQMHPMA9uukU8ASXPUigssu3mDkB8MNI2+gjThnKMdVLX9UsxvPKgp0lSRGo3Zts
	 0Y+8cADATcPDuGGJ3x1hVp8vKYysYpnPiD9dAPzK6re5fezGTd+WUBPO68bxJ+VLJI
	 M/FqlIjQOasjA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65C5F17E131B;
	Tue, 14 Apr 2026 13:45:25 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 13:44:11 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-genio-common: add MT6315
 PMIC supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g1200-pmic-cleanup-v1-2-2a7193ed4e93@collabora.com>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776167122; l=1699;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=HVLzJGaJ0+BYeNYwP5IDRAFG2m2mw5RzVzYdIRE2r+g=;
 b=jKsSrPjR5En5euXaXG47WIqrPZRWhVQ/ExNlMTBa5iOqEg84E+ZLtn+U6OEBCCV/3IBO3PbWK
 T/0wmIobYTXDWqteTJy9euVEdtGwZp9AIto1dp8TLCPF6d1zE/iSe93
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_044528_858200_DEACD605 
X-CRM114-Status: UNSURE (   9.70  )
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

Mediatek Genio 1200-EVK board has two MT6315 PMICs, powered by the
board system power rail (VSYS) and connected to the SPMI interface.

Add VSYS regulator node for system power rail and the supply inputs of
these two PMICs.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 62c336e21500..01e153137a6f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -201,6 +201,14 @@ wifi_fixed_3v3: regulator-2 {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	/* system wide 4.2V power rail */
+	reg_vsys: regulator-vsys {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &adsp {
@@ -1238,6 +1246,11 @@ mt6315_6: pmic@6 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
 
+		pvdd1-supply = <&reg_vsys>;
+		pvdd2-supply = <&reg_vsys>;
+		pvdd3-supply = <&reg_vsys>;
+		pvdd4-supply = <&reg_vsys>;
+
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
 				regulator-name = "Vbcpu";
@@ -1254,6 +1267,11 @@ mt6315_7: pmic@7 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x7 SPMI_USID>;
 
+		pvdd1-supply = <&reg_vsys>;
+		pvdd2-supply = <&reg_vsys>;
+		pvdd3-supply = <&reg_vsys>;
+		pvdd4-supply = <&reg_vsys>;
+
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-name = "Vgpu";

-- 
2.53.0


