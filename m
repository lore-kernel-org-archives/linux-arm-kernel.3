Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2B6CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qNe8wO7To1uXLuvMXlb/yhmyc8HWMkfNPw2M+VueKjQ=; b=1pvBADZqlWKov2BiXZno/kW8U+
	s2uTieYiqY6V4k+LLh5cXbIgg9iU4vJZoa/DKmgA2eBlOYkrZnFmGSgclkzWzjJawYklrvKZAfx/y
	DctozZEEpFpF/t4l3tK2bOsBWzS52+/86wjzSGGE6MMibLOK5/z+WrJE5B7qlbENVRqYo9ZypsOFf
	F6b+R7nUyR9C5YS4C9gqhWP+Fqk3J3hvxkXrjyAwK6v03TvDBADEmN1Pb4/a1+MtEaAwiEVxVlGKV
	+HgCY6QwhOICuvfRqohvIhsifFj9mWTwoPMdB5oNU26Ljl2XPw0I4wsjwQfpoc9G/qw5YK66irUu5
	hvpjJFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmKS-0000000FE6x-348I;
	Wed, 03 Jun 2026 14:12:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmKQ-0000000FE6S-2wdE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:12:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wUmKL-00029V-16; Wed, 03 Jun 2026 16:12:13 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wUmKK-000vVI-0i;
	Wed, 03 Jun 2026 16:12:12 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wUmKK-00000007Qap-0bFJ;
	Wed, 03 Jun 2026 16:12:12 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 03 Jun 2026 16:12:10 +0200
Subject: [PATCH] arm: gen-mach-types: don't include absolute filename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-arm-remove-path-from-mach-types-h-v1-1-cda9890ba788@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIADk2IGoC/x3NQQqEMAxA0atI1hOIlSmDVxEXQdNpFrUlFRkR7
 26Z5dv8f0EVU6kwdheYHFo1bw39q4Ml8vYV1LUZHDlPngZkS2iS8iFYeI8YLCdMvETczyIVI7I
 Pb/dZPQkRtE4xCfr7P6b5vh/T+d4pcwAAAA==
X-Change-ID: 20260603-arm-remove-path-from-mach-types-h-a6f528d60e00
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Ryan Eatmon <reatmon@ti.com>, kernel@pengutronix.de, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780495932; l=1856;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=6NBGGGqQdAlf19cdKqd6/c9iSmq50Hg/WoFP4yTaX50=;
 b=smgTy4jOXbjolFympty6AJluSL4Rbwcxk7U6iebblgjl540rACBjgF4K8uZBnDc8Tge3Vy4DK
 HAUxEAHjlKSAeN3x/Q0XnXkGtFxi8LohpGjl1nZngqoMGvRgWLrWCFm
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_071218_746383_B1796C1D 
X-CRM114-Status: GOOD (  15.12  )
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

mach-types.h is part of the kapi and as such shipped in the
linux-headers package. The embedded build path makes that package
non-reproducible without going through an extra step of normalizing the
path. YOCTO has similar problems in the kernel debug source package.

Make the path relative to the kernel source tree which is enough to
find the tool that has generated the file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
This topic comes up every once in a while, without any clear objection
other than "Or just leave it as is. It's in a comment, it doesn't get
into the executable, and thus is harmless.", from which I am not sure if
it actually is an objection. Cced the authors of the previous patches
that I am aware of:

https://lore.kernel.org/all/20241114130021.2802803-1-m.felsch@pengutronix.de/
https://lore.kernel.org/all/13360982.O9o76ZdvQC@steina-w/
https://lore.kernel.org/all/20240213092835.754462-2-u.kleine-koenig@pengutronix.de/
https://lore.kernel.org/all/20241002175049.15219-1-reatmon@ti.com/
---
 arch/arm/tools/gen-mach-types | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
index cbe1c33bb8710..65ec262b31e65 100644
--- a/arch/arm/tools/gen-mach-types
+++ b/arch/arm/tools/gen-mach-types
@@ -24,7 +24,7 @@ NF == 3 {
 
 END	{
 	  printf("/*\n");
-	  printf(" * This was automagically generated from %s!\n", FILENAME);
+	  printf(" * This was automagically generated from arch/arm/tools/gen-mach-types!\n");
 	  printf(" * Do NOT edit\n");
 	  printf(" */\n\n");
 	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260603-arm-remove-path-from-mach-types-h-a6f528d60e00

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


