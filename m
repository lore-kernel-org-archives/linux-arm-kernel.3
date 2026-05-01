Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CBDCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O31KxZTM0lF562iFAPNNwC+x11Y7ojPJv0AOkMdLfu8=; b=xNsZVfd74Uc05dP/KbfDnezydH
	w4OREixLBy1D1SHw1ceq8vgInpU7s7cA/8YEODSZ2InGsolHWTSFNWHGIXO/2haRN5STHuOFrMvtM
	J/ISDE+0ZOnWCahVkymobKs6+GiV3e9ZvmEhVQfEOp9gvPW+fTNCmK/bMLYdZUKnXcigdWSqFxIfq
	20rx1DCKTsB3/5gMPYTYlW7IKkp0w6YAdxZzaFvI3U6rCDS9O3dbAtnq58W7gyzxurGHFijzTDHht
	nlaMA/4GVg92EdDTZ1axp4yUAQ6/DHOL7fO3SRVrH6pMsQSzbB4gdYiSXnvmaOGCLY1x503rq6jrs
	f4NNustw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvCk-00000007gg6-2S1O;
	Fri, 01 May 2026 21:15:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvCh-00000007gfj-2ugt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 21:15:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 576A54388;
	Fri,  1 May 2026 14:15:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 039333F62B;
	Fri,  1 May 2026 14:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777670117; bh=T7MMJ9Wv9l1EyhkVWkTS1mIc0MqZ90VW1VkSOijVsMc=;
	h=Date:From:To:Cc:Subject:From;
	b=KleSpujHasFcyYW042XT2VSpAaSLj1RSffjRfnw3vgXKSfvQLQPvQeEUZglnhIUBi
	 clnOS8VvWq9ZjbQdFiGH24b1daOozgPB6GSRPdhL6eQleANFNnzR/OVAfuuT6I6vKq
	 EAXw7U/FTQbUU7YgaEO9RO5+dM7i2cQFRrL2SXz8=
Date: Fri, 1 May 2026 22:15:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.1-rc2
Message-ID: <afUX2gRwmgEfU0X1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_141519_859509_BE1B5976 
X-CRM114-Status: GOOD (  11.94  )
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

Hi Linus,

Please pull the arm64 fixes below. Thanks.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 030e8a40fff65ca6ac1c04a4d3c08afe72438922:

  arm64: signal: Preserve POR_EL0 if poe_context is missing (2026-05-01 17:44:25 +0100)

----------------------------------------------------------------
Assorted arm64, ACPI and kselftest fixes for 7.1-rc2:

 - Avoid writing an uninitialised stack variable to POR_EL0 on
   sigreturn if the poe_context record is absent

 - Reserve one more page for the early 4K-page kernel mapping to cover
   the extra [_text, _stext) split introduced by the non-executable
   read-only mapping

 - Force the arch_local_irq_*() wrappers to be __always_inline so that
   noinstr entry and idle paths cannot call out-of-line, instrumentable
   copies

 - Fix potential sign extension in the arm64 SCS unwinder's DWARF
   advance_loc4 decoding

 - Tolerate arm64 ACPI platforms with only WFI and no deeper PSCI idle
   states, restoring cpuidle registration on such systems

 - Include the UAPI <asm/ptrace.h> header in the arm64 GCS libc test
   rather than carrying a duplicate struct user_gcs definition (the
   original #ifdef NT_ARM_GCS was wrong to cover the structure
   definition as it would be masked out if the toolchain defined it)

----------------------------------------------------------------
Breno Leitao (2):
      arm64/irqflags: __always_inline the arch_local_irq_*() helpers
      ACPI: arm64: cpuidle: Tolerate platforms with no deep PSCI idle states

Kevin Brodsky (1):
      arm64: signal: Preserve POR_EL0 if poe_context is missing

Leo Yan (1):
      kselftest/arm64: Include <asm/ptrace.h> for user_gcs definition

Wentao Guan (1):
      arm64/scs: Fix potential sign extension issue of advance_loc4

Zhaoyang Huang (1):
      arm64: Reserve an extra page for early kernel mapping

 arch/arm64/include/asm/irqflags.h            | 14 ++++----
 arch/arm64/include/asm/kernel-pgtable.h      |  7 +++-
 arch/arm64/kernel/pi/patch-scs.c             |  4 +--
 arch/arm64/kernel/signal.c                   | 54 ++++++++++++++++++++++------
 drivers/acpi/arm64/cpuidle.c                 | 10 ++----
 tools/testing/selftests/arm64/gcs/gcs-util.h |  6 ----
 tools/testing/selftests/arm64/gcs/libc-gcs.c |  1 +
 7 files changed, 62 insertions(+), 34 deletions(-)

-- 
Catalin

