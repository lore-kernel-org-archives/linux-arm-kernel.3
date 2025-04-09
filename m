Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B5CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cs0oHYIDLw+NXvNiplcD3L/abgVKbtu5qf/+1OmonH8=; b=RRcMgC2SsLUCgDNbvAl7R7k++E
	66gTCulPhzRbczKJIUpb9gy82IKdqhwNl9t5vIuhN2Sefnm4UIz55n4t3M2fLcw/q0rFlcaed3EC4
	3NCTwdHKK6EzI4J86TPSSzdATz8aVZWNHQc9YKnv4+d5zTACXiuZoS7j0GGXTiRKn3Ts/byZPH4A7
	XyVTLzAj/RClyScZG5vCZ6Xy366SPRGWpnSirmVADlPahHAH9PF4orsLH8/8zYL9tJuxgIkIk4AWr
	MHPMUax8rjVAWBnyFutz2u10vLtVs8t84a7furig9UnqAZBS938YC8hRpnDVIEzD064mbxs+gqE2a
	5Oq/wGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dBF-00000008c0F-3fpB;
	Wed, 09 Apr 2025 21:41:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cMj-00000008Urg-3cBI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34CE961127;
	Wed,  9 Apr 2025 20:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C6CC4CEE2;
	Wed,  9 Apr 2025 20:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231784;
	bh=NozBD7uf0mEfFz72Q+HWrklJjBxU4koxeAHUjP0UPPw=;
	h=From:To:Cc:Subject:Date:From;
	b=vPEFewp/CEcOJm4xepNr29RV9Rod7H/Ms9KcO6fUCblcJOCu/YMbBG+0m1TJ7FDNx
	 GMpWrvRPy+b3LIXhad4p9gSDtnXzK5xeJLwHpcIk59o0wNqrctHMFenwNr4c8dvXcS
	 AXg4ZnGvbXVRXRIis9CseshHE0kaftyQY62TrEY2P/4g/fl4ZRWZxZ7uDaEEFiH2WZ
	 f7ODITtnT+Q4KcVeN/n4GhrKjOUE3mYj3bgfEcDg8ca82jvGUKflz/wKW3KpOivKEf
	 N3MnePIr1K/d9o04u35mVI85M5ci4hkZy+1aGPmzp3g8nPVfZUUvrpPoV/0UB72vt9
	 ZzkdbHE5kgowQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: marvell: Drop unused "pinctrl-names"
Date: Wed,  9 Apr 2025 15:49:35 -0500
Message-ID: <20250409204936.1521405-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

"pinctrl-names" depends on "pinctrl-[0-9]" properties, but none are
present for the pca9555 nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 2 --
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi     | 1 -
 3 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 2b5e45d2c5a6..3add6506ff20 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -124,7 +124,6 @@ &cp0_i2c0 {
 
 	expander0: pca9555@21 {
 		compatible = "nxp,pca9555";
-		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x21>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index 9d45e881a97d..21ecb9c12505 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -122,7 +122,6 @@ &cp0_i2c0 {
 	/* U31 */
 	expander0: pca9555@21 {
 		compatible = "nxp,pca9555";
-		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x21>;
@@ -131,7 +130,6 @@ expander0: pca9555@21 {
 	/* U25 */
 	expander1: pca9555@25 {
 		compatible = "nxp,pca9555";
-		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x25>;
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
index be56a2336265..50e9e0724828 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
@@ -209,7 +209,6 @@ i2c@1 {
 			/* U12 */
 			cp0_module_expander1: pca9555@21 {
 				compatible = "nxp,pca9555";
-				pinctrl-names = "default";
 				gpio-controller;
 				#gpio-cells = <2>;
 				reg = <0x21>;
-- 
2.47.2


