Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F21606A6C0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xoSYou6q;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFEiRR+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V4Id/aV3qkYtLSE7eXDy6LZshkWcet17PGfUIiAdWVA=; b=xoSYou6qBTXV4rc2dRQ0M7W0BW
	TuQUXMW/nC30brR98P+3IUiIBJu7NocEWQjIb3XVXKXE0BqJikoaLHdrYRxHNqHhU8n4DyxyNU5bF
	jg8hHwsz+FJAQpofK9SwJF7XyIskDwoeva9lnS0RoXhuvA2tz/IPLNhe8tT3FrVAYodHxB+V/+2RC
	WsNXDuURkglodlzDYskbMAMu1tNeSeT0Fi84WzVwVMj2lAGeuuvZkduahSzURXqRbAKLG1D5QT1/Q
	yR7tDmeQXn79MIvuZxrnCig7iW+AmNIhh+PCqGRaDzwsTqI8XPuKWLM1Kw/Y2MoufXTYR2WIHgSrs
	PhjAU8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Om-0000000AP3B-0wgO;
	Thu, 05 Nov 2026 19:45:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Ok-0000000AP1T-1fjQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:45:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1491B4363F;
	Thu,  5 Nov 2026 19:45:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793907922;
	b=oJsKdBOLlqtr0uJqN/3jOX+RZHDhimRTa7x9Ee28fwGi90sVn3XUmmbSZ77f6qz0kfXF
	 cXPq3AYNwcYfdl3uG029d0UzFYcnkeiKvDP746O8DHEX9q+IDA55p+ugvpedAJj5P+Y6Q
	 LCMguO907Hobqv1u1lPbXTCedUPfNu6Ioe2A+F2HDKRr5Ap/wMLUp4PLMlji9hQdtl6GK
	 qkD2VkByVr//MkpEX7M/oRZiN/KkH1TY2NmOCTT8hNkHL9hYdO301d9Z662ugU1qSjlwg
	 lSh979fePY5BiGW4PNM4TxL53MR01nnb3TusAwTMtjhMzWzFe+L8y7Vx46CMqJ/jEiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793907922;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V4Id/aV3qkYtLSE7eXDy6LZshkWcet17PGfUIiAdWVA=;
	b=Yeo5N2+3uzbKb3TKSoZMUgBvbz437NtgCA0GCIofdgLcTpAWNY4XIv2wFxvssV4F2Hea
	 LFaefNy08RO8mbjJ7LDbeu7VsMk97rTU3UzwVbq12+gnXr6zvUh6J98vfNIMTT4u07l4Y
	 7D87dVmsXNJ0YdkK062Y/jOozxFOGYcXB+Gsu8wBne0aIB6Ji+5LmHamY5mKRr3mUmG+N
	 pXGClRRuEshkW2X3WUlHSDM3AhSNGc6MnpjPybPzXtyClsRsVa0BjJ225nZnbnNz/++5d
	 DfJ6cdQcYlGl355UgPmek53KfivaZGwZbevPwPErtIRzJHTqE9LGYNOJXrJd75gSh0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 628AD1F0089F;
	Thu,  5 Nov 2026 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907921;
	bh=V4Id/aV3qkYtLSE7eXDy6LZshkWcet17PGfUIiAdWVA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PFEiRR+6lronJVEfBnil5zQpbsWLvbdI4V0ssFjuFVpYgwHYGn0Bva409dI13P/hw
	 g34MJSesHu7f+hTf+KmVz3njNPbxfhUZkcsExMa5vJ4Y48/qtzBc1He7WKQkRy2ZQy
	 45FUTe8CeaQj6mZqoH/fl70Nlgzsty9y+kJ/HL3HONpvv58SMxs68hF444F9SnIiuV
	 ogK/JSY0LfsSczA66tc/KxJZeZeDYiCH5vXLfeBj5ZCbHUUOKYzgvFJK9WmsGohaI/
	 QtVSEyHiyYsQxdcZHf31l7HvZ69MZfr7IMelHzEkbe8LEn6Y0Bo7/hfLfZF2KNaDzP
	 YF6TrE9Nt6x/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BA6D740367;
	Thu,  5 Nov 2026 19:45:20 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Date: Thu, 05 Nov 2026 19:45:21 +0000
Subject: [PATCH] KVM: arm64: Order a later pinner's accesses after the hyp
 mapping
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-pin-barrier-v1-1-04ebf118175a@cs.columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNT3YLMPN2kxCKgpiJdU4s0I2Mjy2RLQwsjJaCOgqLUtMwKsGnRsbW
 1AHAag7RdAAAA
X-Change-ID: 20261105-pin-barrier-58f2329c9182
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793907920; l=4979;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=VSD4GLblhd6azQKpEOEzqUEqojO3itNwjO/sVgeUiIo=;
 b=QTSVYgfFMuRB8xUVfGJEOEYn5PHpxm7RURrEUKvrivYUBnG4i8kkVU4ZFZfpoibktyqcqFCLM
 redV+d6YhMKClxjlcRUrICmxiCS1kKQL1FJrXBMRBJVHHUy8JOYyWfy
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

Since commit 48d848882395 ("KVM: arm64: Defer EL2 stage-1 mapping on
share"), hyp_pin_shared_mem() maps a shared page into the hypervisor's
stage-1 only when its refcount goes from 0 to 1.  The CPU that maps it
runs dsb(ishst); isb() in kvm_pgtable_hyp_map(), which orders that CPU's
own accesses.  A CPU that pins the page later sees refcount >= 1, maps
nothing and runs no barrier.  It then accesses the page through an
address it computed before taking the locks, so nothing orders its
translation after the other CPU's PTE write.  The access can use a
translation performed while the entry was still invalid, and fault.

A host can do this with any pinning hypercall by passing the same page
from two CPUs, for example __pkvm_init_vm() with the same struct kvm:

  CPU A                                CPU B
  -----                                -----
                                       host_kvm = kern_hyp_va_host(x1)
                                       (host_kvm may be translated now,
                                        while its entry is invalid)
  __pkvm_init_vm(host_kvm)
   hyp_pin_shared_mem()
    host/hyp locks
    refcount 0 -> 1
    pkvm_create_mappings_locked()
     kvm_pgtable_hyp_map()
      write the valid PTE
      dsb(ishst); isb()   <- CPU A only
    unlock
                                       __pkvm_init_vm(host_kvm)
                                        hyp_pin_shared_mem()
                                         host/hyp locks
                                         refcount 1 -> 2: no mapping,
                                         no barrier
                                         unlock
                                        READ_ONCE(host_kvm->created_vcpus)
                                         uses the old translation:
                                         translation fault -> hyp_panic()

The lock hand-off orders CPU B's loads and stores after CPU A's PTE
write, but not its translation table walks.  Arm's herd7 model with
-variant vmsa allows the fault for this shape: a mapping made and
completed with DSB; ISB on one CPU, handed over through a
release/acquire, then used on another CPU through an address it already
held.  It forbids the fault once the second CPU runs DSB; ISB after the
acquire.

Make every successful pin end with dsb(ish); isb(), so that the pinning
CPU's later accesses through the range are ordered after the mapping,
whichever pin installed it.

Fixes: 48d848882395 ("KVM: arm64: Defer EL2 stage-1 mapping on share")
Cc: stable@vger.kernel.org
Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
---
The fault was found with herd7 (herdtools7 7.58+1) and Arm's AArch64
model with -variant vmsa,fatal.  The test reduces the host/hyp locks to
an acquire of CPU A's release and the pin to its refcount check:

AArch64 pin-maps-nothing
{
pte_x=(valid:0);
0:X2=pte_x; 0:X1=(oa:phy_y);
y=1;
pte_z=(af:1,db:1); pte_r=(af:1,db:1);
0:X8=z; 1:X8=z;
0:X9=r; 1:X9=r;
1:X3=x;
}
 P0               | P1                ;
 MOV W5,#1        | LDAR W7,[X8]      ;
 STR W5,[X9]      | LDR W5,[X9]       ;
 STLR X1,[X2]     | ADD W5,W5,#1      ;
 DSB ISHST        | STR W5,[X9]       ;
 ISB              | CMP W5,#1         ;
 MOV W7,#1        | B.EQ LMAP         ;
 STLR W7,[X8]     | MOV W6,#2         ;
                  | STLR W6,[X8]      ;
                  | L0: LDR W4,[X3]   ;
                  | LMAP:             ;
exists (1:X7=1 /\ 1:X5=2 /\ fault(P1:L0,x))

P0 is the pin that maps x (refcount 0 -> 1, PTE store, dsb(ishst);
isb(), unlock).  P1 takes the lock after P0's unlock, sees refcount 2,
maps nothing, and then loads through the address it already held in X3.

  $ herd7 -variant vmsa,fatal pin-maps-nothing.litmus
  ...
  1:X5=2; 1:X7=1; Fault(P1:L0,x,D-MMU:Translation);
  ...
  Observation pin-maps-nothing Sometimes 1 7

With DSB ISH; ISB on P1 after its acquire and before L0, as this patch
adds, the result is Never (0 6).  It is also Never with
-variant vmsa,fatal,ets2, i.e. on CPUs with FEAT_ETS2.
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d4c332a91..5cb1a1e1f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1210,6 +1210,14 @@ int hyp_pin_shared_mem(void *from, void *to)
 							    PAGE_HYP));
 	}
 
+	/*
+	 * Only the first pin of a page maps it, and that CPU's barriers order
+	 * only its own accesses. Order this CPU's accesses through the range
+	 * after the mapping, whichever pin made it.
+	 */
+	dsb(ish);
+	isb();
+
 unlock:
 	hyp_unlock_component();
 	host_unlock_component();

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-pin-barrier-58f2329c9182

Best regards,
-- 
Xuheng Li <xuheng@cs.columbia.edu>



