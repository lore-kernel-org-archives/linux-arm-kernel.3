Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s92eyfrG;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UySI9H2f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9tpbLF7GvKR1dLCFLZZGmAAGLb/lQXCuuwOBoPq3W7Q=; b=s92eyfrG1d2/azkG2QLSYiqelK
	sibKEtN8xoVezudc7XSn/Aal/ysJAYaX0SjZlFn9fxByAtuCwbZtnsfAPRCqJ2ZapE7OxznY0+Eao
	hSujcpEPZC6Wmz3hW2MXo8hvGoY32Pb/u8V6fxeMhFnGtALQ/Q82WNUPBydPsN4VS8/d/HIBisc9B
	th1K85WDzz5kCSKdYz1wElcjrMlKuN8cUXpbPum0KTyNOS7fa8U4RIM68Cxvn2V5KE1OtkwJGCq7t
	OBrRV2ywFQoTDDvfBAmPs8pV0XH+eu2XUApz9diAtJrU0g0uB7ECYilFXycNgRAewDUp26swo1Gl1
	WOzH1s1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzR0-00000000SXq-1BtC;
	Mon, 02 Nov 2026 21:19:18 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzQx-00000000SW3-3Ktd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:19:17 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so32827855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793654353; x=1794259153; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tpbLF7GvKR1dLCFLZZGmAAGLb/lQXCuuwOBoPq3W7Q=;
        b=UySI9H2f2qSKdDXhCDAB4hGNRm+49gNBYzi8tn6ZBy1HlCf6kan8WFdth+RmQvRBjZ
         945bEsxjubMYEejjvTJ0NQaTJKbp6c4i7EKsQkwz8hVJCOllveDCaAbY+UagmtiME/xC
         XXDzKU4ZIbyQF+i45jm9Fwiot0k1Aal7giI7BGHS8e3MsqgF8Q5lqP+VYOls6YhdfKe3
         za0Qrdrmj0oz9Bk1VHYc4MwjzXilcXrafay7wJ5Lwlch7PBC98wNl1624FLxrwhMXM3f
         c0ohsVCk35YeswpUOCpYTiIUrF0zjme2csMk1V2+fWspkT1HM1Rkb+DRFyagXy5vdFNj
         DEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654353; x=1794259153;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tpbLF7GvKR1dLCFLZZGmAAGLb/lQXCuuwOBoPq3W7Q=;
        b=vIZgv7TvbywGIrlYKdEAJInydZclo6ah2UVvMp++25aaonBmOXiXAwSp/LWZQ1Xkim
         LY562UGUTC+aGGtCRt7NdffhDr/1TPpWRpcLYcAFV6BhydVIadmkmQ7hNmwMTKi5Z0TI
         jrtCq86L2y7rbYzI0+xp/mCBuH/JdMBhTwGZB2ZnZY/ika+s4OQdYs5geiVHhdnpSbq3
         drLLKY/8KkWHHoy3YKFV5XQm1hcRYJXxgp7mTcdatQu8aOWDRKFgI+aatXsqbut6GsQh
         q+zmSrvgsVVnRSrl9nJiIUhNarRSKN+5GxXboGXjdOe9cbu/O9CRcKF2qNnZTLAElCd+
         PrYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8KKTYTxbIvixlBldBYvG0WntfVlD11nLHMLKB62NNNS4VSHYA+Jf5zXkjftDW849Ejp6xt8K7QOTw9vQHfOqJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLY5S4bngnlVNhhMI4iEDs2NsVNpaW+nN7Zgv+pMO6n5jvLXbVj
	k5ynHVdDRJEL8ssLUnFF1js9uXgcXbwITH9M7Jaci0UnIbfsuxXop5WU0xbLC3bz0+S4D+mjBgb
	vvqr3krM9Q0TInuo8qci1yQ==
X-Received: from wmcn23.prod.google.com ([2002:a05:600c:c0d7:b0:4a1:dfb3:2e66])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr270441685e9.14.1793654353111;
 Mon, 02 Nov 2026 13:19:13 -0800 (PST)
Date: Mon,  2 Nov 2026 21:19:00 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102211900.504192-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: Fast path transparent_hugepage_adjust() for
 non-PMD folios
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, ljs@kernel.org, 
	ryan.roberts@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_131915_853876_E5BCE290 
X-CRM114-Status: GOOD (  20.35  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

transparent_hugepage_adjust() must walk the userspace stage-1 to detect
if a PMD-level mapping is installed. If it is, then a stage-2 block
mapping can be installed. Even though this stage-1 walk is most likely
cache hot (in most cases, the mapping has just been installed), walking
a page-table is still costly. This walks accounts for ~5% of the
user_mem_abort() execution time on an Apple M2 big core. This makes a
fast path interesting.

While we can't be sure by solely looking at the folio if the stage-1 is
a block mapping as userspace has multiple ways to split it, we however
can infer from its size if the stage-1 mapping is __smaller__ than
PMD_SIZE. Anonymous memory or memfd faults will always allocate a folio
big enough for the mapping. The same applies when collapsing into a
block mapping with khugepaged or MADV_COLLAPSE.

Add a fast path based on the folio size. Whenever it is too small for a
PMD_SIZE mapping, bail out early and do not walk the stage-1. This is
interesting for systems where PMD_SIZE THPs are disabled either at
build, or at runtime. Systems under heavy memory pressure will also
benefit from the fast path.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..9d81d908e230 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1553,36 +1553,42 @@ static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s
  * Returns the size of the mapping.
  */
 static long
-transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd, kvm_pfn_t *pfnp, gfn_t *gfnp)
+transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd,
+			    const struct kvm_s2_fault_vma_info *s2vi, kvm_pfn_t *pfnp, gfn_t *gfnp)
 {
 	struct kvm *kvm = s2fd->vcpu->kvm;
-	kvm_pfn_t pfn = *pfnp;
-	gfn_t gfn = *gfnp;
+	int sz;
 
 	/*
 	 * Make sure the adjustment is done only for THP pages. Also make
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
-		int sz = get_user_mapping_size(kvm, s2fd->hva);
+	if (!fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
+		return PAGE_SIZE;
 
-		if (sz < 0)
-			return sz;
+	/*
+	 * If the allocated folio isn't at least PMD_SIZE, there is no way a
+	 * stage-1 PMD level was installed.
+	 */
+	if (s2vi->page && !folio_test_pmd_mappable(page_folio(s2vi->page)))
+		return PAGE_SIZE;
 
-		if (sz < PMD_SIZE)
-			return PAGE_SIZE;
+	/*
+	 * Even though the folio size is big enough, the stage-1 mapping might
+	 * have been split. Verify it.
+	 */
+	sz = get_user_mapping_size(kvm, s2fd->hva);
+	if (sz < 0)
+		return sz;
 
-		gfn &= ~(PTRS_PER_PMD - 1);
-		*gfnp = gfn;
-		pfn &= ~(PTRS_PER_PMD - 1);
-		*pfnp = pfn;
+	if (sz < PMD_SIZE)
+		return PAGE_SIZE;
 
-		return PMD_SIZE;
-	}
+	*gfnp &= ~(PTRS_PER_PMD - 1);
+	*pfnp &= ~(PTRS_PER_PMD - 1);
 
-	/* Use page mapping if we cannot use block mapping. */
-	return PAGE_SIZE;
+	return PMD_SIZE;
 }
 
 static int get_vma_page_shift(struct vm_area_struct *vma)
@@ -2186,7 +2192,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		if (perm_fault_granule > PAGE_SIZE) {
 			mapping_size = perm_fault_granule;
 		} else {
-			mapping_size = transparent_hugepage_adjust(s2fd, &pfn, &gfn);
+			mapping_size = transparent_hugepage_adjust(s2fd, s2vi, &pfn, &gfn);
 			if (mapping_size < 0) {
 				ret = mapping_size;
 				goto out_unlock;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.385.gac671c819a-goog


