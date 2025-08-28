Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79575CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VcWOaR0Ql036OGlkmD0Z7j4nNYEDP3lMRBmO+Y04dbc=; b=Ciw4tQJ+CxiluYoq5aNeCSj+yA
	BJRnT6l8i1/9pMRcVu1eln0dgXAkfJdZhFM7VcZ683FRUXb9hZoFU8m/CAQRIFA3G4jIozKpz/5n9
	lujld6JEvL4clGVZlvZk2bJgpPCCLVFCqpH9p8Msumhaw8PA/nJxdDR8F72NXBZVeMKcpdTZ1+KCC
	7aubXBIHK6guPAioiF5IrYT/t2y+6awJn8O4Na207ttexxHMX7ZnzuHh/kVpGS8k5mtTfpL6eirYi
	NZd0BCdKRYhAszIFHkEoaSzyNU17ZDsl5BG9ef21D30NRU4xU1JDf58Bk+ATjHXVshERa+ql4bA6i
	Sm+d+HSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1M-00000003g00-1y9H;
	Thu, 28 Aug 2025 23:27:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkCf-00000003NWK-1jWe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 21:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2E1F60139;
	Thu, 28 Aug 2025 21:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2C9C4CEEB;
	Thu, 28 Aug 2025 21:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756416640;
	bh=Rd0xr0MhBmCf+FWFWjFdTrfsK8O7aobr0QTSWX9i//w=;
	h=From:To:Cc:Subject:Date:From;
	b=Q0nDTyTzp4ovb908QABKBN+Cl6h+PdlrrI4t2TYunvmoH8hXmeU2HbxjQfHXsT0qs
	 Yk+KMAwAF04QXlrF3i+fMVSRK3/UNj/qrtCrOTD3y4DTGst/Gon6ATnt5+I0tgT/Wi
	 Uc90I3mPhP+4lmHsFyqQe5jJcvqGSbsa3vAEvCRoO6PI2FS/UvEezMHCTsfq2H35YW
	 dY0eFExRfdZwRhPKfpvb65Md6iy/wXqO6vBsiItGQIUyoahsstTgbS72AkGyd0OfOy
	 z4kP2b0MMeWBxtdkCrsNhY6Fm0ZQYO2Q44xOdwQ4pHmnt6hasyPd5hisjofPftcrbV
	 kDdiitq0guDaw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: xilinx: Drop undocumented "always-on" properties
Date: Thu, 28 Aug 2025 16:30:26 -0500
Message-ID: <20250828213028.2266805-1-robh@kernel.org>
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

The "always-on" properties are not documented for "silabs,si5341"
binding nor used by the Linux driver, so drop them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts | 8 --------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts | 6 ------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts | 6 ------
 3 files changed, 20 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index e172a30e7b21..6bee21d4fa4d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -552,42 +552,34 @@ si5341: clock-generator@36 { /* SI5341 - u69 */
 				si5341_0: out@0 {
 					/* refclk0 for PS-GT, used for DP */
 					reg = <0>;
-					always-on;
 				};
 				si5341_2: out@2 {
 					/* refclk2 for PS-GT, used for USB3 */
 					reg = <2>;
-					always-on;
 				};
 				si5341_3: out@3 {
 					/* refclk3 for PS-GT, used for SATA */
 					reg = <3>;
-					always-on;
 				};
 				si5341_4: out@4 {
 					/* refclk4 for PS-GT, used for PCIE slot */
 					reg = <4>;
-					always-on;
 				};
 				si5341_5: out@5 {
 					/* refclk5 for PS-GT, used for PCIE */
 					reg = <5>;
-					always-on;
 				};
 				si5341_6: out@6 {
 					/* refclk6 PL CLK125 */
 					reg = <6>;
-					always-on;
 				};
 				si5341_7: out@7 {
 					/* refclk7 PL CLK74 */
 					reg = <7>;
-					always-on;
 				};
 				si5341_9: out@9 {
 					/* refclk9 used for PS_REF_CLK 33.3 MHz */
 					reg = <9>;
-					always-on;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index cd132abf6e00..f450fad0edf8 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -551,32 +551,26 @@ si5341: clock-generator@36 { /* SI5341 - u69 */
 				si5341_0: out@0 {
 					/* refclk0 for PS-GT, used for DP */
 					reg = <0>;
-					always-on;
 				};
 				si5341_2: out@2 {
 					/* refclk2 for PS-GT, used for USB3 */
 					reg = <2>;
-					always-on;
 				};
 				si5341_3: out@3 {
 					/* refclk3 for PS-GT, used for SATA */
 					reg = <3>;
-					always-on;
 				};
 				si5341_6: out@6 {
 					/* refclk6 PL CLK125 */
 					reg = <6>;
-					always-on;
 				};
 				si5341_7: out@7 {
 					/* refclk7 PL CLK74 */
 					reg = <7>;
-					always-on;
 				};
 				si5341_9: out@9 {
 					/* refclk9 used for PS_REF_CLK 33.3 MHz */
 					reg = <9>;
-					always-on;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index 428b5558fbba..b4768f615182 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -439,32 +439,26 @@ si5341: clock-generator@36 { /* SI5341 - u46 */
 				si5341_0: out@0 {
 					/* refclk0 for PS-GT, used for DP */
 					reg = <0>;
-					always-on;
 				};
 				si5341_2: out@2 {
 					/* refclk2 for PS-GT, used for USB3 */
 					reg = <2>;
-					always-on;
 				};
 				si5341_3: out@3 {
 					/* refclk3 for PS-GT, used for SATA */
 					reg = <3>;
-					always-on;
 				};
 				si5341_5: out@5 {
 					/* refclk5 PL CLK100 */
 					reg = <5>;
-					always-on;
 				};
 				si5341_6: out@6 {
 					/* refclk6 PL CLK125 */
 					reg = <6>;
-					always-on;
 				};
 				si5341_9: out@9 {
 					/* refclk9 used for PS_REF_CLK 33.3 MHz */
 					reg = <9>;
-					always-on;
 				};
 			};
 		};
-- 
2.50.1


