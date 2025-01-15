Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E64C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGaU/+TE2oGF3eimQ2KnLuagLzu4AwU2TBvptcVR7ws=; b=clK3Am93coNQXW6j5d7u19s63a
	cJw7ISuVEnXvKCarvmTpvWpLIm1RHYr2xowk8fA76fh69KmgHaCQoLOZZ0FBbri6rzZ1JYsXwccBN
	qU0Sl3Qneb/3xL2y9k/aVoWT5veajWey/UPsh5aIjmtwcmDw972fi8CFccHW2MK+HEszAWCUSs5Nj
	XvLZzwX2aGcztLvTXBMLiJ+QC2sI+Vsy3KudUeaOiLpp38Jm5cdYF4+Jh7LbMPvGBJYsGt3gnhlvP
	MvaWwesEOH+w50XFnkZUq5WW7KhZ7OqA8knzzakV9uefnkFdVmofpOpLGbiE4yn/XENYYqXpG3Iq9
	4o2y1ZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuL4-0000000AXni-272y;
	Wed, 15 Jan 2025 03:45:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuF2-0000000AWk1-1DMR;
	Wed, 15 Jan 2025 03:38:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21654fdd5daso106217445ad.1;
        Tue, 14 Jan 2025 19:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912331; x=1737517131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGaU/+TE2oGF3eimQ2KnLuagLzu4AwU2TBvptcVR7ws=;
        b=Zvl78yW5skM/SqotXWtTUUPIXDO/nezMZ92d7TcC9LyeO0fWcs3I2vtI0Y9u/TJmQE
         khKd59z6SHBL6kN2MhtmrFhIxRt6u/OFCkIpbfqo0i6CqMTOzjQL3e++M4yZlls7ABse
         DwRsmh7QhNlmP8OGp0UuD78+bETjAfoLGcep8r1OgmixMOy+pgIJkLgk2AgEEQ11uX1E
         KhVDg5YnolKjlwkxNjUhrQd681uX/opJeDHQJOBEZEKQOku30uaunMVzglfsKWFh2da3
         eO35sm2iJwfdjqQZckO2C3D41294/yX1xCnMRMDoQnVDlyLH6PHWryM99yWj23P1R4m3
         fU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912331; x=1737517131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGaU/+TE2oGF3eimQ2KnLuagLzu4AwU2TBvptcVR7ws=;
        b=dX93hyV39CIjIOnfWAcs/4nRSr4N1U84MbBt0p+5BtsbOvy8w4HiR7fIrWWlEcIsHd
         EJyN8yo7GYQxYz/GW6D27GLdE4MIEN1Mh3MmHeov93ezs69jRqF8szhiHx8MFBCmcMQ1
         7Mf2cH70sdtfBjCmr3Nzu9h5D058c+8bWfZSxKUbBYKL0HnQRhJTc8HulhIax5DdQKYN
         kGOZfvonmjrp3Gsl/aT0IvFmdCIaZrz61+gF8pDwbQLlGpvKg6hdY5Xa/4tyrdvek/o7
         KbbgjNV8vB4etPUBdiLMvfBtR4PIR0FXNgq4jd6zeSzxVEdX73XWar337Ce9BwSeIuN8
         UhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoj7hxkpqvgg6gwKWsr8z9SEotYzfQrVMTPWsCabz9ukiY1LXon9Ec+LAO/LdcCiPWe/+DnRSztvOAfy6ER5c3@lists.infradead.org, AJvYcCVg71+9Urjgcvpr89+aVOc45AwQZZY5lxLdqORCEN7biSIjfJlg1v5uBlN2RTZIYgypMaprMr4bWnweubU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfY49KWhP+4P2D3idDQzWcRMfXQYpi/fh0UZzFNq+SM3/ltGn0
	NGm7C/AEK/bzWxkxL6uXJznz+k0PBcqNTE/c5fitwlNnkB8S3WyI
X-Gm-Gg: ASbGnctgktpoDqqv64vMRzgqgkyk2XOgg0/5DPCZjAZxhC9USYkbDvhsQHk4ft/J7Iu
	XZIce2q5bw085OjM6opv6x3dqU4+IlguaRHlhBg+U8rOu7BLXCZ+08rpWgDmTS394ztTS0A5dn6
	7wD+CPH8JFjucNACPNRgmdVv4Q/oy/ijRG9RObh8CnKH3ytbu/hsfemPdCoU3UurrxnwR2VGHDG
	/hgPi5FGVaSnTuvW1lBPkDLPrOHTYbWrHMh+FdxVBjOtx2eS6Pq31psvYLyES7DRL84n/4Rvo0G
	QeXH3J5P
X-Google-Smtp-Source: AGHT+IEqw72Wem1/NpwpTk58spR/v0PCzoGmmngV+d3HWDRVCCL9vc8Xbq25OJt+gLxiUfAdXr2j8w==
X-Received: by 2002:a17:902:f644:b0:212:40e0:9562 with SMTP id d9443c01a7336-21a83f69651mr417875835ad.25.1736912331517;
        Tue, 14 Jan 2025 19:38:51 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:e5d5:b870:ca9b:78f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10dffbsm73368195ad.49.2025.01.14.19.38.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 19:38:51 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Wed, 15 Jan 2025 16:38:07 +1300
Message-Id: <20250115033808.40641-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250115033808.40641-1-21cnbao@gmail.com>
References: <20250115033808.40641-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_193852_329771_53FC6B22 
X-CRM114-Status: GOOD (  18.02  )
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

From: Barry Song <v-songbaohua@oppo.com>

Currently, the PTEs and rmap of a large folio are removed one at a time.
This is not only slow but also causes the large folio to be unnecessarily
added to deferred_split, which can lead to races between the
deferred_split shrinker callback and memory reclamation. This patch
releases all PTEs and rmap entries in a batch.
Currently, it only handles lazyfree large folios.

The below microbench tries to reclaim 128MB lazyfree large folios
whose sizes are 64KiB:

 #include <stdio.h>
 #include <sys/mman.h>
 #include <string.h>
 #include <time.h>

 #define SIZE 128*1024*1024  // 128 MB

 unsigned long read_split_deferred()
 {
 	FILE *file = fopen("/sys/kernel/mm/transparent_hugepage"
			"/hugepages-64kB/stats/split_deferred", "r");
 	if (!file) {
 		perror("Error opening file");
 		return 0;
 	}

 	unsigned long value;
 	if (fscanf(file, "%lu", &value) != 1) {
 		perror("Error reading value");
 		fclose(file);
 		return 0;
 	}

 	fclose(file);
 	return value;
 }

 int main(int argc, char *argv[])
 {
 	while(1) {
 		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
 				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

 		memset((void *)p, 1, SIZE);

 		madvise((void *)p, SIZE, MADV_FREE);

 		clock_t start_time = clock();
 		unsigned long start_split = read_split_deferred();
 		madvise((void *)p, SIZE, MADV_PAGEOUT);
 		clock_t end_time = clock();
 		unsigned long end_split = read_split_deferred();

 		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
 		printf("Time taken by reclamation: %f seconds, split_deferred: %ld\n",
 			elapsed_time, end_split - start_split);

 		munmap((void *)p, SIZE);
 	}
 	return 0;
 }

w/o patch:
~ # ./a.out
Time taken by reclamation: 0.177418 seconds, split_deferred: 2048
Time taken by reclamation: 0.178348 seconds, split_deferred: 2048
Time taken by reclamation: 0.174525 seconds, split_deferred: 2048
Time taken by reclamation: 0.171620 seconds, split_deferred: 2048
Time taken by reclamation: 0.172241 seconds, split_deferred: 2048
Time taken by reclamation: 0.174003 seconds, split_deferred: 2048
Time taken by reclamation: 0.171058 seconds, split_deferred: 2048
Time taken by reclamation: 0.171993 seconds, split_deferred: 2048
Time taken by reclamation: 0.169829 seconds, split_deferred: 2048
Time taken by reclamation: 0.172895 seconds, split_deferred: 2048
Time taken by reclamation: 0.176063 seconds, split_deferred: 2048
Time taken by reclamation: 0.172568 seconds, split_deferred: 2048
Time taken by reclamation: 0.171185 seconds, split_deferred: 2048
Time taken by reclamation: 0.170632 seconds, split_deferred: 2048
Time taken by reclamation: 0.170208 seconds, split_deferred: 2048
Time taken by reclamation: 0.174192 seconds, split_deferred: 2048
...

w/ patch:
~ # ./a.out
Time taken by reclamation: 0.074231 seconds, split_deferred: 0
Time taken by reclamation: 0.071026 seconds, split_deferred: 0
Time taken by reclamation: 0.072029 seconds, split_deferred: 0
Time taken by reclamation: 0.071873 seconds, split_deferred: 0
Time taken by reclamation: 0.073573 seconds, split_deferred: 0
Time taken by reclamation: 0.071906 seconds, split_deferred: 0
Time taken by reclamation: 0.073604 seconds, split_deferred: 0
Time taken by reclamation: 0.075903 seconds, split_deferred: 0
Time taken by reclamation: 0.073191 seconds, split_deferred: 0
Time taken by reclamation: 0.071228 seconds, split_deferred: 0
Time taken by reclamation: 0.071391 seconds, split_deferred: 0
Time taken by reclamation: 0.071468 seconds, split_deferred: 0
Time taken by reclamation: 0.071896 seconds, split_deferred: 0
Time taken by reclamation: 0.072508 seconds, split_deferred: 0
Time taken by reclamation: 0.071884 seconds, split_deferred: 0
Time taken by reclamation: 0.072433 seconds, split_deferred: 0
Time taken by reclamation: 0.071939 seconds, split_deferred: 0
...

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/rmap.c | 47 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index abeb9fcec384..be1978d2712d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1642,6 +1642,25 @@ void folio_remove_rmap_pmd(struct folio *folio, struct page *page,
 #endif
 }
 
+/* We support batch unmapping of PTEs for lazyfree large folios */
+static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
+			struct folio *folio, pte_t *ptep)
+{
+	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	int max_nr = folio_nr_pages(folio);
+	pte_t pte = ptep_get(ptep);
+
+	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
+		return false;
+	if (pte_none(pte) || pte_unused(pte) || !pte_present(pte))
+		return false;
+	if (pte_pfn(pte) != folio_pfn(folio))
+		return false;
+
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
+			       NULL, NULL) == max_nr;
+}
+
 /*
  * @arg: enum ttu_flags will be passed to this argument
  */
@@ -1655,6 +1674,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
+	int nr_pages = 1;
 	unsigned long pfn;
 	unsigned long hsz = 0;
 
@@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				hugetlb_vma_unlock_write(vma);
 			}
 			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
+		} else if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
+				can_batch_unmap_folio_ptes(address, folio, pvmw.pte)) {
+			nr_pages = folio_nr_pages(folio);
+			flush_cache_range(vma, range.start, range.end);
+			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
+			if (should_defer_flush(mm, flags))
+				set_tlb_ubc_flush_pending(mm, pteval, address,
+					address + folio_size(folio));
+			else
+				flush_tlb_range(vma, range.start, range.end);
 		} else {
 			flush_cache_page(vma, address, pfn);
 			/* Nuke the page table entry. */
@@ -1875,7 +1905,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					 * redirtied either using the page table or a previously
 					 * obtained GUP reference.
 					 */
-					set_pte_at(mm, address, pvmw.pte, pteval);
+					set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
 					folio_set_swapbacked(folio);
 					goto walk_abort;
 				} else if (ref_count != 1 + map_count) {
@@ -1888,10 +1918,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					 * We'll come back here later and detect if the folio was
 					 * dirtied when the additional reference is gone.
 					 */
-					set_pte_at(mm, address, pvmw.pte, pteval);
+					set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
 					goto walk_abort;
 				}
-				dec_mm_counter(mm, MM_ANONPAGES);
+				add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
 				goto discard;
 			}
 
@@ -1943,13 +1973,18 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			dec_mm_counter(mm, mm_counter_file(folio));
 		}
 discard:
-		if (unlikely(folio_test_hugetlb(folio)))
+		if (unlikely(folio_test_hugetlb(folio))) {
 			hugetlb_remove_rmap(folio);
-		else
-			folio_remove_rmap_pte(folio, subpage, vma);
+		} else {
+			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
+			folio_ref_sub(folio, nr_pages - 1);
+		}
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
 		folio_put(folio);
+		/* We have already batched the entire folio */
+		if (nr_pages > 1)
+			goto walk_done;
 		continue;
 walk_abort:
 		ret = false;
-- 
2.39.3 (Apple Git-146)


