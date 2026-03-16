Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC13F53D83
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6PUosDqFM1wW08Bt2ktV0PauZ5/echf23A/jM8EdZI=; b=xdx59hcaWCKN2yQC4BlHXPk/nS
	xrTxvicpQzVZTtZisUuCkVS62kowOORrFwz7tA3GeiCzVguZcZ+kh/0xRM1r0KlfkAFfmuTOgYThe
	QTAm7/9tTx09nSxYTqegvE8Rp6N0qrq/wcO6+/FaVSlVXTHn/TO5+1PvrZ8S9SP/n7/ku3k1fR0pT
	+JkqBmMo8BGWA0VrELKNjEGGdbQ9+ZBO6CJxFbLKxMWJRK9XposbkuhKlM85XCJMUAobZne7U3nBM
	PIRI+xI0C/Cjc1cxuyB/jLDuEAI2rp/cRJ/DYaLc9QeRNd4Ra85sfxnabBeg7GgK6uI3KbXi+kXJE
	XKSAgFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CAE-00000004dJ7-2z2q;
	Mon, 16 Mar 2026 17:55:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9m-00000004cob-1cVj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=A6PUosDqFM1wW08Bt2ktV0PauZ5/echf23A/jM8EdZI=; b=Z01HuZkLH71KosZFmUadktr8/j
	MOhS+MrW7Q1yGKn/ChU8GUSZS/1OIwodbCl4JV0vKj0wfU7KNwTesBOeMIVyfwkvPB4ZwGCuQED0l
	GcgkvVm1TkIJLDoEfJcEzMLE5O0wiqz8me+rUKrMJVTLCsXSrPiVfjI7xPKkV1NWguV46QngeGtZD
	fnIsngD/p8JeX614mqGCDVRY8eNdiys1Y9PZUM4b8srPohXaPU9yf38zFf9XoaoeCJZTn75uzdfL0
	J6mHabkVE6orCsja/xBmyKP5rTztKp/X9xw0zyrlo0156l/xcSintb/qk9Awt+XpY1VBzk1phqxiZ
	T1Fd7nlw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9h-00000007OU7-2X4o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9639244471;
	Mon, 16 Mar 2026 17:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF61C19421;
	Mon, 16 Mar 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683702;
	bh=pSz7KSEk3cZzgsv0JwIgztuHbAHwcbSKxhrdJqB5X70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uF/fX79xcRAegiUt8xa9auKVQE5slpbESkSVo6Mwptn3YalTNhrjaqnWRHKDVTxB8
	 qn9V+emv76/lGBPr/yWrgS5r1wfOc+2gXwa1D/caAQhH7lL34pU3OvUpueUfuRbRq8
	 63dluAVdF1Zmx9lAsQiKAlu8vvoFFGzqaWdkDbhKauROUB5YrL74RXT+BKAS1jAZ6C
	 /jfYaIg58V4Z8PnOiVPru2ywctzOx+w9svEoqgdeYWpTs0Kfou28nqpZEi1WVood+E
	 q85A01VkOMcGBHDXAnf3OyykySUq7j4RaK0B3MLhsuP350W/HHxrcf20bSBw5XZq5I
	 uvZzPIsGI7oYw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9c-00000002XDx-2iOS;
	Mon, 16 Mar 2026 17:55:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 06/17] KVM: arm64: Kill write_fault from kvm_s2_fault
Date: Mon, 16 Mar 2026 17:54:39 +0000
Message-ID: <20260316175451.1866175-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
References: <20260316175451.1866175-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_175505_972243_4B2F949F 
X-CRM114-Status: GOOD (  14.40  )
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

We already have kvm_is_write_fault() as a predicate indicating
a S2 fault on a write, and we're better off just using that instead
of duplicating the state.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 12c2f0aeaae4c..86950acbd7e6b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1711,7 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 }
 
 struct kvm_s2_fault {
-	bool write_fault;
 	bool exec_fault;
 	bool writable;
 	bool topup_memcache;
@@ -1799,7 +1798,7 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 		return ret;
 
 	fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, fault),
-				       fault->write_fault ? FOLL_WRITE : 0,
+				       kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
 	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
 		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
@@ -1850,7 +1849,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 			 */
 			fault->s2_force_noncacheable = true;
 		}
-	} else if (fault->logging_active && !fault->write_fault) {
+	} else if (fault->logging_active && !kvm_is_write_fault(s2fd->vcpu)) {
 		/*
 		 * Only actually map the page as writable if this was a write
 		 * fault.
@@ -1980,21 +1979,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
-	bool write_fault = kvm_is_write_fault(s2fd->vcpu);
 	bool logging_active = memslot_is_logging(s2fd->memslot);
 	struct kvm_s2_fault fault = {
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-		.write_fault = write_fault,
 		.exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
-		.topup_memcache = !perm_fault || (logging_active && write_fault),
+		.topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
 	};
 	void *memcache;
 	int ret;
 
-	VM_WARN_ON_ONCE(fault.write_fault && fault.exec_fault);
-
 	/*
 	 * Permission faults just need to update the existing leaf entry,
 	 * and so normally don't require allocations from the memcache. The
-- 
2.47.3


