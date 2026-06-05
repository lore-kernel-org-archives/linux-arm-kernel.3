Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2BECD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GD2Kr06zQNFkIwrVrOalWnuCkNJUXETOOuvMASHG1wc=; b=PvrWbgMGTZcjLiM2dnSf6hhQv+
	HVSKSwciWdhVPtkSZIH/NxKcjz1sqW1Z75Hz1k2Netl7GSJ96jLZuYeYyqegmCgFkDK87GYW0gptO
	5HxNomDIsYiY3PRIOgrN3ZalKUcOPX4T/Gmw0fuU+jPaCclCXkmKBBTSTp1n6oIcqIlBhcCo03TzZ
	5aUO9uYM6PGygtE7wlABjozAGund+1LPH0AKNU0jzJYb9nlN2ug37RqadF6yupeJBwLTZGZBl+8iQ
	dUnJsCTqGjpouJR7ANR+g26iTYRPP5liqr5U1O1y5R0ohGzhx4TzE7vLCfv7fGMhoxwv8YSf2MpEw
	RQ68fkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNZK-000000007z6-3oLE;
	Fri, 05 Jun 2026 05:58:10 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNZH-000000007yf-0Pbd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 05:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=GD
	2Kr06zQNFkIwrVrOalWnuCkNJUXETOOuvMASHG1wc=; b=DbmCziOv5IknDVlK99
	daj1ffrq+HwEfO5hUp3zaUPHJ4mWsF+C0X1NdDeCRGSFmnlioqmZ+X+YV/rurLl9
	mBh+mTkxRqhtKkkPog+n9w1wGobIRA0raergS38laMxKw/+RLEz+nlQ58ctS4w4i
	6LLVuZ74B58zsqIPOawbfVo34=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAXkGE7ZSJqxsLwAQ--.65168S4;
	Fri, 05 Jun 2026 13:57:18 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/2] ARM: dts: aspeed: add 'resets' to video node
Date: Fri,  5 Jun 2026 13:52:43 +0800
Message-ID: <20260605055712.118501-3-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605055712.118501-1-haiyuewa@163.com>
References: <20260605055712.118501-1-haiyuewa@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgAXkGE7ZSJqxsLwAQ--.65168S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr48Kr18WFy5Kw1UtF43Wrg_yoW8ury5pa
	y7Cr4kX3ySgF45t34UGFyDKr1DAay5JF4rKrsIk34UXry3X3sYqr1ftrsag34UXrs5uw1S
	gF1xXr9Fqw1DXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE3xhJUUUUU=
X-Originating-IP: [116.233.237.18]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzh+L9moiZT+z1QAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_225807_627229_4BF9525D 
X-CRM114-Status: UNSURE (   9.53  )
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

The aspeed video (be compatible for ast2400, ast2500, ast2600) now needs
the reset DTS handle specified, otherwise it will fail to load:

[    4.809494] aspeed-video 1e700000.video: irq 57
[    4.809977] aspeed-video 1e700000.video: Unable to get reset
[    4.810341] aspeed-video 1e700000.video: probe with driver aspeed-video failed with error -2

Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index c3d4d916c69b..1547e28d77e2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -242,6 +242,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <7>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 39500bdb4747..793570ca2518 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -296,6 +296,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <7>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..3adf48987a17 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -428,6 +428,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
-- 
2.54.0


