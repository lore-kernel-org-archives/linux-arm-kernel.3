Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797B7E748E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhrIoXouXYs4DJFLD2MmLh4WIXwwUc8JqcYdOTRcOos=; b=K81LA6wI77OvAEFlLL1rBUl0WS
	kufg4sCktE33EpKsNytXaCxBZ3AvPecH4dCYp/wqneKBpT1+vXcwgszrHoBkCr1snN6J9cZNjSojT
	0nMgXMwkcksobt1Wywjo9qjjhV08chn57FJLKIJdpEMlqcuIhN2G5cFAUWbZNPci5FV5iNRrBa42A
	hB+IIKNkTxE4j78MfgmgAWtBx/sk3Wy4L8dLjN4Q/tGVBqIACAZPR/CPKOsRwratdffw5LQwmnWaq
	2YlDgFgR8jSc37LdDXC2TRGl2B91OUkQgH5v22BLjmdORqY7VktrbLtHgA+BsZIGrPLdsyo27ddJZ
	y2mDu7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYA35-0000000G6WL-1Rtd;
	Tue, 23 Dec 2025 21:36:07 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYA2Z-0000000G6VE-28p7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 21:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mhrIoXouXYs4DJFLD2MmLh4WIXwwUc8JqcYdOTRcOos=; b=9cKGKIlt2MeEKd8kxKur8Uwb0/
	3FnjnIFaeQgivS3hca7eFsDYB/F3IDB6uldNIsQB9JTqD+eWzpSqu31am2veeiftzkXX2+UHo2KsK
	b+KtxS+zxAw3BmFphllnMn6uMVa1Z5ToT3drTTcegcynDw7+zXhtebwBEaox0xN2/+9QvDi4IfX1e
	C6+/kCy9+nghYPmGDgb513CrGVEFw448UzaDOgDzaKYP/pUk4+IMhjKuAO12+d712hbmboQ70dWVW
	1IaB/f2ljAChOFSTqgRJ817ZuWUC8cn4K6r8F0lV0BuFfJ2f35FHLD5f/Uoaov4iFiWjscQ6Va25Z
	ODt5CsUA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 23 Dec 2025 22:34:03 +0100
Subject: [PATCH 2/2] ARM: imx_v6_v7_defconfig: enable EPD regulator needed
 for Kobo Clara 2e
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-fp9931-clara2e-v1-2-e5b1cb79330a@kemnade.info>
References: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
In-Reply-To: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=718; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=4LxVzoYiZ+imSrOKh/GT1oH8ji6K+fpHnPRTQVJteRM=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJneXH9sMs8laIg9D2za8Mtx9UT56aka3OfmfVkpXblx6
 ardkzz+dJSyMIhxMciKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjCRtAMM/6PrFwvnsj+skb78
 eJOmsKVsXK7+0sa3X16+6Jktefjioy0M/52VTVX1bsju3Sy34pCPjvsJjTrmranVD5pWlK3/Wrl
 qEzsA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_133535_570941_4AAA00A0 
X-CRM114-Status: UNSURE (   7.45  )
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

Kobo Clara 2e revision b requires the JD9930/FP9931 regulator driver
for the EPD, so enable it.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0d55056c6f82..94ef23b272fc 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -251,6 +251,7 @@ CONFIG_REGULATOR_DA9052=y
 CONFIG_REGULATOR_DA9062=y
 CONFIG_REGULATOR_DA9063=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_FP9931=m
 CONFIG_REGULATOR_LTC3676=y
 CONFIG_REGULATOR_MC13783=y
 CONFIG_REGULATOR_MC13892=y

-- 
2.47.3


