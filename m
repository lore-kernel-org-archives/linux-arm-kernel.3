Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03086F417F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NQjtoOjqEoEhL9SXcTYQtV0z7pkjaM4pgJfIZLDhlRI=; b=wSicjoHMgVefEVRl1ygS36f35j
	ZqoOtSELh78tIa1NBqf/KJEVaX2+xjbk8Ta49H96SrpSSLjfHXPo2v5pGfQnEQMjIgIIXr6s2rsB+
	7yRVxiOTHBpfJ1AA14/r6ccalN2IxMtFtCqUnghoLpR/CoN7Sk1KbAVKUhZIQwRGdWKXLNhIcuir4
	Co8FgfvxVQ0cen2JzDvHExutyeEhNx6rdAoBepJBBRhvnZbiQyeUP076CkJ1sW7JibmIBp9RhPaqz
	5EUWGN+AIxb4bKdICvtqWrQ0Y66JLIM9EeWtPwmw2NfG8G7Usp+JSDhCpgqJjpkkWOfOqLgFNOrYE
	5kyTEiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcCY-00000007Ybn-1mbf;
	Mon, 09 Mar 2026 15:07:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcCV-00000007Yaw-3pCA;
	Mon, 09 Mar 2026 15:07:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BABF043D11;
	Mon,  9 Mar 2026 15:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46592C4AF0B;
	Mon,  9 Mar 2026 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773068838;
	bh=GdeMPNlEReEt5c3TbQB5zQABnqKdWHPzQr6+VSniZPU=;
	h=From:Date:Subject:To:Cc:From;
	b=m+jMxgTteOqY+Vth7Dvs9wyoCR4Q8NylkAbt2g2eTL+vPR+xuq2cyI46nvHaTj/wf
	 5IyqHm4Ut6Dv/avs+1fFeNUM5mm3s4qyNg2Cdq/dicEthSxkXEEX7zeD2V5KjTIntn
	 yR9pLeffuUGIKQWqwujInprHXCwz3KHTWuw43X0ZtRctOakv6yil1nFBZfSgmfr//z
	 TYP1muwsAP7ZfJBM3YJHVsJS+zBAvQrVHrNCRgutzV7csv1RBVivPyWXyQOiv05fAh
	 JuFJAMZ1vMxdIDa7PnDe+gLM/fv9fPYjIksg6arf7PqLxDtKsNO2xFoMP5k2jGYbuh
	 JmIkKVvWURBJg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 09 Mar 2026 16:07:03 +0100
Subject: [PATCH] arm64: dts: airoha: en7581: Add npu node to to EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-airoha-7581-npu-v1-1-856a360ae9f6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswS8uuEi0Gm2o2JkoRRHdPW
 r7F/w9kTsIZxuqBxJdkOUJBU1fgdwoboyzFoJW2qlUOSdKxE/ZmaDDEE72hnrTT1lMHpYqJV7n
 /4zS/7weYEy2JYQAAAA==
X-Change-ID: 20260309-airoha-7581-npu-c5a7a2926ca4
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_080719_991637_9696AA37 
X-CRM114-Status: GOOD (  10.25  )
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

Introduce npu controller node to EN7581 SoC and EN7581 evaluation board.
Adjust reserved memory parameters to the values used by the npu
controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts |  4 +++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 43 ++++++++++++++++++++++++-------
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64ce1a2a5496d35b8379fb4ac27dc2..b1a41d1e7eb676beb0e42c949c70362125ec6f0b 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -99,6 +99,10 @@ &i2c0 {
 	status = "okay";
 };
 
+&npu {
+	status = "okay";
+};
+
 &eth {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8eb6cf91343495d1fe531a868e41fb..3ea00b3b0a35ce1f466cbe89fefd05abef20056d 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -15,29 +15,29 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		npu-binary@84000000 {
+		npu_binary: npu-binary@84000000 {
 			no-map;
 			reg = <0x0 0x84000000 0x0 0xa00000>;
 		};
 
-		npu-flag@84b0000 {
+		npu_pkt: npu-pkt@8a000000 {
 			no-map;
-			reg = <0x0 0x84b00000 0x0 0x100000>;
+			reg = <0x0 0x8a000000 0x0 0x2c00000>;
 		};
 
-		npu-pkt@85000000 {
+		npu_txpkt: npu-txpkt@8cc00000 {
 			no-map;
-			reg = <0x0 0x85000000 0x0 0x1a00000>;
+			reg = <0x0 0x8cc00000 0x0 0x4000000>;
 		};
 
-		npu-phyaddr@86b00000 {
+		npu_txbufid: npu-txbufid@90c00000 {
 			no-map;
-			reg = <0x0 0x86b00000 0x0 0x100000>;
+			reg = <0x0 0x90c00000 0x0 0x6800>;
 		};
 
-		npu-rxdesc@86d00000 {
+		npu_ba: npu-ba@90c06800 {
 			no-map;
-			reg = <0x0 0x86d00000 0x0 0x100000>;
+			reg = <0x0 0x90c06800 0x0 0x200000>;
 		};
 	};
 
@@ -347,6 +347,31 @@ i2c1: i2c@1fbf8100 {
 			status = "disabled";
 		};
 
+		npu: npu@1e900000 {
+			compatible = "airoha,en7581-npu";
+			reg = <0x0 0x1e900000 0x0 0x313000>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&npu_binary>, <&npu_pkt>, <&npu_txpkt>,
+					<&npu_txbufid>, <&npu_ba>;
+			memory-region-names = "firmware", "pkt", "tx-pkt",
+					      "tx-bufid", "ba";
+			status = "disabled";
+		};
+
 		eth: ethernet@1fb50000 {
 			compatible = "airoha,en7581-eth";
 			reg = <0 0x1fb50000 0 0x2600>,

---
base-commit: 405c09548a695ca7be58b5b9d3ac8388630e907f
change-id: 20260309-airoha-7581-npu-c5a7a2926ca4

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


