Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437EAC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jswb2vgBrJFejY3wNbk8xQJcBc0nYqakiP0xn711J4I=; b=09TjEVUEBKlbSm6PW8wETWdb9G
	iV5LREnpEVhNnADywxuI4yNmq/quqii+CehtRmZ4ir7357EWycK6NJQv3Jky8+Xbzuhqwg0MWsD2Z
	nKn9Drc8r915QJJBW6aMqbVPjtfAp2O/G7hFD4b5YGFmLBMqwPIxq3ogfTOyaC1ryPB1wixfEDBtf
	y/dlnDiM6Sfm+ysD6L+7MCQqO5lka76RXp8Y4tjDbP6XGobtk4s1sfjme22ohQAaab3r2DvBAcjNw
	VoMRHawQj33S4feI8Ryk5oyIV1pb/0uvxLf92Pl7NXkbqzeIK2aQVUV9G98saJuevjLeh0kj/WFge
	nxRFmHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5R-00000009cLG-0nQr;
	Wed, 09 Jul 2025 19:04:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWPm-000000096fG-3FSB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F4FDA547EB;
	Wed,  9 Jul 2025 15:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC08C4CEEF;
	Wed,  9 Jul 2025 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752073733;
	bh=aOlbZkcI7oF3SOFwCQeZdFEAK3mOIpqRgWAeM2Pwt3w=;
	h=Date:From:To:Cc:Subject:From;
	b=h+EkCEXW/Wib9SN4ISibuhk+/zMJh+JOmyHCKL+Oiy7izNmKXIcIJra7EA8P1hVBL
	 IeAOCgavQHrySGhQmnUIWNY7ghn+GXwzqyy4eB/yy0ZUnRXZl161quP/6scunZC0O7
	 WHfvEC2Gwqd9oM/ffORMUB/aEoVw4N42Ox/FVETTtsIY2KKruLbn0r2t2SajfnsMF9
	 okc/s9eTYBf8gzvFC2XY0J/+97Wu1K6SDkOAHHxdj5jhYMq+QejJYm1wW3JR/GLRPC
	 CqNmqjN0+GX2aR1ItathXL8WJBq0k1zjbEAcrKPGs9gS49VNwhoQVqWQqDVJJmkHVc
	 voI3zkp0gP7Sg==
Date: Wed, 9 Jul 2025 16:08:48 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc6
Message-ID: <aG6GAKc8EV0cERsn@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_080854_886181_FEE29259 
X-CRM114-Status: GOOD (  12.03  )
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

Please pull these arm64 fixes for -rc6. We've had a steady trickle of
relatively minor fixes since -rc3 but they're all self-contained 6.16
material and confined to the arch code.

There's the usual summary in the tag.

Cheers,

Will

--->8

The following changes since commit 39dfc971e42d886e7df01371cd1bef505076d84c:

  arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth() (2025-06-12 17:28:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 9dd1757493416310a5e71146a08bc228869f8dae:

  arm64/mm: Drop wrong writes into TCR2_EL1 (2025-07-04 16:46:04 +0100)

----------------------------------------------------------------
arm64 fixes for -rc6

- Fix bogus KASAN splat on EFI runtime stack

- Select JUMP_LABEL unconditionally to avoid boot failure with pKVM
  and the legacy implementation of static keys

- Avoid touching GCS registers when 'arm64.nogcs' has been passed on the
  command-line

- Move a 'cpumask_t' off the stack in smp_send_stop()

- Don't advertise SME-related hwcaps to userspace when ID_AA64PFR1_EL1
  indicates that SME is not implemented

- Always check the VMA when handling an Overlay fault

- Avoid corrupting TCR2_EL1 during boot

----------------------------------------------------------------
Anshuman Khandual (1):
      arm64/mm: Drop wrong writes into TCR2_EL1

Arnd Bergmann (1):
      arm64: move smp_send_stop() cpu mask off stack

Breno Leitao (1):
      arm64: efi: Fix KASAN false positive for EFI runtime stack

Kevin Brodsky (1):
      arm64: poe: Handle spurious Overlay faults

Marc Zyngier (1):
      arm64: Unconditionally select CONFIG_JUMP_LABEL

Mark Brown (2):
      arm64/gcs: Don't try to access GCS registers if arm64.nogcs is enabled
      arm64: Filter out SME hwcaps when FEAT_SME isn't implemented

 arch/arm64/Kconfig                 |  1 +
 arch/arm64/include/asm/el2_setup.h | 19 +++++--------
 arch/arm64/kernel/Makefile         |  3 +-
 arch/arm64/kernel/cpufeature.c     | 57 +++++++++++++++++++++-----------------
 arch/arm64/kernel/efi.c            | 11 ++++++--
 arch/arm64/kernel/process.c        |  5 ++++
 arch/arm64/kernel/smp.c            |  2 +-
 arch/arm64/mm/fault.c              | 30 ++++++++++++++------
 arch/arm64/mm/proc.S               |  1 -
 9 files changed, 76 insertions(+), 53 deletions(-)

