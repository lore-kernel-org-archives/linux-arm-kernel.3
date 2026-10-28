Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21716606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 23:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N/dzQHj0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=es5pmGVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=x9PhEZroZ7s6qQbU4UDDHXsyI0SUTC2fQaTTCcL595k=; b=N/dzQHj0Q3rloQFxI0d2pb22wa
	C+f7Et60Tu2NWfrakb92F+1gG+13eGNmYkcjgZIuiuDi2XsplcD8oj1kwoTVGC692bjdeG/a/scrw
	3aEDnQ3Mynlx+L9ub2oMCV47XguZGwKK0qoS+55VxZaldPA6qALmnNlON4klLncX++0uRzVS9VtS6
	fpQd7YqOo73bu8rZlyT9hdiiNRZQZSztw65+egHJpEhpbbL1JlIIm2in69P/9SWflxsDydNJJxllB
	eRgBP11CyGaE+I/xPsAu4dNPF2pHzVStURCum0w9Uqgp41z9uxZCEI2+ACdGOJlu5WdOKHPuKxEhs
	DWGg9Amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCet-0000000836I-2uWD;
	Wed, 28 Oct 2026 23:02:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCer-0000000836B-2spN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 23:02:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AD99600DA;
	Wed, 28 Oct 2026 23:02:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793228532;
	b=zK1yFaOEcGOG+TVK2haXDS8YcMRvOoJx5yo1ua6/Aio1f19k07grIJfnciPE3PXZPfte
	 GEU/TIYo9H7/WqCY+PBZFErugA3Cvow/m1MQ8ozfxlLa76ZrkMH8wsS/puzkrSB81eaVP
	 mIA9lkrN7nV5HwsehuDZ0lO0HJhHhz1Tutql77p6l8QD3q+3s8tFDXCYzWKBfC60CYBLC
	 jRuDfJkzcvkuwV8Pe0bz1oFRojf5LLKcPWjjRwLo/matbtXkzfv7E/gTSOnQfgopqRx3k
	 WoNV29wH4XDpQXXNNTQFghMfO4mzLWkkBApYcfK+4bB3lgip5Ym/WSlEvW7r5556DLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793228532;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=x9PhEZroZ7s6qQbU4UDDHXsyI0SUTC2fQaTTCcL595k=;
	b=hPXSRThHkVxc4S4bEhl+ByRLDvazCyHyJqKQKC7H7CmfEcYpDPkxz4/3T1iC/W7V93ac
	 OrJWCslyHWk2+rb2E4/6QXyMfFzN/k/GvCiNBiczIXdq9wgrnN+/Ie1Kdt/tknTOtGfp5
	 +UHTD62m0uSnyhp23COqlXRuYd/tikQOIEKtVGZytbeMErPnD5235ec5x5JrSHGo+uNW4
	 SGAZTe7s7hJVE+6y1eU6QjD/prTnLCUV6CRdxK1M+lASjWsGvke2pzaQIilYqeeDPok/h
	 0Jb/GA6zMGnnInniwGFEDoEVoAy1ZUeJNTw9J8w9K/2gGrN6aT8MihyJlBq/J+9deSw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 921DA1F01825;
	Wed, 28 Oct 2026 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793228532;
	bh=x9PhEZroZ7s6qQbU4UDDHXsyI0SUTC2fQaTTCcL595k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=es5pmGVO9hlHoqYn5bFIApN86T0Bva+Y7j2gwnn0UWcgX83OvLNkkzFfmgctWW+UC
	 EiI0TazmpyLHaU7M5T7IONhoEekLNIiq5WYwIt4nb+35jAYiik6VcQWFgpHAwRfTyt
	 Fp2AegJIupTduKFBLbrFg2qQHQfwkKzAm7q9lUMioGikrnipE36M0Bj6xk8F2B5c1c
	 GsAGo0ei5z7azfTT2wOyE41PeH6ApcMzbHibXT/81MRDohleDF2Jr2X/gA2pUg3PO7
	 dsJZFFQX76x3QvpBoBFc7mnnkKL/OLj90vp3c8F9j/wWPodT0jWVyLEU2tehfle82G
	 wz3gEbxW2vrxw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E4866455F9;
	Wed, 28 Oct 2026 23:02:10 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Date: Wed, 28 Oct 2026 23:02:10 +0000
Subject: [PATCH] KVM: arm64: Add an ISB after mapping a hyp fixmap slot
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261028-fixmap-isb-v1-1-6c9f0f9cb810@cs.columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3bTMitzEAt3M4iTd5GTLFHMz01Rj86RkJaCGgqJUoCzYsOjY2lo
 AeJvqclwAAAA=
X-Change-ID: 20261028-fixmap-isb-cc9d765e37bc
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Xuheng Li <xuheng@cs.columbia.edu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793228530; l=1807;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=MRI3I7XYX2g8m/5nRZspzMo8wXyH7lpxeGQhbbi2qGg=;
 b=QsMY43bA+fBdaVPVPnbfW9T26X1m6bDnOE7uREQ34isPF0d5YMF7mQSstVSg6VOotubIGaW9A
 r5yGUIqIiLpB2fu5VZSh8xzoazibgmP2GJdt7mXdoCFHaXbfoEdnjGO
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

fixmap_map_slot() installs a valid PTE for the CPU's fixmap slot (or
the fixblock slot) and issues a DSB ISHST before returning the slot's
VA, which the caller then accesses.  It does not issue an ISB.

The DSB guarantees that the PTE write has completed, but without a
context synchronization event the architecture does not guarantee that
a later access on the same CPU uses the new entry: its translation may
have been performed speculatively while the slot was still invalid, in
which case the access takes a translation fault.  At EL2 that fault
ends in hyp_panic().  The clear side, fixmap_clear_slot(), already ends
with an ISB.

A litmus test of the same shape (map the slot, DSB ISHST, load through
it) faulted on a Cortex-A72 in 2 out of 100M runs.  Arm's herd7 model
with -variant vmsa also allows the fault, and forbids it once the ISB
is added.

Add the missing ISB.  This covers both hyp_fixmap_map() and
hyp_fixblock_map(), which share fixmap_map_slot().

Fixes: aa6948f82f0b ("KVM: arm64: Add per-cpu fixmap infrastructure at EL2")
Cc: stable@vger.kernel.org
Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
---
 arch/arm64/kvm/hyp/nvhe/mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index b95d98cfe..83b74c522 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -316,6 +316,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 	pte |= kvm_phys_to_pte(phys) | KVM_PTE_VALID;
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
+	isb();
 
 	return (void *)slot->addr;
 }

---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261028-fixmap-isb-cc9d765e37bc

Best regards,
-- 
Xuheng Li <xuheng@cs.columbia.edu>



