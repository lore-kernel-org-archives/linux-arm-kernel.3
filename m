Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE01C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8wU5q00cv3r1Vl5o/oe8WwDIpkLXQ9PUNvKcJ30Z60=; b=rwkmvB27yqsanBddRMdEBtMk9w
	B6fARWYQDyNkL9ZRachTQVJA5zTv/nSgt5eYn5rzNrnsDfTgNn8suvUHSJy31xReJFZIWzIdVN8AB
	FzI6cfSivqY3+846AKpU3FyZrCJv5Bi9Z/tOPhnW/uDKXneQ+ilY2WJ2RVUVpazxGWBiMwlpH2Mth
	or/gijEX0Fzy/WfrVwgu3ZnaMdB+bdiDD/44i6broi1Wh/ZjDaMlvwZOLK+c53B4EPq0kA+FuEaqy
	aW7aXsEX1eSYtoNouoa6xGXqv2RnellXIoT0mX00+SsBxpwdRP77yjZ9OEEshWbsndfJEBp7VC19e
	OS0KfZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63qp-000000037kV-39Zl;
	Mon, 14 Sep 2026 10:23:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pO-0000000361X-3Sq7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 10:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+8wU5q00cv3r1Vl5o/oe8WwDIpkLXQ9PUNvKcJ30Z60=; b=MVinVpcU8hOYzBfBleELDZ+IcN
	okuLLWecx/U20Nb2Z6BiavRo7YHqcl88UA2QPmzsHn9li+N3Z00NsIEPblc27qOfh3OIi9mwvy9Cm
	AW0C/34+swb3qcwzFJ6ZSXoxXwY2redvFsKuVbLmtvoQibNA3yVgoGNFmdbizVUiYAHAuzeIQOndO
	/5ZbK+e28F/MlWbvkbfPQKG9sARv1J+bGe15giy7GBJMPhowjlNbyFdlsDoDnBtY0onl8DaYr44Bw
	mHPypQvYks5fqDmxeIBD8IMN55PBtYqcNw/I/mpPrwFOAzvwO8CCZrH8eN95dYhLlEuw5aASBEJbn
	ng5n//XQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63pL-00000005U9U-43v3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C294C1576;
	Mon, 14 Sep 2026 03:22:15 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F2723F7B4;
	Mon, 14 Sep 2026 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381339; bh=lrLRVc1wO6GU/aRFoJ0Ac4kPDignSWwbPPtXwz+6lvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HM8wcRh93V15MZETZHW+IhnCwt9rYn6AY+TNbl1WNGZOvplfwrAwQPexr/niycKLM
	 fgRESFsuJZYLnBHFDGKbB+RJ2S6lBZPrAlO/OzpN53boWQQDLQDmZhzKHu0P4wSIPY
	 /OO+F3kP8FzuqOrrOb3e9bQW7663GzvvPTd/bHKo=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 36/38] genirq: Trust local irqchip when considering IRQ for NMI
Date: Mon, 14 Sep 2026 11:21:00 +0100
Message-Id: <20260914102102.68597-37-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_112220_272734_EB3088CE 
X-CRM114-Status: GOOD (  11.91  )
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

Generic IRQ code sanitises whether an IRQ can be considered for NMI
use. Currently, it only considers IRQs managed by the root irqchip.

GICv5 IPIs belong to a logical domain built on top of the LPI domain.
Consequently, generic IRQ code rejects these IPIs for NMI use, even
though their hardware state is managed by the root LPI domain.

One way to allow GICv5 IPIs to be used as NMIs would be to adjust the
sanitisation logic to account for this domain hierarchy. However, the
generic IRQ code can instead trust the local irqchip.

Remove the root irqchip check and use the local irqchip when
considering an IRQ for NMI use.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 include/linux/irq.h | 2 +-
 kernel/irq/manage.c | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index f485369b1b4f..92d3ad639ae8 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -563,7 +563,7 @@ struct irq_chip {
  * IRQCHIP_ONESHOT_SAFE:              One shot does not require mask/unmask
  * IRQCHIP_EOI_THREADED:              Chip requires eoi() on unmask in threaded mode
  * IRQCHIP_SUPPORTS_LEVEL_MSI:        Chip can provide two doorbells for Level MSIs
- * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs, only for root irqchips
+ * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs
  * IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND:  Invokes __enable_irq()/__disable_irq() for wake irqs
  *                                    in the suspend path if they are in disabled state
  * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before startup
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 57eff26fa646..c9ad79743ef6 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1370,11 +1370,6 @@ static bool irq_supports_nmi(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
 
-#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
-	/* Only IRQs directly managed by the root irqchip can be set as NMI */
-	if (d->parent_data)
-		return false;
-#endif
 	/* Don't support NMIs for chips behind a slow bus */
 	if (d->chip->irq_bus_lock || d->chip->irq_bus_sync_unlock)
 		return false;
-- 
2.34.1


