Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9A910987B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVj6+jshPU/yjuO8X+vQGIhhTpPJ5OYUeBCvCZEk0JM=; b=vFBCDbDRC91FJsKf9qBa3TjJGM
	3iWTHvy7OauV2L2ZeBmpJCaeS69xiRCUUPO3P2PY79QSPCRxxsB5/xYj/S53HeqJIUe9+UrZfI/rd
	RnkC9QTHHVMw0XXx7o4E1paTaDSs1R7JTl+wuJCesAhU+pOgUKw/+IHXGgTpum1LACu2JbT3H+dqj
	y+gD9eMgVmhODfqHYc6C65PKODF7V9EOrCiFxH84ws+MzVcLw8uknTUbrON9LgLVtOxeJTn7GEao9
	WtSZGRiF2vHtqzQBw7O8JM9jkBcQMqpE3OJ56Q6+jyntgKWcfzdXL6+DHV1Ww6ptxxhJ+Z3HTJ+TN
	2+Ml5osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0g-0000000DBaj-3vIi;
	Fri, 20 Mar 2026 16:47:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0c-0000000DBWK-3Dov
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23EA0434FC;
	Fri, 20 Mar 2026 16:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B59C4CEF7;
	Fri, 20 Mar 2026 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025258;
	bh=sK9Je7eEOHO0wb9I2WtylwKv1pOI57lliw+dQ40lnJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O/zzqxqk9VqjAANVq7YDdiaokLbu44P5/67s5HUnm/t8DTYF3xkcrspcDP2VXspvp
	 o3+lHsw326285W/ymwngxI1IszpKN5dgfSCmvWQRruAqMauEH12zK4oz3Qvvv0VPGk
	 p0eYTW2Ha7L4nPsqNqQpj4ibJfgQM6n/IjD0PotT+Jyi+uZu5xK/7EGiNCv96oEESs
	 27Hqm6XrZSCWcm4L/HZ8ZHnDR4BCFZO0R/yolmi2IjQY4RH8os2TPMGpDbg5udvDMZ
	 fb08XC5LBsQw7YxYzA7bozLDJ43h7bAI9wn7jeisuw+bAspHfpZ64ycwQWQHpJG9f7
	 uRtu+aevcJ/Eg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Mar 2026 11:47:16 -0500
Subject: [PATCH 3/5] arm64: dts: arm/corstone1000: Move cpu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-dt-corstone1000-a320-v1-3-a549dfcfe8da@kernel.org>
References: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
In-Reply-To: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Frazer Carsley <frazer.carsley@arm.com>, 
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>, 
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094738_864604_F9E24052 
X-CRM114-Status: UNSURE (   9.33  )
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

In preparation to add a new Corstone-1000 variation with different CPUs,
move the CPU nodes into the specific platforms and out of the common
corstone1000.dtsi.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts  | 54 ++++++++++++++++-----------
 arch/arm64/boot/dts/arm/corstone1000-mps3.dts | 13 +++++++
 arch/arm64/boot/dts/arm/corstone1000.dtsi     | 13 -------
 3 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
index 66ba6b027193..e479c79c1ea7 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
+++ b/arch/arm64/boot/dts/arm/corstone1000-fvp.dts
@@ -48,30 +48,40 @@ sdmmc1: mmc@50000000 {
 		clocks = <&smbclk>, <&refclk100mhz>;
 		clock-names = "smclk", "apb_pclk";
 	};
-};
+	cpus: cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
 
-&cpus {
-	cpu1: cpu@1 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a35";
-		reg = <0x1>;
-		enable-method = "psci";
-		next-level-cache = <&L2_0>;
-	};
+		cpu: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0 0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
 
-	cpu2: cpu@2 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a35";
-		reg = <0x2>;
-		enable-method = "psci";
-		next-level-cache = <&L2_0>;
-	};
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0 0x2>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
 
-	cpu3: cpu@3 {
-		device_type = "cpu";
-		compatible = "arm,cortex-a35";
-		reg = <0x3>;
-		enable-method = "psci";
-		next-level-cache = <&L2_0>;
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0 0x3>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/arm/corstone1000-mps3.dts b/arch/arm64/boot/dts/arm/corstone1000-mps3.dts
index 10d265be0c02..adcfaf7c55b8 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-mps3.dts
+++ b/arch/arm64/boot/dts/arm/corstone1000-mps3.dts
@@ -13,6 +13,19 @@ / {
 	model = "ARM Corstone1000 FPGA MPS3 board";
 	compatible = "arm,corstone1000-mps3";
 
+	cpus: cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0 0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+	};
+
 	smsc: ethernet@4010000 {
 		compatible = "smsc,lan9220", "smsc,lan9115";
 		reg = <0x40100000 0x10000>;
diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot/dts/arm/corstone1000.dtsi
index f35a5c96f3da..4d57dc197918 100644
--- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
@@ -21,19 +21,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a35";
-			reg = <0>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-		};
-	};
-
 	memory@88200000 {
 		device_type = "memory";
 		reg = <0x88200000 0x77e00000>;

-- 
2.51.0


