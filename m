Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACD1C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YquYZSBkNkCy8q5pJMQ3JTNMW8JFEnoR2bR427fPAFs=; b=d7l/UwhQMgk2dvss+D2cCOHtdW
	nDRjWn5xMM2gRGZ+MDGvcfgmrVigu5boLhKfMRT3kDO5BfFTD/ejcmVVChV08IR16i8ao6bfAByZb
	U7qL7g9GxlepIFe1ZmgZdlhHrkxPsNVb3IyxnUsds2rnY7wtbXYxKnnlGF+B60IuhzC9rzo6GqLzH
	kvY4NY1y0vVQlZa1dKzViKRAw/8GknnULrOc+t5c3GZ/hmMFIhDZpCwNqkbgd8EXE4RXcftONzaxl
	HUCCuRvol9sVLWI6HM0d/65KIKuHe8An2oYkZHOg2g1lh0KeCHWQKrwSjya0f52vN8kt2ZQf1dK41
	Z562r3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfw-00000008qbV-1yat;
	Tue, 08 Sep 2026 11:07:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tft-00000008qaD-2mMS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 11:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YquYZSBkNkCy8q5pJMQ3JTNMW8JFEnoR2bR427fPAFs=; b=OJgQPSZWeZDifBvpJfK0hBaVB3
	FOYLmzkfnyQ4PfwgWwPWzM6GAcrgnm00DK1SIEjAh6m110iju4BTue+sWGwuQ1onjavrcnGS/Dsp+
	3DVq1ECKf3EWaWnqxYmRvUokra+h71lC4GF/dsNt4TzhIalp8qe64v0x5W/sdH0dd43mPB/ce2VLC
	gcHDUhtErRXbfP+fz+FOD5BpI1sMCjBvh6YQPg0/cVaAxiVnZBzPVJv9TfvV8wQW5F2C28U0HvCmr
	FBmdTTz6rhI9AR9ftwqRsjsp1pfjhiGi95/KMY1p1YsZrK512TG/mDMLi6z4h+Y+GM3NNlcK/op4o
	cJr6fdbQ==;
Received: from out-217.mta1.migadu.com ([2001:41d0:203:375::d9] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3tfq-0000000HJqi-41xQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:07:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7jgjQnlj8gbwTTpqNz7Ycv0TSVqQ6IULxTwgTLGtkyI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788865653; v=1; x=1789470453;
 b=wtVnzCoiVkA0PBUwzT44/sHHt9z9WkdVgO2X863a6VQniPD93Mg6PzVPpG9EKU5WPcsgTJrW
 058s4i4jkaIZz/akTDcMZ0pA1tFqPk80nSIktHhKEm29aFRND+wYBAlcNYQvwIhrtmcy4sYYmvI
 0j5TOsTw/lLv15j6Z3+TUVtA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2a5986739231b1ca;
	Tue, 08 Sep 2026 11:07:32 +0000
X-Mizu-Trace-ID: 2a5986739231b1ca
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] KVM: arm64: Move the private VA allocation cursor to __io_map_next
Date: Tue,  8 Sep 2026 12:07:12 +0100
Message-Id: <20260908110713.1540304-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908110713.1540304-1-fuad.tabba@linux.dev>
References: <20260908110713.1540304-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_120735_149063_8BA0D689 
X-CRM114-Status: GOOD (  15.36  )
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

__io_map_base is the start of the private VA range only until the first
allocation from it, after which it is the allocation cursor. Keep it as
the start and move the cursor to __io_map_next, for the walk of the
range the next patch adds.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/mm.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 3b0bee496bffb..422ee57be9560 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -25,6 +25,7 @@ struct memblock_region hyp_memory[HYP_MEMBLOCK_REGIONS];
 unsigned int hyp_memblock_nr;
 
 static u64 __io_map_base;
+static u64 __io_map_next;
 
 struct hyp_fixmap_slot {
 	u64 addr;
@@ -50,7 +51,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
 
 	hyp_assert_lock_held(&pkvm_pgd_lock);
 
-	if (!start || start < __io_map_base)
+	if (!start || start < __io_map_next)
 		return -EINVAL;
 
 	/* The allocated size is always a multiple of PAGE_SIZE */
@@ -60,7 +61,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
 	if (cur > __hyp_vmemmap)
 		return -ENOMEM;
 
-	__io_map_base = cur;
+	__io_map_next = cur;
 
 	return 0;
 }
@@ -70,7 +71,7 @@ static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
  * @size:	The size of the VA range to reserve.
  * @haddr:	The hypervisor virtual start address of the allocation.
  *
- * The private virtual address (VA) range is allocated above __io_map_base
+ * The private virtual address (VA) range is allocated above __io_map_next
  * and aligned based on the order of @size.
  *
  * Return: 0 on success or negative error code on failure.
@@ -81,7 +82,7 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	int ret;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
-	addr = __io_map_base;
+	addr = __io_map_next;
 	ret = __pkvm_alloc_private_va_range(addr, size);
 	hyp_spin_unlock(&pkvm_pgd_lock);
 
@@ -341,7 +342,7 @@ static int create_fixblock(void)
 		return -EINVAL;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
-	addr = ALIGN(__io_map_base, PMD_SIZE);
+	addr = ALIGN(__io_map_next, PMD_SIZE);
 	ret = __pkvm_alloc_private_va_range(addr, PMD_SIZE);
 	if (ret)
 		goto unlock;
@@ -426,6 +427,7 @@ int hyp_create_idmap(u32 hyp_va_bits)
 	 */
 	__io_map_base = start & BIT(hyp_va_bits - 2);
 	__io_map_base ^= BIT(hyp_va_bits - 2);
+	__io_map_next = __io_map_base;
 	__hyp_vmemmap = __io_map_base | BIT(hyp_va_bits - 3);
 
 	return __pkvm_create_mappings(start, end - start, start, PAGE_HYP_EXEC);
@@ -433,19 +435,19 @@ int hyp_create_idmap(u32 hyp_va_bits)
 
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 {
-	unsigned long addr, prev_base;
+	unsigned long addr, prev_next;
 	size_t size;
 	int ret;
 
 	hyp_spin_lock(&pkvm_pgd_lock);
 
-	prev_base = __io_map_base;
+	prev_next = __io_map_next;
 	/*
 	 * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
 	 * an alignment of our allocation on the order of the size.
 	 */
 	size = NVHE_STACK_SIZE * 2;
-	addr = ALIGN(__io_map_base, size);
+	addr = ALIGN(__io_map_next, size);
 
 	ret = __pkvm_alloc_private_va_range(addr, size);
 	if (!ret) {
@@ -461,7 +463,7 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 		ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr + NVHE_STACK_SIZE,
 					  NVHE_STACK_SIZE, phys, PAGE_HYP);
 		if (ret)
-			__io_map_base = prev_base;
+			__io_map_next = prev_next;
 	}
 	hyp_spin_unlock(&pkvm_pgd_lock);
 
-- 
2.39.5


