Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A7ECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 05:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fA06ODKykpCwU5SpUaMRRFriIP3mIYry2ZKL0oVKhQ8=; b=cu9+fkJGl3IXdUINRp0BK4i+W+
	KmtJVGafJJFVBS8D/S1vA5SN8olyjwIND+9IPiJRCKFKKGpkmiaYTl5jlN1jk3HgVlT5ctr/sQVLH
	qYiMGkEQxMJTKlYYlYR4gTvOXMg4z50j+RAFz0pkhvojuSYrCDC7D5INwX6d2WRW83iuMvu3wU/T9
	EAkaUETX8g/UT+vovTkZW/jmBiDhOMLCmzMuaBCqxDXljurg/AMZfU/XM1jylCu3G+5Pr2CeWXNhx
	uEwaQG7Q9YItK25xDo4nL8sf5lpIp2PviEP6KeEGw4hs+Hi4o5lSlFkXh5hLNQLJWwD0BOCkdrSJZ
	h3awD/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9x2-0000000BClZ-3FaL;
	Tue, 04 Nov 2025 05:51:28 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9wy-0000000BCja-1M1y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 05:51:25 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 4 Nov
 2025 13:51:12 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 4 Nov 2025 13:51:12 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<billy_tsai@aspeedtech.com>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] hwmon: (aspeed-g6-pwm-tach): Add AST2700 compatible string
Date: Tue, 4 Nov 2025 13:51:12 +0800
Message-ID: <20251104055112.2679087-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104055112.2679087-1-billy_tsai@aspeedtech.com>
References: <20251104055112.2679087-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_215124_361921_EF842FF9 
X-CRM114-Status: GOOD (  10.98  )
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

Extends device tree support to include the AST2700 chip variant by
adding its compatible string to the device match table.

The AST2700 PWM/TACH hardware is compatible with the existing driver
implementation used for AST2600.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 4174b129d1fc..44e1ecba205d 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -528,6 +528,9 @@ static const struct of_device_id aspeed_pwm_tach_match[] = {
 	{
 		.compatible = "aspeed,ast2600-pwm-tach",
 	},
+	{
+		.compatible = "aspeed,ast2700-pwm-tach",
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, aspeed_pwm_tach_match);
-- 
2.25.1


