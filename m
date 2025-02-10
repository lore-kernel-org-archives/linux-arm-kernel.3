Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2516C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnPL6qlRjnhYn1bG++Obl2wl3mzgTVcYBa5NvDw/CSg=; b=G36hEhW3mj1caXDpYXmJB3UZ70
	tvSjOtFeMfdmpFSYDFjzq0Vw9pPszdVdXImjTDuH2XvQSc2vxH9Gh4/zTYQGPSa0QMcQZcym0+kUD
	jeAq4+6Gauk/NLZ9K5nlXY+KS+RAbOOA9Zh5Nr0TCd95UjOcZlyqO2ZtLPYwKiEvUAFS/BqgHgpzN
	qS6hgZ7GXWWvnga30xiXgled3Qmg3iKgHeHjqQACwHOnrmjflA6kr1pO+U839wbRIPtdmNGCiDzQU
	iF/ooNStnAWem/8OxFLilqs0M9TfSJHocwjmRoi4u1KrbRAWawlzBW8nOyESGWGYObncC6COymvLy
	OgUdvTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPfc-0000000GkbI-3lIM;
	Mon, 10 Feb 2025 09:01:36 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPUi-0000000GiDn-0eYu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 08:50:21 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 10 Feb
 2025 16:50:04 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 10 Feb 2025 16:50:04 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/3] dt-binding: clock: ast2700: modify soc0/1 clock define
Date: Mon, 10 Feb 2025 16:50:02 +0800
Message-ID: <20250210085004.1898895-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210085004.1898895-1-ryan_chen@aspeedtech.com>
References: <20250210085004.1898895-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_005020_202524_EBC61082 
X-CRM114-Status: UNSURE (   8.17  )
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

remove soc0 clock:
 SOC0_CLK_UART_DIV13
 SOC0_CLK_HPLL_DIV_AHB
 SOC0_CLK_MPLL_DIV_AHB
add soc0 clock:
 SOC0_CLK_AHBMUX
 SOC0_CLK_MPHYSRC
 SOC0_CLK_U2PHY_REFCLKSRC
add soc1 clock:
 SOC1_CLK_I3C

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 include/dt-bindings/clock/aspeed,ast2700-scu.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/aspeed,ast2700-scu.h b/include/dt-bindings/clock/aspeed,ast2700-scu.h
index 63021af3caf5..c7389530629d 100644
--- a/include/dt-bindings/clock/aspeed,ast2700-scu.h
+++ b/include/dt-bindings/clock/aspeed,ast2700-scu.h
@@ -13,18 +13,17 @@
 #define SCU0_CLK_24M		1
 #define SCU0_CLK_192M		2
 #define SCU0_CLK_UART		3
-#define SCU0_CLK_UART_DIV13	3
 #define SCU0_CLK_PSP		4
 #define SCU0_CLK_HPLL		5
 #define SCU0_CLK_HPLL_DIV2	6
 #define SCU0_CLK_HPLL_DIV4	7
-#define SCU0_CLK_HPLL_DIV_AHB	8
+#define SCU0_CLK_AHBMUX		8
 #define SCU0_CLK_DPLL		9
 #define SCU0_CLK_MPLL		10
 #define SCU0_CLK_MPLL_DIV2	11
 #define SCU0_CLK_MPLL_DIV4	12
 #define SCU0_CLK_MPLL_DIV8	13
-#define SCU0_CLK_MPLL_DIV_AHB	14
+#define SCU0_CLK_MPHYSRC	14
 #define SCU0_CLK_D0		15
 #define SCU0_CLK_D1		16
 #define SCU0_CLK_CRT0		17
@@ -68,6 +67,7 @@
 #define SCU0_CLK_GATE_UFSCLK	53
 #define SCU0_CLK_GATE_EMMCCLK	54
 #define SCU0_CLK_GATE_RVAS1CLK	55
+#define SCU0_CLK_U2PHY_REFCLKSRC 56
 
 /* SOC1 clk */
 #define SCU1_CLKIN		0
@@ -160,4 +160,5 @@
 #define SCU1_CLK_GATE_PORTDUSB2CLK	85
 #define SCU1_CLK_GATE_LTPI1TXCLK	86
 
+#define SCU1_CLK_I3C	87
 #endif
-- 
2.34.1


