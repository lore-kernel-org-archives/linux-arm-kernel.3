Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1699DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ANa3bcMCpVaj0ud2ZO7rs6yyZikjf0Zmx2b5NDAqdI=; b=AIT1D8UHOQlTdxt2CxB6BmffJX
	tH1BV3pYvvnPsD/icm77DqF2Sm4kzEO76kIoQxEFbc0c1atc7MW/VfY1eDbbLxfbZHeV+k6N2eGlz
	iZsmlHpzH8u/9vGS9kXWrKf9sM25OjbaSkZwIAce/gzDvUPAchW78PD+DpmvXjywTWGjfLKT7SVFY
	SLL+ugv5agrlM0I7weSAFeaT5xs+l24uPdByArIgaCsnBl/qa4EpD+XhfplL0gNawMp6fs7NzKfcV
	FnAVgM7k0ZBiW83IV5WVxypDfFS8saSw98RWuHmBRh/yByOtG36/Fm7GIIuP2Z9avmY4B3B8HD0rW
	L2GDgNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWE2v-0000000FFZB-2NP0;
	Fri, 10 Jan 2025 12:23:25 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDzN-0000000FEjA-1hH1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:19:46 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d821f9730aso2938827a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 04:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736511583; x=1737116383; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ANa3bcMCpVaj0ud2ZO7rs6yyZikjf0Zmx2b5NDAqdI=;
        b=qsVapKR8oTxdvtvXweiOLBlapTuMnlZluMF/+96vvMuakRoBq0q21AkQPQ/eMiYLTn
         TSKREQ/rL8U+kQJoCrWxiyZ1b/So3pnoaOBBNbb0v7lNfurB8+6tNeC5bzOuK0W2zQL/
         qB6E2B8rBF8PWs2lWOwquSNpNHXgw6XZNFunlaq82q2VoOgO6aaFfOX46dmIUSENpQve
         pXF7mVEINguTbeLUyQJ38/zkyd11cncM3msrlK4LC36CHTG057HHra58oo6BSUkqp/dp
         +PKtGcMQCkwJGcdfi6/E2GDAlscfUGbjKOMdwsdji3BlnD7Vm/y9RqAdBxjVN90Fredu
         AadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736511583; x=1737116383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ANa3bcMCpVaj0ud2ZO7rs6yyZikjf0Zmx2b5NDAqdI=;
        b=R+7UTL7rzuPkryNIk+nfzGL26anXd+CpQFji1hLaM84dMvT3WiHKrR77LI+M7ScvLo
         H6Q+Yb7dCwHxunliJA7d+nqs6BI/j2voqTxhQi0Osuz/sU5xA0FE3ebWrGa5t1kM6Is6
         Aui/dWYNcuF2U/0uKCDyuhqwLNccebbrdTCHWbCIC/9cSHduvzWsFaQzBNxXo6GtFA3k
         Xc6Of6AXUirZSXCG6ewfewh1xnJYFnCSwYOyceWpCgcgZ28ZyzeU3hirCjJXgvLcOegO
         /p+Z0lD1tGtuGcc5kqf+R4trsocKQORBYSIFuygDjQ2EeWs+9q1l7bG/nLjbpLA64itU
         NYUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoIqdnpFf5UhnRtwmfLr332bV88wFx/s16jySGb0NzLk1kKJP20wCv4xJSG+o7DK7s5LWrcAqnu0TqjIN2MhV9@lists.infradead.org
X-Gm-Message-State: AOJu0YyHGUqNRHcKsNPRHQDRYBHGg9GQIZcZiauLfuyHab5ChhIVMbO4
	vCep+mGpCMQdNobg/0OmnSXPqiaNw4eDNmRMiwcrlBxvcwjPN56DLdm65vKhEw2dvNLIuVo22uh
	u4CsGiA==
X-Google-Smtp-Source: AGHT+IEvkER4iwk0Rq80V2KJQRuC2I1AmaqZpwtSs7vKSCi0Z91CiB52u56N8FwCQ2DalePfEMorN0DwawR+
X-Received: from edqo13.prod.google.com ([2002:aa7:c50d:0:b0:5d9:87fb:9141])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3585:b0:5d0:d845:2882
 with SMTP id 4fb4d7f45d1cf-5d98a50c432mr4752723a12.13.1736511583251; Fri, 10
 Jan 2025 04:19:43 -0800 (PST)
Date: Fri, 10 Jan 2025 12:19:35 +0000
In-Reply-To: <20250110121936.1559655-1-qperret@google.com>
Mime-Version: 1.0
References: <20250110121936.1559655-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250110121936.1559655-3-qperret@google.com>
Subject: [PATCH 2/3] KVM: arm64: Drop pkvm_mem_transition for host/hyp sharing
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_041945_444201_E9EACACC 
X-CRM114-Status: GOOD (  17.41  )
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

Simplify the __pkvm_host_{un}share_hyp() paths by not using the
pkvm_mem_transition machinery. As there are the last users of the
do_share()/do_unshare(), remove all the now-unused code as well.

No functional changes intended.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 319 +++-----------------------
 1 file changed, 34 insertions(+), 285 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 3a3d9fcbc508..cd8d233b9527 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -685,36 +685,6 @@ static int host_request_owned_transition(u64 *completer_addr,
 	return __host_check_page_state_range(addr, size, PKVM_PAGE_OWNED);
 }
 
-static int host_request_unshare(u64 *completer_addr,
-				const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	u64 addr = tx->initiator.addr;
-
-	*completer_addr = tx->initiator.host.completer_addr;
-	return __host_check_page_state_range(addr, size, PKVM_PAGE_SHARED_OWNED);
-}
-
-static int host_initiate_share(u64 *completer_addr,
-			       const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	u64 addr = tx->initiator.addr;
-
-	*completer_addr = tx->initiator.host.completer_addr;
-	return __host_set_page_state_range(addr, size, PKVM_PAGE_SHARED_OWNED);
-}
-
-static int host_initiate_unshare(u64 *completer_addr,
-				 const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	u64 addr = tx->initiator.addr;
-
-	*completer_addr = tx->initiator.host.completer_addr;
-	return __host_set_page_state_range(addr, size, PKVM_PAGE_OWNED);
-}
-
 static int host_initiate_donation(u64 *completer_addr,
 				  const struct pkvm_mem_transition *tx)
 {
@@ -802,31 +772,6 @@ static bool __hyp_ack_skip_pgtable_check(const struct pkvm_mem_transition *tx)
 		 tx->initiator.id != PKVM_ID_HOST);
 }
 
-static int hyp_ack_share(u64 addr, const struct pkvm_mem_transition *tx,
-			 enum kvm_pgtable_prot perms)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-
-	if (perms != PAGE_HYP)
-		return -EPERM;
-
-	if (__hyp_ack_skip_pgtable_check(tx))
-		return 0;
-
-	return __hyp_check_page_state_range(addr, size, PKVM_NOPAGE);
-}
-
-static int hyp_ack_unshare(u64 addr, const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-
-	if (tx->initiator.id == PKVM_ID_HOST && hyp_page_count((void *)addr))
-		return -EBUSY;
-
-	return __hyp_check_page_state_range(addr, size,
-					    PKVM_PAGE_SHARED_BORROWED);
-}
-
 static int hyp_ack_donation(u64 addr, const struct pkvm_mem_transition *tx)
 {
 	u64 size = tx->nr_pages * PAGE_SIZE;
@@ -837,24 +782,6 @@ static int hyp_ack_donation(u64 addr, const struct pkvm_mem_transition *tx)
 	return __hyp_check_page_state_range(addr, size, PKVM_NOPAGE);
 }
 
-static int hyp_complete_share(u64 addr, const struct pkvm_mem_transition *tx,
-			      enum kvm_pgtable_prot perms)
-{
-	void *start = (void *)addr, *end = start + (tx->nr_pages * PAGE_SIZE);
-	enum kvm_pgtable_prot prot;
-
-	prot = pkvm_mkstate(perms, PKVM_PAGE_SHARED_BORROWED);
-	return pkvm_create_mappings_locked(start, end, prot);
-}
-
-static int hyp_complete_unshare(u64 addr, const struct pkvm_mem_transition *tx)
-{
-	u64 size = tx->nr_pages * PAGE_SIZE;
-	int ret = kvm_pgtable_hyp_unmap(&pkvm_pgtable, addr, size);
-
-	return (ret != size) ? -EFAULT : 0;
-}
-
 static int hyp_complete_donation(u64 addr,
 				 const struct pkvm_mem_transition *tx)
 {
@@ -885,180 +812,6 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
 	return check_page_state_range(&vm->pgt, addr, size, &d);
 }
 
-static int check_share(struct pkvm_mem_share *share)
-{
-	const struct pkvm_mem_transition *tx = &share->tx;
-	u64 completer_addr;
-	int ret;
-
-	switch (tx->initiator.id) {
-	case PKVM_ID_HOST:
-		ret = host_request_owned_transition(&completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	switch (tx->completer.id) {
-	case PKVM_ID_HYP:
-		ret = hyp_ack_share(completer_addr, tx, share->completer_prot);
-		break;
-	case PKVM_ID_FFA:
-		/*
-		 * We only check the host; the secure side will check the other
-		 * end when we forward the FFA call.
-		 */
-		ret = 0;
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-static int __do_share(struct pkvm_mem_share *share)
-{
-	const struct pkvm_mem_transition *tx = &share->tx;
-	u64 completer_addr;
-	int ret;
-
-	switch (tx->initiator.id) {
-	case PKVM_ID_HOST:
-		ret = host_initiate_share(&completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	switch (tx->completer.id) {
-	case PKVM_ID_HYP:
-		ret = hyp_complete_share(completer_addr, tx, share->completer_prot);
-		break;
-	case PKVM_ID_FFA:
-		/*
-		 * We're not responsible for any secure page-tables, so there's
-		 * nothing to do here.
-		 */
-		ret = 0;
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-/*
- * do_share():
- *
- * The page owner grants access to another component with a given set
- * of permissions.
- *
- * Initiator: OWNED	=> SHARED_OWNED
- * Completer: NOPAGE	=> SHARED_BORROWED
- */
-static int do_share(struct pkvm_mem_share *share)
-{
-	int ret;
-
-	ret = check_share(share);
-	if (ret)
-		return ret;
-
-	return WARN_ON(__do_share(share));
-}
-
-static int check_unshare(struct pkvm_mem_share *share)
-{
-	const struct pkvm_mem_transition *tx = &share->tx;
-	u64 completer_addr;
-	int ret;
-
-	switch (tx->initiator.id) {
-	case PKVM_ID_HOST:
-		ret = host_request_unshare(&completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	switch (tx->completer.id) {
-	case PKVM_ID_HYP:
-		ret = hyp_ack_unshare(completer_addr, tx);
-		break;
-	case PKVM_ID_FFA:
-		/* See check_share() */
-		ret = 0;
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-static int __do_unshare(struct pkvm_mem_share *share)
-{
-	const struct pkvm_mem_transition *tx = &share->tx;
-	u64 completer_addr;
-	int ret;
-
-	switch (tx->initiator.id) {
-	case PKVM_ID_HOST:
-		ret = host_initiate_unshare(&completer_addr, tx);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	switch (tx->completer.id) {
-	case PKVM_ID_HYP:
-		ret = hyp_complete_unshare(completer_addr, tx);
-		break;
-	case PKVM_ID_FFA:
-		/* See __do_share() */
-		ret = 0;
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-/*
- * do_unshare():
- *
- * The page owner revokes access from another component for a range of
- * pages which were previously shared using do_share().
- *
- * Initiator: SHARED_OWNED	=> OWNED
- * Completer: SHARED_BORROWED	=> NOPAGE
- */
-static int do_unshare(struct pkvm_mem_share *share)
-{
-	int ret;
-
-	ret = check_unshare(share);
-	if (ret)
-		return ret;
-
-	return WARN_ON(__do_unshare(share));
-}
-
 static int check_donation(struct pkvm_mem_donation *donation)
 {
 	const struct pkvm_mem_transition *tx = &donation->tx;
@@ -1149,31 +902,29 @@ static int do_donate(struct pkvm_mem_donation *donation)
 
 int __pkvm_host_share_hyp(u64 pfn)
 {
+	u64 phys = hyp_pfn_to_phys(pfn);
+	void *virt = __hyp_va(phys);
+	enum kvm_pgtable_prot prot;
+	u64 size = PAGE_SIZE;
 	int ret;
-	u64 host_addr = hyp_pfn_to_phys(pfn);
-	u64 hyp_addr = (u64)__hyp_va(host_addr);
-	struct pkvm_mem_share share = {
-		.tx	= {
-			.nr_pages	= 1,
-			.initiator	= {
-				.id	= PKVM_ID_HOST,
-				.addr	= host_addr,
-				.host	= {
-					.completer_addr = hyp_addr,
-				},
-			},
-			.completer	= {
-				.id	= PKVM_ID_HYP,
-			},
-		},
-		.completer_prot	= PAGE_HYP,
-	};
 
 	host_lock_component();
 	hyp_lock_component();
 
-	ret = do_share(&share);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
+	if (ret)
+		goto unlock;
+	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
+		ret = __hyp_check_page_state_range((u64)virt, size, PKVM_NOPAGE);
+		if (ret)
+			goto unlock;
+	}
+
+	prot = pkvm_mkstate(PAGE_HYP, PKVM_PAGE_SHARED_BORROWED);
+	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, prot));
+	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
 
+unlock:
 	hyp_unlock_component();
 	host_unlock_component();
 
@@ -1182,31 +933,29 @@ int __pkvm_host_share_hyp(u64 pfn)
 
 int __pkvm_host_unshare_hyp(u64 pfn)
 {
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 virt = (u64)__hyp_va(phys);
+	u64 size = PAGE_SIZE;
 	int ret;
-	u64 host_addr = hyp_pfn_to_phys(pfn);
-	u64 hyp_addr = (u64)__hyp_va(host_addr);
-	struct pkvm_mem_share share = {
-		.tx	= {
-			.nr_pages	= 1,
-			.initiator	= {
-				.id	= PKVM_ID_HOST,
-				.addr	= host_addr,
-				.host	= {
-					.completer_addr = hyp_addr,
-				},
-			},
-			.completer	= {
-				.id	= PKVM_ID_HYP,
-			},
-		},
-		.completer_prot	= PAGE_HYP,
-	};
 
 	host_lock_component();
 	hyp_lock_component();
 
-	ret = do_unshare(&share);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
+	if (ret)
+		goto unlock;
+	ret = __hyp_check_page_state_range(virt, size, PKVM_PAGE_SHARED_BORROWED);
+	if (ret)
+		goto unlock;
+	if (hyp_page_count((void *)virt)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
+	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
 
+unlock:
 	hyp_unlock_component();
 	host_unlock_component();
 
-- 
2.47.1.688.g23fc6f90ad-goog


