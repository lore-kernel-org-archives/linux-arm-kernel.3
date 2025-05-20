Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E34C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SdcnrUmWq7v6a3i92pL8fQL4v54u0gfSQOAZg2wF6X8=; b=T88lQQ6ljRjQlBL+3oaqBg1q6T
	9qANZ0nsZpKHzBz9UHu9X8mMmdr3194yib322jsX6i8LeLBiKc0EafcZTOu5LItG1jerBlowrGywm
	saEKGYZ3I11tHr4sppIgs30uCOt+3TfTQd9mIXgkOK/s8IGK1OFL/+892FqB7LsIW9lyQxJqQL5Kf
	ilsyUG9HuXvnDc1h/0p8jneHvSdNo+SClvEXiCJGySaxzo2a3iVCrXglIYTIrsE42ec3ccziLFymW
	EfONeO/K7gZrTsStTqQa8gHvbN03xjIDmOz+mraBBZOurtvNzs9HmljbxN4ALG5m54bJL3n/2j8Lr
	//Xw+44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNGH-0000000D3Bn-49KY;
	Tue, 20 May 2025 13:44:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNEB-0000000D2zY-3kAg;
	Tue, 20 May 2025 13:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76C36A4EA80;
	Tue, 20 May 2025 13:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF75C4CEE9;
	Tue, 20 May 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747748513;
	bh=aF9DEQjUc4Qwge2M0Bizos2dw0TZnxr1SLShOtIxmfs=;
	h=From:Date:Subject:To:Cc:From;
	b=rFmrfRJKFsr5GIgctEUfS0qkuxKMbUtxBFt1UH6ndA/NAjfoZACEau5FExCWGFkfE
	 WcCYydLLrzXWe/gpTax6YixO7E8VZTaicuDCA3IgZ8a9BCncIOZ0VlsEcnv3D0xr1w
	 XzhZNps+u4Fzvs0OAmonW4ckmGKS6zhHPDhul+lcn7HiVQ3YVdcPSNKezX7eaJnyvp
	 qObncCv2wTHUFkB76LgzwEWvJtUByvdt8/w9MAvC/op4IAPqqHfhqMTpXqtXux1yOU
	 Nqrs6td/3zqzrfHmOn4nIbNNjRfOuy4hNz804d7ICBP6YuGKRv5+fqjhd0kNmA0QOT
	 vGPW33t/rkNqg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 20 May 2025 15:41:35 +0200
Subject: [PATCH] arm64: dts: airoha: en7581: Add ethernet nodes to EN7581
 SoC evaluation board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-en7581-net-v1-1-5317f8e829ad@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI6GLGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMD3dQ8c1MLQ9281BJdkxSLNKOklOQ04yRTJaCGgqLUtMwKsGHRsbW
 1ANCnKgZcAAAA
X-Change-ID: 20250520-en7581-net-4d8f2bdcf3b5
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_064156_066385_DCB152D9 
X-CRM114-Status: UNSURE (   8.47  )
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

Introduce ethernet controller nodes to EN7581 SoC and EN7581 evaluation
board.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts |  8 +++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 49 +++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 99d2c4f1fc5a9638f551c6d725eeea568943cc68..dae9968a4ff68e8b34d02b237a168a80d184bcb0 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -98,3 +98,11 @@ &pcie1 {
 &i2c0 {
 	status = "okay";
 };
+
+&eth {
+	status = "okay";
+};
+
+&gdm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 536ece69b935add88fb73ca6bd3f1ecd842cad7a..ff6908a76e8eb6cf91343495d1fe531a868e41fb 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -346,5 +346,54 @@ i2c1: i2c@1fbf8100 {
 
 			status = "disabled";
 		};
+
+		eth: ethernet@1fb50000 {
+			compatible = "airoha,en7581-eth";
+			reg = <0 0x1fb50000 0 0x2600>,
+			      <0 0x1fb54000 0 0x2000>,
+			      <0 0x1fb56000 0 0x2000>;
+			reg-names = "fe", "qdma0", "qdma1";
+
+			resets = <&scuclk EN7581_FE_RST>,
+				 <&scuclk EN7581_FE_PDMA_RST>,
+				 <&scuclk EN7581_FE_QDMA_RST>,
+				 <&scuclk EN7581_XSI_MAC_RST>,
+				 <&scuclk EN7581_DUAL_HSI0_MAC_RST>,
+				 <&scuclk EN7581_DUAL_HSI1_MAC_RST>,
+				 <&scuclk EN7581_HSI_MAC_RST>,
+				 <&scuclk EN7581_XFP_MAC_RST>;
+			reset-names = "fe", "pdma", "qdma",
+				      "xsi-mac", "hsi0-mac", "hsi1-mac",
+				      "hsi-mac", "xfp-mac";
+
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gdm1: ethernet@1 {
+				compatible = "airoha,eth-mac";
+				reg = <1>;
+				phy-mode = "internal";
+				status = "disabled";
+
+				fixed-link {
+					speed = <10000>;
+					full-duplex;
+					pause;
+				};
+			};
+		};
 	};
 };

---
base-commit: 357bbde68e750ea3da2450c0c2076ff2465de559
change-id: 20250520-en7581-net-4d8f2bdcf3b5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


