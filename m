Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19238CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=prAEBrzKIWuMkPm2FcUrO0qI2deWE7cYQ4+upoac854=; b=T4J4q5ejHoYDa5Le8VaMcjXxgN
	nfsyAB82rA69/87oYQFkCbpT8xPRo7o7tYpovGMl9LP6NcVwhrQjiqsgV9eI0+DnjxMuW2/UuTj/O
	h1KVLk0s/RroTfFFEYlvPJ8rxpyoXclBVrxmQI8x6ABAPM8QXBxOTB18l1DbNnV3RauGN9OdFbwnp
	HVLOXlU9LcgVpV6L01bpvJEZgMs9AzBcvwLJI3En/+aAfE5BC6FS2UDHzKpRNhLcWdbu0URPy3Ta8
	Yr4vXFcyev8osmPbaTJ+d5AL0OCQz53RETCUm6Y9zIN5Gdcr4e0SlAgkDF5bxalhDMdpbHfRwQwMN
	pt4D6vMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxL2-0000000AaTs-09RO;
	Fri, 12 Jun 2026 08:34:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxKy-0000000AaT5-3kmq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781253238;
	bh=prAEBrzKIWuMkPm2FcUrO0qI2deWE7cYQ4+upoac854=;
	h=From:Date:Subject:To:Cc;
	b=EEgF/PvFQ0IsQ9p8/kc3TKc68eIKvTFg/E3j9lx/aiOAItCi/icSFcYEBe/9xdcmR
	 ZUSONM71odncnQoSCNkGtS+d+RZc+Uct3JMSkI2ib2oY8mBCmLS/A+JdOcVnt1rQhB
	 XYYzT+lo8cDLJjNhKmfiQtUxXixm5TVnU/YXyi3Oixc9yvJDoq1oRjKq07AoqvGAO7
	 H9T+Ad3FebZUhGWNKbS90Q7Q4msS4ZSlxcLnr5n8OHDQmQAPN6UWrg02rDjUSQ8kma
	 FUdpXd7noUd+BnzaH3wx5r3FQOzygD0F67J5vunbJpO/+S7/Ywl/GiF8NSk0HrjF1M
	 8lGfj40pdwAmg==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E3E3F60931;
	Fri, 12 Jun 2026 16:33:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 12 Jun 2026 18:03:27 +0930
Subject: [PATCH] arm64: dts: aspeed: Fix duplicate pinctrl labels and
 address scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-aspeed-arm64-dt-v1-1-d1d1a4737905@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAFbEK2oC/yXMQQqDMBBG4avIrDugUYLtVaSLmPzVEaqSURHEu
 5va5bd47yBFFCi9soMiNlGZxoTikZHv3diBJSSTyY3NbWHY6QwEdvFrKw4LPyvjautbhLKkVM0
 RH9nvY/P+W9d2gF9+GzrPC8V0WEhzAAAA
X-Change-ID: 20260612-aspeed-arm64-dt-942a86cbed33
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, joel@jms.id.au, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6435;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=J1juUJ02HqSgk/LBAT55Ph6yeet02dscpZhfvtggV1Q=;
 b=owGbwMvMwCW22PjiTL8dD5cxnlZLYsjSPlLw58GEVddbU67Frv5V2vysc11KGs8MMwX1ltwsQ
 +35L93edJSyMIhxMciKKbKsCLQtvLt5UvzPA9nHYOawMoEMYeDiFICJZCcy/K9TvGCoVrzU8ZlQ
 7tvrLq7h7Tw8DjZrJ+XL3Q4L7GJofsbI8G1Vl87l8ML/M5SSw166Mh9WsZhuwcx79SCrZszzZzM
 2cgMA
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_013401_166074_E21AB111 
X-CRM114-Status: GOOD (  13.32  )
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

From: Ryan Chen <ryan_chen@aspeedtech.com>

A report from shashiko-bot highlighted some concerns concurrent to
application of the series[1].

Fix duplicate pinctrl_tach{0-15} and pinctrl_n{cts,dcd,dsr,ri}5 labels
in aspeed-g7-soc1-pinctrl.dtsi. These didn't cause errors from dtc
because dtc accepts duplicate labels for duplicate nodes specified
through a node reference[2].

Drop the cpu-index from secondary/tertiary container nodes: reduce
the "#address-cells" from 2 to 1 and update unit-addresses and reg
accordingly. The 2-cell scheme was proposed in an early mailing list
sketch to prompt discussion[3], but the design evolved in ways that made
it unnecessary.

Also remove URL comments from the DTS. The links were to comments in
the kernel sources with discussion justifying the approach, but are not
necessary to carry forward.

[arj: Extend discussion in the commit message]

Link: https://lore.kernel.org/all/20260609025708.ADBFE1F00893@smtp.kernel.org/ [1]
Link: https://lore.kernel.org/all/b226339bb2abe42ce23e90eadbc654b426131083.camel@codeconstruct.com.au/ [2]
Link: https://lore.kernel.org/all/1a2ca78746e00c2ec4bfc2953a897c48376ed36f.camel@codeconstruct.com.au/ [3]
Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device tree")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Link: https://patch.msgid.link/20260611-dtsi_fix-v1-1-ef2b7cd86d6d@aspeedtech.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello SoC maintainers,

Here's a patch containing Ryan's fixes for issues in the report from
sashiko-bot linked in the commit message. The series in question was
inadvertently sent to soc@ before consensus had been reached through
review, and applied to soc/dt concurrent to some of the discussion on
the list.

Thanks,

Andrew
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
base-commit: 564edaca14861ba9e58d4e646d272c677296d285
change-id: 20260612-aspeed-arm64-dt-942a86cbed33

Best regards,
--  
Andrew Jeffery <andrew@codeconstruct.com.au>


