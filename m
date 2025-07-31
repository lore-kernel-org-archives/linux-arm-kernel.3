Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CE6C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNB/USS/uG0h39FDRpJoXVY7f/FrpKXXBu/8vBC1B2U=; b=RcOgM1yUpSuUnA9K+V+yEQrSM2
	NvdoOeawvIQmVPhKAThSC6Mn2jgNEowO9g+WmqRUbBY+hsLx97zshR9ybKzeYHXO6nLsziRf82IJD
	+bg7YiznR+Iy0clcxx32OeoTS0am6f3GkjOQlgaznYmtCNc+eZNA3L73Pb8mQuiUhHUyAYyVW1Bt0
	0/i8xlL6oJBD+Jhv1b3gHw1BzgwAHnHa3S12gPh2NDlRBcp4vBPl6kN7YePIv3Yf2Jf+oXZeW29g0
	BStk9Ywipn8xlul5e7CiHy34BAS5Nmp4ywjca389Vl/Yumo8gSIiJt2iZ02Clk7VhXi5XaZDJClR1
	pseG32YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbde-00000004Xt6-1XNC;
	Thu, 31 Jul 2025 22:20:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbVy-00000004XAU-0Fh3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDAF3462CB;
	Thu, 31 Jul 2025 22:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDCAC4CEF4;
	Thu, 31 Jul 2025 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753999961;
	bh=iCHNz13YFPJI2rv/3E+irLxUkOjyMiI3w+ZxRLbSXwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z+a4eReZzye57rk5zFrxJ5GDtFDgGuQS/b9abZkgO+BdyRHsuYPzE3WLL+dcYEgru
	 j94N2eV/OcsgxYGafKlFM8lOU3JadX0QQEkZiuWyE6lgUeZ1+bOeGeEmbNxBMt0CVt
	 uwmxI8ja/wfpgU9w4/Es+PrIBob98dsT/GF9BSZGI3zACQ8psN6q0fwQ+SUedklnQX
	 Gf2iafV3MT9EgGbciiO9e2EaDtdOBQ+7KjMnHg7y9TxeN0WLxtoJUSS+TgJT4xmAf9
	 +bpMzIsYhbggtOZf4FpksBsDiXD0p7C8FhGuc8aYO/f1w1fpaXkj+UCgMbBdsUwu4n
	 eWSjQ+BzkpLMg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 31 Jul 2025 17:12:19 -0500
Subject: [PATCH 2/6] ARM: dts: aspeed: Drop "fsi-master" compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-dt-fsi-cleanups-v1-2-e7b695a29fc3@kernel.org>
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_151242_143702_04661817 
X-CRM114-Status: GOOD (  11.56  )
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

The "fsi-master" compatible has been used inconsistently on FSI masters.
It doesn't have any real use or meaning, so it's easier to drop it
everywhere than add it where missing. It is also not documented by any
schemas (only .txt bindings).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts     | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dts      | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts      | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts    | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts     | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts       | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts       | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                 | 4 ++--
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts
index f42254ba6aeb..79c6919b3570 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts
@@ -54,7 +54,7 @@ video_engine_memory: jpegbuffer {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
+		compatible = "aspeed,ast2500-cf-fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
index 370738572a55..87acbfc0a1b7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
@@ -63,7 +63,7 @@ sys_err {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
+		compatible = "fsi-master-gpio";
 		#address-cells = <2>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dts
index 31ff19ef87a0..6c8b966ffccc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dts
@@ -165,7 +165,7 @@ fan4 {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
+		compatible = "fsi-master-gpio";
 		#address-cells = <2>;
 		#size-cells = <0>;
 		no-gpio-delays;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts
index e5b8d07e7622..1b7c25e307bc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts
@@ -77,7 +77,7 @@ attention {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
+		compatible = "aspeed,ast2500-cf-fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts
index 45631b47a7b3..c7aa14034dc0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts
@@ -55,7 +55,7 @@ identify {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "aspeed,ast2400-cf-fsi-master", "fsi-master";
+		compatible = "aspeed,ast2400-cf-fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts
index 2180fa9b6f24..3c03204869e7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts
@@ -68,7 +68,7 @@ power {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
+		compatible = "aspeed,ast2500-cf-fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts
index a0e8c97e944a..39d0fe46fd9e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts
@@ -200,7 +200,7 @@ rear-id {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
+		compatible = "fsi-master-gpio";
 		#address-cells = <2>;
 		#size-cells = <0>;
 		no-gpio-delays;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
index 8b1e82c8cdfe..89907b628b65 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
@@ -173,7 +173,7 @@ power-button {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
+		compatible = "fsi-master-gpio";
 		#address-cells = <2>;
 		#size-cells = <0>;
 		no-gpio-delays;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts
index 9904f0a58cfa..9b49b0aa8b35 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts
@@ -96,7 +96,7 @@ hdd_fault {
 	};
 
 	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
+		compatible = "fsi-master-gpio";
 		#address-cells = <2>;
 		#size-cells = <0>;
 		no-gpio-delays;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 8ed715bd53aa..acdb6ae74b27 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -847,7 +847,7 @@ i2c: bus@1e78a000 {
 
 			fsim0: fsi@1e79b000 {
 				#interrupt-cells = <1>;
-				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
+				compatible = "aspeed,ast2600-fsi-master";
 				reg = <0x1e79b000 0x94>;
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
@@ -859,7 +859,7 @@ fsim0: fsi@1e79b000 {
 
 			fsim1: fsi@1e79b100 {
 				#interrupt-cells = <1>;
-				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
+				compatible = "aspeed,ast2600-fsi-master";
 				reg = <0x1e79b100 0x94>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";

-- 
2.47.2


