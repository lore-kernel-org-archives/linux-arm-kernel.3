Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04644CF8846
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSv/toN8LhY0dPYfxd/+apT8J/RWyA9BoX5PvgpGrmE=; b=lKjpGAqAaRBfjvIL4pRRDqhSfK
	XFWkBJHO8VIn4QDInD9WwzWNEbuwGi7GfSI2xqUZjKCyv/NXYfdWiMma10W4M7T7zOuev5O1udYhL
	qR6h5w8SoykOKFWrbrDiD5BwzfcdbTKTQwVY62WHuGq0g01brk7nhDPBuxi0uNfCBDQBIZPvNKcZU
	Qk3pAEwwJrzXrCGtoY4L4xbLRt+GpNjmVugtiX/qgApqgvpV+Phr1V9ciZBra7OohTZ96iy1iSfuy
	hytMamM14ZV9jVgPl7lFFHrcssNrruISomQ8UG4Iy1Qdt7rvcb+shpmcfbBvULnrda+/kiWbl4Lda
	fXvnY2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2ao-00000006YO5-3U2x;
	Thu, 20 Nov 2025 11:12:50 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2al-00000006YMA-0GTX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:12:48 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 20 Nov
 2025 19:12:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 20 Nov 2025 19:12:34 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 20 Nov 2025 19:12:32 +0800
Subject: [PATCH v3 2/2] hwmon: (aspeed-g6-pwm-tach): Add AST2700 compatible
 string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251120-upstream_pwm_tach-v3-2-eaa2f9b300a2@aspeedtech.com>
References: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
In-Reply-To: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763637154; l=856;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=ej2x2zXWoa7QtHmm0Xcp6bZn7Ld93lchW1+uF4w0usU=;
 b=9D8NhxSOyyG7fLbywKVqdjG1j+SQgH267L/XyiiX3zrdd3nPdvt9S2B2UD+K/F7tfAiJFl7mu
 eQwMsMn8g+nDR0affVT6WVYSAiPG6plYrtnArbJqsrQPPzpQqSl5SXV
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_031247_097445_373025F7 
X-CRM114-Status: GOOD (  10.59  )
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
2.34.1


