Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 23:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbzdyELa/IqfVWVSZ/sYbxCt/G4V10EvuDwRo5hACX0=; b=E4LqQFsDLCuu8QWKN77KrjV3Eb
	RWbaiCyhpflXksIvM76+jbbKBwvgR179iF4wIIfKJxfhyVMlxxDq7vB1sMEGtddIE7FbuvvxOVZwi
	b3doAUw6FMlOL50Hxr/Si/D6j6cATU6Zb3ni3d80fV7a2eeTmMaeJRcCxMN9XnLt+av+Kc0g2VyZi
	cMzObfPHM0Z/0DKLsuWPucvAyNTgenQ79czGGlrNeG9o5Blqs7AIuPonjFR0CS1J1XevhPB5moQ59
	/0ZD7NFSS0KzfUkTmE52+hi0WbpjpM+BliBSJHCFdPf52kFuq+zmaiTeorJQRpSPGpgakPowLBp+K
	AAkGZWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUPd-0000000HKzG-1skh;
	Wed, 10 Sep 2025 23:39:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUPb-0000000HKyk-3uhq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 23:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50E426013D;
	Wed, 10 Sep 2025 23:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13EDC4CEEB;
	Wed, 10 Sep 2025 23:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757547579;
	bh=GJZeHiPjiP3DnQJ+evMgNsJiiU3rynjez02+ZvOXV3o=;
	h=From:To:Cc:Subject:Date:From;
	b=VDsTZZWxOqmBMXRIg17++DxFGS2w1kU0CXtlP35NBu37ZgvzwUvVzf+mY0P0QZPy4
	 sl17HHzvWMdOJI675tO/9uJPQG4eHuKu0/sFADbEYSkRKwGfasxUXCu9Wh1w79ZJmZ
	 2F4c8bZg7grHlhMNUE01zdOBpYVFUA1gN1s5aov+WJw4PFS/dHuHbEHB6J7qPgRtJv
	 Yenyk3NWL+KJ7ypSiSLIUDBvG7V25afpffUSjS1gnKvUbI9Ig7fCZIRu23yMPOdNxF
	 rOVAJVr8Q/bhWcmFYLx5xX/ITLQIuRaa2Dp+8poK5Rxmcaero5/3cke2ND4svciFTu
	 8+VNad3BMBMrQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: socionext: Drop "linux,spdif-dit" port node unit-address
Date: Wed, 10 Sep 2025 18:39:23 -0500
Message-ID: <20250910233923.778992-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

A single graph port node without an address (i.e. "reg") should not have
a unit-address, drop it from the "linux,spdif-dit" port node.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, Please apply directly.

 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts  | 4 ++--
 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts | 4 ++--
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
index de219570bbc9..fc105d420db4 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
@@ -68,7 +68,7 @@ spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			spdif_tx: endpoint {
 				remote-endpoint = <&spdif_hiecout1>;
 			};
@@ -79,7 +79,7 @@ comp-spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			comp_spdif_tx: endpoint {
 				remote-endpoint = <&comp_spdif_hiecout1>;
 			};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
index fba454adae7d..10efa747ed8b 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
@@ -74,7 +74,7 @@ spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			spdif_tx: endpoint {
 				remote-endpoint = <&spdif_hiecout1>;
 			};
@@ -85,7 +85,7 @@ comp-spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			comp_spdif_tx: endpoint {
 				remote-endpoint = <&comp_spdif_hiecout1>;
 			};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
index 20e5fb724fae..3c4dcfb82ddf 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
@@ -68,7 +68,7 @@ spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			spdif_tx: endpoint {
 				remote-endpoint = <&spdif_hiecout1>;
 			};
@@ -79,7 +79,7 @@ comp-spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			comp_spdif_tx: endpoint {
 				remote-endpoint = <&comp_spdif_hiecout1>;
 			};
-- 
2.51.0


