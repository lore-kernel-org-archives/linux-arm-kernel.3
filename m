Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B387CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Hrx09fbI0rCnyuIH51g1d7/84fJ47WaPzex923wSBGM=; b=eI2dufMCS9w1AJeAiOL1s93dCk
	W/KeXgM4doX/BmUluSSMZ1q4o2U23hVW7sseysGtRvrwD8yruSX0QwA3I/NWfXJl5mU1FMI/sq3wj
	9GhwDzdNPYTV59ueAycxmxGdSPtfxLAQou000AE47PZZgOKO3mGGpJJ4284HNcIf8quR8x6kdkGUU
	GIxLu2cfoqaqI1nvG4m1CRnqya6TX91cPIe6Jwpk2n+zOKABq0RxJjHfy7THGo123gos3aYNXOBBK
	rXxh3zjzU8EzCygozAROZqo4Vutt8fMJ6BYRJaLHCE9WVTVjVODn9KK8yIINgTP1wPC9PHpoPFZp0
	4kYcYkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpld-000000082Xz-2T5w;
	Fri, 15 May 2026 10:27:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNplb-000000082Xj-3T5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC9546132D;
	Fri, 15 May 2026 10:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F513C2BCB0;
	Fri, 15 May 2026 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778840858;
	bh=LFq05zmXPt0S5II932JUk8O2kgYym186l0qX9txCYMM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=u3n9Q3HxfccY4WEGYaj8UGVALAG/ezCyYE01lG6yV+kOXB7Gm2J55MUItLA6fbXoc
	 qPF5kduBWs4YqJCGPRo6ImjCTbrM5/ytiLlQTRJ5hTZ4cxjqydDXkcbhPKuTLbxqOc
	 uMBHz7KjnmNY5M+Fz4fYBIr3HJaX6W5nfBgi67VQ=
Subject: Patch "arm64/mm: Enable batched TLB flush in unmap_hotplug_range()" has been added to the 6.6-stable tree
To: anshuman.khandual@arm.com,catalin.marinas@arm.com,david@kernel.org,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,ryan.roberts@arm.com,sashal@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 15 May 2026 12:27:34 +0200
In-Reply-To: <20260428152400.3033637-1-sashal@kernel.org>
Message-ID: <2026051534-dean-squire-0ddf@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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

    arm64/mm: Enable batched TLB flush in unmap_hotplug_range()

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-241691-greg=kroah.com@vger.kernel.org Tue Apr 28 17:25:10 2026
From: Sasha Levin <sashal@kernel.org>
Date: Tue, 28 Apr 2026 11:24:00 -0400
Subject: arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
To: stable@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <20260428152400.3033637-1-sashal@kernel.org>

From: Anshuman Khandual <anshuman.khandual@arm.com>

[ Upstream commit 48478b9f791376b4b89018d7afdfd06865498f65 ]

During a memory hot remove operation, both linear and vmemmap mappings for
the memory range being removed, get unmapped via unmap_hotplug_range() but
mapped pages get freed only for vmemmap mapping. This is just a sequential
operation where each table entry gets cleared, followed by a leaf specific
TLB flush, and then followed by memory free operation when applicable.

This approach was simple and uniform both for vmemmap and linear mappings.
But linear mapping might contain CONT marked block memory where it becomes
necessary to first clear out all entire in the range before a TLB flush.
This is as per the architecture requirement. Hence batch all TLB flushes
during the table tear down walk and finally do it in unmap_hotplug_range().

Prior to this fix, it was hypothetically possible for a speculative access
to a higher address in the contiguous block to fill the TLB with shattered
entries for the entire contiguous range after a lower address had already
been cleared and invalidated. Due to the table entries being shattered, the
subsequent TLB invalidation for the higher address would not then clear the
TLB entries for the lower address, meaning stale TLB entries could persist.

Besides it also helps in improving the performance via TLBI range operation
along with reduced synchronization instructions. The time spent executing
unmap_hotplug_range() improved 97% measured over a 2GB memory hot removal
in KVM guest.

This scheme is not applicable during vmemmap mapping tear down where memory
needs to be freed and hence a TLB flush is required after clearing out page
table entry.

Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
Cc: stable@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
[ replaced `__pte_clear()` with `pte_clear()` ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/mm/mmu.c |   36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -870,10 +870,14 @@ static void unmap_hotplug_pte_range(pmd_
 
 		WARN_ON(!pte_present(pte));
 		pte_clear(&init_mm, addr, ptep);
-		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-		if (free_mapped)
+		if (free_mapped) {
+			/* CONT blocks are not supported in the vmemmap */
+			WARN_ON(pte_cont(pte));
+			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 			free_hotplug_page_range(pte_page(pte),
 						PAGE_SIZE, altmap);
+		}
+		/* unmap_hotplug_range() flushes TLB for !free_mapped */
 	} while (addr += PAGE_SIZE, addr < end);
 }
 
@@ -894,15 +898,14 @@ static void unmap_hotplug_pmd_range(pud_
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_sect(pmd)) {
 			pmd_clear(pmdp);
-
-			/*
-			 * One TLBI should be sufficient here as the PMD_SIZE
-			 * range is mapped with a single block entry.
-			 */
-			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-			if (free_mapped)
+			if (free_mapped) {
+				/* CONT blocks are not supported in the vmemmap */
+				WARN_ON(pmd_cont(pmd));
+				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
 				free_hotplug_page_range(pmd_page(pmd),
 							PMD_SIZE, altmap);
+			}
+			/* unmap_hotplug_range() flushes TLB for !free_mapped */
 			continue;
 		}
 		WARN_ON(!pmd_table(pmd));
@@ -927,15 +930,12 @@ static void unmap_hotplug_pud_range(p4d_
 		WARN_ON(!pud_present(pud));
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
-
-			/*
-			 * One TLBI should be sufficient here as the PUD_SIZE
-			 * range is mapped with a single block entry.
-			 */
-			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-			if (free_mapped)
+			if (free_mapped) {
+				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
 				free_hotplug_page_range(pud_page(pud),
 							PUD_SIZE, altmap);
+			}
+			/* unmap_hotplug_range() flushes TLB for !free_mapped */
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
@@ -965,6 +965,7 @@ static void unmap_hotplug_p4d_range(pgd_
 static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 				bool free_mapped, struct vmem_altmap *altmap)
 {
+	unsigned long start = addr;
 	unsigned long next;
 	pgd_t *pgdp, pgd;
 
@@ -986,6 +987,9 @@ static void unmap_hotplug_range(unsigned
 		WARN_ON(!pgd_present(pgd));
 		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
+
+	if (!free_mapped)
+		flush_tlb_kernel_range(start, end);
 }
 
 static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-6.6/ksmbd-reset-rcount-per-connection-in-ksmbd_conn_wait_idle_sess_id.patch
queue-6.6/dmaengine-idxd-fix-crash-when-the-event-log-is-disab.patch
queue-6.6/bpf-don-t-mark-stack_invalid-as-stack_misc-in-mark_s.patch
queue-6.6/wifi-mt76-connac-introduce-helper-for-mt7925-chipset.patch
queue-6.6/wifi-mt76-mt792x-describe-usb-wfsys-reset-with-a-descriptor.patch
queue-6.6/mmc-core-optimize-time-for-secure-erase-trim-for-some-kingston-emmcs.patch
queue-6.6/ksmbd-replace-connection-list-with-hash-table.patch
queue-6.6/selftests-bpf-validate-fake-register-spill-fill-prec.patch
queue-6.6/block-relax-pgmap-check-in-bio_add_page-for-compatible-zone-device-pages.patch
queue-6.6/wifi-rtl8xxxu-fix-potential-use-of-uninitialized-value.patch
queue-6.6/x86-shadow-stacks-proper-error-handling-for-mmap-loc.patch
queue-6.6/ksmbd-use-msleep-instaed-of-schedule_timeout_interruptible.patch
queue-6.6/net-txgbe-fix-rtnl-assertion-warning-when-remove-mod.patch
queue-6.6/bluetooth-mgmt-fix-possible-uafs.patch
queue-6.6/net-qrtr-ns-limit-the-total-number-of-nodes.patch
queue-6.6/bpf-handle-fake-register-spill-to-stack-with-bpf_st_.patch
queue-6.6/io_uring-poll-fix-multishot-recv-missing-eof-on-wake.patch
queue-6.6/drm-amdgpu-use-vmemdup_array_user-in-amdgpu_bo_creat.patch
queue-6.6/arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
queue-6.6/smb-common-change-the-data-type-of-num_aces-to-le16.patch
queue-6.6/mtd-docg3-convert-to-platform-remove-callback-return.patch
queue-6.6/f2fs-fix-uaf-caused-by-decrementing-sbi-nr_pages-in-f2fs_write_end_io.patch
queue-6.6/iommu-amd-use-atomic64_inc_return-in-iommu.c.patch
queue-6.6/wifi-mwifiex-fix-use-after-free-in-mwifiex_adapter_cleanup.patch
queue-6.6/f2fs-fix-to-detect-potential-corrupted-nid-in-free_n.patch
queue-6.6/selftests-bpf-validate-precision-logic-in-partial_st.patch
queue-6.6/rxrpc-fix-rxrpc_input_call_event-to-only-unshare-dat.patch
queue-6.6/regset-use-kvzalloc-for-regset_get_alloc.patch
queue-6.6/pci-epf-mhi-return-0-not-remaining-timeout-when-edma-ops-complete.patch
queue-6.6/spi-meson-spicc-fix-double-put-in-remove-path.patch
queue-6.6/net-fix-icmp-host-relookup-triggering-ip_rt_bug.patch
queue-6.6/alsa-aoa-use-guard-for-mutex-locks.patch
queue-6.6/udf-fix-partition-descriptor-append-bookkeeping.patch
queue-6.6/lib-test_hmm-evict-device-pages-on-file-close-to-avoid-use-after-free.patch
queue-6.6/kvm-x86-fix-shadow-paging-use-after-free-due-to-unex.patch
queue-6.6/bpf-preserve-stack_zero-slots-on-partial-reg-spills.patch
queue-6.6/driver-core-don-t-let-a-device-probe-until-it-s-read.patch
queue-6.6/hfsplus-fix-uninit-value-by-validating-catalog-record-size.patch
queue-6.6/selftests-bpf-validate-zero-preservation-for-sub-slo.patch
queue-6.6/bpf-preserve-constant-zero-when-doing-partial-regist.patch
queue-6.6/smb-move-some-duplicate-definitions-to-common-smbacl.h.patch
queue-6.6/alsa-aoa-i2sbus-clear-stale-prepared-state.patch
queue-6.6/padata-fix-pd-uaf-once-and-for-all.patch
queue-6.6/drm-amdgpu-limit-bo-list-entry-count-to-prevent-reso.patch
queue-6.6/net-mctp-fix-don-t-require-received-header-reserved-bits-to-be-zero.patch
queue-6.6/media-rc-ttusbir-respect-dma-coherency-rules.patch
queue-6.6/f2fs-fix-to-do-sanity-check-on-dcc-discard_cmd_cnt-conditionally.patch
queue-6.6/hfsplus-fix-held-lock-freed-on-hfsplus_fill_super.patch
queue-6.6/spi-fix-resource-leaks-on-device-setup-failure.patch
queue-6.6/selftests-bpf-add-stack-access-precision-test.patch
queue-6.6/bpf-track-aligned-stack_zero-cases-as-imprecise-spil.patch
queue-6.6/mtd-docg3-fix-use-after-free-in-docg3_release.patch
queue-6.6/smb-client-validate-the-whole-dacl-before-rewriting-it-in-cifsacl.patch
queue-6.6/sched-use-u64-for-bandwidth-ratio-calculations.patch
queue-6.6/flow_dissector-do-not-dissect-pppoe-pfc-frames.patch
queue-6.6/padata-remove-comment-for-reorder_work.patch
queue-6.6/fbdev-defio-disconnect-deferred-i-o-from-the-lifetime-of-struct-fb_info.patch
queue-6.6/dmaengine-idxd-fix-leaking-event-log-memory.patch
queue-6.6/selftests-bpf-validate-stack_zero-is-preserved-on-su.patch
queue-6.6/net-qrtr-ns-limit-the-maximum-number-of-lookups.patch
queue-6.6/iommu-amd-serialize-sequence-allocation-under-concur.patch
queue-6.6/alsa-aoa-skip-devices-with-no-codecs-in-i2sbus_resume.patch
queue-6.6/loongarch-add-spectre-boundry-for-syscall-dispatch-t.patch
queue-6.6/net-bridge-use-a-stable-fdb-dst-snapshot-in-rcu-readers.patch
queue-6.6/x86-shstk-prevent-deadlock-during-shstk-sigreturn.patch
queue-6.6/rdma-mana_ib-disable-rx-steering-on-rss-qp-destroy.patch
queue-6.6/xfs-fix-a-resource-leak-in-xfs_alloc_buftarg.patch
queue-6.6/thermal-core-fix-thermal-zone-governor-cleanup-issues.patch
queue-6.6/drm-amd-display-do-not-skip-unrelated-mode-changes-i.patch
queue-6.6/wifi-mt76-mt792x-fix-mt7925u-usb-wfsys-reset-handling.patch
queue-6.6/net-qrtr-ns-limit-the-maximum-server-registration-per-node.patch
queue-6.6/ext4-validate-p_idx-bounds-in-ext4_ext_correct_index.patch
queue-6.6/bpf-support-non-r10-register-spill-fill-to-from-stac.patch
queue-6.6/rxrpc-fix-potential-uaf-after-skb_unshare-failure.patch
queue-6.6/firmware-google-framebuffer-do-not-unregister-platform-device.patch
queue-6.6/ksmbd-require-minimum-ace-size-in-smb_check_perm_dacl.patch
queue-6.6/media-rc-igorplugusb-heed-coherency-rules.patch

