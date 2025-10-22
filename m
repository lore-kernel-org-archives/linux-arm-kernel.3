Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359C4CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poKoDk5JsUNnSl1nvbFWT7ZRjSjAmaJktrcHmAUIWUA=; b=Gi80eBg+cIKYK0JzRGk9yOhbCy
	XBU2CjO5pEixLTdiX4xHB+EUkOl1lW15TWdHUjV3q4NYDzYMa1KE+0VUAkgJNtD4pLHlLsKrDkeps
	RhZPKQfzcKbWyfgFtcSs7l+uFQMsreI2InlbCRpiU3YJP80EKd03AMacV0Q/as19Yz5tqtBFmPrhq
	JzkD64Qd17PYC+MUrrbViL1jMKmNMe3yRsbTG6dAq8Rfal1d452K1vIAH/D2pFey+EUwTMof+Wr44
	EztF8UO2MlQy2npbPs4F889rMKI5+h0/pVbNX1ORTgnqqDPqaXDXuY0aNRE9PmAs+Efm3QkQbKaTa
	GMiITYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSkv-00000001jzk-2NQV;
	Wed, 22 Oct 2025 06:55:33 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSkm-00000001jrA-1z5p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:55:25 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 22 Oct
 2025 14:55:08 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 22 Oct 2025 14:55:08 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	<jk@codeconstruct.com.au>, Kevin Chen <kevin_chen@aspeedtech.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v5 3/3] irqchip: aspeed: add compatible strings for ast2700-intc0-ic and ast2700-intc1-ic
Date: Wed, 22 Oct 2025 14:55:07 +0800
Message-ID: <20251022065507.1152071-4-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_235524_571146_D89FE829 
X-CRM114-Status: UNSURE (   9.61  )
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

The AST2700 SoC defines two parent interrupt controller blocks
(INTC0 and INTC1), each containing multiple interrupt-controller
child instances ("*-intc-ic"). The existing irqchip driver
(irq-aspeed-intc.c) currently only registers a single compatible
string: "aspeed,ast2700-intc-ic"

To support device trees that describe the INTC0 and INTC1
hierarchy more precisely, this patch adds two additional
compatible strings:
 - "aspeed,ast2700-intc0-ic"
 - "aspeed,ast2700-intc1-ic"

Both map to the same initialization function
`aspeed_intc_ic_of_init()`.

This allows DTS bindings and drivers for AST2700 INTC0/INTC1
to be matched correctly, while maintaining backward compatibility
with the original compatible string.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/irqchip/irq-aspeed-intc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-aspeed-intc.c
index 8330221799a0..a40b406dc8fa 100644
--- a/drivers/irqchip/irq-aspeed-intc.c
+++ b/drivers/irqchip/irq-aspeed-intc.c
@@ -137,3 +137,5 @@ static int __init aspeed_intc_ic_of_init(struct device_node *node,
 }
 
 IRQCHIP_DECLARE(ast2700_intc_ic, "aspeed,ast2700-intc-ic", aspeed_intc_ic_of_init);
+IRQCHIP_DECLARE(ast2700_intc0_ic, "aspeed,ast2700-intc0-ic", aspeed_intc_ic_of_init);
+IRQCHIP_DECLARE(ast2700_intc1_ic, "aspeed,ast2700-intc1-ic", aspeed_intc_ic_of_init);
-- 
2.34.1


