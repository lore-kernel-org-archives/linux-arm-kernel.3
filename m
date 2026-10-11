Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A82FCA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LD0h3iIgO7PZyfjdVnhwEIhyBqfxijYlB+A8FPxw+aY=; b=HnXDvZ5uIkDnBNoIPGri210K9b
	4PosPjn7YkscU6XEtLLtWH/c+qz6P11KzzJIr/CNxzi2ergvuhwDBLSVjPYUfvBDk55AF7IUKRIJE
	IS4aHC3MrtHcr38hvqUviGIC95OcrAl4pNc2tJdiYH0ZJVK8P5ZrkRyUv8QOX7K4UvPNg60/4+34N
	wVvebDvo/eL9Ffh/IcOHiDiHJPZyMvgfIZ4xsFP5bcqhi6uGNMcjeTkCsErsbDbiZUGklnLpy4A0I
	EQ/FONtjBGMnnxQd7tCDnHX5LawoqiSl8O3BA4apJNehs5dpCxJr3H4DTi9YIX1vle6TfWREuCsB8
	y9Sn5XIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFpIi-00000008sI7-2x8O;
	Sun, 11 Oct 2026 08:53:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFpIh-00000008sI0-269c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 08:52:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E588B402BB;
	Sun, 11 Oct 2026 08:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7C61F0089B;
	Sun, 11 Oct 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791708778;
	bh=LD0h3iIgO7PZyfjdVnhwEIhyBqfxijYlB+A8FPxw+aY=;
	h=From:To:Cc:Subject:Date;
	b=bmqFqvXBoNLyzZg0SuKBE9/swCDpTS6y+TEBBphqp4Qsb2g6klh4nfhpPPxwrihzu
	 myaRirrO1iNFMeha0yjfpSv5qjKrMhmeoG6Qb+fmRnzAZnvJvSPIZTe3ylwKFqVmQ4
	 WigBBg07Iq+oiqPn4fqMgP8+SlqFmIeVzayr7oG8otXTXXHDgtm6ZZwqhtD/RHy3Xz
	 mwzQVh0Cd3xmPnFPftCXGOBzlHx3dVjdMvPhdJoWx1YoFyz2l9eT9yzjv1ZU9pnzaJ
	 CPjw6CXEfXpwhJCKqeRz6F5pgAm5zGI8+wScQ4HRNCdvHzNZoOOG1JkIQl8gmbdfCD
	 ch4//yg9PKkOA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v2] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
Date: Sun, 11 Oct 2026 10:52:54 +0200
Message-ID: <20261011085254.603765-1-jirislaby@kernel.org>
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

According to Florian, it should be first.lastname@broadcom.com.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Scott Branden <scott.branden@broadcom.com>
Cc: Ray Jui <ray.jui@broadcom.com>
---
[v2] fix instead of remove
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff3bfd42d3f3..752775f2371e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5240,8 +5240,8 @@ F:	drivers/iommu/generic_pt/fmt/*bcm2712*
 
 BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Maintained
 T:	git https://github.com/broadcom/mach-bcm
@@ -5538,8 +5538,8 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 
 BROADCOM IPROC ARM ARCHITECTURE
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -5576,7 +5576,7 @@ F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
 BROADCOM KONA GPIO DRIVER
-M:	Ray Jui <rjui@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.yaml
-- 
2.56.0


