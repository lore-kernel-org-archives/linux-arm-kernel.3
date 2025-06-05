Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49FAC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IeaVDcrjlBChfyvskixwOU9t0RUvB1RE7Sm2CsP6HmY=; b=KbEjRKTQMGH3lH2hYxGzqwnva8
	saV/2ldG9TQ98pQ/tS7vdFbcMPFpVcRys9nDewF9qulZ8EzoKqLPKRxz8uS9Dd9HAESpqhRuh6fJb
	caKBdk4mZIgw5vazmNTule0UKzllvsDenRpK8C9X/ecoMxkyC62oV9RIBKcOW6tCw3vd1zYln8esY
	E4w0zoyBRUoNVFJLARpSJCDd+Etm4nIucXqg1ZzhGUFwpriexAB5nO/002FvLD/Yd+VwJIhNj1UJN
	nlLoxcrqogVMcIx407hCyYVUw8HBCixUIK2VE8RWgK8a0aDMzfcfUChWYqNF63N8jJTPBlrEq9Wy0
	g8VRQw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBF4-0000000FjNX-0exc;
	Thu, 05 Jun 2025 14:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAqZ-0000000Fg6x-3u9J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4947744D64;
	Thu,  5 Jun 2025 13:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F758C4CEE7;
	Thu,  5 Jun 2025 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749130891;
	bh=5H6teBMsrCBmaDMnEFeiUG4tGgR3EfbIwYOznmPuKlk=;
	h=Date:From:To:Cc:Subject:From;
	b=KLeCTbWAwXG5/0B716MGFwBy4Ee/kKRG51ei8PI0ABccPj20EVeD+KcNNKiKJ9wTK
	 vJFA8ERcvF2ta6SOid3qMC8foYiGjG3RGeQG3Fe6eJlID7uFRmNb2UcuYDKeDJ0iVU
	 gDBKpkp2HPgoMcOD+OyS+sBAnVFYWTVoqdUX0tmqtxcF525PJH7Jh3k+nIGBLa979N
	 VBJ4pJOf4sPGV1KYnRg9cZdbyf77TzP9jrMDyMtGeMWLHxhzo3U+3IU3OE3NdIKNf9
	 TdHJu6KuoyVlOrboTvinYy8pFw32/n90LOBTt4VpLKuRBVyhVtd8DWfqyAy+MmdSVH
	 sIDaeGWWGsHBQ==
Date: Thu, 5 Jun 2025 14:41:26 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc1
Message-ID: <20250605134126.GA4845@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_064131_989177_F8B86B3D 
X-CRM114-Status: GOOD (  11.22  )
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

Please pull the following arm64 fixes for -rc1. Usual summary in the
tag, but we've got a couple of build fixes when using LLD, a missing TLB
invalidation and a workaround for broken firmware on SoCs with CPUs that
implement MPAM.

Cheers,

Will

--->8

The following changes since commit 217e3cbba3d6613bee9ac33ddc330f8676eb9eca:

  Merge branch 'for-next/vdso' into for-next/core (2025-05-27 12:26:54 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 10f885d63a0efd50b0d22bf27eb3cf727838e99e:

  arm64: Add override for MPAM (2025-06-02 13:49:09 +0100)

----------------------------------------------------------------
arm64 fixes for -rc1

- Disable problematic linker assertions for broken versions of LLD.

- Work around sporadic link failure with LLD and various randconfig
  builds.

- Fix missing invalidation in the TLB batching code when reclaim races
  with mprotect() and friends.

- Add a command-line override for MPAM to allow booting on systems with
  broken firmware.

----------------------------------------------------------------
Ard Biesheuvel (2):
      arm64: Disable LLD linker ASSERT()s for the time being
      arm64: Work around convergence issue with LLD linker

Ryan Roberts (1):
      arm64/mm: Close theoretical race where stale TLB entry remains valid

Xi Ruoyao (1):
      arm64: Add override for MPAM

 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/arm64/include/asm/el2_setup.h              | 24 ++++++++++--------------
 arch/arm64/include/asm/kernel-pgtable.h         |  2 +-
 arch/arm64/include/asm/tlbflush.h               |  9 +++++----
 arch/arm64/kernel/cpufeature.c                  |  7 +++++--
 arch/arm64/kernel/cpuinfo.c                     |  7 +++++--
 arch/arm64/kernel/image-vars.h                  | 17 +++++++++++++++++
 arch/arm64/kernel/pi/idreg-override.c           |  3 +++
 8 files changed, 49 insertions(+), 23 deletions(-)

