Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA0A108E1E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mc/8ouXsRhsoNUAz5xj4qcR1KH317YnDcjfTCVdWsz8=; b=b9AyMtWw4QtpxmcaHpw+OFnkhl
	55/9SJd+ZGsE8Ny9SDv9EqYhyOB7TEoIM/tWegLGPbM+zLnnapmUbZW02J9ygRHt8RwWlPXm1HbNo
	tgJ45+WQ9Jz6rFMsMfYllP55qpGy7osewC3RW6YMmExHbSy1YZXspdD408PSy/E0y+kdiqRNBNlPK
	Yihzju3AKi+fLpNwjQGQDMHWXY4CZrGRFPeiJURHDgrwna3FEtYgZUc6nCtPn9FzwWOpW33ysybob
	Ms8F9/QYL6oP1c9jsA5WlKPNeeUJArdRyXwdmpbO14xmedMNVnLiLYiNiuoEQlsU45cC+0jk02wcu
	YSmpeyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BJD-0000000AUt9-1MNo;
	Thu, 19 Mar 2026 11:12:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BJA-0000000AUso-1q0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ADE94020C;
	Thu, 19 Mar 2026 11:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05D7C19424;
	Thu, 19 Mar 2026 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773918774;
	bh=vE62LzfpwfjDmK7KsX8Tt8P8J+smLkHcdWOzAX3l+MM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Zn7CaSK0y861lCz4ulRt7+9OyqxAnyiuXFZL7iUngA5mrO9XibisT3mb2OTXTwjlQ
	 62Nu9y2QJ2dsyHd+sOytXZs0zqCzsNEQutp8lEZPU6hDHAKby3wjzGWId0UuSNFSrg
	 StY0QBYXCPz7jcSd0bpGiuJWl+z2YIIpi7KvAT0U=
Subject: Patch "arm64: mm: Batch dsb and isb when populating pgtables" has been added to the 6.6-stable tree
To: Jim.Perrin@microsoft.com,ardb@kernel.org,catalin.marinas@arm.com,echanude@redhat.com,itaru.kitayama@fujitsu.com,jaboutboul@microsoft.com,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,nmeyerhans@microsoft.com,ryan.roberts@arm.com,sgeorgejohn@microsoft.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 12:12:51 +0100
In-Reply-To: <20260217133411.2881311-3-ryan.roberts@arm.com>
Message-ID: <2026031950-departed-corsage-828f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_041256_525905_23159DC3 
X-CRM114-Status: GOOD (  16.34  )
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


This is a note to let you know that I've just added the patch titled

    arm64: mm: Batch dsb and isb when populating pgtables

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-batch-dsb-and-isb-when-populating-pgtables.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-216826-greg=kroah.com@vger.kernel.org Tue Feb 17 14:35:05 2026
From: Ryan Roberts <ryan.roberts@arm.com>
Date: Tue, 17 Feb 2026 13:34:07 +0000
Subject: arm64: mm: Batch dsb and isb when populating pgtables
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jack Aboutboul <jaboutboul@microsoft.com>, Sharath George John <sgeorgejohn@microsoft.com>, Noah Meyerhans <nmeyerhans@microsoft.com>, Jim Perrin <Jim.Perrin@microsoft.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Eric Chanudet <echanude@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20260217133411.2881311-3-ryan.roberts@arm.com>

From: Ryan Roberts <ryan.roberts@arm.com>

[ Upstream commit 1fcb7cea8a5f7747e02230f816c2c80b060d9517 ]

After removing uneccessary TLBIs, the next bottleneck when creating the
page tables for the linear map is DSB and ISB, which were previously
issued per-pte in __set_pte(). Since we are writing multiple ptes in a
given pte table, we can elide these barriers and insert them once we
have finished writing to the table.

Execution time of map_mem(), which creates the kernel linear map page
tables, was measured on different machines with different RAM configs:

               | Apple M2 VM | Ampere Altra| Ampere Altra| Ampere Altra
               | VM, 16G     | VM, 64G     | VM, 256G    | Metal, 512G
---------------|-------------|-------------|-------------|-------------
               |   ms    (%) |   ms    (%) |   ms    (%) |    ms    (%)
---------------|-------------|-------------|-------------|-------------
before         |   78   (0%) |  435   (0%) | 1723   (0%) |  3779   (0%)
after          |   11 (-86%) |  161 (-63%) |  656 (-62%) |  1654 (-56%)

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20240412131908.433043-3-ryan.roberts@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/pgtable.h |    7 ++++++-
 arch/arm64/mm/mmu.c              |   11 ++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -262,9 +262,14 @@ static inline pte_t pte_mkdevmap(pte_t p
 	return set_pte_bit(pte, __pgprot(PTE_DEVMAP | PTE_SPECIAL));
 }
 
-static inline void set_pte(pte_t *ptep, pte_t pte)
+static inline void set_pte_nosync(pte_t *ptep, pte_t pte)
 {
 	WRITE_ONCE(*ptep, pte);
+}
+
+static inline void set_pte(pte_t *ptep, pte_t pte)
+{
+	set_pte_nosync(ptep, pte);
 
 	/*
 	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -175,7 +175,11 @@ static void init_pte(pte_t *ptep, unsign
 	do {
 		pte_t old_pte = READ_ONCE(*ptep);
 
-		set_pte(ptep, pfn_pte(__phys_to_pfn(phys), prot));
+		/*
+		 * Required barriers to make this visible to the table walker
+		 * are deferred to the end of alloc_init_cont_pte().
+		 */
+		set_pte_nosync(ptep, pfn_pte(__phys_to_pfn(phys), prot));
 
 		/*
 		 * After the PTE entry has been populated once, we
@@ -229,6 +233,11 @@ static void alloc_init_cont_pte(pmd_t *p
 		phys += next - addr;
 	} while (addr = next, addr != end);
 
+	/*
+	 * Note: barriers and maintenance necessary to clear the fixmap slot
+	 * ensure that all previous pgtable writes are visible to the table
+	 * walker.
+	 */
 	pte_clear_fixmap();
 }
 


Patches currently in stable-queue which might be from ryan.roberts@arm.com are

queue-6.6/arm64-mm-don-t-remap-pgtables-per-cont-pte-pmd-block.patch
queue-6.6/arm64-mm-don-t-remap-pgtables-for-allocate-vs-populate.patch
queue-6.6/arm64-mm-batch-dsb-and-isb-when-populating-pgtables.patch

