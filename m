Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220D8CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uetyr08EbPxb1/vTxBz/oHKvTpwSsGRtAmxHx+DBRGk=; b=rMNkbZqZMj47WDKrtkXIYuoCm5
	0rZSRJRcSeg/9tKdk2KbGHnNIjBWyyXpHIHIhB9il1h0a8zjzJR1rkn4lcWNAiJ53BIyEXwttYlvZ
	u69/bTSJJEGRGKd6bNzfCZ84+MP9N9bFCjNY9SYs8uJSSroNWkCbtuiNDNbRGzQLQThYoiVvYKUMw
	OVKqozneYKpZFXNJ3wm7x1FHE5gS3drXziBM5fNkEpVsS4NjEDQAW54vcSKjjtdm9eeUmzp5K8T6t
	ybDrXy7Fyn2xYYZLMuVi0NyYKLcrEa9QIbyZe6//iOtbzZ0HAfumytgigT8qjhj7c+xnijDijehHO
	s+GGvKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3er-00000005ZrZ-1Gwq;
	Fri, 09 Oct 2026 06:00:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3eq-00000005Zr7-0W8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:00:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32F02602CA;
	Fri,  9 Oct 2026 06:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D181F000FF;
	Fri,  9 Oct 2026 06:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791525638;
	bh=Uetyr08EbPxb1/vTxBz/oHKvTpwSsGRtAmxHx+DBRGk=;
	h=From:To:Cc:Subject:Date;
	b=fuibOJiZponbSA6UcUYzC37umoqq9FWCLbdQ9pKce5+bgxjG0z1mKlHwaCoCdLeRc
	 MQsxZMxHhJeiAhlhPawV1bc3aY5gaG5ZRv+doc/ru0MN3pegiYaj1mGyuKiygCkRGd
	 YEo6GMY7ohJObQOUlju3yteSWUrCKNCH9wxBZfmPWGUMbaQ6H/ROt4Ea6DQBCaYjMO
	 vCO1v6C5xnp0n5vw9Ur7t+ST2PSUDWS9G9v7FWMP6zmGOqrcV1nOEMZs9zCiBRDABH
	 FF77WnQ9MZLDVTFKgq90oRED6NvBJUw3CVeocPZPght8Fc/qB9aC/rVWGFS5kXOYQ3
	 EI2keko7HnIeg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] MAINTAINERS: remove {sbranden,rjui}@broadcom.com
Date: Fri,  9 Oct 2026 08:00:35 +0200
Message-ID: <20261009060035.544789-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Both are bouncing:
  Final-Recipient: rfc822; rjui@broadcom.com
  Action: failed
  Status: 5.1.3
  Diagnostic-Code: smtp; The email account that you tried to reach does
    not exist. Please try double-checking the recipient's email address
    for typos or unnecessary spaces.

Anyone knows if they care about the entries/what's their new e-mail
address?

Ccing scott.branden@broadcom.com in a hope that one works. If not, v2
will follow to remove that too.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Scott Branden <scott.branden@broadcom.com>
---
 MAINTAINERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff3bfd42d3f3..d3b4271ca722 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5240,8 +5240,6 @@ F:	drivers/iommu/generic_pt/fmt/*bcm2712*
 
 BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Maintained
 T:	git https://github.com/broadcom/mach-bcm
@@ -5538,8 +5536,6 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 
 BROADCOM IPROC ARM ARCHITECTURE
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -5576,7 +5572,6 @@ F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
 BROADCOM KONA GPIO DRIVER
-M:	Ray Jui <rjui@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.yaml
-- 
2.56.0


