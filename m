Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C81CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6t4ZwmCH40IWIYlaLACvuOiRTFEmMUQ/Ln8FmnXcNjQ=; b=JaPY9sPYgfu0puVDZXs1vGg8B7
	4laFhhOoGiI97I+hMNZN2DqXZ4iLMdBv9MGp+IQo1TocHKjniFzB5lbbj7OnattysWMUh2/rY+dG2
	+tyL4MrdKa+cKNd7rohOT/BHgsHkWQKITJEozxt24RGc/QXQq73WigqXbiArt9wmSB5w0Ky7zR67+
	r8Lqa/OEV2m1cRS5n2otgW4y+iFKRK66IYhOv+y+NGDA+BxJIBp98rTMBSrLwEGnmcek+WbXr0uGa
	aH/MiauJKcyFvBcIHcyCwOJ/5pWZLjOcJXw6MrQYu0fpkxfUOIqkR65UCp6lP6+6yjDZ8z1Th6azb
	eKoupoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwHs-00000005tOB-1KsP;
	Tue, 23 Jun 2026 08:15:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwHp-00000005tLo-1slG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:15:15 +0000
X-UUID: 9da3d15a6edb11f1aa26b74ffac11d73-20260623
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED
	SA_UNFAMILIAR, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e244f643-0d94-4661-9dbe-d3f87441a1ef,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.12,REQID:e244f643-0d94-4661-9dbe-d3f87441a1ef,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:e7bac3a,CLOUDID:5549c0c9c56ac87306c3598eda0d2bad,BulkI
	D:260623161455U457ALV5,BulkQuantity:0,Recheck:0,SF:16|19|66|78|81|82|102|1
	27|136|865|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bu
	lk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9da3d15a6edb11f1aa26b74ffac11d73-20260623
X-User: leixiang@kylinos.cn
Received: from ninol.. [(116.128.244.169)] by mailgw.kylinos.cn
	(envelope-from <leixiang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 276535867; Tue, 23 Jun 2026 16:14:54 +0800
From: leixiang <leixiang@kylinos.cn>
To: maz@kernel.org
Cc: oupton@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leixiang <leixiang@kylinos.cn>
Subject: [RFC PATCH] KVM: arm64: Set irqfd->producer to enable vLPI routing updates
Date: Tue, 23 Jun 2026 16:14:33 +0800
Message-ID: <20260623081433.21250-1-leixiang@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622075103.35164-1-leixiang@kylinos.cn>
References: <20260622075103.35164-1-leixiang@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_011513_803422_34A1F5CB 
X-CRM114-Status: GOOD (  12.76  )
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

ARM64's kvm_arch_irq_bypass_add_producer() never sets irqfd->producer,
so kvm_irq_routing_update() never calls the ARM64 routing hook.  That
hook unmaps the vLPI and falls back to software injection when an
irqfd's MSI routing changes; with it dead, the vLPI stays bound to the
old translation.

Set irqfd->producer once kvm_vgic_v4_set_forwarding() succeeds and
clear it in del_producer(), under irqfds.lock; the only reader,
kvm_irq_routing_update(), takes that lock.  set_forwarding() may sleep,
so it runs outside the lock and the pointer is published only on
success, needing no error cleanup.

Sent as RFC: the unmap-on-reroute path has been dormant.

Fixes: 2412405b3141 ("KVM: arm/arm64: register irq bypass consumer on ARM/ARM64")
Signed-off-by: leixiang <leixiang@kylinos.cn>
---
A review of the x86/powerpc producer-nullify patch pointed out that
ARM64 never sets irqfd->producer, so kvm_arch_update_irqfd_routing()
is dead.  This RFC fills that gap; set_forwarding() may sleep and so
can't run under irqfds.lock like the x86 path, hence the locking is
what I'd most like reviewed.

 arch/arm64/kvm/arm.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..6f1e4f526719 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2935,6 +2935,7 @@ int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
 	struct kvm_kernel_irqfd *irqfd =
 		container_of(cons, struct kvm_kernel_irqfd, consumer);
 	struct kvm_kernel_irq_routing_entry *irq_entry = &irqfd->irq_entry;
+	int ret;

 	/*
 	 * The only thing we have a chance of directly-injecting is LPIs. Maybe
@@ -2943,8 +2944,16 @@ int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
 	if (irq_entry->type != KVM_IRQ_ROUTING_MSI)
 		return 0;

-	return kvm_vgic_v4_set_forwarding(irqfd->kvm, prod->irq,
-					  &irqfd->irq_entry);
+	ret = kvm_vgic_v4_set_forwarding(irqfd->kvm, prod->irq,
+					 &irqfd->irq_entry);
+	if (ret)
+		return ret;
+
+	spin_lock_irq(&irqfd->kvm->irqfds.lock);
+	irqfd->producer = prod;
+	spin_unlock_irq(&irqfd->kvm->irqfds.lock);
+
+	return 0;
 }

 void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
@@ -2957,6 +2966,10 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	if (irq_entry->type != KVM_IRQ_ROUTING_MSI)
 		return;

+	spin_lock_irq(&irqfd->kvm->irqfds.lock);
+	irqfd->producer = NULL;
+	spin_unlock_irq(&irqfd->kvm->irqfds.lock);
+
 	kvm_vgic_v4_unset_forwarding(irqfd->kvm, prod->irq);
 }

--
2.45.0

