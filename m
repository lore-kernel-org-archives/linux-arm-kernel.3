Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E0D606B5E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xl+wx6XF;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jXEmiMkT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aObHiAl14ISYnHTiq56WBT9/HZ+h1+3i8W9JjZxKwNA=; b=Xl+wx6XFd5QJ51dmO0bVLw8/5W
	uKqnzPEABbVHSVYw+f+3hK9u05tG8WTGlcd7IeCiGFQDVr2BJy14j+bvUuPQhH4Mw2l1IGRsVq4OA
	ZElzjDzyFNnzv7mINP+pGzHf8XUYWhuA83K2L+92l9LpfNvW6/2Hf8tvB6Mwu/SBAe1DrfAfLBVmN
	82nHzHT4c34hyeJgvTuoUY38T5Wdx+p3zJtvj+TFqhuzcCyi+WJUeLfv+cKwa2IwNUGKwb3TC181K
	nqJ6/zUVEr8ODsMP+h0cJKae8oIJ6i4kUz2iDuWGv4y4BjPac9P+PxQBHAIxcHjtAEe7wjL76wOOl
	6BTKfTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsoI-0000000GkeJ-1x6R;
	Mon, 02 Nov 2026 14:14:54 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsoF-0000000GkZx-1Ihb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:14:53 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4ae2756fa7aso13926885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 06:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793628888; x=1794233688; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aObHiAl14ISYnHTiq56WBT9/HZ+h1+3i8W9JjZxKwNA=;
        b=jXEmiMkTZoemAFF3DtZt65RQ3HzMzOuQIyShGTl1LWEcK7KUacd9NYmDvsZoylz5Np
         Ml2nZuzNDhzicG2N1HiUfAnPvRM+pLQvOX7yvLq3qiH+ai3m2TGFH2eIu9iOOlMKzQLt
         JhvC3WqEinMdpO+zlnY/x9tKrADE1b1UP5fA1TTeXkc2XwGpDX1iIG5zex2Bj4l346Ca
         IgKUfHrrSWKpGMFY53VsJTIisscExWhqsFV1rrWR1jto9iJoi7HDANqCX1gZS/1Ffiml
         bu+k20xfvUUv3dRtc74VFezDzGg8v0ih30zbSXeNNDPpDfn6+DoNbuifvajhWzjkFxUf
         RazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628888; x=1794233688;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aObHiAl14ISYnHTiq56WBT9/HZ+h1+3i8W9JjZxKwNA=;
        b=Xe7iwscCkfYB+55Wpv/xmvkXBRRLqhJ+1Ch6qNGcRoZBfv2O9KJ+g8MYiV8ZyhoR7D
         6y76Cc/NaVXNKPKDdVRhZWqvrMDenNcdg999hX0/Alcez5o5fBUkmvz7M3U5cX0v1Ilq
         KERasFweqZYUDJBeoiaxNRsFXZxWXQQySCB/5YOMO51qe/BJlcgw6zJr+XVC4PXJX/nO
         ebu+cEYZQ3YJZt/yTH5LFCKfrS+Fd2voNb2sWYPi2pdpK47+6jol6rGIgDk9s/xOX/Vb
         ow3F3NEjecBDAPfxsvfLnskkr7JKObtxrIDlC0O9KKhMn9V0HIpBQUOonX8WMkzXkakA
         MQ4g==
X-Forwarded-Encrypted: i=1; AKwUvBx4tKyZlvvZxXXtLSI087A+LRSAS+XOb7fgIlTUoMrapIJK9/PKExXlykPs8MK7mRgJdVaYNsl/e3b9k5yrm7Z6@lists.infradead.org
X-Gm-Message-State: AFq9FYJsYFWbfhVIkkIX4JcR67clvH6E77BgcuhRQhYHXMDn3dssOFxg
	M2hnXN7IkP76IAz1oP2gspNoWg1dRv5AJslft616FaDWv6FKTmDKcz8MXZH3hi3umcltYW989wZ
	Q++GxRqoXKrOS3uXiDyTAgiWspw==
X-Received: from wrbbn9.prod.google.com ([2002:a05:6000:609:b0:488:62a3:a2ef])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr237585955e9.27.1793628888027;
 Mon, 02 Nov 2026 06:14:48 -0800 (PST)
Date: Mon,  2 Nov 2026 14:14:44 +0000
In-Reply-To: <20261102141444.1830221-1-snehalreddy@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102141444.1830221-1-snehalreddy@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102141444.1830221-3-snehalreddy@google.com>
Subject: [PATCH v3 2/2] KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_061451_429669_B5FF4C3F 
X-CRM114-Status: GOOD (  17.80  )
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

FF-A v1.3 BET0 (DEN0140 rev K) adds the FFA_MEM_RECLAIM2 interface,
allowing an Owner to reclaim a subset of pages from a shared or lent
memory region by populating constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. Upon completion, the Relayer returns the number of 4K pages
reclaimed in x3.

Support FFA_MEM_RECLAIM2 in the host FF-A proxy handler. Validate the
register arguments, copy the constituent descriptors from the host TX
buffer into the hypervisor's TX buffer, and check the descriptor bounds,
the total page count and the initial page index on that copy before
forwarding the call to the SPMD. On success, unshare the reclaimed page
ranges from the host stage-2 page tables.

On a Pixel board (pKVM, 16K pages, EL3 SPMC), reclaiming a single 16K
range drops from 1.3us to 0.7us (~45% faster) by avoiding
FFA_MEM_RETRIEVE_REQ/RX_RELEASE (~0.6us), and single-call
FFA_MEM_RECLAIM2 stays faster across small range counts (1.3us vs 1.9us
at 16 ranges; 2 calls break even). Up to 64MiB (4096 ranges), batching
256 descriptors/call adds 15 preemption points, capping each EL2/EL3
call at ~11us while keeping total SMC time within 5%.

Link: https://support.arm.com/documentation/den0140/k
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
---
Changes in v3:
- Drop RFC tag and update specification reference to FF-A v1.3 BET0
  (DEN0140 rev K)
- Add benchmark numbers to commit description
- Add Vincent's Reviewed-by tag (no code changes)

Changes in v2:
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2 (sashiko)
- Check that the sum of pg_cnt across all constituent descriptors
  matches total_pages, guarding against overflow (Vincent)
- Simplify the flags and offset alignment checks (Vincent)

 arch/arm64/kvm/hyp/nvhe/ffa.c | 126 ++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 5ad74ab265b5..2f49ffaa9361 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -232,6 +232,19 @@ static void ffa_mem_reclaim(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 	}, res);
 }
 
+static void ffa_mem_reclaim2(struct arm_smccc_1_2_regs *res, u64 handle,
+			     u64 flags, u64 x3, u64 x4, u64 x5)
+{
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+		.a0 = FFA_MEM_RECLAIM2,
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
@@ -611,6 +624,116 @@ static void __do_ffa_mem_xfer(const u64 func_id,
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
+	u32 declared_pages = 0;
+	u32 reclaimed_pages;
+	u32 reclaimed_count = 0;
+	u32 in_idx;
+	int ret = 0;
+
+	if (ffa_check_unused_args_sbz(ctxt, 6) || flags > 1 || (x4 >> 32)) {
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
+	if (offset % desc_size) {
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
+	for (in_idx = 0; in_idx < req_desc_cnt; in_idx++) {
+		range = (void *)hyp_buffers.tx + in_idx * desc_size;
+		if (check_add_overflow(declared_pages, range->pg_cnt, &declared_pages)) {
+			ret = FFA_RET_INVALID_PARAMETERS;
+			goto out_unlock;
+		}
+	}
+
+	range = (void *)hyp_buffers.tx + offset;
+	if (declared_pages != total_pages || page_index >= range->pg_cnt) {
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
@@ -1107,6 +1230,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_MEM_RECLAIM:
 		do_ffa_mem_reclaim(&res, host_ctxt);
 		goto out_handled;
+	case FFA_MEM_RECLAIM2:
+		do_ffa_mem_reclaim2(&res, host_ctxt);
+		goto out_handled;
 	case FFA_MEM_LEND:
 	case FFA_FN64_MEM_LEND:
 		do_ffa_mem_xfer(FFA_FN64_MEM_LEND, &res, host_ctxt);
-- 
2.56.0.317.g454f8302e1-goog


