Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6530EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WGY/mL22bYW3oXC6j6+r7oiH7H8EA2nYr+zuiyZ+qgQ=; b=lwKzHsbfIQaZ+lCdemQ+g9NeAr
	kAPLyJ8iWZVMquez32KQJOOOZZiW6Qkn6uWY688zi2lpUACJxCaIF8nVCDRdO/QCblXiaGupVZZki
	s5UgtgDI9HqBxD+9DFyy/CtBwG+VkAjVlW0GjUBfhfAn8k/zDAqG/DuygeTyZruTnYLog2ef9662J
	Di1/ArqA1pV6hUx7N0A5+Yw1fsGlAFSRMOIoR0ycq9EpK4CoFDly55ppufCTIt7VXv6TmPJM9cF2b
	StUjKt9AVDo9aIqn+0fFVPtyZ+1SY4gfHnmmyP5H43pnJvth+uEy4mFW2b+FjHB/Xv08u2hbS2og+
	97tcNFzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqQA-00000002sxO-1ttE;
	Thu, 09 Jul 2026 15:12:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqQ9-00000002sxI-01mF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:12:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DE536137C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 15:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D2D1F000E9;
	Thu,  9 Jul 2026 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783609931;
	bh=WGY/mL22bYW3oXC6j6+r7oiH7H8EA2nYr+zuiyZ+qgQ=;
	h=From:To:Cc:Subject:Date;
	b=Gur3wbPdmugbC9+AOKp3RJLGDcZMmdumF7ngf+Fenr7C9Hjg5wtXVq1PGtZizAvp3
	 qoOhGIbmvAG8IUqLDd6IzbffUINjX/offUbWoIds7sCUGL3x/hSbttOhdFhH/W8c7k
	 moqNPNUTQcA58j8iIV5saeSfO5b4aDCH2dlQ+ShIdbtiiLlGIUbgW3Vke1NbrQTjZ0
	 dmZyI/0ce+3v8kMTA6yLZx+ZiVH9sUwJbylPmxJMjRfvGfACbs0MHiF+8DszauiexR
	 Z5q4DtFFFX84QWFqOfFUjYokiHEphu6C0KziWX/HCnXaAmDXwXlQW9jB72ZPcFtl2r
	 VYGXWhDZRS0ug==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/gic-v5: iwb: Fix stray verb in comment
Date: Thu,  9 Jul 2026 17:12:08 +0200
Message-ID: <20260709151208.1168456-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.54.0
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

Remove a stray verb ('be') that is out of context in a comment in the IWB
driver.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-iwb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
index 9103feb70ce8..87f10212f283 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -143,7 +143,7 @@ static int gicv5_iwb_irq_domain_translate(struct irq_domain *d, struct irq_fwspe
 			return -EINVAL;
 
 		/*
-		 * param[0] is be the wire
+		 * param[0] is the wire
 		 * param[1] is the interrupt type
 		 */
 		*hwirq = fwspec->param[0];
-- 
2.54.0


