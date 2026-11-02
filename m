Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D8B606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jbhzvCBx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GfPd3vma;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mk4QBn8A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z1KV9h17lcmSCanvum5IrLFJmwB9lWwA5/Uy28XQqAE=; b=jbhzvCBxNZq6FH11II4VBAmv/N
	ObVmDzG6LWIAiKLCwcIvTj/9HqJVBM10q7HOWDKMfXo7qLUNWzNEBC/4/Iw34GvPyskOu4sil/vOR
	G1Tewik1SQvONyjtmaVCa9PIBlf+PaGIK2jqXq/y2XGujEq9b272lYAJGyeOTLSe13wopoPHfrz7y
	J3YijmONVTqfLyF8K0VG8vpKP+azH2UzXRd/ybMPnOMzd0xCh0D8tSmi5rAvV2BrmJCMaXYdu/dl3
	TAgOnrLqEmsZbTrImVUy3jByDNWacRx5IxCL/k3ngaAGp5hr40A0gJ3+A9ZBya8FHWs4+5J9gfmlI
	fHqjAN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywb-00000000OhF-1DPu;
	Mon, 02 Nov 2026 20:47:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywZ-00000000OeG-0Unt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 20:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z1KV9h17lcmSCanvum5IrLFJmwB9lWwA5/Uy28XQqAE=; b=GfPd3vma7r27B+AcilH81GxzjE
	llXx0GhBlQgsJgMKi0spPp5vT+s3+Ph+pBDK4CnPIXFGRNWoJF/0SMJH/rUy+G1FkxPjbQfpnWUG+
	Dl9Hma44LJyLQ3U8xjeImqgfPXUrLuQOyVdLM997QOSZ3OMmI6H1xt6vBOaeLuNRFE9uUr4rGciuD
	0bNm4Rncod/Q9RLI3ui86VMgF6ipQfWSy3Roq1J5Py5qA2kZwJVCnmFESP5RBbx/iW36WfuiI+1bL
	LtB7e3ymNmMFwLN+6pphkyPH8Cu40xcb9X5k30y4F0h/+9TMMu2wFACRud1ntnTqyoxUZaxGJCI9Q
	6no+UVeg==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvx-000000035Tw-2kSQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:27 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49febef74e3so342485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652431; x=1794257231; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1KV9h17lcmSCanvum5IrLFJmwB9lWwA5/Uy28XQqAE=;
        b=mk4QBn8AlyPSxXS5E1RLB+6/InzbrMW5xIvdMGNEPJcq54jDU6BC8W5u1mSA4+tpKm
         xC5OMQ9UiSvdzWVsETz9mjkd8HOsoR4CdwkWhIS4K61BsfqQWJkqVbWd3Kv1gyg741EA
         2ZFI7Oknek+3zdRH5Px61+Q1PHGzlVxr3v+5ONzH4TSk4T3hGDTjWxYBy7bHEQDgjdLN
         OXdS/i816lxARKT2vGszOVxD7tJCN9tc3yrPcYBfTTsqX6uW6xoB6n9Gnl3LwtX89or9
         5bPnOfRWBzvvE4dJbfq1OBd+qYIAZClo+UPaNbCcqRAW0cSXZ4DzgXuTEedfS+cMysKp
         Wp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652431; x=1794257231;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1KV9h17lcmSCanvum5IrLFJmwB9lWwA5/Uy28XQqAE=;
        b=FVAs+wtUKfhNlVXapTH9+IY6fEre8x76HNmF8TWFyyDMMjijjldv9CrGdFJd3IuumQ
         h/khtDhESuRil/mKSVRgZymglKvBbNB3bOVuDTKuM224/4KLqI6UQ3u+GLnR/d/X5WEJ
         C8v8E4fvOtf6jV6h38YYTIUfc4Iy+Ns8m0BxVAJyVcIwVJXPgO0ZwMWp5lqod7yR9FgS
         sx8ISsrdYmSXdywVTeDv7XGcsSlBgtrfXwEQRIHp3eNchQluPKOtEjGG+n7bG56zNgft
         RuV8/182PkdvjMe8SeSxeGH+JNFiguS0Gp/rsa5z5CI+Pv9g2hf1hlNY853tVEdxVGZ5
         diiw==
X-Forwarded-Encrypted: i=1; AKwUvBz0pcs6Kldh28TDaupRZQo7PVoARzPsnk6yDiX9SY9snmh7FkBmt2j2rPjVmZgOyN71JZdagEBi9abdRGvTvJqN@lists.infradead.org
X-Gm-Message-State: AFq9FYKGr0M+VISAbQ1zxmWF5eZSk/PfM6euzdWEuL+q/OHYKxekH3Td
	zLStiTE5i68f7g6WhhmBEs9lBGgwIxZ42G5Gbo0ShoV5VZmvMi3ScGxedMg9pSygP7JZXnceTYp
	e3HagE++9O1abNGg4Pd6oUA==
X-Received: from wmbgx21.prod.google.com ([2002:a05:600c:8595:b0:4a1:70b0:32e3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6285:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4ac180f07d1mr278917575e9.17.1793652430885;
 Mon, 02 Nov 2026 12:47:10 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:14 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-10-vdonnefort@google.com>
Subject: [PATCH v3 09/23] KVM: arm64: Add a range to hyp_poison_page()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204715_679358_75E92230 
X-CRM114-Status: GOOD (  15.99  )
X-Spam-Score: -7.6 (-------)
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

In preparation for supporting stage-2 huge mappings for protected VMs,
add a nr_pages argument to the memory poisoning mechanism. Use the
existing __apply_guest_page() helper which speeds up the process by
using a PMD_SIZE fixmap when possible.

Also, rename the function to hyp_poison_range() to reflect the new
capability.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index ed82cbe973ad..f2a9af6bda77 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1299,11 +1299,9 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
 	return 0;
 }
 
-static void hyp_poison_page(phys_addr_t phys)
+static void __hyp_poison_page(void *addr, size_t size)
 {
-	void *addr = hyp_fixmap_map(phys);
-
-	memset(addr, 0, PAGE_SIZE);
+	memset(addr, 0, size);
 	/*
 	 * Prefer kvm_flush_dcache_to_poc() over __clean_dcache_guest_page()
 	 * here as the latter may elide the CMO under the assumption that FWB
@@ -1311,8 +1309,12 @@ static void hyp_poison_page(phys_addr_t phys)
 	 * host stage-2 and would otherwise lead to a malicious host potentially
 	 * being able to read the contents of newly reclaimed guest pages.
 	 */
-	kvm_flush_dcache_to_poc(addr, PAGE_SIZE);
-	hyp_fixmap_unmap();
+	kvm_flush_dcache_to_poc(addr, size);
+}
+
+static void hyp_poison_range(phys_addr_t phys, u64 size)
+{
+	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
 }
 
 static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
@@ -1384,7 +1386,7 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	if (ret)
 		goto unlock_guest;
 
-	hyp_poison_page(phys);
+	hyp_poison_range(phys, PAGE_SIZE);
 	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
 unlock_guest:
 	guest_unlock_component(vm);
@@ -1412,7 +1414,7 @@ int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 	switch (guest_get_page_state(pte, ipa)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE));
-		hyp_poison_page(phys);
+		hyp_poison_range(phys, PAGE_SIZE);
 		break;
 	case PKVM_PAGE_SHARED_OWNED:
 		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
-- 
2.56.0.385.gac671c819a-goog


