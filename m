Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409DFD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNFPbeDpfcWwNjFqfpFGb1I3h0sHk40o+FNyTY0hGXM=; b=RPhZoZiq54RFg3pi9It54BUXI2
	/LO72Htwmxxk/3doP1VpNZxcVnmslsjIM4SphtyG3p4dj1PGDbbd3aPWj41kLYdQs8c9SosofvDIn
	yP0m3sVQDQwBLCy6EXxpCaipmc/QkKD31H126kWQMtu71V7Y0nyIFitcAmL08Dv22UAeZHCrWsnoO
	tJBeeJNGvLIOYerydun6KORX6kZTpbHr/1QRTUEbM+Tfndu8TcdXkC9EbHxf4OXSxPVIMXNCgp6pW
	dlKNs63PNUUyFa33ZPiz+pR++TK9fZ77VUQuS44//YcwQtnaW3roYIWebx0vZf18YVuEMohqElweN
	hiq/N9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NTv-0000000AUe0-2GPa;
	Mon, 28 Oct 2024 11:00:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MEx-0000000AGRm-34pT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B75D5C5A10;
	Mon, 28 Oct 2024 09:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EA3C4CEE3;
	Mon, 28 Oct 2024 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730108446;
	bh=z1mUlgIUaANV/bPlzaFct/onP+Qou91QVjn4WHN+xBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=makORikMMp9/UbWQJ3sLJYYmDweBYANAH51dd82Y2lkQOuR/iidUeUDNFZazncjP9
	 SXlxlDLkTEuXSuJxdvyV3ic8Z8x8fkCuv5P2eGaDWz96MXcgNl1bu+4ps234VH4hFz
	 hojhDqOkIT0MHmmm27Yqe04+In8D8Unw308HCHt3aw71+SxoM2XbzPIpwKzBZYbNDO
	 CkomdyrKrGxLm7fCWIb77ITglUOIe6z6qrVF/clVOowdB2jt3wT1XARtYa/+jYQ3uo
	 UiBKwAvgSnrqo9SM5rouDqir2whDwApOP26Gxoxe6qY9Zh0LMW8iGZjivdTvPpcIfQ
	 7UQJd5K8abhYg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH 3/4] arm64: mte: update code comments
Date: Mon, 28 Oct 2024 15:10:13 +0530
Message-ID: <20241028094014.2596619-4-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_024047_835966_A7C67DA0 
X-CRM114-Status: GOOD (  15.07  )
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

commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag
initialisation") updated the locking such the kernel now allows
VM_SHARED mapping with MTE. Update the code comment to reflect this.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/kvm/mmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a509b63bd4dd..b5824e93cee0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1390,11 +1390,8 @@ static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long hva)
  * able to see the page's tags and therefore they must be initialised first. If
  * PG_mte_tagged is set, tags have already been initialised.
  *
- * The race in the test/set of the PG_mte_tagged flag is handled by:
- * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
- *   racing to santise the same page
- * - mmap_lock protects between a VM faulting a page in and the VMM performing
- *   an mprotect() to add VM_MTE
+ * The race in the test/set of the PG_mte_tagged flag is handled by
+ * using PG_mte_lock and PG_mte_tagged together.
  */
 static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 			      unsigned long size)
@@ -1646,7 +1643,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	}
 
 	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
-		/* Check the VMM hasn't introduced a new disallowed VMA */
+		/*
+		 *  not a permission fault implies a translation fault which
+		 *  means mapping the page for the first time
+		 */
 		if (mte_allowed) {
 			sanitise_mte_tags(kvm, pfn, vma_pagesize);
 		} else {
-- 
2.43.0


