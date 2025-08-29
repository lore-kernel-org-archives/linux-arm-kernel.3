Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D011CA1003
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBRFXBOTZNtalyxQYje6lHR6qBaFS0kltKQZlJ6Krkw=; b=zmaPfnLRumJpsEb0RO1k6AfBoj
	o7JoyvfEptLt86FJiQa/QEu2iPmSjaPUMDWSN6eSOkmwicUgo3Vq8RqzVoBwRkpRqBSgEYw5KRLSf
	sTHLIa4cFvnKN4lul+Lu5vdQ1XqbdzcjOd353U9RpuidkCUGpy8nIpW2tWSPwLjtzIlHzNfjCYjiK
	Cb5fCNWowEXPZ6hj/cn7crv45L0BmkEzap4CzGIJ/oMAtVkY9eB5Vxy6hZ49BHkDHWvYkfE6JCyGm
	VqKG+zcML7lcEAZCfMVtK50Z5L8zNvHdXhsrFV02RmSMXDvowivZvene4zE/+fNHWlUcn9KL/1SvI
	Mc4zsZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oO-00000007CMV-0xh2;
	Sat, 30 Aug 2025 00:51:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us6Ph-00000006sow-3NAR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 21:13:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40E3F60142;
	Fri, 29 Aug 2025 21:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9429BC4CEF0;
	Fri, 29 Aug 2025 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756502017;
	bh=sbyw8T8JAdvdlkAq4zux1rD5z1Wak6PP9egfwjKNvFI=;
	h=From:To:Cc:Subject:Date:From;
	b=t1XC+i7JMTzBN6/YM6iXaXxS7ND02N38fa8g3j1r5h082lgjCMsr2HzDxexxBeJOm
	 jmMTeZcSldK/7MG4RwWhIiSweMqSNzncUGPerbH/X7m/kSwZNvPjtWs//EJG0oSdKX
	 rJ8p4XB3nx6rcRPvFH8Tf/AYy35sc7kE9cGob1NbMXN33Dl7O8eWgU9DTU9lFdwG5o
	 WCvmH7SowZYmgHQ6wk5CfvZmi6BZxJr/W1opkRFMeE3r22eiLsEkrUnM8tEp0Iut5V
	 ePbHt7lQzyusXkqHnfxgb0gXRKnffyBgWCTptVBtK4JBXQCwTFwzTShkA7pEzlUjGc
	 +KxTU45ry+h+A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: Drop syscon "reg-io-width" properties
Date: Fri, 29 Aug 2025 16:13:29 -0500
Message-ID: <20250829211330.1336274-1-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
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

The default width is 4 bytes for "syscon" devices, so "reg-io-width" is
redundant and can be dropped.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 1 -
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 2 --
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 2 --
 3 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index 78c967812492..c3d4d916c69b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -356,7 +356,6 @@ vuart: serial@1e787000 {
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
-				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 57a699a7c149..39500bdb4747 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -273,7 +273,6 @@ hace: crypto@1e6e3000 {
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2500-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;
-				reg-io-width = <4>;
 				clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
 				resets = <&syscon ASPEED_RESET_CRT1>;
 				syscon = <&syscon>;
@@ -441,7 +440,6 @@ vuart: serial@1e787000 {
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
-				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 61983feb2a4e..f8662c8ac089 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -382,7 +382,6 @@ rng: hwrng@1e6e2524 {
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2600-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;
-				reg-io-width = <4>;
 				clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
 				resets = <&syscon ASPEED_RESET_GRAPHICS>;
 				syscon = <&syscon>;
@@ -572,7 +571,6 @@ peci0: peci-controller@1e78b000 {
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
-				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.50.1


