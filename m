Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFE1CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 23:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aE7mCsrW+jbsuaUl3dmSP9nXkq+eiADJoNB6eIGghOI=; b=rJOeLQTfTosgLCcoNBXqVF3lVH
	3L9gtXv57Q6hJikrSmQfyGaOLdLzpAgwi9gqz9v2sZ9auVaM2smG8oDjPZ76jxEV3FxFKqswYu3jy
	jax7MupjQWxPFivoXKp3kvXriWbfZrRNXe9K6rg0JgRrFoTEj9Zf/47Zu8Hc2qp4otDayeTzIwt0O
	JW9/3vbxN3akJ0RYZc3vX1iSPFL4rF/ImfzRFdcb0EDX+ct07KurDQDhbgPVtRtA4dTqNR8mJs2aa
	VIxJbkr9//KFUjMz8NEot6kwd2Hwglm410HRD/s7Gck0CJpNd16ZhrDZFIx+TtYPrAslEGTtDLKPZ
	iM3XpWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUPG-0000000HKqu-0cvd;
	Wed, 10 Sep 2025 23:39:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUPD-0000000HKpv-38ON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 23:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02B3744916;
	Wed, 10 Sep 2025 23:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2EFC4CEEB;
	Wed, 10 Sep 2025 23:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757547554;
	bh=oThnhjwHOCRp+Pu8CYFW0dQq+PXlgMWB686UxQw7yiE=;
	h=From:To:Cc:Subject:Date:From;
	b=kJOzZAzOFl6orh8RdBkKXLCmaP9bF0y65JlF+R5NAQbn+gJh+0xFO1CV6UM6v/b/z
	 62DrC2q/asOfJMPLA2AHVENID0Xj0gH3JjmtHelwh6f8yCJ+4TclVEgTNsQipgNCxP
	 iQ8b0Q/VAuIzrYxhf9cNdjFTlssX1zRIMb4RmIOZEcmawrrIpJvDXwghlJDSHdfyuj
	 ZXPXA6PzFfmaUVym2vjDkBbH+GATgjn6mvDIDLtvV5Bq8JJz8Zunf73q4cJtiOTPpE
	 eKSlpha903l3v3k3aZslw+9+J0soOTzVRFRwvMFmt3qnGHu/aL/pHSzrGnZs09FGS9
	 x1gc5TtGjI1Jw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: socionext: Drop "linux,spdif-dit" port node unit-address
Date: Wed, 10 Sep 2025 18:37:40 -0500
Message-ID: <20250910233740.777077-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_163915_805036_1340C381 
X-CRM114-Status: GOOD (  10.52  )
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

 arch/arm/boot/dts/socionext/uniphier-pxs2-vodka.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/socionext/uniphier-pxs2-vodka.dts b/arch/arm/boot/dts/socionext/uniphier-pxs2-vodka.dts
index 7e08a459f7d8..ab910e1b5e6a 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pxs2-vodka.dts
+++ b/arch/arm/boot/dts/socionext/uniphier-pxs2-vodka.dts
@@ -43,7 +43,7 @@ spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			spdif_tx: endpoint {
 				remote-endpoint = <&spdif_hiecout1>;
 			};
@@ -54,7 +54,7 @@ comp-spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			comp_spdif_tx: endpoint {
 				remote-endpoint = <&comp_spdif_hiecout1>;
 			};
-- 
2.51.0


