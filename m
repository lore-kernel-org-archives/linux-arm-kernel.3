Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5168DC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRMphI5T1L64WHuwz6aodMyAcWwTtLqR1TEhwEfUsrw=; b=jxc/AWiHt5svtQJ9NVpybyiY1R
	4ssofTVoZk5RPFTZZjnPBUUMWTiAetjnLqhuEc9Bk27FgQ0Kfx2dYQJSjr/lApHJhgSLYS4R+/+3L
	SgS/3F+kVlXE0VNpPk+/lROyOMgQJaF9M62Dh5PyymflVofh02TtM+C6drahA003hmYMWjbGmdB+b
	hXs/5nGxA1awac8SL9K2aZzU/81bTHyl0KbcI0Q4InT3iMkL6GrW+4gpF0nzA11JTPOBJR10CLvJj
	u78SHOEF0WLrBn33qv/gpzw/d3NuRKm+07sMntDEIgeaqRR41tdnp/bF3rjz9kNI1QxC0ktf8UyeG
	c7hu3vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hBt-00000002sQO-3tKt;
	Mon, 21 Sep 2026 16:48:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hBl-00000002sNd-008m
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 16:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SRMphI5T1L64WHuwz6aodMyAcWwTtLqR1TEhwEfUsrw=; b=kUD/43JjX19R+2kiyGHpz1kwaL
	do4bW4k23CfcSAS5IE9cAtSy/VILpE6yEpLEUgkUIqJBVvptDYzkgHPzlBJHmvR3Qo27qJO9uGehE
	sEcBt9vS5ErwfYc5hTrmO2VdAAJS06ThlWfqUwDpQnDbmoUkKoH0OLGEc3AYRLqVahT+KB8Lz7qLj
	pfHkpCw5DAdptrBpcCn7BezTeay5CtjvtVro8e6eyfhoyRtijTtAw+o1uye31nay6mijgmpFi24DQ
	1/yYJgGg4jEqras5XAgWiwK3L4bAIYRESvPAqOioHYzdvPF8GMcwPuMG5KDGVL4lOJ7/mhoWCoNH0
	055ONS4w==;
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8hBh-0000000Ca3L-3NCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:48:19 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49e65bee41aso746765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790009295; x=1790614095; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRMphI5T1L64WHuwz6aodMyAcWwTtLqR1TEhwEfUsrw=;
        b=Z9qu0tm6EUo2fU9Zx1q7hQHn80r8mQ0iy7yEa2o1cmWABlpS9MmCVxZ8meZlkfTPGa
         pL6f6UPJHrkioEy+VbMcVv23Mw3wGbWRWQec6macpRZ9AG/btljtrCyXjaDJv/BaL3QA
         wg46HJsNCWkQMtitP302k6ngh9YCf3C39ei9J+JcsigaUMr7jOIlXdVCwe3Nv/4T41pm
         rOQENBEAIsKBwysjk2KmsAdE6KRX6V4w1stzWeuXkw2wrpyLwZWBEeMDEQantFIqALnO
         WzFY55lonNl57L7vUUxjzCAElqFUQB/0cUURkkEelQV+XD1zR0ZzLvwbGR/SC/xHwHUf
         L9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009295; x=1790614095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRMphI5T1L64WHuwz6aodMyAcWwTtLqR1TEhwEfUsrw=;
        b=gZihLzTjETBRjqxu+bimp45rQcatrnPFGDPZDpSz+l8i6WMsPM08RPL8H+uMYSI/og
         swaWkwpO/Q9AZ9K7bjf2yRiAHd7/kgEd+hazHyHx/rbK4CCHcZNE45GSpT0LDXucs0uJ
         WfuEmS2QBTJCvHUdcpvTnFf75qb+GWWayldiypv+1CJMATaqOBkUReVRj72pMnxKYkqi
         LnBmONlAm/J2Qez4he3HydNAMoxk+29PaQxbKrqaeQ60l/pTuSxJKrugYzR2BTWJ1+/g
         uq9sKxguSDOnPVfQA9m5RUfGROrz4NCQCnaeKjrM2U9lXclKBPZpZxOIpgpsCxatqouP
         O4rA==
X-Forwarded-Encrypted: i=1; AKwUvBwdFmtI2m+lU0LGtIJwF3e1G29aF7JbPAs3RzqQVYOuOgHcbt0k1B8JRIYy6vqb4aN3hVbsG/nExvN3hUd0pFvT@lists.infradead.org
X-Gm-Message-State: AFuF++lWtsHMeFfhyde9NVIOlKxq8xIEZ9pfi/UXFYabPjYSIaY8IXFY
	iEwlRbNPQPa0qKDy0YMY+d5JwkVfnLufjSQBCAHcn9cPXDxpeibsAAGkmJLZYHz6Mn/VhvflS4E
	cTMKIYCXQIAFOKlJCM2rozzb75w==
X-Received: from wrbfm9.prod.google.com ([2002:a05:6000:2809:b0:488:5e25:c0aa])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4443:20b0:49f:bb49:9cca with SMTP id 5b1f17b1804b1-49fd883ccd1mr3241865e9.5.1790009295199;
 Mon, 21 Sep 2026 09:48:15 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:47:48 +0000
In-Reply-To: <20260921164748.2958578-1-snehalreddy@google.com>
Mime-Version: 1.0
References: <20260921164748.2958578-1-snehalreddy@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921164748.2958578-3-snehalreddy@google.com>
Subject: [PATCH 2/2] KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_174817_937031_63ED711A 
X-CRM114-Status: GOOD (  15.58  )
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

FF-A v1.3 ALP5 (DEN0140 rev J) adds the FFA_MEM_RECLAIM2 interface,
allowing an Owner to reclaim a subset of pages from a shared or lent
memory region by populating constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. Upon completion, the Relayer returns the number of 4K pages
reclaimed in x3.

Support FFA_FN64_MEM_RECLAIM2 in the host FF-A proxy handler. Validate
the register arguments, descriptor bounds, and initial page index
against the host TX buffer before forwarding the SMC call to the SPMD,
and unshare the reclaimed page ranges in the host stage-2 page tables.

Link: https://support.arm.com/documentation/den0140/j
Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 117 ++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 5ad74ab265b5..e0fba07a67bc 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -232,6 +232,19 @@ static void ffa_mem_reclaim(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 	}, res);
 }
 
+static void ffa_mem_reclaim2(struct arm_smccc_1_2_regs *res, u64 handle,
+			     u64 flags, u64 x3, u64 x4, u64 x5)
+{
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+		.a0 = FFA_FN64_MEM_RECLAIM2,
+		.a1 = handle,
+		.a2 = flags,
+		.a3 = x3,
+		.a4 = x4,
+		.a5 = x5,
+	}, res);
+}
+
 static void ffa_retrieve_req(struct arm_smccc_1_2_regs *res, u32 len)
 {
 	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
@@ -611,6 +624,107 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 		__do_ffa_mem_xfer((fid), (res), (ctxt));	\
 	} while (0);
 
+static void do_ffa_mem_reclaim2(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u64, handle, ctxt, 1);
+	DECLARE_REG(u64, flags, ctxt, 2);
+	DECLARE_REG(u64, x3, ctxt, 3);
+	DECLARE_REG(u64, x4, ctxt, 4);
+	DECLARE_REG(u64, x5, ctxt, 5);
+	u32 req_desc_cnt = (u32)(x3 >> 32);
+	u32 total_pages = (u32)x3;
+	u32 desc_size = (u32)x4;
+	u32 offset = (u32)x5;
+	u32 page_index = (u32)(x5 >> 32);
+	struct ffa_mem_region_addr_range *range;
+	u32 reclaimed_pages;
+	u32 reclaimed_count = 0;
+	u32 in_idx;
+	int ret = 0;
+
+	if (ffa_check_unused_args_sbz(ctxt, 6) || (flags & ~1ULL) || (x4 >> 32)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (!req_desc_cnt || !total_pages) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (desc_size != sizeof(struct ffa_mem_region_addr_range)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if ((u64)req_desc_cnt * desc_size > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (offset % desc_size != 0) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (offset >= (u64)req_desc_cnt * desc_size) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	hyp_spin_lock(&host_buffers.lock);
+	if (!host_buffers.tx) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	memcpy(hyp_buffers.tx, host_buffers.tx, (u64)req_desc_cnt * desc_size);
+
+	range = (void *)hyp_buffers.tx + offset;
+	if (page_index >= range->pg_cnt) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	ffa_mem_reclaim2(res, handle, flags, x3, x4, x5);
+	if (res->a0 != FFA_SUCCESS)
+		goto out_unlock;
+
+	reclaimed_pages = res->a3;
+
+	for (in_idx = offset / desc_size; in_idx < req_desc_cnt; in_idx++) {
+		struct ffa_mem_region_addr_range temp;
+		u32 pg_cnt, to_reclaim;
+
+		if (reclaimed_count >= reclaimed_pages)
+			break;
+
+		range = (void *)hyp_buffers.tx + in_idx * desc_size;
+		if (!range->pg_cnt)
+			continue;
+
+		pg_cnt = range->pg_cnt - page_index;
+		to_reclaim = min(pg_cnt, reclaimed_pages - reclaimed_count);
+
+		temp = (struct ffa_mem_region_addr_range) {
+			.address = range->address + (u64)page_index * FFA_PAGE_SIZE,
+			.pg_cnt = to_reclaim,
+		};
+
+		WARN_ON(ffa_host_unshare_ranges(&temp, 1));
+
+		reclaimed_count += to_reclaim;
+		page_index = 0;
+	}
+
+out_unlock:
+	hyp_spin_unlock(&host_buffers.lock);
+
+	if (ret)
+		ffa_to_smccc_res(res, ret);
+}
+
 static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 			       struct kvm_cpu_context *ctxt)
 {
@@ -1107,6 +1221,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_MEM_RECLAIM:
 		do_ffa_mem_reclaim(&res, host_ctxt);
 		goto out_handled;
+	case FFA_FN64_MEM_RECLAIM2:
+		do_ffa_mem_reclaim2(&res, host_ctxt);
+		goto out_handled;
 	case FFA_MEM_LEND:
 	case FFA_FN64_MEM_LEND:
 		do_ffa_mem_xfer(FFA_FN64_MEM_LEND, &res, host_ctxt);
-- 
2.55.0.1082.g2b9226bbc0-goog


