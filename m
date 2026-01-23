Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A905D72350
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fbsN5ZEFZE5NcAhqQKkrKzJc628Um5uggFEdrqrp/E=; b=R/VMJR7tIFamdepgZWKbONa8oy
	sOi5VHbs/Mj/o/rJcez0aAap6E40305vFQUfmFyoELU5WasyHxTSlqBYnF1kc1BhytuB/QKe3XghO
	mqokYtiLNidmX6V3kTkJ7+XwTFRBxXVC18hojkOZgDDpAg1en4MGw8D6CmC1nEgzjUxfsws4uBJSw
	My07YPTMAUUJ1XyqrbbyG8OLOgi+2wt870xlUIDohDjthSaBp5C0YesOT6ImWd1LhRuLGVs/jxk6/
	vUAQgiAGC3BW6rVSIKBzcsDbULYtCjfEmQE9n7vDAnBRy8kKBGrS37JRLC6+wOTULJNCshQVDKtwT
	UiIA3C7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDRC-00000008Yvo-1KnD;
	Fri, 23 Jan 2026 09:26:42 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDR8-00000008YsP-1lB3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:26:39 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 17:26:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 17:26:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 17:26:27 +0800
Subject: [PATCH v2 2/6] gpio: aspeed-sgpio: Remove unused bank name field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_sgpio-v2-2-69cfd1631400@aspeedtech.com>
References: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
In-Reply-To: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160386; l=1327;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=wq9nW1jVro6VbeJ8h0mIqtAis/vwp9TjCPIxWOSBwOI=;
 b=YC9UInze1Bq7V+AeVOJPr9VhTHhX2yJDKM/ZG0zONoIDK+mvEveIiX4wTrP4BEdrd5OhEcCIj
 NdxYKnFKt9TCSaNByioCJ1UngylgmFMsaNFYivrP/D/Yo7N9Gt/NNhW
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_012638_463648_699E66FC 
X-CRM114-Status: UNSURE (   9.20  )
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

Drops the names array from the bank struct and its initializers, as it is
unused in the driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 318cd0e39741..a96ed6d8a55d 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -43,7 +43,6 @@ struct aspeed_sgpio_bank {
 	u16    rdata_reg;
 	u16    irq_regs;
 	u16    tolerance_regs;
-	const char  names[4][3];
 };
 
 /*
@@ -59,28 +58,24 @@ static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
 		.rdata_reg = 0x0070,
 		.irq_regs = 0x0004,
 		.tolerance_regs = 0x0018,
-		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x001C,
 		.rdata_reg = 0x0074,
 		.irq_regs = 0x0020,
 		.tolerance_regs = 0x0034,
-		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0038,
 		.rdata_reg = 0x0078,
 		.irq_regs = 0x003C,
 		.tolerance_regs = 0x0050,
-		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0090,
 		.rdata_reg = 0x007C,
 		.irq_regs = 0x0094,
 		.tolerance_regs = 0x00A8,
-		.names = { "M", "N", "O", "P" },
 	},
 };
 

-- 
2.34.1


