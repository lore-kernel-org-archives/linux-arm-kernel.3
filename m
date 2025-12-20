Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C68E668AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=to9kdjlnae5iAnTqPuA1zzcz+DuxQGrAZC/0io6YsCw=; b=d53+mBwrJkd3RKVzQXdmn6cJxo
	B3Ja01zkbyBjNZnWyJwqp+aOgnEEX9irU2o196EWiV0qbmuz4jABoDPOff5NlUq+imB3XD6yM24eE
	SRQuGhkpXNHOBiByO6F7KM6N6qP4VE+WmHyuo0Qan/BUln4fvUoykPaOqD+LTL/yHkoE+1oflFDA1
	NbZDl6o8boaWl8JebUGGKREgVVNvJ9/tbIwP736Fb1PLIvCcfcc42G/bu5Q0T7iuZG5rpO8oJX43U
	LbxAOSf581rSULawhzGy6Enybd4KEcn/BNeXliSP1b6xC54hsgvioq2eSpvLUKPwPFGfZ/rGMoWHk
	NzJF2ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtaO-0000000BTWa-1MMN;
	Sat, 20 Dec 2025 09:49:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtaL-0000000BTWF-2jOI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E999B41820;
	Sat, 20 Dec 2025 09:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C837EC4CEF5;
	Sat, 20 Dec 2025 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766224151;
	bh=pYj2OlcustQY/pV1CgTXZnP5ez3Vh8eJUCsV2AF86uc=;
	h=Date:From:To:Cc:Subject:From;
	b=DYjkoiK9+1EibEhm1DINiEFIOtsQjtFHd6+IJR6rF3noB3yoXK+J+cbGfCGDtdTZi
	 /AYMhuZmRRKzymA22AVS26z1zXV66qNBEYrloJnT8pjBHNgd3taV2IHt3cQkw9lB4J
	 2cqkTBP4vDKgI7lt9ANtAyaG+OS8aOFWYpRGZRMGtciZ4w/NrrLEJ+L53kkthNtQKo
	 Yte1+Rsx63rKRqXaRlh0ZDrU2P5Wnf2lqJqHY44x58XUyDhpjUxdGWG8NYXx3nz8SR
	 YrbRdGvcMuZifd3FoTYN7anLt1LmtjTK+KmvgUv/0UU2LpGQPewFrYPmE8YqRcTQT/
	 6LtaILdktgB3A==
Date: Sat, 20 Dec 2025 09:49:08 +0000
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 updates/fixes for 6.19-rc2
Message-ID: <aUZxFI1CtSF2R5HX@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_014913_713146_ECE4CFF5 
X-CRM114-Status: GOOD (  11.80  )
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

Please pull the arm64 updates below. There are two cleanups that I did
not push during the merging window because of conflicts with other
series going in via the tip and crypto trees. The other is a GCS fix.

Thanks.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to f4ea8e05f2a857d5447c25f7daf00807d38b307d:

  lkdtm/bugs: Do not confuse the clang/objtool with busy wait loop (2025-12-19 15:09:09 +0000)

----------------------------------------------------------------
Two left-over updates that could not go into -rc1 due to conflicts with
other series:

 - Simplify checks in arch_kfence_init_pool() since force_pte_mapping()
   already takes BBML2-noabort (break-before-make Level 2 with no aborts
   generated) into account

 - Remove unneeded SVE/SME fallback preserve/store handling in the arm64
   EFI. With the recent updates, the fallback path is only taken for EFI
   runtime calls from hardirq or NMI contexts. In practice, this only
   happens under panic/oops/emergency_restart() and no restoring of the
   user state expected. There's a corresponding lkdtm update to trigger
   a BUG() or panic() from hardirq context together with a fixup not to
   confuse clang/objtool about the control flow

GCS (guarded control stacks) fix: flush the GCS locking state on exec,
otherwise the new task will not be able to enable GCS (locked as
disabled).

----------------------------------------------------------------
Ard Biesheuvel (2):
      lkdtm/bugs: Add cases for BUG and PANIC occurring in hardirq context
      arm64/efi: Remove unneeded SVE/SME fallback preserve/store handling

Catalin Marinas (1):
      lkdtm/bugs: Do not confuse the clang/objtool with busy wait loop

Kevin Brodsky (1):
      arm64: mm: Simplify check in arch_kfence_init_pool()

Mark Brown (1):
      arm64/gcs: Flush the GCS locking state on exec

 arch/arm64/kernel/fpsimd.c              | 130 +++++---------------------------
 arch/arm64/kernel/process.c             |   1 +
 arch/arm64/mm/mmu.c                     |  33 ++++----
 drivers/misc/lkdtm/bugs.c               |  53 +++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |   2 +
 5 files changed, 92 insertions(+), 127 deletions(-)

-- 
Catalin

