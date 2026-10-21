Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5CB606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sTmsWEpu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZPoPV7lW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IaPriw5B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfJEvxeugzbMy0UfOmSFFKEhA+PewXL6rgmJ57d1BGY=; b=sTmsWEpuLNaRXBjBCT5/RKRGkP
	g//fnKksjfnlOSCMgQR0g5JVz56R9tV43wxEIehGkIBjLvJh5HCnkY0Y0tM2boE8TnrYcKQjK8oaX
	9XL3ZUe5BHHO1DdEMRIU84gQPqHs/33HyeZnvC+uhXUiXm+FT3oyAgwt5aa2RnGV/2rhYGEvTEJwt
	QkIwp49ssajPSkadEv7RoJbcirdXPWZofYHsSntSjwwamofw2Q0BAADa9O8o3ZRGHHEC+7oj2w61J
	Db2B2gvKj3ReAQTnnyYy7sPVH+X625Qel8ddw9sRjnX3+pc5Zv/HzOK8DYLLhf9uYIFS9z5es4H/A
	mAHuSY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAK-0000000BhCj-28nw;
	Wed, 21 Oct 2026 11:07:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAD-0000000BhA1-3X21
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 11:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lfJEvxeugzbMy0UfOmSFFKEhA+PewXL6rgmJ57d1BGY=; b=ZPoPV7lWMvdlMiH4VHaJW1Djnz
	peMwfgRAEmWlsoWSOt2NJSNrQlL+RWTMWaUfdZT8vMeUT2wZteQ0tEa3G2+IOb9hMtoDRxHikeCrG
	n8eiIxeuI6sSIvzVjX9mPxcJJ/7B3gZLp7lD+/Rzj4J3nBOEzoj7YUUz+FHo4qy/86Y3iNKPT+Fp2
	sLz0J8Yy8OLk0DOaFAcKQpYHH8ZiyBnlZwsdOI/gvDgFgSXK8BtqvxHe3WP0CzyZpnhuxThl5Hvce
	VoZ5Gs3qaPDVuXkr9fj7LcXiOnLLAYUmYjBIJaUGPirkJR/TKspPHsaJzHftLCHyJNGL5oc7Cx6zV
	OvS8dTzA==;
Received: from out-21.mta1.migadu.com ([2001:41d0:203:375::15] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJUAB-00000005jXQ-04bx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:07:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Pju20CFh13puHUYFtOtzpLfsAN18NYvnMP/ZNBnwsKA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792580835; v=1; x=1793185635;
 b=IaPriw5BfVW9gEFnfu3PD1FlyMHM7/f5hFkSqPNok+4ccVfzjeGnnljf3cWCQ42NgoyUsyAt
 gp/yB1hle05hRGXFYpea6yXauJn80ffXE8lc7gC8wmumH/FnLLfjqAerP/OeDCHm7n/ZN7+ZNQV
 rcOnP8dbHEujL7l3+4lYlZ/U=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2cc7fc73b5d6669d;
	Wed, 21 Oct 2026 11:07:15 +0000
X-Mizu-Trace-ID: 2cc7fc73b5d6669d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] KVM: arm64: Sanitise MTE tags when a permission fault installs a mapping
Date: Wed, 21 Oct 2026 12:06:59 +0100
Message-ID: <20261021110700.493315-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110700.493315-1-fuad.tabba@linux.dev>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_120719_161505_63C4551C 
X-CRM114-Status: GOOD (  15.25  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The stage-2 fault path sanitises MTE tags only on translation faults, as
a permission fault normally just relaxes an existing leaf. However, when
the page is backed by a THP, a permission fault at page granule installs
a block whose other pages may never have been mapped or sanitised. Once
dirty logging is off, a guest write to a page mapped read-only during
logging installs the block, and the guest can read the tags those pages'
previous owners left.

Sanitise whenever the fault path calls kvm_pgtable_stage2_map() rather
than relaxing permissions. If the VMM replaces the VMA after the guest
takes a permission fault but before vma_lookup(), that path would map
and sanitise memory from the new VMA without checking it. Run the
VM_MTE_ALLOWED check in kvm_s2_fault_compute_prot() on permission
faults too.

Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a551b6bb13c21..6e10aa9913d71 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2004,7 +2004,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (s2fd->nested)
 		*prot = adjust_nested_exec_perms(kvm, s2fd->nested, *prot);
 
-	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
+	if (!s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (!s2vi->mte_allowed)
 			return -EFAULT;
@@ -2059,9 +2059,6 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
-		sanitise_mte_tags(kvm, pfn, mapping_size);
-
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
 	 * permissions only if mapping_size equals perm_fault_granule. Otherwise,
@@ -2076,6 +2073,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
 								 prot, flags);
 	} else {
+		if (!s2vi->map_non_cacheable && kvm_has_mte(kvm))
+			sanitise_mte_tags(kvm, pfn, mapping_size);
+
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
 							 __pfn_to_phys(pfn), prot,
 							 memcache, flags);
-- 
2.47.3


