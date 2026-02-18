Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547ACE9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8wxhrJ2+Xu4peRdnR9PFfONKD2qHfYD9erXzqaH4Ns=; b=HAtTXsGVwUM79mIZIeMuePlIwb
	3aeQMJDWwXw8rrc82qu72Lgf0Q2F2bTg2DoYsBh3QBLyAj/WeMgFjSjBRcqJ/2+sp4BqUVIefdAgA
	pdCeRw1v6FpHLe7OOp7gHxS9q4FojgHGarkcKGc/WlYVPN/b4rQzFQ8K8paJ64f1julkheFbI/sOp
	T3IEyCfx1MkZai7bxbcwUV7gPlmhlpT1C/Ht3nVYECLP2rAi0BYQGKWm/pxu/7ZRuvLHuT91ME35V
	Hsm8inw8rBfKFUkhFVyNfsOaB8YJGsU/65ON1zK5S8CyarU4vAwMpkKHF4SF94mN1H6lRPpMdxMRP
	+KlttRRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyP-00000009uAz-0SaL;
	Wed, 18 Feb 2026 13:52:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyM-00000009u9J-1ivn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D060861864;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B855C116D0;
	Wed, 18 Feb 2026 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422729;
	bh=x7GxsV6Tq+ePPzXaTrey1iLvcxNRtPSbmSObedomQnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tp5uiLmFdMvlW6M2BZtPLE6leqbwpK3J/TvTkp7f89H6BmAW55oKTse1z5oXmnoKD
	 /Uft6AvzrR6rnwhWeuWFPOLtBJqXFuszx3dy/dU1uarlIclWRN/E/M6FlNKTVhAfjM
	 XntR4M1gaHouuat3uKA2g9WctcMpyBCx2vW2YQU+FHNcj/Si7O/JKA05XHQf/sZkuE
	 /b39lBP84X4UK3ALbwQaoFl+VgraSvu3fA66nFGGNPXVt4UZGgHZ3wH9xYlxNTEZys
	 F0lqg1VflaKWHYFYRTtuB0HsZbquSt2J7YZuzXAnL0vEjsOTadePKmkVFz3xrvfYHU
	 NNw1FBIQ1CuBQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyJ-0000000Bu02-3U24;
	Wed, 18 Feb 2026 13:52:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] platform-msi: Remove stale comment
Date: Wed, 18 Feb 2026 13:52:03 +0000
Message-ID: <20260218135203.2267907-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The backward compatibility code for the previous incarnation of
platform MSI was removed in e9894248994ca ("genirq/msi: Remove
platform MSI leftovers"), but the comment about that removal is
still present.  Remove it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/base/platform-msi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 70db08f3ac6fa..69eed058eb208 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -61,10 +61,6 @@ static const struct msi_domain_template platform_msi_template = {
  * parent. The parent domain sets up the new domain. The domain has
  * a fixed size of @nvec. The domain is managed by devres and will
  * be removed when the device is removed.
- *
- * Note: For migration purposes this falls back to the original platform_msi code
- *	 up to the point where all platforms have been converted to the MSI
- *	 parent model.
  */
 int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
 					    irq_write_msi_msg_t write_msi_msg)
-- 
2.47.3


