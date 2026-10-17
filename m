Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6844ECCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMR9NHx2zb2FLTQwDhokawfL6JKdx49X0IlMyOlscr4=; b=EX2SwhXs3YaHBrN+UKmjIXRndT
	XZYevHgQS7RTZx+kDUhBXBE15K6hck1QsfxtIb9kz4oSq2gUszDyyfvs6lpNeRmjXj3vP6r8Ri83K
	Zmj3XHIiNHKlIxlMnodNRW24iv3W2A5EWWVZ2IrFUeyOlYHi7cSDNnX+8aIIeZhtv9W3sVH19YL+6
	sNwzR+0dBX/2txcrA/IiKxfLUDLIjY+f0NnkEnzqFyE5RuqQ3SiCx2ysitMN+YHBpCVYNbv1blLcS
	PRl/khq8luXIFzk5UP0uEzYf6lQ+NnlP+ZIg9GxYwv8JTuyA2bx9l5Hubl2RVE/1Mko3eN6+1CeGt
	b+uaDheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8c-00000004Y3e-3if2;
	Sat, 17 Oct 2026 07:47:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8Z-00000004Y38-3LSu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9236E6022E;
	Sat, 17 Oct 2026 07:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187381F000C4;
	Sat, 17 Oct 2026 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792223245;
	bh=RMR9NHx2zb2FLTQwDhokawfL6JKdx49X0IlMyOlscr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EQRqheCaALCCTfQcx3Mpyk8Ae1CXrMoOWqDNV1iP8vGP43RZ7eZ/u44xdtoQvtMhb
	 w380ttZmHPFz5Y324ENEkD/Y+5uiueFwpjBsoen/5sV15rTBTuVm3oxw6rOCJkSr2o
	 Yc2uAxeLBPCL9wkA2cOF02v4OzlUrMAs1aT3wc1gvAZ8IuswwBgvMI+hcPtmOjATdn
	 BY8Y7voOUAaH9mY0MNrALVJfLuc/tk6mE8rbklF8M4iz3XctbXEy26zu6K0HUTek7Q
	 aiTLiqe+clZFfbIlR3xNu2RqYK4cO/9j1MC0L2Yi1uxPk7VGLqW6ZYHkqVv2L/QfI5
	 Wv4WPlD+EEHig==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 17 Oct 2026 09:47:18 +0200
Subject: [PATCH v2 1/3] ARM: dts: broadcom: Preserve the XG6846B CFE
 holding pen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-1-bf6b4b374b6e@kernel.org>
References: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
In-Reply-To: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

CFE copies the secondary CPU holding pen to physical address 0x1000.
The secondary-boot reservation covers this area, but its no-map
attribute prevents the reservation from taking effect with the normal
ARM kernel placement.

ARM reserves its initial page tables before scanning reserved-memory.
With TEXT_OFFSET=0x8000, those tables overlap the secondary-boot region.
The reserved-memory code rejects a no-map region overlapping an existing
reservation, leaving the CFE holding pen available for allocation.

Use an ordinary reservation, which can overlap the page-table
reservation while keeping the holding pen reserved. This also matches
the semantics of the vendor device tree's /memreserve/ entry.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
index a3616fb7b3a8..6cb221dca0ac 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
@@ -34,7 +34,7 @@ reserved-memory {
 		ranges;
 
 		secondary-boot@0 {
-			no-map;
+			/* Includes the kernel's initial page tables. */
 			reg = <0x00000000 0x00008000>;
 		};
 		pmc3-firmware@8000 {

-- 
2.56.0


