Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB43C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2pq/miyp6Sj5o2rBY3DlX9YsmWZVWJxRK5MVyvPwhc=; b=urxABFVeehM/p73aeUGlCKS6Vn
	Mq8e0vdq7GTriGSsGZkX/itV47lV5x7kYzig+SdYm5ka5fBOlcnW9h5+INLU13Kqtse/O04axLlhx
	0rlGjKciKtxGDnNZJRsgmOZzJZNYk+YlOiF2z9dH8YREUYv3080/gtj2rOdEPUF8f4ZrFXjDnPvMq
	6d6RX4W2cz1mJaHMJmaBWHZWBHMIHqzzvOITJ/hPKhbwRXM3j6l88hx7niEDHd8ONAfC4qZq55S8T
	mXRGmctBHtvoQpATGtGNWN28eEwm2e+o7j5iQ+Uei16P3iikkKipaiFk2JvdwiwBIzoFgdmGMUDzp
	jwOT3F5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wma-00000009Gpc-3yTT;
	Tue, 08 Sep 2026 14:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wmX-00000009Gnn-21bw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 14:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=p2pq/miyp6Sj5o2rBY3DlX9YsmWZVWJxRK5MVyvPwhc=; b=LaL6xEZ+GPv0c+PqgK49bo3qmP
	sSJVIo3YUQ1qLWVLJWEbeDeeW86hkEXAc4aWv85slk0xID5RbQMlIIXXgll4AJsmaPyi0q162/wyM
	m/e1a+/wS88zUoLn0x/tmw4vMFTfVc/c0QHVDtCF9iTjB0f1986xcM/++du2rqwWQhyXS3YBFplX4
	EKMsRSPG6uHzMADzvllh7LRzquLs6JAZlZ3M/BNCauwzAbeXq9Ns8LviIms4Uexp95MQVqcH+rFwh
	13EEIyYA8bpXQYGNJUstOo7HGStSGcAHrlXDH5xp0doo+ngR/8AtEngm/J5gTgaPL5mnrfaUaIkd1
	9PDF0zpQ==;
Received: from out-150.mta1.migadu.com ([2001:41d0:203:375::96] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wmT-0000000HXFk-278l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:26:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nBNi3rr/ynuXU4SgyyxAlr6fIfq350MdVspuBNckMOI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788877595; v=1; x=1789482395;
 b=e0W48CzJU7EbNKzAtEbpGqNrB/IaIf24kcvNpIfG/+D1XnKnK3L99QVaWHUgKL0J6QiFr839
 aMEC5xObauclnZnxySDjg2QaeFznJKE11bXCiP0K+bL1LbtuZz6uqy+/VeIOzjfFKME3QtcIf2Y
 RShliwTu8FVfJ7dM1Bc5ZirA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7cbc54a65df9e3cc;
	Tue, 08 Sep 2026 14:26:35 +0000
X-Mizu-Trace-ID: 7cbc54a65df9e3cc
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] irqchip/gic-v3-its: Clear vpt_page after freeing the pending table
Date: Tue,  8 Sep 2026 15:26:32 +0100
Message-Id: <20260908142632.2795308-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_152637_707683_4BF66D99 
X-CRM114-Status: UNSURE (   9.87  )
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

its_vpe_teardown() frees vpt_page without clearing it, so its
vpt_page == NULL guard only holds the first time it runs on a vPE.
struct its_vpe outlives a failed KVM_DEV_ARM_VGIC_CTRL_INIT, so a retry
that fails again frees the pending table and the vPE ID a second time.

Fixes: 325ff3e78c64c ("irqchip/gic-v3-its: Prevent leak in its_vpe_irq_domain_alloc()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 81a96149f9154..f5d89e829c168 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4599,6 +4599,7 @@ static void its_vpe_teardown(struct its_vpe *vpe)
 	its_vpe_db_proxy_unmap(vpe);
 	its_vpe_id_free(vpe->vpe_id);
 	its_free_pending_table(vpe->vpt_page);
+	vpe->vpt_page = NULL;
 }
 
 static void its_vpe_irq_domain_free(struct irq_domain *domain,
-- 
2.39.5


