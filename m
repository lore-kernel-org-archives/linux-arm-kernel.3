Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B9AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 06:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LAQ6Z6EwAvfbHLN69Pjt5N3KgdNTZvyqg+Ui5xtL1j0=; b=LcM1EaBQA8cIUSPrjWBRMNNXp3
	iowKvhb0ke+h1Yy0+BjkgoaL4GSXyefrYx2nNfBRDIcliUh4RO2mFp+XRKVAJYR7mwc31jVyOqOMO
	fjjfOPUOJGEaZCwiiWAWIMMHDl6IGGd7blRPMJyEgDPEuvmfAt5L2Huh5OgyLjz/fUggfWyi3TLf0
	s4g8dgwA0TUPsidsVGi2DsDOtLJWptqIjgubz8VV4XPLB0XfSiCy7EBMJajWKOzz6VHFvgecR4cfm
	eTLMXbPyGMvQ/Yn7x/lQRZX190O/Rr6/sf7tjxypAd1/ipny0CLksCkJCrPIkkvEys9kTHb59vAhL
	VXQtfYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wineV-00000007CDe-2Ps7;
	Sun, 12 Jul 2026 06:26:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wineT-00000007CDR-3mQB;
	Sun, 12 Jul 2026 06:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5779042B1D;
	Sun, 12 Jul 2026 06:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2985EC2BCB7;
	Sun, 12 Jul 2026 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783837617;
	bh=Vr4HVuUefqZoMgR1OZYG2aJ1KU03OvqZFMVAlXZ3S3Q=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=UlNP0AXpR0W3oNYqEsa74thYYwjIS8sI7Vq6nfANp7C55AJgAvdDQnYFT/FsL0Rac
	 gmaQ6a0lY7oOy4/54YhSI8Xerj8S4wz/W/NJbOoH3K26iNVGp5P+zUNavJUvMPPlbE
	 x3fYu16933LYIcD8ibxwvSiaN6DodGgLQEs0MbI6uWgJUfQnOskd1GPdIT873JkKmD
	 6QQznvWV5xyK2haicsllKNg1Kf9VqpbnGs66mXeKXiZaZI4xmoMobLbnitWT4H3jC6
	 VGvaonBKeXkVqo7SEd6wq3lq+x/fAf922XfByd18wHiSXnqljMVBClUn+dwd0qSbIh
	 CatX7sL+VI+fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEF5C43458;
	Sun, 12 Jul 2026 06:26:56 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sun, 12 Jul 2026 09:26:36 +0300
Subject: [PATCH] iio: adc: mt6323: remove unused header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTsJTLUYr2JYlPZHxgQ0UzQkh
 Ltbdfkt3tsowxSZLtVGhrdmfcwFzaGiOIb5BtZUTFKLr9tGeFq8E8chRbaJR4QEY39yaAecj5I
 ilfRpGHT9ba/d3/nV3xGX74v2/QMdiVPweAAAAA==
X-Change-ID: 20260712-mt6323-adc-rm-header-653e7fe842dc
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783837615; l=887;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=4AfmdH97pxmA7NGkEcbGJbdXmNTkYLKIx6MU+gfb9S8=;
 b=bb5KN3ABVq20sUCeCrgmAdVq9DUtWjUEDn0Z/GsgayOaPBYwEcqAUNghEqJiXpdx/neq9Zy3B
 gnnMxpawH8IDS8mtOv9ueHAQjFbRTGkbZY597sUts0aFjDyxrO6tuko
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Remove unused mod_devicetable.h header.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
A small cleanup for mt6323 auxadc driver.

This patch is based on top of iio/togreg branch.
---
 drivers/iio/adc/mt6323-auxadc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-auxadc.c
index c450fb6f09cb..4f73ac42abb7 100644
--- a/drivers/iio/adc/mt6323-auxadc.c
+++ b/drivers/iio/adc/mt6323-auxadc.c
@@ -11,7 +11,6 @@
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/iio/iio.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>

---
base-commit: 2e2f2de7532cbbc2269de8be20ec709606c6e79b
change-id: 20260712-mt6323-adc-rm-header-653e7fe842dc

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



