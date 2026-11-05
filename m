Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08D606D802
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XU/4aT7P;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0ttzZWP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Agqd4DpQlfLhCygUFKz09zZ1TBm+YrGMJck2lLX5TNw=; b=XU/4aT7PenDKPXzpHgCty5zU1M
	yUOqT2Yfuz3huTdocISLfLtWJkv+CWgVno+j3kH9utmb/FulJYPXXQNHgi7fxfOjEIQ9nVfy3oH7l
	LEfgVJZkX0orceawRn3I+R5qJ3O/gdJ0PNd4Lqvqq6BYNbtXv1FAf+PoXkUGrQiTS/nv+KnfjfsLr
	DnRCQPS0S3jYXTDtyfmEJu4LamhsCQ2mGW/HSSjqEmu3uGT/wQ9RbMFNPVkthdo4Fy2+2Jb01aLPa
	OXV6HA7ThwNdHiGmpZcTP4PkdlMdn9tX3gzY4UFPCKDjRalLFO5j/bl/O/l7tygQnfeeRN8MR2muS
	BbcYcVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6R1-0000000AqCt-48Aa;
	Thu, 05 Nov 2026 22:59:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6Qw-0000000AqBE-2vLy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8C8D6020F;
	Thu,  5 Nov 2026 22:59:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793919589;
	b=SJcvdsODkIUvutDnpTkOaHctPPflY5Ui3mYzOj+KDmVIZ2pGlAhqAWxx160YFnJ7xfwX
	 ihsz/jx66Yczs7shPa53l2ENOfcMSbpjS1C4Sznf9cIuutloM8S6U1vXX7zFUHwCJlgfs
	 z0YDJWpug4aP0dZU29eQiSM+uYAKgu3q/a/It9D5TZ98QiK/rDTPHHSks4vrHrdpbcMsX
	 UKjfHGFk1xJsemmykWP6rREWcCYD9vj/CBbDCFSISq5gQZo9+0/a1gVlbulNP4PNnWmDq
	 GbHT2cCGEqWMiSV2KyOFpl16/wzF8lJDJqzHfrvsAMUFFeGuw+sZM3nK3EAbiPcK+WA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793919589;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Agqd4DpQlfLhCygUFKz09zZ1TBm+YrGMJck2lLX5TNw=;
	b=jfdqpiexcX0gHY9/+QWWIINlGcmUqWfy7Oan1EBJ4p6Q/C+a2zUYFkWRr7mQ6SdVF/f/
	 9UYSPL6bd6S0V38S3fizHhgl7DcjwozMGG6ZSN14div0MMsgFQL1UmsedHvA6QmBwQ4eA
	 7xUXKnTyz3SM+/7B8QUsdr9mc3wwiU5TUI6f/lNJUNoTpfM13EKKLRdyM0a8F7wzPvwDO
	 IZiRv1seNtU9RjZvEJ0eM6g5fIDfkp2HNeuxMy8bcgXTcO1YdRuZADGKEnUJPuKQLiZdP
	 nVCSeoCKEExMB6L2zXknSgiCYCHJRfk/Cmms9+o2tLFd6RroKXqK97TlLplq+nlOseA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7338A1F008A1;
	Thu,  5 Nov 2026 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793919589;
	bh=Agqd4DpQlfLhCygUFKz09zZ1TBm+YrGMJck2lLX5TNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F0ttzZWPxNXblFTVO+qeGWajmQfjpopMMObGi0ArYNBPG0RSXaHuQuMMp/71ZCMiE
	 SHWCJxnlcQ85fz17VHTJ3Xq/H7J4jn3UHjWV3wIuO7grMf2fNvQOF4m40Fdol2PNZW
	 qgKDnv53876MtjViHYGY6XDCXif+UFrP5WAiMF2Db6FQFb5JO0hnH1B3bpws3Q/hcU
	 9EjOlXUhkbvbURW/z/gKkhInMAhMhRgDQOIBAC2/8OHqadufQCptcgOug7Pkml9Djk
	 5CixRJ0AeJiW9nHJSsVFh8EbT5/Ca5pUZELaG9a8MQTSSse1zb2SluQNdgQJC1uZxv
	 vAu89QyaTWqVA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E11D545AC7;
	Thu,  5 Nov 2026 22:59:47 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Date: Thu, 05 Nov 2026 22:59:48 +0000
Subject: [PATCH v2 1/3] KVM: arm64: Compute hyp early-allocation and pool
 sizes in 64 bits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xuheng Li <xuheng@cs.columbia.edu>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793919587; l=3382;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=X5zU9gd0/pnazNbILmVOr0uKyLVNYG+93eBtX8egCgU=;
 b=LqShZxLLsCWkqR33ccGO7h/LdAeTf+PNFAx+Xe+7n2OfRV+wV5cEeW1Lv5RF0HlLlcrurlta8
 6w2qFGnPnc1AnsuA1wFVdjo55XDX/DwojSoNMruLzn/SrazrlO+hX6L
X-Developer-Key: i=xuheng@cs.columbia.edu; a=ed25519;
 pk=L1HVV+goqxYmEMO/OXakL6uf9isSpgk2QrLlFqyZ2Qs=
X-Endpoint-Received: by B4 Relay for xuheng@cs.columbia.edu/20261028 with
 auth_id=1349
X-Original-From: Xuheng Li <xuheng@cs.columbia.edu>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xuheng@cs.columbia.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xuheng Li <xuheng@cs.columbia.edu>

hyp_early_alloc_contig() and hyp_pool_init() both take a page count as
an unsigned int and compute the size in bytes as nr_pages << PAGE_SHIFT
in 32 bits.  For 4 GiB or more (nr_pages >= 2^20 with 4 KiB pages) the
shift overflows.

Two of the regions that pKVM carves out at boot are sized from the
amount of memory: hyp_s1_pgtable_pages() for the hyp page tables (hpool)
and host_s2_pgtable_pages() for the host stage-2 pool both provision
page-granular tables for all of memory, about one page per 2 MiB of
RAM, so they reach 4 GiB on a machine with about 2 TiB of RAM.  Arm
systems of that size exist, for example AWS Graviton4 x8g.metal-48xl
instances (3 TiB) and Ampere Altra Max servers (up to 4 TiB per
socket).

On such a machine, divide_memory_pool() gets a truncated hyp page-table
region from hyp_early_alloc_contig(), so the host stage-2 region and the
FF-A proxy pages that follow it start inside the range that hpool will
own.  hyp_pool_init() then attaches all nr_pages pages of each pool to
its free lists, so hpool and host_s2_pool share pages and the same page
can be handed out twice, for example as a hyp stage-1 table and as a
host stage-2 table.  hyp_pool_init() also derives range_end and
max_order from the truncated size, so most of each pool is treated as
external order-0 pages; on a host whose IPA size makes the host stage-2
PGD a multi-page allocation (for example a 42-bit PARange), that
allocation fails and host_s2_zalloc_pages_exact() uses the NULL result.

Compute both sizes in 64 bits.

Fixes: e75960408723 ("KVM: arm64: Introduce an early Hyp page allocator")
Fixes: 8e17c66249e9 ("KVM: arm64: Introduce a Hyp buddy page allocator")
Cc: stable@vger.kernel.org
Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
---
 arch/arm64/kvm/hyp/nvhe/early_alloc.c | 2 +-
 arch/arm64/kvm/hyp/nvhe/page_alloc.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
index 00de04153..f435f89be 100644
--- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
@@ -23,7 +23,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
 
 void *hyp_early_alloc_contig(unsigned int nr_pages)
 {
-	unsigned long size = (nr_pages << PAGE_SHIFT);
+	unsigned long size = (unsigned long)nr_pages << PAGE_SHIFT;
 	void *ret = (void *)cur;
 
 	if (!nr_pages)
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index 57f86aa0f..e7c10d2f7 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -233,16 +233,16 @@ int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
 		  unsigned int reserved_pages)
 {
 	phys_addr_t phys = hyp_pfn_to_phys(pfn);
+	u64 size = (u64)nr_pages << PAGE_SHIFT;
 	struct hyp_page *p;
 	int i;
 
 	hyp_spin_lock_init(&pool->lock);
-	pool->max_order = min(MAX_PAGE_ORDER,
-			      get_order(nr_pages << PAGE_SHIFT));
+	pool->max_order = min(MAX_PAGE_ORDER, get_order(size));
 	for (i = 0; i <= pool->max_order; i++)
 		INIT_LIST_HEAD(&pool->free_area[i]);
 	pool->range_start = phys;
-	pool->range_end = phys + (nr_pages << PAGE_SHIFT);
+	pool->range_end = phys + size;
 
 	/* Init the vmemmap portion */
 	p = hyp_phys_to_page(phys);

-- 
2.53.0



