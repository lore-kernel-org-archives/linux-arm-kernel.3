Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D5EF53D82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpR3ACqU07aVtibziRIGQBdLLRT1jdd+Sta0uM61LtQ=; b=hnPh033TPJqp60/rtUmIoC2cUP
	+VjDv0UIlpZZQdN+n7gdE1mXHlbEbaHTGUyDZC0AH0js23Fn3TnR6vUQS6r3js7nF/y0iTY4PU35Z
	EB0CWuAFisW807SxTgNGyrQipPHRZGhiMD2fFTIZw/iz8XSwMemq289x/N0M0vunRaswA1JhELZis
	iR9997AVuGjy9tqX7ErA6rfn9qsO0QRHXJ9l7PpMd2i/26BbKkhY4htdUvttmsUE1AlpPhEclXEmB
	3tualyDnsnQwQEuXJhCoM48zKh16qYCA9oOtfolytcLqIENd35C+s2ZwVNoCJI6yLNf1yqe4Wx1y8
	0CmSPSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Br6-00000004Zx4-10qJ;
	Mon, 16 Mar 2026 17:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqu-00000004Zpo-1BDP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CpR3ACqU07aVtibziRIGQBdLLRT1jdd+Sta0uM61LtQ=; b=gt7KgRVjbBF02lrA+jmKwPTC5U
	sPJVjpbXL3esylVth13TAhIWd4p0BlOb94m9ZwNSvZAywhP0cPZcerYzSEvScv4JpCJBK6h2PErTN
	3BhSEUPWyuf0dezbtXhsVHUPdPY67aZV9WY1JryiW3NeZCnh8KFt0kWQKemWwsi54Qf86PNqzemaB
	9U98ZN55jGOdRpMSy5CGM4VcKm5A9hlUDezZb3wYlPvhoovz5vsRRKi2UHRbBm26T/LC4aQQMu7hN
	BFIfKibWFFcKECw4OZxQSqaQvZvhaMOB7r7L/rklOG9SRkFI73NW+lT3Y9roEpeVvAp70R4sbDyrT
	QIYySkcQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqr-00000007Lsd-15Kq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-485389bf0daso32899465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682535; x=1774287335; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpR3ACqU07aVtibziRIGQBdLLRT1jdd+Sta0uM61LtQ=;
        b=iv9La4mV3EnJFR41bjB/bLe+l1rJZD/SK8tmWF4vziiP6ly9CXbBgDLc1uFxhbJGZi
         HNhGyziJR7ezLWolGURRu0K6wEubAk+Tx1IQs+BU6idYK3qNFCMNRW2iXqFaesFjiMW4
         8xrRZU97U8ou8FI94E+ci+7OxJaXFYjdCIJbXPp1ljTPELu3l8lbYp2vEOsABObr4ChP
         xS+QuE3iIh3JyLYXnbxci54mX1b+jxf3LBcvutPQV/Pz+OA/vIB4CvVpTqp/SO+u0VRp
         esb2gc0SQRK31GT1gaBg8UhntKl3DbJ0iFhD2agTWyJbLuqBVb16DhE761Ya3c09+wyr
         y0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682535; x=1774287335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CpR3ACqU07aVtibziRIGQBdLLRT1jdd+Sta0uM61LtQ=;
        b=SOFGWJskSNLexXXbPEReI6Q3fYTbLed4eoVkwVrCq19QU6srY0HOSDeoeSqFhwr9MS
         hE1Xa8IE4uREp9Ks9zUvEe4mH9fULd1A6z5xuWZnXt3fZuskV6kmOTanV9F7ZXlaiNtf
         jt15ExiPJ7p7U3UGq6f6Y94DXDU09I3euSNIf3YitQRlNKD59OZqkhxtI+FL89HNdSGa
         hJGEb7J5socuM7ERN9YXGicSeU9VDjDUToWL9GoB00pFwsetf41bzs3Hrbqbjy5uj+ea
         vogwkMVw/76TAb2yfyHryJDUFwwZf7tQXRZYq5QUdt2fn8UBQAQxBU02/676F28AR3UZ
         ZqYw==
X-Forwarded-Encrypted: i=1; AJvYcCW3BI5LIF4bHawJIv+xov4jQlXTToKVtjp436jSRuLUCHtnFfX5Fnc275FZwSPJePrNcYE3AL6m/BQgP2cSu8gZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzR4y9ZowpQiKwlZfLeRliwHgTq+3hzl0PeBBH9JecwVAws4NOI
	NMAykHPiYF1ZZcD8I3NGWOFk1HfsK4cIIOGq0JLHwA8peJ5fPcAUYyGydIxqzeKVOMk7VNyXIZg
	M6Q==
X-Received: from wmsl29.prod.google.com ([2002:a05:600c:1d1d:b0:485:3659:1508])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a45:b0:485:4006:960c
 with SMTP id 5b1f17b1804b1-48556702a7dmr250396775e9.16.1773682534732; Mon, 16
 Mar 2026 10:35:34 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:27 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-6-456875a2c6db@google.com>
Subject: [PATCH 06/10] KVM: arm64: Use guard(mutex) in mmu.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173537_383566_7C883DF1 
X-CRM114-Status: GOOD (  17.37  )
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

Migrate manual mutex_lock() and mutex_unlock() calls managing
kvm_hyp_pgd_mutex and hyp_shared_pfns_lock to use the
guard(mutex) macro.

This eliminates manual unlock calls on return paths and simplifies
error handling by replacing unlock goto labels with direct returns.
Centralized cleanup goto paths are preserved with manual unlocks
removed.

Change-Id: Ib0f33a474eb84f19da4de0858c77751bbe55dfbb
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 95 ++++++++++++++++++++--------------------------------
 1 file changed, 36 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ec2eee857208..05f1cf839c9e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -388,13 +388,12 @@ static void stage2_flush_vm(struct kvm *kvm)
  */
 void __init free_hyp_pgds(void)
 {
-	mutex_lock(&kvm_hyp_pgd_mutex);
+	guard(mutex)(&kvm_hyp_pgd_mutex);
 	if (hyp_pgtable) {
 		kvm_pgtable_hyp_destroy(hyp_pgtable);
 		kfree(hyp_pgtable);
 		hyp_pgtable = NULL;
 	}
-	mutex_unlock(&kvm_hyp_pgd_mutex);
 }
 
 static bool kvm_host_owns_hyp_mappings(void)
@@ -421,16 +420,11 @@ static bool kvm_host_owns_hyp_mappings(void)
 int __create_hyp_mappings(unsigned long start, unsigned long size,
 			  unsigned long phys, enum kvm_pgtable_prot prot)
 {
-	int err;
-
 	if (WARN_ON(!kvm_host_owns_hyp_mappings()))
 		return -EINVAL;
 
-	mutex_lock(&kvm_hyp_pgd_mutex);
-	err = kvm_pgtable_hyp_map(hyp_pgtable, start, size, phys, prot);
-	mutex_unlock(&kvm_hyp_pgd_mutex);
-
-	return err;
+	guard(mutex)(&kvm_hyp_pgd_mutex);
+	return kvm_pgtable_hyp_map(hyp_pgtable, start, size, phys, prot);
 }
 
 static phys_addr_t kvm_kaddr_to_phys(void *kaddr)
@@ -478,56 +472,42 @@ static int share_pfn_hyp(u64 pfn)
 {
 	struct rb_node **node, *parent;
 	struct hyp_shared_pfn *this;
-	int ret = 0;
 
-	mutex_lock(&hyp_shared_pfns_lock);
+	guard(mutex)(&hyp_shared_pfns_lock);
 	this = find_shared_pfn(pfn, &node, &parent);
 	if (this) {
 		this->count++;
-		goto unlock;
+		return 0;
 	}
 
 	this = kzalloc_obj(*this);
-	if (!this) {
-		ret = -ENOMEM;
-		goto unlock;
-	}
+	if (!this)
+		return -ENOMEM;
 
 	this->pfn = pfn;
 	this->count = 1;
 	rb_link_node(&this->node, parent, node);
 	rb_insert_color(&this->node, &hyp_shared_pfns);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
-unlock:
-	mutex_unlock(&hyp_shared_pfns_lock);
-
-	return ret;
+	return kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
 }
 
 static int unshare_pfn_hyp(u64 pfn)
 {
 	struct rb_node **node, *parent;
 	struct hyp_shared_pfn *this;
-	int ret = 0;
 
-	mutex_lock(&hyp_shared_pfns_lock);
+	guard(mutex)(&hyp_shared_pfns_lock);
 	this = find_shared_pfn(pfn, &node, &parent);
-	if (WARN_ON(!this)) {
-		ret = -ENOENT;
-		goto unlock;
-	}
+	if (WARN_ON(!this))
+		return -ENOENT;
 
 	this->count--;
 	if (this->count)
-		goto unlock;
+		return 0;
 
 	rb_erase(&this->node, &hyp_shared_pfns);
 	kfree(this);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
-unlock:
-	mutex_unlock(&hyp_shared_pfns_lock);
-
-	return ret;
+	return kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
 }
 
 int kvm_share_hyp(void *from, void *to)
@@ -652,22 +632,20 @@ int hyp_alloc_private_va_range(size_t size, unsigned long *haddr)
 	unsigned long base;
 	int ret = 0;
 
-	mutex_lock(&kvm_hyp_pgd_mutex);
-
-	/*
-	 * This assumes that we have enough space below the idmap
-	 * page to allocate our VAs. If not, the check in
-	 * __hyp_alloc_private_va_range() will kick. A potential
-	 * alternative would be to detect that overflow and switch
-	 * to an allocation above the idmap.
-	 *
-	 * The allocated size is always a multiple of PAGE_SIZE.
-	 */
-	size = PAGE_ALIGN(size);
-	base = io_map_base - size;
-	ret = __hyp_alloc_private_va_range(base);
-
-	mutex_unlock(&kvm_hyp_pgd_mutex);
+	scoped_guard(mutex, &kvm_hyp_pgd_mutex) {
+		/*
+		 * This assumes that we have enough space below the idmap
+		 * page to allocate our VAs. If not, the check in
+		 * __hyp_alloc_private_va_range() will kick. A potential
+		 * alternative would be to detect that overflow and switch
+		 * to an allocation above the idmap.
+		 *
+		 * The allocated size is always a multiple of PAGE_SIZE.
+		 */
+		size = PAGE_ALIGN(size);
+		base = io_map_base - size;
+		ret = __hyp_alloc_private_va_range(base);
+	}
 
 	if (!ret)
 		*haddr = base;
@@ -711,17 +689,16 @@ int create_hyp_stack(phys_addr_t phys_addr, unsigned long *haddr)
 	size_t size;
 	int ret;
 
-	mutex_lock(&kvm_hyp_pgd_mutex);
-	/*
-	 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
-	 * an alignment of our allocation on the order of the size.
-	 */
-	size = NVHE_STACK_SIZE * 2;
-	base = ALIGN_DOWN(io_map_base - size, size);
+	scoped_guard(mutex, &kvm_hyp_pgd_mutex) {
+		/*
+		 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
+		 * an alignment of our allocation on the order of the size.
+		 */
+		size = NVHE_STACK_SIZE * 2;
+		base = ALIGN_DOWN(io_map_base - size, size);
 
-	ret = __hyp_alloc_private_va_range(base);
-
-	mutex_unlock(&kvm_hyp_pgd_mutex);
+		ret = __hyp_alloc_private_va_range(base);
+	}
 
 	if (ret) {
 		kvm_err("Cannot allocate hyp stack guard page\n");

-- 
2.53.0.851.ga537e3e6e9-goog


