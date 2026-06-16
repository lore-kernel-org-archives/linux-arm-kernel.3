Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A18CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 05:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/Wp3c3zu44W0F7nk0G2RdTDz4t3tavk25CHmT3N+kzc=; b=kAGMPHqhUGyI28T+qnfIQ0PJsr
	MDY+UOGdCGMPV4hm67HutkPElRGSw+X+IVcVwES41LRce316yZn1eH4bia1xnG58yBhHpn+7DwHsM
	MCP8wWAIRgO/C6JsxeqXdpGrkDYx8IorIgNHIZhb1PfYVmHxPw7uVyoTwKAkGdP7Uot8neH9AKQfa
	VmXiT2z6MOQjBLdBqrqdi4yOVnot3YJRaQa5yUxb3XfhsVYjRqukTFJOFRA300bMKYZvW1oFQ0tN+
	QCH80mQzwdIrgugenLHWRFs61Nu468Zuz9Y5JsUdPQ+fjQYfZXAA3ayxv85JrBS98Bh3jWiSbHV44
	sWWcUglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMBN-0000000FEtf-3O5U;
	Tue, 16 Jun 2026 05:17:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMBM-0000000FEtX-1SZi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 05:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24386600AB;
	Tue, 16 Jun 2026 05:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8CF1F000E9;
	Tue, 16 Jun 2026 05:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781587070;
	bh=/Wp3c3zu44W0F7nk0G2RdTDz4t3tavk25CHmT3N+kzc=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=U/rn3j+6dHTOtUcXal5TpFZPdex28dQmkL3NeJRPI5QS+ldW/93baocXAut42PYRh
	 O8p8WnKgNWGOx7hENLYkbwsLixuLN1WzbBVAfIjzYoRARV0cbI06YSz30sXdf+zBdD
	 oY23TdU7vR1LXN7dDEBqLofnHkhDGqX1pfDzyuoQ=
Subject: Patch "arm64/mm: Enable batched TLB flush in unmap_hotplug_range()" has been added to the 6.1-stable tree
To: anshuman.khandual@arm.com,catalin.marinas@arm.com,david@kernel.org,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,ryan.roberts@arm.com,sashal@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 10:46:28 +0530
In-Reply-To: <20260428181949.3127002-1-sashal@kernel.org>
Message-ID: <2026061628-finalist-aftermost-6d3b@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-241756-greg=kroah.com@vger.kernel.org Tue Apr 28 23:49:57 2026
From: Sasha Levin <sashal@kernel.org>
Date: Tue, 28 Apr 2026 14:19:49 -0400
Subject: arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
To: stable@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <20260428181949.3127002-1-sashal@kernel.org>

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
@@ -925,10 +925,14 @@ static void unmap_hotplug_pte_range(pmd_
 
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
 
@@ -949,15 +953,14 @@ static void unmap_hotplug_pmd_range(pud_
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
@@ -982,15 +985,12 @@ static void unmap_hotplug_pud_range(p4d_
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
@@ -1020,6 +1020,7 @@ static void unmap_hotplug_p4d_range(pgd_
 static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 				bool free_mapped, struct vmem_altmap *altmap)
 {
+	unsigned long start = addr;
 	unsigned long next;
 	pgd_t *pgdp, pgd;
 
@@ -1041,6 +1042,9 @@ static void unmap_hotplug_range(unsigned
 		WARN_ON(!pgd_present(pgd));
 		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
+
+	if (!free_mapped)
+		flush_tlb_kernel_range(start, end);
 }
 
 static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-6.1/f2fs-use-kfree-instead-of-kvfree-to-free-some-memory.patch
queue-6.1/hwmon-pmbus-adm1266-serialize-gpio-pmbus-accesses-wi.patch
queue-6.1/bonding-refuse-to-enslave-can-devices.patch
queue-6.1/asoc-intel-bytcht_es8316-fix-mclk-leak-on-init-error.patch
queue-6.1/asoc-codecs-simple-mux-fix-enum-control-bounds-check.patch
queue-6.1/selftests-bpf-add-read_build_id-function.patch
queue-6.1/smb-client-validate-the-whole-dacl-before-rewriting-it-in-cifsacl.patch
queue-6.1/rdma-rxe-complete-the-rxe_cleanup_task-backport.patch
queue-6.1/bluetooth-l2cap-fix-possible-crash-on-l2cap_ecred_co.patch
queue-6.1/ipv6-sit-reload-inner-ipv6-header-after-gso-offloads.patch
queue-6.1/ethtool-eeprom-add-more-safeties-to-eeprom-netlink-f.patch
queue-6.1/vxlan-vnifilter-fix-spurious-notification-on-vni-upd.patch
queue-6.1/6lowpan-fix-off-by-one-in-multicast-context-address-.patch
queue-6.1/sctp-fix-race-between-sctp_wait_for_connect-and-peel.patch
queue-6.1/pcnet32-stop-holding-device-spin-lock-during-napi_co.patch
queue-6.1/drm-vc4-fix-krealloc-memory-leak.patch
queue-6.1/f2fs-fix-to-do-sanity-check-on-dcc-discard_cmd_cnt-conditionally.patch
queue-6.1/arm64-tlb-optimize-arm64_workaround_repeat_tlbi.patch
queue-6.1/nfc-llcp-fix-use-after-free-race-in-nfc_llcp_recv_cc.patch
queue-6.1/revert-selftests-bpf-workaround-strict-bpf_lsm-retur.patch
queue-6.1/net-netlink-fix-sending-unassigned-nsid-after-assign.patch
queue-6.1/bluetooth-bnep-reject-short-frames-before-parsing.patch
queue-6.1/net-packet-convert-po-has_vnet_hdr-to-an-atomic-flag.patch
queue-6.1/net-qrtr-ns-free-the-node-during-ctrl_cmd_bye.patch
queue-6.1/dm-cache-policy-smq-check-allocation-under-invalidat.patch
queue-6.1/ipmi-fix-rcu_read_unlock-to-srcu_read_unlock-in-hand.patch
queue-6.1/drm-i915-psr-read-intel-dpcd-workaround-register.patch
queue-6.1/net-fec-fix-pinctrl-default-state-restore-order-on-r.patch
queue-6.1/ipv6-rpl-fix-hdrlen-overflow-in-ipv6_rpl_srh_decompr.patch
queue-6.1/net-gro-don-t-merge-zcopy-skbs.patch
queue-6.1/ieee802154-6lowpan-only-accept-ipv6-packets-in-lowpa.patch
queue-6.1/tun-free-page-on-short-frame-rejection-in-tun_xdp_on.patch
queue-6.1/usb-serial-mct_u232-fix-memory-corruption-with-small.patch
queue-6.1/bluetooth-bnep-fix-incorrect-length-parsing-in-bnep_.patch
queue-6.1/signal-clear-jobctl_pending_mask-for-caller-in-zap_o.patch
queue-6.1/loongarch-add-spectre-boundry-for-syscall-dispatch-table.patch
queue-6.1/alsa-aoa-i2sbus-clear-stale-prepared-state.patch
queue-6.1/sched-use-u64-for-bandwidth-ratio-calculations.patch
queue-6.1/revert-rdma-rxe-fix-double-free-in-rxe_srq_from_init.patch
queue-6.1/net-qrtr-fix-refcount-saturation-and-potential-uaf-i.patch
queue-6.1/media-rc-igorplugusb-heed-coherency-rules.patch
queue-6.1/bpf-free-reuseport-cbpf-prog-after-rcu-grace-period.patch
queue-6.1/net-qrtr-ns-change-servers-radix-tree-to-xarray.patch
queue-6.1/net-mctp-ensure-our-nlmsg-responses-are-initialised.patch
queue-6.1/media-rc-ttusbir-respect-dma-coherency-rules.patch
queue-6.1/batman-adv-tt-fix-toctou-race-for-reported-vlans.patch
queue-6.1/ptp-vclock-switch-from-rcu-to-srcu.patch
queue-6.1/time-fix-off-by-one-in-settimeofday-usec-validation.patch
queue-6.1/usb-serial-cypress_m8-fix-memory-corruption-with-sma.patch
queue-6.1/xfrm-policy-fix-use-after-free-on-inexact-bin-in-xfr.patch
queue-6.1/tools-bootconfig-cleanup-bootconfig-footer-size-calc.patch
queue-6.1/netlabel-validate-unlabeled-address-and-mask-attribu.patch
queue-6.1/batman-adv-tt-avoid-empty-vlan-responses.patch
queue-6.1/net-hsr-fix-potential-oob-access-in-supervision-fram.patch
queue-6.1/drm-remove-plane-hsub-vsub-alignment-requirement-for.patch
queue-6.1/net-qrtr-ns-limit-the-total-number-of-nodes.patch
queue-6.1/selftests-bpf-convert-test_global_funcs-test-to-test.patch
queue-6.1/serial-dz-fix-bootconsole-handover-lockup.patch
queue-6.1/net-sched-revert-net-sched-restrict-conditions-for-a.patch
queue-6.1/net-packet-convert-po-tp_loss-to-an-atomic-flag.patch
queue-6.1/mm-hugetlb-avoid-false-positive-lockdep-assertion.patch
queue-6.1/drm-i915-psr-add-defininitions-for-intel_wa_register.patch
queue-6.1/revert-selftests-bpf-add-a-cgroup-prog-bpf_get_ns_cu.patch
queue-6.1/net-mvpp2-limit-xdp-frame-size-to-the-rx-buffer.patch
queue-6.1/bpf-fix-a-few-selftest-failures-due-to-llvm18-change.patch
queue-6.1/vxlan-do-not-reuse-cached-ip_hdr-value-after-skb_tun.patch
queue-6.1/net-guard-timestamp-cmsgs-to-real-error-queue-skbs.patch
queue-6.1/batman-adv-tvlv-reject-oversized-tvlv-packets.patch
queue-6.1/r8152-block-future-register-access-if-register-acces.patch
queue-6.1/net-mvpp2-add-metadata-support-for-xdp-mode.patch
queue-6.1/net-packet-convert-po-tp_tx_has_off-to-an-atomic-fla.patch
queue-6.1/net-mctp-fix-don-t-require-received-header-reserved-bits-to-be-zero.patch
queue-6.1/xfrm-check-for-underflow-in-xfrm_state_mtu.patch
queue-6.1/netfilter-nf_conntrack-destroy-stale-expectfn-expect.patch
queue-6.1/net-garp-fix-unsigned-integer-underflow-in-garp_pdu_.patch
queue-6.1/selftests-bpf-s-iptables-iptables-legacy-in-the-bpf_.patch
queue-6.1/revert-selftests-bpf-add-tests-for-_opts-variants-of.patch
queue-6.1/hid-core-fix-size_t-specifier-in-hid_report_raw_even.patch
queue-6.1/rds-mark-snapshot-pages-dirty-in-rds_info_getsockopt.patch
queue-6.1/net-sched-act_api-use-rcu-with-deferred-freeing-for-.patch
queue-6.1/bluetooth-6lowpan-check-skb_clone-return-value-in-se.patch
queue-6.1/batman-adv-v-stop-ogmv2-on-disabled-interface.patch
queue-6.1/net-openvswitch-fix-possible-kfree_skb-of-err_ptr.patch
queue-6.1/hwmon-pmbus-adm1266-serialize-sequencer_state-debugf.patch
queue-6.1/fbdev-defio-disconnect-deferred-i-o-from-the-lifetime-of-struct-fb_info.patch
queue-6.1/bluetooth-mgmt-fix-backward-compatibility-with-users.patch
queue-6.1/ip6_vti-fix-incorrect-tunnel-matching-in-vti6_tnl_lo.patch
queue-6.1/gpio-rockchip-convert-bank-clk-to-devm_clk_get_enabl.patch
queue-6.1/selftests-bpf-enhance-align-selftest-s-expected-log-.patch
queue-6.1/netfilter-ctnetlink-ensure-safe-access-to-master-con.patch
queue-6.1/rdma-rxe-fix-double-free-in-rxe_srq_from_init.patch-25226
queue-6.1/hid-pass-the-buffer-size-to-hid_report_raw_event.patch
queue-6.1/alsa-aoa-skip-devices-with-no-codecs-in-i2sbus_resume.patch
queue-6.1/batman-adv-bla-avoid-null-ptr-deref-for-claim-via-dr.patch
queue-6.1/usb-serial-digi_acceleport-fix-memory-corruption-wit.patch
queue-6.1/tools-bootconfig-fix-buf-leaks-in-apply_xbc.patch
queue-6.1/bluetooth-rfcomm-hold-listener-socket-in-rfcomm_conn.patch
queue-6.1/wifi-mwifiex-fix-use-after-free-in-mwifiex_adapter_cleanup.patch
queue-6.1/batman-adv-iv-recover-ogm-scheduling-after-forward-p.patch
queue-6.1/net-sched-cls_fw-fix-null-dereference-of-old-filters.patch
queue-6.1/net-netlink-don-t-set-nsid-on-local-notifications.patch
queue-6.1/tcp-restrict-so_attach_filter-to-priv-users.patch
queue-6.1/batman-adv-tp_meter-directly-shut-down-timer-on-clea.patch
queue-6.1/netfilter-nf_log-validate-mac-header-was-set-before-.patch
queue-6.1/mm-page_alloc-clear-page-private-in-free_pages_prepa.patch
queue-6.1/octeontx2-af-npc-fix-cpt-channel-mask-in-npc_install.patch
queue-6.1/net-smc-do-not-re-initialize-smc-hashtables.patch
queue-6.1/ipvs-clear-the-svc-scheduler-ptr-early-on-edit.patch
queue-6.1/bluetooth-l2cap-clear-chan-ident-on-ecred-reconfigur.patch
queue-6.1/bpf-bonding-reject-vlan-srcmac-xmit_hash_policy-chan.patch
queue-6.1/tunnels-do-not-assume-transport-header-in-iptunnel_p.patch
queue-6.1/iomap-don-t-revert-iov_iter-on-partially-completed-b.patch
queue-6.1/phy-mscc-use-phy_id_match_vendor-to-minimize-phy-id-.patch
queue-6.1/net-802-mrp-fix-vector-attribute-parsing-in-mrp_pdu_.patch
queue-6.1/batman-adv-bla-avoid-double-decrement-of-bla.num_req.patch
queue-6.1/batman-adv-tvlv-abort-ogm-send-on-tvlv-append-failur.patch
queue-6.1/lib-test_hmm-evict-device-pages-on-file-close-to-avoid-use-after-free.patch
queue-6.1/alsa-pcm-fix-wait-queue-list-corruption-in-snd_pcm_d.patch
queue-6.1/net-mvpp2-refill-rx-buffers-before-xdp-or-skb-use.patch
queue-6.1/tun-free-page-on-build_skb-failure-in-tun_xdp_one.patch
queue-6.1/selftests-bpf-fix-arg_ptr_to_long-half-uninitialized.patch
queue-6.1/net-mvpp2-build-skb-from-xdp-adjusted-data-on-xdp_pa.patch
queue-6.1/selftests-bpf-add-generic-bpf-program-tester-loader.patch
queue-6.1/bluetooth-fix-memory-leak-in-error-path-of-hci_alloc.patch
queue-6.1/hid-core-add-printk_ratelimited-variants-to-hid_warn.patch
queue-6.1/bluetooth-mgmt-validate-advertising-tlv-before-type-.patch
queue-6.1/mm-damon-ops-common-call-folio_test_lru-after-folio_.patch
queue-6.1/netfilter-synproxy-add-mutex-to-guard-hook-reference.patch
queue-6.1/asoc-wm_adsp-fix-null-dereference-when-removing-firm.patch
queue-6.1/net-skbuff-fix-missing-zerocopy-reference-in-pskb_ca.patch
queue-6.1/drm-dp-add-edp-1.5-bit-definition.patch
queue-6.1/dmaengine-idxd-fix-not-releasing-workqueue-on-.relea.patch
queue-6.1/ipv6-fix-possible-infinite-loop-in-rt6_fill_node.patch
queue-6.1/tee-optee-prevent-use-after-free-when-the-client-exi.patch
queue-6.1/disable-wattribute-alias-for-clang-23-and-newer.patch
queue-6.1/vxlan-vnifilter-send-notification-on-vni-add.patch
queue-6.1/usb-gadget-f_ncm-fix-net_device-lifecycle-with-devic.patch
queue-6.1/selftests-bpf-update-bpf_clone_redirect-expected-ret.patch
queue-6.1/net-skbuff-fix-pskb_carve-leaking-zcopy-pages.patch
queue-6.1/net-qrtr-ns-limit-the-maximum-number-of-lookups.patch
queue-6.1/net-sched-sch_sfb-replace-direct-dequeue-call-with-p.patch
queue-6.1/netfilter-x_tables-avoid-leaking-percpu-counter-poin.patch
queue-6.1/tunnels-load-network-headers-after-skb_cow-in-iptunn.patch
queue-6.1/spi-imx-fix-use-after-free-on-unbind.patch
queue-6.1/netfilter-synproxy-refresh-tcphdr-after-skb_ensure_w.patch
queue-6.1/arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
queue-6.1/netfilter-nf_tables-restore-set-elements-when-delete.patch
queue-6.1/alsa-aoa-use-guard-for-mutex-locks.patch
queue-6.1/mm-huge_memory-update-file-pmd-counter-before-folio_.patch
queue-6.1/spi-fix-resource-leaks-on-device-setup-failure.patch
queue-6.1/kvm-arm64-remove-vpipt-i-cache-handling.patch
queue-6.1/xhci-tegra-fix-ghost-usb-device-on-dual-role-port-un.patch
queue-6.1/net-mana-add-null-guards-in-teardown-path-to-prevent.patch
queue-6.1/netfilter-nft_exthdr-fix-register-tracking-for-f_pre.patch
queue-6.1/net-packet-fix-toctou-race-on-mmap-d-vnet_hdr-in-tpa.patch
queue-6.1/net-cpsw_new-fix-potential-unregister-of-netdev-that.patch
queue-6.1/drm-i915-psr-apply-intel-dpcd-workaround-when-sdp-on.patch
queue-6.1/net-iucv-fix-locking-in-.getsockopt.patch
queue-6.1/sctp-purge-outqueue-on-stale-cookie-echo-handling.patch
queue-6.1/ipv4-restrict-ipopt_ssrr-and-ipopt_lsrr-options.patch
queue-6.1/netfilter-xt_cpu-prefer-raw_smp_processor_id.patch
queue-6.1/batman-adv-tt-reject-oversized-local-tvlv-buffers.patch
queue-6.1/net-annotate-sk-sk_write_space-for-udp-sockmap.patch
queue-6.1/r8152-handle-the-return-value-of-usb_reset_device.patch
queue-6.1/hwmon-pmbus-adm1266-serialize-nvmem-blackbox-read-wi.patch
queue-6.1/netfilter-ebtables-fix-oob-read-in-compat_mtw_from_u.patch
queue-6.1/r8152-reduce-the-control-transfer-of-rtl8152_get_ver.patch
queue-6.1/net-packet-convert-po-running-to-an-atomic-flag.patch
queue-6.1/tap-free-page-on-error-paths-in-tap_get_user_xdp.patch
queue-6.1/nfc-nxp-nci-i2c-use-rising-edge-irq-on-acpi-systems.patch
queue-6.1/bluetooth-rfcomm-validate-skb-length-in-mcc-handlers.patch
queue-6.1/net-bridge-use-a-stable-fdb-dst-snapshot-in-rcu-readers.patch
queue-6.1/fs-ntfs3-return-error-for-inconsistent-extended-attr.patch
queue-6.1/f2fs-fix-uaf-caused-by-decrementing-sbi-nr_pages-in-f2fs_write_end_io.patch
queue-6.1/thermal-core-fix-thermal-zone-governor-cleanup-issues.patch
queue-6.1/net-lan743x-permit-vlan-tagged-packets-up-to-configu.patch
queue-6.1/drm-imx-fix-three-kernel-doc-warnings-in-dcss-scaler.patch
queue-6.1/spi-imx-convert-to-platform-remove-callback-returning-void.patch
queue-6.1/net-mlx4-avoid-gcc-10-__bad_copy_from-false-positive.patch
queue-6.1/ipv6-fix-possible-infinite-loop-in-fib6_select_path.patch
queue-6.1/netfilter-bridge-make-ebt_snat-arp-rewrite-writable.patch
queue-6.1/nfc-llcp-fix-use-after-free-in-llcp_sock_release.patch
queue-6.1/selftests-forwarding-lib-add-helpers-for-checksum-ha.patch
queue-6.1/ksmbd-require-minimum-ace-size-in-smb_check_perm_dacl.patch
queue-6.1/netfilter-conntrack_irc-fix-possible-out-of-bounds-r.patch
queue-6.1/netfilter-xt_nfqueue-prefer-raw_smp_processor_id.patch
queue-6.1/phy-mscc-use-phy_id_match_exact-for-vsc8584-vsc8582-.patch
queue-6.1/usb-gadget-u_ether-fix-null-pointer-deref-in-eth_get.patch
queue-6.1/net-rds-fix-null-deref-in-rds_ib_send_cqe_handler-on.patch
queue-6.1/sctp-fix-uninit-value-in-__sctp_rcv_asconf_lookup.patch
queue-6.1/ipv4-free-net-ipv4.sysctl_local_reserved_ports-after.patch
queue-6.1/net-mvpp2-sync-rx-data-at-the-hardware-packet-offset.patch
queue-6.1/arm64-tlb-allow-xzr-argument-to-tlbi-ops.patch

