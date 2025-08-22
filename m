Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8A9CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wXnfzHJDqVUfWCBd4/k2UAlJSNWQR5wSsV5pY0oo2n4=; b=dQqAE7S+tHWOHzThMWCywaE6R4
	ZGQRP04ce+qPbYNPAlb7LFRVAgACciZdGt7Cl+0jzZfOUDbZa+39yshCh8rtjcgSm4EtwkeFF0ngI
	/pWGgsLYSLav50r9SUtoJFkoaOo1XGkW8WrS0zh2nHeU0N8lDqErm4N8JmBWwXVbP+W89Vp1sUoUZ
	zUMNOzk3nVD62V/r5Vr2Wl9Qx1Y3/2CA1KTLJdxiGgqsYsZKCZshh0gMLACLsttQYsnIifc7WFN0u
	1WZwpiwX95FkZ9WVscBepR9Mx3HyTj8/RJ7CeCJJyd5T3WtOjOH1kvtk6rCvNPhski4X7cvSTEU06
	8h5BegRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphmy-000000040l0-02qB;
	Sat, 23 Aug 2025 06:31:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upShw-00000002owX-453U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B24FA5865A;
	Fri, 22 Aug 2025 14:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E9AC4CEED;
	Fri, 22 Aug 2025 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755872732;
	bh=Ce8xVjTX+LdoK8WYSQNLB8XNPREgItbTHqmQpvQAYkc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=BSe20ul57KuSwSNT0pYtd50nT03RRVTm0wI9xPlrL0e2DvOsIRcnTYhSeAKbzxeHw
	 3eU4mf4zV9JDqJeaVQCPbB/q5ILYygixpzH5CPfym+30F5B3z+iiGSN1z6rGhbfvtp
	 OKpNWQfhyskt/XnQDvKU7R3eoSHMcdM+efXn1+HI=
Subject: Patch "KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix" has been added to the 5.15-stable tree
To: ardb@kernel.org,gregkh@linuxfoundation.org,kvmarm@lists.linux.dev,lee@kernel.org,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,maz@kernel.org,sashal@kernel.org,tabba@google.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 22 Aug 2025 16:25:28 +0200
In-Reply-To: <20250822140402.2688-1-will@kernel.org>
Message-ID: <2025082228-camper-turtle-e085@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_072533_144400_A633087A 
X-CRM114-Status: GOOD (  17.16  )
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

    KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-fix-kernel-bug-due-to-bad-backport-of-fpsimd-sve-sme-fix.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From will@kernel.org  Fri Aug 22 16:24:21 2025
From: Will Deacon <will@kernel.org>
Date: Fri, 22 Aug 2025 15:04:02 +0100
Subject: KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix
To: stable@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>, Marc Zyngier <maz@kernel.org>
Message-ID: <20250822140402.2688-1-will@kernel.org>

From: Will Deacon <will@kernel.org>

Upstream commit fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush
host FPSIMD/SVE/SME state") relies on interrupts being disabled during
fpsimd_save_and_flush_cpu_state() so that a softirq cannot be taken
while the host floating point context is being saved and potentially try
to use kernel-mode NEON.

Unfortunately, stable kernels without 9b19700e623f ("arm64: fpsimd: Drop
unneeded 'busy' flag") leave interrupts enabled in
fpsimd_save_and_flush_cpu_state() and so the BUG_ON(!may_use_simd()) in
kernel_neon_begin() has been observed to trigger in real-world usage:

 |  kernel BUG at arch/arm64/kernel/fpsimd.c:1904!
 |  Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
 |
 |  Call trace:
 |   kernel_neon_begin+0xdc/0x12c
 |   ...
 |   crypto_aead_decrypt+0x5c/0x6c
 |   seqiv_aead_decrypt+0x88/0x9c
 |   crypto_aead_decrypt+0x5c/0x6c
 |   esp_input+0x280/0x364
 |   xfrm_input+0x6ac/0x16f8
 |   ...
 |   net_rx_action+0x13c/0x31c
 |   handle_softirqs+0x124/0x3d0
 |   __do_softirq+0x14/0x20
 |   ____do_softirq+0x10/0x20
 |   call_on_irq_stack+0x3c/0x74
 |   do_softirq_own_stack+0x1c/0x2c
 |   __irq_exit_rcu+0x54/0xb4
 |   irq_exit_rcu+0x10/0x1c
 |   el1_interrupt+0x38/0x58
 |   el1h_64_irq_handler+0x18/0x24
 |   el1h_64_irq+0x68/0x6c
 |   fpsimd_save+0xe4/0x130
 |   kvm_arch_vcpu_load_fp+0x2c/0x58
 |   kvm_arch_vcpu_load+0x88/0x26c
 |   kvm_sched_in+0x2c/0x3c

Given that 9b19700e623f ("arm64: fpsimd: Drop unneeded 'busy' flag") is
not a fix in its own right, has non-trivial dependencies and is a
reasonably invasive change to the in-kernel use of fpsimd, opt instead
for a simple fix to use the softirq-safe {get,put}_cpu_fpsimd_context()
helpers in fpsimd_save_and_flush_cpu_state().

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: <stable@vger.kernel.org> # 5.15.y, 6.1.y and 6.6.y
Fixes: 806d5c1e1d2e ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state") # 6.6.y
Fixes: 04c50cc23a49 ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state") # 6.1.y
Fixes: 5289ac43b69c ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state") # 5.15.y
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kernel/fpsimd.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1303,10 +1303,10 @@ void fpsimd_save_and_flush_cpu_state(voi
 	if (!system_supports_fpsimd())
 		return;
 	WARN_ON(preemptible());
-	__get_cpu_fpsimd_context();
+	get_cpu_fpsimd_context();
 	fpsimd_save();
 	fpsimd_flush_cpu_state();
-	__put_cpu_fpsimd_context();
+	put_cpu_fpsimd_context();
 }
 
 #ifdef CONFIG_KERNEL_MODE_NEON


Patches currently in stable-queue which might be from will@kernel.org are

queue-5.15/kvm-arm64-fix-kernel-bug-due-to-bad-backport-of-fpsimd-sve-sme-fix.patch
queue-5.15/arm64-mark-kernel-as-tainted-on-sae-and-serror-panic.patch
queue-5.15/arm64-entry-mask-daif-in-cpu_switch_to-call_on_irq_stack.patch
queue-5.15/mm-ptdump-take-the-memory-hotplug-lock-inside-ptdump_walk_pgd.patch

