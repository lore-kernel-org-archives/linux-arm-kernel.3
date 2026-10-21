Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9ED606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HSbMxs9y;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=M1EyjHo+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=At2A/wrqaAUfI4SKCwlEtMqC27pXN2/myITaZPv60nw=; b=HSbMxs9yzaf2nuJ3u3r9lltYPb
	UxjWJkMrCAc1eG5lTCCVa33PyCDHy1FxOn9OlKvzVbMyomk/EjrRSs717e62LpUYWFr6qvvWrpFSO
	PCubc5apgs66OTgwI2h7xZ5DqnsHrcpnTroaS6NDfd5iFSVjDUGn6TW5ARk+NkTEvFRLxOD6yvpY8
	n8cRMO/jkEwgsKA9B3m31elp+qKLGDStT37cAN9IeZfAHaHH8ep2IL4XKX3lo51XTtyjt66681s2V
	zrmxQ1xbxTWj8Pe0bOUrKQo/+Dp0IbQwST3L4/W5TOd6/LqrSgHwJajgOdEyj6IQqp6hLMvY5icYs
	Md6uP2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJckP-0000000Cp2s-34fm;
	Wed, 21 Oct 2026 20:17:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJckN-0000000Cp29-1dH3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 20:17:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2db33db4de9so16755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792613831; x=1793218631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=At2A/wrqaAUfI4SKCwlEtMqC27pXN2/myITaZPv60nw=;
        b=M1EyjHo+h42T3OSGcBjVvOBIuNlS9mcS+PXAd092vFrPEg/LExW9xtsx8phZ1J8TpY
         E9OlMWKiITb7xB/VazPA+vXP2eBTwblNeOycLL3nPhSGZZbcYcAY4X/Ax4t8n4Ly1h3E
         /VAtmljacFnNTlTYdAgXMFtDVe1y2+Bsy7uIFLNGAdxQJMt8rOP6CthMsRiTo8XH9qhY
         14HkKohuuZj4fq9DErzkWv2M0NP20pwNJLlO3CKfEW/H88sVpIhE7UjLnKsHHaAQOuZV
         zihSVpupnsc3SNnDuOMDpdl6bVdZJj5YCtbadQsasN7Bisj9jPcLmn58eIr86iXWemaR
         CYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613831; x=1793218631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At2A/wrqaAUfI4SKCwlEtMqC27pXN2/myITaZPv60nw=;
        b=S/nUl2i5gsIJH+7gCLNSIt7IC3s+XosLu8nX0z/KEjPmGjq/diN1vJaDJJJtyNvGW9
         yVcujf4mHIRK3AtSsQ2+PEy359fpSggsdqNK2uaezfAxcTnmIs34h/HYLNu6WPuZdgHM
         RPNlWhUp0PGD5ooaW9M9OyvP9/6TLuFmUTD/B75VH17udkkuIo10WDqhJPHQr30Tk4vv
         Qxu/cbOtLdsFgs79cJV5ntaYqDZE8MavXGWuV3zMGLF4KPpl8fBEatwzunUzjAG1hpG9
         DJiP097ZKniRnBq+YgfEpBiXpguuyuE2zgEyjWbx4WcjUC0xwQb0fI8dM4U/ZJAe9MAC
         g9UQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2phi+hdTDg8KrtQZT7aDm544ibjN4dD7J7HODw2Mh3R6gFHKQ7AUl2leZNHwcwdB1SgaQQKquKtDpzcYIbHWp@lists.infradead.org
X-Gm-Message-State: AFq9FYLCzKDF9IpD6fTXRU6s5iF04GZSkv+m+YW1ArR4bpEO4YGBTylr
	7GZhVaYFK0OAmQMaKwikxOT0Yfr4a6UfzevroLonxrw3kpyIf7IvJfEzscq27ZPrZw==
X-Gm-Gg: AYBFou03S27h5lexGCwsjGbkvaeCDsGDTzqDjvwTHlaQnPT2y4JyXtNFhi+zMHK9yN6
	1bv+wTOXEXorn5kr7fGh+QBQMnILM+tUP1M9cJmuoKJ225wCwXVKZQpOzGpsb50JWpr6ytbSw6h
	Nm9Jsv0W9zgGY5ULfnBmOmZzyIgJ8GOSa3CeOfnuXH4BzLWb7yI2vdy0U7R6J0mRkqtcjkqe1aI
	ZysJBLcNlsvA7BfJh1bO8qoS1M36DRKZBPO6ZZseJrl13sdVr+21XaOSofxzby9pvstKC85fUvT
	oxLG/bbgBlYvRDKoNKb58E7t4xZrP24iwmIx3khbovrUG9a8ajvWhd5SZo+s+/cPXPm1jrLQLvn
	YzgOgV6ehnRYCkpheaq4emHnSY6LVE19UKlqxjwcIQfBoVp8j1nDAJbr8NpcpUYP3PMHvrTH2Ke
	ZdXe+LRq4gAW6pdLarMTpWsOyBkDTZuuk1wEU3Rko4Ce5WsjnWBgGYTHKiMAMncz8OaDXvG+Qkp
	NP8+00Vq2SoygzWtts9pQS56ZLjqsaBwwZ5/VyDFz05PMQWssp59n/EOeRYM7PGAGZj5AdhVv12
	4/ScvIaG1Txe7N88bbjuiYfmh3ev8haBKvveW9RsPvs/aObE
X-Received: by 2002:a17:903:24b:b0:2e6:d25:d874 with SMTP id d9443c01a7336-2ea6313172cmr689965ad.10.1792613830593;
        Wed, 21 Oct 2026 13:17:10 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm927197a91.6.2026.10.21.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:17:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:17:05 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Fred Griffoul <griffoul@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Woodhouse <dwmw2@infradead.org>, 
	Ackerley Tng <ackerleytng@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/11] iommufd: Map memory provider files
Message-ID: <atkO08eCJzLX6R58@google.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-7-griffoul@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261014093733.90312-7-griffoul@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_131715_443036_EE2155E4 
X-CRM114-Status: GOOD (  32.82  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 09:37:28AM +0000, Fred Griffoul wrote:
>From: Fred Griffoul <fgriffo@amazon.co.uk>
>
>IOMMU_IOAS_MAP_FILE pins the pages it maps, which cannot work for a
>memory provider file: the frames may have no struct page, and the
>provider can take any of them back at any time.
>
>Accept a provider file. iommufd neither pins nor accounts its pages.
>It asks the provider for each frame when it fills a domain, and on a
>revoke it unmaps the range in every domain and maps what the provider
>backs now. A device that accesses the range in between faults. A
>revoke charges the page tables it allocates to the memory cgroup that
>mapped the file, not to the task that revoked.
>
>Each frame gets a PAGE_SIZE entry, so a partial revoke never splits a
>large IOMMU page. The next patch maps larger blocks. Holes stay
>unmapped, read-only pages are mapped without IOMMU_WRITE, and MMIO
>pages with IOMMU_MMIO. Frame 0 is refused with -EINVAL: iova_to_phys()
>returns 0 for an IOVA that is not mapped, so a revoke would take that
>page for a hole and leave it mapped.
>
>A revoke would race a dirty bitmap read and lose the dirty bits of the
>range, so provider pages and a dirty tracking domain cannot share an
>IOAS: whichever comes second fails with -EOPNOTSUPP. A provider
>mapping cannot be split by a partial unmap, and in-kernel accesses to
>it are refused.
>
>Assisted-by: Claude:claude-opus-5-5
>Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
>---
> drivers/iommu/iommufd/Kconfig        |   1 +
> drivers/iommu/iommufd/io_pagetable.c |  13 +-
> drivers/iommu/iommufd/io_pagetable.h |  27 ++-
> drivers/iommu/iommufd/pages.c        | 288 ++++++++++++++++++++++++++-
> include/uapi/linux/iommufd.h         |  11 +-
> 5 files changed, 334 insertions(+), 6 deletions(-)
>

[snip]

>+
> /* The pages are not pinned, so their domains are tracked in pages->tracker. */
> static inline bool iopt_pages_tracked(struct iopt_pages *pages)
> {
>-	return iopt_is_dmabuf(pages);
>+	return iopt_is_dmabuf(pages) || iopt_is_provider(pages);
> }
>
> static inline bool iopt_dmabuf_revoked(struct iopt_pages *pages)
>@@ -285,6 +306,10 @@ struct iopt_pages *iopt_alloc_dmabuf_pages(struct iommufd_ctx *ictx,
> 					   unsigned long start_byte,
> 					   unsigned long start,
> 					   unsigned long length, bool writable);
>+struct iopt_pages *iopt_alloc_provider_pages(struct file *file,
>+					     unsigned long start,
>+					     unsigned long length,
>+					     bool writable);
> void iopt_release_pages(struct kref *kref);
> static inline void iopt_put_pages(struct iopt_pages *pages)
> {
>diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
>index 660af3d46f5e..aa7740326ad6 100644
>--- a/drivers/iommu/iommufd/pages.c
>+++ b/drivers/iommu/iommufd/pages.c
>@@ -52,6 +52,8 @@
> #include <linux/iommu.h>
> #include <linux/iommufd.h>
> #include <linux/kthread.h>
>+#include <linux/mem_provider.h>
>+#include <linux/memcontrol.h>
> #include <linux/overflow.h>
> #include <linux/slab.h>
> #include <linux/sched/mm.h>
>@@ -238,6 +240,35 @@ static void iommu_unmap_nofail(struct iommu_domain *domain, unsigned long iova,
> 	WARN_ON(ret != size);
> }
>
>+/*
>+ * Provider pages are mapped with PAGE_SIZE entries, and may have holes.  Some
>+ * IOMMU drivers warn when asked to unmap an IOVA that is not mapped, so find
>+ * the runs that are mapped and unmap each one, without touching the holes.
>+ * iopt_provider_map() refuses frame 0, which iova_to_phys() reports for
>+ * an IOVA that is not mapped.
>+ */
>+static void iopt_provider_unmap(struct iopt_area *area,
>+				struct iommu_domain *domain,
>+				unsigned long start_index,
>+				unsigned long last_index)
>+{
>+	unsigned long iova = iopt_area_index_to_iova(area, start_index);
>+	size_t left = (last_index - start_index + 1) * PAGE_SIZE;
>+
>+	while (left) {
>+		size_t len = 0;
>+
>+		while (len < left && iommu_iova_to_phys(domain, iova + len))
>+			len += PAGE_SIZE;
>+		if (len)
>+			iommu_unmap_nofail(domain, iova, len);
>+		/* Step over the run and the hole page that ended it. */
>+		len = min(len + PAGE_SIZE, left);
>+		iova += len;
>+		left -= len;
>+	}
>+}
>+
> static void iopt_area_unmap_domain_range(struct iopt_area *area,
> 					 struct iommu_domain *domain,
> 					 unsigned long start_index,
>@@ -245,6 +276,11 @@ static void iopt_area_unmap_domain_range(struct iopt_area *area,
> {
> 	unsigned long start_iova = iopt_area_index_to_iova(area, start_index);
>
>+	if (area->provider) {
>+		iopt_provider_unmap(area, domain, start_index, last_index);
>+		return;
>+	}
>+
> 	iommu_unmap_nofail(domain, start_iova,
> 			   iopt_area_index_to_iova_last(area, last_index) -
> 				   start_iova + 1);
>@@ -1349,6 +1385,10 @@ static int pfn_reader_first(struct pfn_reader *pfns, struct iopt_pages *pages,
> 	    WARN_ON(last_index < start_index))
> 		return -EINVAL;
>
>+	/* Provider pages are read from the provider, see iopt_provider_map() */
>+	if (WARN_ON(iopt_is_provider(pages)))
>+		return -EINVAL;
>+
> 	rc = pfn_reader_init(pfns, pages, start_index, last_index);
> 	if (rc)
> 		return rc;
>@@ -1647,6 +1687,228 @@ void iopt_pages_untrack_all_domains(struct iopt_area *area,
> 	}
> }
>
>+static int iopt_provider_prot(struct iopt_area *area, u32 attrs)
>+{
>+	int prot = area->iommu_prot;
>+
>+	if (attrs & MEM_PROVIDER_ATTR_READONLY)
>+		prot &= ~IOMMU_WRITE;
>+	if (mem_provider_type(attrs) != MEM_PROVIDER_TYPE_RAM) {
>+		prot &= ~IOMMU_CACHE;
>+		prot |= IOMMU_MMIO;
>+	}
>+	return prot;
>+}
>+
>+/*
>+ * Map what the provider backs in [start_index, last_index] of the area into
>+ * @domain, and leave the holes unmapped.  Each frame is mapped with a
>+ * PAGE_SIZE entry, so that a revoke of part of a large block never has to
>+ * split a larger IOMMU page.  On failure nothing in the range is mapped.
>+ */
>+static int iopt_provider_map(struct iopt_area *area, struct iopt_pages *pages,
>+			     struct iommu_domain *domain,
>+			     unsigned long start_index,
>+			     unsigned long last_index)
>+{
>+	unsigned long base = pages->provider.start >> PAGE_SHIFT;
>+	unsigned long index = start_index;
>+	int rc;
>+
>+	lockdep_assert_held(&pages->mutex);
>+
>+	if ((1UL << __ffs(domain->pgsize_bitmap)) > PAGE_SIZE)
>+		return -EOPNOTSUPP;
>+
>+	/*
>+	 * A revoke unmaps under pages->mutex only, so it would race with a
>+	 * dirty bitmap read, and lose the dirty bits of what it unmaps.
>+	 * Provider pages are not mapped in a domain with dirty tracking.
>+	 */
>+	if (domain->dirty_ops)
>+		return -EOPNOTSUPP;
>+
>+	while (index <= last_index) {
>+		unsigned long pfn, iova, block_end, nr, i;
>+		int order = PUD_ORDER;
>+		u32 attrs;
>+		int prot;
>+
>+		rc = mem_provider_get_page(&pages->provider.att, base + index,
>+					   &pfn, &order, &attrs);
>+		if (rc == -EFAULT) {
>+			index++;
>+			continue;

Hi Fred,

Thanks for this.

With this approach, silently skipping holes during IOAS_MAP_FILE means
iommufd has no tracking of which IOVA ranges in the area are actually
mapped, which complicates unmap and could also hide a bug if a hole in
the range was not expected?

I am wondering whether the areas can track the holes, or whether we
should have areas for the mapped/unmapped ranges? This should allow
proper sanity checks when doing revoke. I am also thinking about this
from the live update point of view, where we might need to sanity check
that the backing memory of mapped regions is preserved.

Could you please CC me on v3? I'd like to follow this from the live
update IOMMU and iommufd preservation side.

https://lore.kernel.org/all/20260921004834.2601285-1-skhawaja@google.com/

Thanks,
Sami

