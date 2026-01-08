Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F5CD185F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=X+Dn0NUOdN4RL+4zSgxJZL1v/+YJe5v0qEVeZlgzxqs=; b=KEtEy4x+wMqqYlXbFo8PK6MmI2
	M2go71NfPuI13PxwAKiE3X52ecujVHjuJR7l4aNmifubfIY3VCh9+BaGrgJ4RQHkzwvbLAdb9rPYx
	Rr495MIjDw6hDpEahpUUGLp3iEinmPFqzBH984EPCuZ5FLY81bLW4XCbAE8qLcbuufjCQqlu/1wuV
	an9o2QkWoydfnZ0C9CpJkyaMoz5lsLAwDdQLuDjimDNjYzYjjojakwh1HXU6zouCfwZqZG0MxnwDg
	KbTiDzGPm0sr8wG2MdUVEWrE7sWtVVh1hGICu+MsBxqZ+9azg2RvnxXVj/Z88ERwGJIOkKrFHs+1F
	Fu7DKUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqBz-0000000HBZ1-0DKn;
	Thu, 08 Jan 2026 13:36:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqBw-0000000HBYO-0Asz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C364543CF2;
	Thu,  8 Jan 2026 13:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A381C116C6;
	Thu,  8 Jan 2026 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767879402;
	bh=O26X0sdvaAEhLqhxIo+DAUoci1J8MorgSZNU9eEiNek=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=VNyTqjC0jF2kSmH1p8tDj5GZFPGRfWy7lc0maQ4bihbs1O8DFftIOQf7v0v5KOhig
	 BryrqCkte6S/7KOi6qdsZGHRRytr1LaRUf9ukzatiGrrNibunlXx/DIIV6ZmEwWHEC
	 jXEOOtPEjXdf5Y81QdIkhR7rwgWUu04tKKUREwxk=
Subject: Patch "KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning" has been added to the 6.1-stable tree
To: alexandru.elisei@arm.com,catalin.marinas@arm.com,cov@codeaurora.org,gregkh@linuxfoundation.org,joey.gouly@arm.com,justinstitt@google.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,llvm@lists.linux.dev,maz@kernel.org,nathan@kernel.org,oliver.upton@linux.dev,suzuki.poulose@arm.com,will@kernel.org,ynaffit@google.com,yuzenghui@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Jan 2026 14:36:37 +0100
In-Reply-To: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
Message-ID: <2026010837-unwell-problem-70b2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_053644_488869_D42487BD 
X-CRM114-Status: GOOD (  12.54  )
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

    KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From justinstitt@google.com  Thu Jan  8 14:27:57 2026
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 05 Dec 2025 14:51:41 -0800
Subject: KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer warning
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,  Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,  Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,  Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,  Justin Stitt <justinstitt@google.com>
Message-ID: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>

From: Justin Stitt <justinstitt@google.com>

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration") which incidentally removed the aforementioned warning.
Since there is no upstream equivalent, this patch just needs to be
applied to 6.1.

Disable this warning for sys_regs.o instead of backporting the patches
from 6.2+ that modified this code area.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
Reviewed-by: Tiffany Yang <ynaffit@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kvm/Makefile |    3 +++
 1 file changed, 3 insertions(+)

--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,6 +24,9 @@ kvm-y += arm.o mmu.o mmio.o psci.o hyper
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)
+
 always-y := hyp_constants.h hyp-constants.s
 
 define rule_gen_hyp_constants


Patches currently in stable-queue which might be from justinstitt@google.com are

queue-6.1/kvm-arm64-sys_regs-disable-wuninitialized-const-pointer-warning.patch

