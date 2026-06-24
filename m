Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF89CDE004
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 05:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbHGYQnLXjx8sR3CrEtTcp69CUeSpUTPyZikbR0/6+g=; b=U9e/Rm+DYcJbhLlAAwU996QDvR
	fA+5aOo+M1TB3MdPC9dW94Hrgd/EooTQ+vjMKLT76wmbB4kutgOMd9uyG9IsvRgPuUbso9BUzBOvI
	4/fZVWLz9QYVNF1N3eApp80QzCcEqItk3toIJu+vs+gJEdGMwOUx5Hy5Aj3P9diC/s30Vw10Yb6/U
	NqfYbGAjEpxnJ3AESejxjHnlOka2HgH3OtKuCTwN03x9y2omnxqCu5JU7DX9EKk/GAUJ7oflv5EAr
	cQmcLdJB9s9bLgn/r6A+9CF8JZwu7YeJUzgRqL22qU1dMaqgzVpufrdADyIPBlIPaakRT0Q4P/e+r
	yDp2SdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGQI-00000007AdG-2uf1;
	Wed, 24 Jun 2026 05:45:18 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGQD-00000007Abj-0OV1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 05:45:14 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Jun
 2026 13:45:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Jun 2026 13:45:01 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 24 Jun 2026 13:44:59 +0800
Subject: [PATCH 1/2] dt-bindings: clock: ast2700: add PECI clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>
References: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
In-Reply-To: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782279900; l=765;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=JUf9fissI0o+YbcRxTHYw+J0Bt4Cob8MbJmxrjdeD0o=;
 b=Dbz+dhYxa8ghMWi+O0fu/mH0ly7AEJ5h7PW3fIkqJGrv1rQJOCUwAC0F+h+dYR/bOITZNM/Fx
 zSU6FRa+1Y2C/8wLxdM/ECnDLAveD5mxSyNzqTI6WjtBtRRXyCSfeDO
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_224513_190685_59929606 
X-CRM114-Status: UNSURE (   7.70  )
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

Add SCU1_CLK_PECI for the SoC1 PECI controller clock source, and
SCU1_CLK_HPLL_DIV4 which serves as one of the PECI clock mux parents.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 include/dt-bindings/clock/aspeed,ast2700-scu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/aspeed,ast2700-scu.h b/include/dt-bindings/clock/aspeed,ast2700-scu.h
index bacf712e8e04..138f78ce5f07 100644
--- a/include/dt-bindings/clock/aspeed,ast2700-scu.h
+++ b/include/dt-bindings/clock/aspeed,ast2700-scu.h
@@ -163,5 +163,7 @@
 #define SCU1_CLK_GATE_PORTDUSB2CLK	85
 #define SCU1_CLK_GATE_LTPI1TXCLK	86
 #define SCU1_CLK_I3C				87
+#define SCU1_CLK_HPLL_DIV4		88
+#define SCU1_CLK_PECI			89
 
 #endif

-- 
2.34.1


