Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41659CF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 01:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeLz8B+FFA+xmUGLHkiMAf9w6+beNxbYkBoeeKfR+nQ=; b=yYzRmQvHHfT29lu4yUcKP9iH9g
	Ua3PPB2h5RL+qVaVgklULdTMLfvZkYJM1vwkUXSRlNSVYK5YZ2guRzFVVlShk8Yh4geAcRtptWr4T
	eH99sXU5vHvKYgablDwcUkESgqcgfx497zadrNOUQcUg8+b3G7gE2xjx4Ug/xm8twhVnsVrFmO7gf
	dMGtzGhmPeetionrqZDc6PtawPB8cKf4EK4PSAkH+GhwCtDIZiQkTbisOMFoVcOCKGEXIjFOqFGHH
	NsqPNE7Ly/1fQYTkbHnqLQO2UpYkhAfMIlfHvW9IuUZYC7FfzOi4cy+miKQ/D1yMTk7ZCXC9xE3KE
	1/mTTN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIch-0000000E1Wv-1n2j;
	Wed, 07 Jan 2026 01:46:07 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIce-0000000E1WY-3hFy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 01:46:06 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so267268366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 17:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767750363; x=1768355163; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IeLz8B+FFA+xmUGLHkiMAf9w6+beNxbYkBoeeKfR+nQ=;
        b=Iqc+GJ604uerg93RGRoKuKW8HvrulnvLaSt/ps8EP+MImsXokewUQ5k9UX6G2qhOB1
         F5MaRLT9Wdwpia1ChtrYHzOBznHrCPE6aSJiJax0bqglfo+Ie4+UCzrvZ5yYNEM85WRJ
         1Ev97SeZDygbIppfooLwzHxuglPeHk862F2s0WI0p2+kd1z5M75C8Xf3C4TQnE0yBu4x
         B8nZF09ZKjMpbGmqw4iszlrqG64S+zVguTzE5bxMprzzO0MFGZTfdALqnoqO/v29F+NT
         OxOHKx6c0rW9VqsaA6gEjbCoFXIawbjCMCRBzBljmCA76o+AFt/dbG1hZPvFaSzgt/ld
         B3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767750363; x=1768355163;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeLz8B+FFA+xmUGLHkiMAf9w6+beNxbYkBoeeKfR+nQ=;
        b=such0SRb1xHTVR9vaHwk06S6iv2eWYXjbSGyMEDevn2QjWjveo6t4TU4EP00PQLUnp
         VV3LjJou5OKBXQeQ06BFQEKqsPVE8H4Ti/VTmrMDQzGRQPVtKQzBm0khX8st1Add+6to
         BfpaOgiEvrxp5P5LAepvw0v2CuiaVF6q1jGcSjz3N/rdJTPtv96gfanOncWN72n+0Q38
         1HdHlyNpTH5cvlJK75jzW/Q0kJd+PJhKsHtKJf3QB9qVXuPA78yBsb8Ccso0zfRmfRZX
         eCdY58L35K0Hqyjdv760G47rcNh7Yjky46HfvkFuYTTRBisemcvsjfxC/4p6kcEg2DjE
         a4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Hol5C0ZQ5XDNuzRScbfHwOIFE2fWWXoKYdV1rw6m9GTw9DZMcJOALi4nfv9imzejm0/xju3GA2ca0PCPOZOF@lists.infradead.org
X-Gm-Message-State: AOJu0YzJdzWv+OXPg1A8tWVqIE7AK5+K0N0Xbk/Jf1InQrSkTr/r252e
	ovlY7g+6rzG5cOWFsQ7flGxXJw/U4QJ62kuX7HgwdEto5TvBiHxVg8Ck
X-Gm-Gg: AY/fxX4jFnfyV9fYaci6NdYQwd6nqqilCi7EyR4JvdBm/YEzMbn05+62ykxjmEfP2y5
	pW2K3klbXrNe1UEhraJ9uhka0zEus8/dJwS6H7NVSNHNI4hNlhV8cJmKWKMIDAi8/my4nEF/YYg
	tIBnMnevEdegJlVPz8d9A2Nonh0AfrF+IczfDgx9GxGtOFhkrqGVywrGkBADzlvlIZB/sgBpiMV
	kMTBb3nOvGA3nmyoS1FF9ZCsBDwNblqBaKVawK5Yv9ORnYQtnlvrsldqRGax1LxqO7QMX/DFzak
	3cAYtWQnH1QGVR7FWJPh5Uddhbok2YL5fr9giGNRme7w7LoTioaDfPpOxRqr1zonvaRL+TH8JY2
	koZhAEGiFfc0wkURvcDO2MFpQgFks/HLbN5UwGTNp+/7CPx7BrDnMfFE4ag13Lww3nDcle7Ifk0
	BL/j+R/zZK6csD9qXDqKB5
X-Google-Smtp-Source: AGHT+IFeA6mkv79CriXKt6qQAcQGV8CynmdXfqBxQvsbb+Aj2IP7Z2BA07re20HuxUP8m4dAAyg8xw==
X-Received: by 2002:a17:906:ef02:b0:b80:751:ee62 with SMTP id a640c23a62f3a-b8444c8e95bmr98318966b.14.1767750362536;
        Tue, 06 Jan 2026 17:46:02 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm375951066b.2.2026.01.06.17.46.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jan 2026 17:46:02 -0800 (PST)
Date: Wed, 7 Jan 2026 01:46:01 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	akpm@linux-foundation.org, david@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, riel@surriel.com,
	harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
	dev.jain@arm.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file
 large folios
Message-ID: <20260107014601.dxvq6b7ljgxwg7iu@master>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master>
 <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_174605_070579_EE8F0867 
X-CRM114-Status: GOOD (  27.41  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 07, 2026 at 10:29:25AM +1300, Barry Song wrote:
>On Wed, Jan 7, 2026 at 2:22 AM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> On Fri, Dec 26, 2025 at 02:07:59PM +0800, Baolin Wang wrote:
>> >Similar to folio_referenced_one(), we can apply batched unmapping for file
>> >large folios to optimize the performance of file folios reclamation.
>> >
>> >Barry previously implemented batched unmapping for lazyfree anonymous large
>> >folios[1] and did not further optimize anonymous large folios or file-backed
>> >large folios at that stage. As for file-backed large folios, the batched
>> >unmapping support is relatively straightforward, as we only need to clear
>> >the consecutive (present) PTE entries for file-backed large folios.
>> >
>> >Performance testing:
>> >Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
>> >reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
>> >75% performance improvement on my Arm64 32-core server (and 50%+ improvement
>> >on my X86 machine) with this patch.
>> >
>> >W/o patch:
>> >real    0m1.018s
>> >user    0m0.000s
>> >sys     0m1.018s
>> >
>> >W/ patch:
>> >real   0m0.249s
>> >user   0m0.000s
>> >sys    0m0.249s
>> >
>> >[1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u
>> >Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> >Acked-by: Barry Song <baohua@kernel.org>
>> >Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> >---
>> > mm/rmap.c | 7 ++++---
>> > 1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/mm/rmap.c b/mm/rmap.c
>> >index 985ab0b085ba..e1d16003c514 100644
>> >--- a/mm/rmap.c
>> >+++ b/mm/rmap.c
>> >@@ -1863,9 +1863,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>> >       end_addr = pmd_addr_end(addr, vma->vm_end);
>> >       max_nr = (end_addr - addr) >> PAGE_SHIFT;
>> >
>> >-      /* We only support lazyfree batching for now ... */
>> >-      if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> >+      /* We only support lazyfree or file folios batching for now ... */
>> >+      if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>> >               return 1;
>> >+
>> >       if (pte_unused(pte))
>> >               return 1;
>> >
>> >@@ -2231,7 +2232,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>> >                        *
>> >                        * See Documentation/mm/mmu_notifier.rst
>> >                        */
>> >-                      dec_mm_counter(mm, mm_counter_file(folio));
>> >+                      add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
>> >               }
>> > discard:
>> >               if (unlikely(folio_test_hugetlb(folio))) {
>> >--
>> >2.47.3
>> >
>>
>> Hi, Baolin
>>
>> When reading your patch, I come up one small question.
>>
>> Current try_to_unmap_one() has following structure:
>>
>>     try_to_unmap_one()
>>         while (page_vma_mapped_walk(&pvmw)) {
>>             nr_pages = folio_unmap_pte_batch()
>>
>>             if (nr_pages = folio_nr_pages(folio))
>>                 goto walk_done;
>>         }
>>
>> I am thinking what if nr_pages > 1 but nr_pages != folio_nr_pages().
>>
>> If my understanding is correct, page_vma_mapped_walk() would start from
>> (pvmw->address + PAGE_SIZE) in next iteration, but we have already cleared to
>> (pvmw->address + nr_pages * PAGE_SIZE), right?
>>
>> Not sure my understanding is correct, if so do we have some reason not to
>> skip the cleared range?
>
>I don’t quite understand your question. For nr_pages > 1 but not equal
>to nr_pages, page_vma_mapped_walk will skip the nr_pages - 1 PTEs inside.
>
>take a look:
>
>next_pte:
>                do {
>                        pvmw->address += PAGE_SIZE;
>                        if (pvmw->address >= end)
>                                return not_found(pvmw);
>                        /* Did we cross page table boundary? */
>                        if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) == 0) {
>                                if (pvmw->ptl) {
>                                        spin_unlock(pvmw->ptl);
>                                        pvmw->ptl = NULL;
>                                }
>                                pte_unmap(pvmw->pte);
>                                pvmw->pte = NULL;
>                                pvmw->flags |= PVMW_PGTABLE_CROSSED;
>                                goto restart;
>                        }
>                        pvmw->pte++;
>                } while (pte_none(ptep_get(pvmw->pte)));
>

Yes, we do it in page_vma_mapped_walk() now. Since they are pte_none(), they
will be skipped.

I mean maybe we can skip it in try_to_unmap_one(), for example:

diff --git a/mm/rmap.c b/mm/rmap.c
index 9e5bd4834481..ea1afec7c802 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2250,6 +2250,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		 */
 		if (nr_pages == folio_nr_pages(folio))
 			goto walk_done;
+		else {
+			pvmw.address += PAGE_SIZE * (nr_pages - 1);
+			pvmw.pte += nr_pages - 1;
+		}
 		continue;
 walk_abort:
 		ret = false;

Not sure this is reasonable.


-- 
Wei Yang
Help you, Help me

