Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F0ECD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/3KW645kadoWYBkkkiV3R/cBByrtaM6iiRuO1ZY31c=; b=BcfSNaOYJ+Y2p1KJkWdEZC/1iA
	gQS4u9hDusAD6oSvE6TLcFgFw+gLg4OwQ/e1iqP8ZlMwbdhVS7lJefnVUHPW/yfF1B4buxONeBzGd
	zdSvHrtzMueU7PffO81a8R/FQ1eEoKuMZBU8RDcQn8/4XDWDw6NFGZ6w8R2hYpKHdSJk5lXYOW8JA
	RS0V7taKWzXPZg3qTeaC1U+L033J3PZhd45HGJyjDqC2dfc3NYK92sxLjJhOd/rehX0n+X0w60k2F
	u86t1YwmjctvYxOD/4NVY9Wy7Azx3N/qBSWZR77wNhe//uhw3fSes7yIxf4OwJwnBDF/WbYUl85yZ
	SNbOAVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZF5-00000008pal-24bA;
	Thu, 11 Jun 2026 06:50:19 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZF2-00000008pZm-3RlW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 06:50:18 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 11 Jun
 2026 14:50:09 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 11 Jun 2026 14:50:09 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Thu, 11 Jun 2026 14:50:08 +0800
Subject: [PATCH] arm64: dts: aspeed: Fix duplicate pinctrl labels and
 address scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260611-dtsi_fix-v1-1-ef2b7cd86d6d@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAKBaKmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ND3ZSS4sz4tMwKXQNLyyRDw0RjI8MkUyWg8oKiVKAw2Kjo2NpaAKY
 AXaBaAAAA
X-Change-ID: 20260611-dtsi_fix-099b11a321b5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Arnd Bergmann <arnd@arndb.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781160609; l=5765;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=8U6jz7rXtYL1MwCZPqGDf5fZs+4y+xyGRhjMMf47rOU=;
 b=O9wmMN7nZjWZ4LiaBz1UQB8K5FQiwQQye3VsCY92aIsBDGfBlwhNQ68rdmVUnuq1MT8XhoL1R
 byIXjsGNhUgDIjxeCHG6e77/P2X8uyQom931Pc1kK32Q0cXBpJexTUJ
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_235016_879876_6BC23F83 
X-CRM114-Status: GOOD (  10.94  )
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

Fix duplicate pinctrl_tach{0-15} and pinctrl_n{cts,dcd,dsr,ri}5 labels
in aspeed-g7-soc1-pinctrl.dtsi.

Drop the cpu-index from secondary/tertiary container nodes: reduce the
"#address-cells" from 2 to 1 and update ssp_nvic/tsp_nvic unit-address
and reg accordingly. Also remove URL comments from the DTS.

Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device tree")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
This series contains follow-up fixes for the AST27xx DTS support that
was merged into linux-next (e77bb5dc5759).

Two issues were identified after merge by Andrew Jeffery during review
of the pending v11 series:

1. Duplicate pinctrl state labels in aspeed-g7-soc1-pinctrl.dtsi caused
   dtc to abort with fatal label-redefinition errors.

2. The synthetic container nodes (secondary, tertiary) for sub-processor
   interrupt controllers used a 2-cell address scheme to encode a
   <cpu-index reg-base> tuple.  Since the cpu-index adds no value for
   nodes that are purely phandle anchors, Andrew requested we drop it
   and use the bare register address instead.
---
 arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi      |  14 ++-
 .../boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi    | 102 ---------------------
 2 files changed, 6 insertions(+), 110 deletions(-)

diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
index ef283d95649a..58193c3c3696 100644
--- a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
+++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
@@ -84,32 +84,30 @@ l2: l2-cache0 {
 	};
 
 	secondary {
-		#address-cells = <2>;
-		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/address.c?h=v6.16#n491 */
+		#address-cells = <1>;
 		#size-cells = <0>;
-		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/address.c?h=v6.16#n430 */
 
-		ssp_nvic: interrupt-controller@1,e000e100 {
+		ssp_nvic: interrupt-controller@e000e100 {
 			compatible = "arm,v7m-nvic";
 			#interrupt-cells = <2>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <1 0xe000e100>;
+			reg = <0xe000e100>;
 			arm,num-irq-priority-bits = <3>;
 			status = "disabled";
 		};
 	};
 
 	tertiary {
-		#address-cells = <2>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		tsp_nvic: interrupt-controller@2,e000e100 {
+		tsp_nvic: interrupt-controller@e000e100 {
 			compatible = "arm,v7m-nvic";
 			#interrupt-cells = <2>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <2 0xe000e100>;
+			reg = <0xe000e100>;
 			arm,num-irq-priority-bits = <3>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
index 72d93323593d..6edf14617b09 100644
--- a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
@@ -496,87 +496,6 @@ pinctrl_hvi3c15_default: hvi3c15-default-state {
 		function = "I3C15";
 		groups = "HVI3C15";
 	};
-
-	pinctrl_tach0_default: tach0-default-state {
-		function = "TACH0";
-		groups = "TACH0";
-	};
-
-	pinctrl_tach1_default: tach1-default-state {
-		function = "TACH1";
-		groups = "TACH1";
-	};
-
-	pinctrl_tach2_default: tach2-default-state {
-		function = "TACH2";
-		groups = "TACH2";
-	};
-
-	pinctrl_tach3_default: tach3-default-state {
-		function = "TACH3";
-		groups = "TACH3";
-	};
-
-	pinctrl_tach4_default: tach4-default-state {
-		function = "TACH4";
-		groups = "TACH4";
-	};
-
-	pinctrl_tach5_default: tach5-default-state {
-		function = "TACH5";
-		groups = "TACH5";
-	};
-
-	pinctrl_tach6_default: tach6-default-state {
-		function = "TACH6";
-		groups = "TACH6";
-	};
-
-	pinctrl_tach7_default: tach7-default-state {
-		function = "TACH7";
-		groups = "TACH7";
-	};
-
-	pinctrl_tach8_default: tach8-default-state {
-		function = "TACH8";
-		groups = "TACH8";
-	};
-
-	pinctrl_tach9_default: tach9-default-state {
-		function = "TACH9";
-		groups = "TACH9";
-	};
-
-	pinctrl_tach10_default: tach10-default-state {
-		function = "TACH10";
-		groups = "TACH10";
-	};
-
-	pinctrl_tach11_default: tach11-default-state {
-		function = "TACH11";
-		groups = "TACH11";
-	};
-
-	pinctrl_tach12_default: tach12-default-state {
-		function = "TACH12";
-		groups = "TACH12";
-	};
-
-	pinctrl_tach13_default: tach13-default-state {
-		function = "TACH13";
-		groups = "TACH13";
-	};
-
-	pinctrl_tach14_default: tach14-default-state {
-		function = "TACH14";
-		groups = "TACH14";
-	};
-
-	pinctrl_tach15_default: tach15-default-state {
-		function = "TACH15";
-		groups = "TACH15";
-	};
-
 	pinctrl_thru0_default: thru0-default-state {
 		function = "THRU0";
 		groups = "THRU0";
@@ -940,27 +859,6 @@ pinctrl_uart3_default: uart3-default-state {
 		function = "UART3";
 		groups = "UART3";
 	};
-
-	pinctrl_ncts5_default: ncts5-default-state {
-		function = "NCTS5";
-		groups = "NCTS5";
-	};
-
-	pinctrl_ndcd5_default: ndcd5-default-state {
-		function = "NDCD5";
-		groups = "NDCD5";
-	};
-
-	pinctrl_ndsr5_default: ndsr5-default-state {
-		function = "NDSR5";
-		groups = "NDSR5";
-	};
-
-	pinctrl_nri5_default: nri5-default-state {
-		function = "NRI5";
-		groups = "NRI5";
-	};
-
 	pinctrl_ndtr5_default: ndtr5-default-state {
 		function = "NDTR5";
 		groups = "NDTR5";

---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260611-dtsi_fix-099b11a321b5

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


