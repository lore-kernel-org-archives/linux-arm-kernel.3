Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AF3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 05:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SjDo9zkPqh5G3a4cJVEabwQF/qW3EfvDIzwridmYrhk=; b=qqaPETrLKtiyzoSfUiPEgqDrWn
	B0j9C+RmFC3YzayuX0kAsIFPqgzjxnEIbZxH0SyA+D6vJivwBiaQf+xwFqUUwuF5OcPxC9efcGTpB
	WM4399+Oy8bXVFaZ1sUX5qvPbwhzGs6iwFA1p5T829ZnqpKoR05Q7TVYp87n01sPWwFS5WJUqf++N
	yf2jzR0zfzmwWpx7ONcoo2EC5dJTmcw0E53oIfk/78AP+Qgv8+tuz/sIhyC2Xfv+rJb+nlCUVP5+x
	BabjE85rFzviYAL6bd2ZDlWBEmgVmQoBRyWTHZasr3pDJEppfKZbF/AKTt2Y9c5b2RztxjkjjEWFM
	JVnIwKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdLaR-0000000C9gz-0BxX;
	Sat, 27 Jun 2026 05:28:15 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdLaM-0000000C9gf-37eW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 05:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Sj
	Do9zkPqh5G3a4cJVEabwQF/qW3EfvDIzwridmYrhk=; b=TCkjbpfRH/7tLfUjmQ
	qzbCkOInafayZdvaCXmqft3mb286eZg7/1lTSWRC1pQdBbu1flSG7PRhq1WgEIyM
	FAoo4nzx1vL/wSIHWAbg8wM+LENOBProUGbnROs0me2vuPTNOJAE8VHriVp1U+AX
	90hIu53qkfUfBhSdBpOTQsKhU=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXCwMxXz9qZPylEg--.40725S2;
	Sat, 27 Jun 2026 13:27:15 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: devicetree@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Haiyue Wang <haiyuewa@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible string
Date: Sat, 27 Jun 2026 13:27:07 +0800
Message-ID: <20260627052708.172918-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgBXCwMxXz9qZPylEg--.40725S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4DCFyUZFy3XrW3AryDtrb_yoW8AF43pa
	909aykX39aqw4aq3WDWF1ktr4kJ3yrAF4DK39xAayUJF9Fg34IqF43tF4xKFsrXr4kuwnI
	qF18CFyqqr1DWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRj0P-UUUUU=
X-Originating-IP: [101.228.92.86]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzRRPumo-XzQRUwAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_222811_686613_0BA8EE96 
X-CRM114-Status: UNSURE (   9.01  )
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

As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatible
string") does, change the AST2600 DTS file to use kcs ast2600 compatible
string.

Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..774d5af495fb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -585,7 +585,7 @@ lpc: lpc@1e789000 {
 				ranges = <0x0 0x1e789000 0x1000>;
 
 				kcs1: kcs@24 {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
 					interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
@@ -594,7 +594,7 @@ kcs1: kcs@24 {
 				};
 
 				kcs2: kcs@28 {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
 					interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
@@ -602,7 +602,7 @@ kcs2: kcs@28 {
 				};
 
 				kcs3: kcs@2c {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
 					interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
@@ -610,7 +610,7 @@ kcs3: kcs@2c {
 				};
 
 				kcs4: kcs@114 {
-					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					compatible = "aspeed,ast2600-kcs-bmc";
 					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
 					interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-- 
2.54.0


