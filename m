Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B3CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 03:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ILy73sttCQKjQ905fT2jb4GJKnPBKwJV0b2jd47RFds=; b=TXKhT79K50imDvDxI8abWwItPL
	oJjMhZopfsrwBlmxpxcVoZDp0dOPDt6agbFiUMf13xHlveV8FdtUBm2qsnM3KZ/cR8DZILvOy5RxP
	kgMEgUG1N38UgC6I+rUKDJP0npCZCKQC35yal/xYPZR/FctdPcYwV/q/+unOoXTCYKN0BDaDt1jCc
	wE/lMST3fo2yOBuSRLF9OHd0KoCKBdJuYWN0T6d0HFHlXgnD4x6m69RyHUaciBveFd2FSebsyzObl
	OFu6GK+8lO1pz8/Sn1K0R51yjXfClkaPUAX8Dt6Fw16ZwGbRtxfGhAH+BZG77emqXFzb15v75L9E/
	lJ+D01Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqgP-0000000EoLg-0kVF;
	Thu, 06 Nov 2025 03:29:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqgN-0000000EoLX-3fea
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 03:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1DB160051;
	Thu,  6 Nov 2025 03:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55A9DC4CEF5;
	Thu,  6 Nov 2025 03:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762399746;
	bh=M0+1u9tcjtZAWeIYRMKAetnt82+eDnNc/pxxjVmeGJ8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Dh/0XwzCtPCb0+qYPzg7D7KZCE9NvK2+eQz0QYIYPccpP3TpZCVGlWnTBz/kDIP+I
	 VXA59TVihOTPfE3z700wZC8gLk/1MxZF95f8JJ5P+QDe1Wx57NEtOdFUjfv3LCvC7i
	 0ZPVuir+WBdj6jXJk6+bVx7VtydAp/iOWprFEJDYs5PB3gGGhiLfoA6mqpcz/bcX44
	 aT2N+7JDGvi0JyAOVQRqxHpWdUHz5Ivd3N6jaijEBGMbTHl05FbWtL+EfJ9ygVO/fB
	 AXEP0egvtMYYyAwNoPBy0V/NsTw9aJP4WmY7U3MeG1SRw+yi+YFigpA9Vf8jKg+ePZ
	 IR3dpCojZa3Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E65ACCF9F8;
	Thu,  6 Nov 2025 03:29:06 +0000 (UTC)
From: Kimi Chen via B4 Relay <devnull+kimi.zy.chen.fii-foxconn.com@kernel.org>
Date: Thu, 06 Nov 2025 11:28:57 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: add gpio line name to io
 expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-dts-add-gpio-to-io-expander-v1-1-b4765c092ebe@fii-foxconn.com>
X-B4-Tracking: v=1; b=H4sIAPgVDGkC/x3MMQqAMAxA0atIZgO2WgevIg6hiTVLW1oRQby7x
 eXDW/4DVYpKhaV7oMilVVNsMH0H/qAYBJWbwQ7WGTPMyGdFYsaQNeGZsFXuTJGlIE1+tN7vbia
 CdshFdr3/+7q97weaqovrbQAAAA==
X-Change-ID: 20251106-dts-add-gpio-to-io-expander-a4c32ccf56aa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, Kimi Chen <kimi.zy.chen@fii-foxconn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399744; l=1184;
 i=kimi.zy.chen@fii-foxconn.com; s=20251105; h=from:subject:message-id;
 bh=AqtmtuP+jr8hv72i4Nsvgu+5GWsxpYdSguFgfPJMrrg=;
 b=gWTwCX2zWlQlFmQ63qT3cV1Pcm+eKRpXeZgl3/1S5mJQoeNAfaz9EI1I+tUftf1a7t2j1hDTo
 eWJkfoeyTbcD7nRo1MdQ4AHqWcYF0SRWvsqNNqGdct6+z+VvOuuCC5b
X-Developer-Key: i=kimi.zy.chen@fii-foxconn.com; a=ed25519;
 pk=3zHetsW/3CYYIgQlYV9dqSS7aW7aZXLUaIvc+OKr3NM=
X-Endpoint-Received: by B4 Relay for kimi.zy.chen@fii-foxconn.com/20251105
 with auth_id=559
X-Original-From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
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
Reply-To: kimi.zy.chen@fii-foxconn.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>

The chassis power cycle process requires a forced shutdown before
cutting off the standby power. Therefore, SCM CPLD adds a hard shutdown
host function and triggers it via the IO expander in Clemente platform.

Thus, a new GPIO line named "hard_shutdown_host" is added to the
PCA9555 IO expander at line 10 to notify the CPLD to execute the hard
shutdown host function.

Signed-off-by: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 450446913e36..0eafd8ea04ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -983,7 +983,7 @@ io_expander4: gpio@4f {
 			"",
 			"",
 			"",
-			"",
+			"hard_shutdown_host",
 			"",
 			"",
 			"",

---
base-commit: 6953afcd81a2cc73784e3dd23faa0a1aaf97441a
change-id: 20251106-dts-add-gpio-to-io-expander-a4c32ccf56aa

Best regards,
-- 
Kimi Chen <kimi.zy.chen@fii-foxconn.com>



