Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E44C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2nCVZwSTdzhwpnquuJVpQTO9Vvb3soMR1RzCaMT9f0=; b=Bcho6lVaY+VDhPHeqVBcm6M1ah
	nrVyfW5NqYv7Qlx3qp/ifWkpe/gdKf7j1gbW4VVTE6QBLqDFDkvNqBB122uUqALDkNujLXyp4nzlE
	k+K7FrNmeiDjXkbzEdbERl0QkrIiLVNvfb22sdWhIYof99tiN9D967+fr8tma4xT85Crfc8CDiEDt
	shj9iI0PMK3MkQK2G3LI/E/5B3iznelwXIOntLhZpxhG2fQEoix2AnpSSjyB9YByroxH9cAVFitAw
	EqkV9U0NvqxZQjvWYB/7AQJJ+WaPd+VSYvSRc+uM20/7u86qJw0vq1MrnkXVk7hOxWaLui7/IWPnh
	3UDWLO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSa5T-0000000FTsN-0yZk;
	Fri, 20 Jun 2025 11:39:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZJz-0000000FP0d-2wEI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EAC85A47826;
	Fri, 20 Jun 2025 10:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF55C4CEE3;
	Fri, 20 Jun 2025 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750416610;
	bh=vCwR+vgZaANWT+DX6tuXMLx5vzPlxMcIfrhlOdZgpE0=;
	h=Date:From:To:Cc:Subject:From;
	b=eHFzJ+E7tzfit7vZPwamrR96dRzKK40YBJ5L8zwfpfmezE697ryxGA5+B0QnjFlC+
	 XOg70mzx+mQ9k6/WPClZXDuJLkjGmU0ZwiM69v2qGy9ckITaKNl6WCklzU+gaBQFnV
	 YIE7mrsVAR17y9GPsnhd4ksecWrRsNunrH8637RhuuZND/0rNGdQs4auoWNvwusbd8
	 hRNjs734BqfCrUzLJ1/rrWgPUS5codBZE0gVXty4st2jRuTIN7NhyFvDw27kovakTT
	 fzYZNa5hTdqSTaRJODM2/b6BvaPb9iJe4BTJTLUNQLhOLK7eOUDDEnrzGhXHwoodBy
	 zMhJYWhccOGDg==
Date: Fri, 20 Jun 2025 11:50:06 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc3
Message-ID: <20250620105005.GA22615@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_035011_807847_4C6B66F9 
X-CRM114-Status: GOOD (  10.96  )
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

Please pull these four arm64 fixes for -rc3. There's nothing major (even
the vmalloc one is just suppressing a potential warning) but all worth
having, nonetheless.

Cheers,

Will

--->8

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 39dfc971e42d886e7df01371cd1bef505076d84c:

  arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth() (2025-06-12 17:28:18 +0100)

----------------------------------------------------------------
arm64 fixes for -rc3

- Suppress KASAN false positive in stack unwinding code.

- Drop redundant reset of the GCS state on exec().

- Don't try to descend into a !present PMD when creating a huge vmap()
  entry at the PUD level.

- Fix a small typo in the arm64 booting Documentation.

----------------------------------------------------------------
Dev Jain (1):
      arm64: Restrict pagetable teardown to avoid false warning

Lorenzo Pieralisi (1):
      docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst

Mark Brown (1):
      arm64/gcs: Don't call gcs_free() during flush_gcs()

Tengda Wu (1):
      arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()

 Documentation/arch/arm64/booting.rst | 2 +-
 arch/arm64/kernel/process.c          | 4 +++-
 arch/arm64/kernel/ptrace.c           | 2 +-
 arch/arm64/mm/mmu.c                  | 3 ++-
 4 files changed, 7 insertions(+), 4 deletions(-)

