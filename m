Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB8BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ds+e2FY4qG8uWc/bHrSma6khFqfMpMsqfzupXVEK1dg=; b=Lt7IGOABEGBz2xj3RQ/3uMT2RX
	l4Sgm6mBK7HKkf66e5BvegEh9pGqafVrDYqKYTXBDw0IOusJ/F752FvfyqdzWW2MewPaj6ao81d6x
	lRfHHNu/6QAaCoziceA5RFoICBxa5pTqhFPR4FIifLjPtR+7QEy7mq6zHA5Oq4shi+L6UHUfi3p/P
	r5R+JzZWjY8ubTSWM/uYYWA9tspC0ldcdzWo8uvCoJNNXFU5uqhDzJj8hBBU5Le1j7pJJ4jLI3MXt
	5sP05lw5PxqozDvNB1qLfAW3/4f89Hb6kXI9xlsq12nm5ewd5brQvWJRpFQve6VwfBMJ92q1gSawO
	5Qgu8NHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7bj-0000000EgnK-16TP;
	Fri, 14 Mar 2025 16:09:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Wy-0000000EfW0-3Ile
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C6E35C40BE;
	Fri, 14 Mar 2025 16:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7DEC4CEE3;
	Fri, 14 Mar 2025 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741968303;
	bh=Ta9k0fUFkF12PTa91lP+YCJcKC0H52dUXuAZotRTJvA=;
	h=Date:From:To:Cc:Subject:From;
	b=u8tAqGa9bhEIECQIBlEv9g6B6qZ7Y5H/9JBa5b0TQMLpSkByxyxzgCccJOnEBFaJi
	 dd67nB5jdJmrkiNtBJC4XD6vD9J3VXNRvaoPJv+OnPlKnyBrLxr6CQW2eniXbIS2ej
	 G2NfLkLKG6oxz5Gl/AfbeCwbtvw/6L6AbsxjwHpSXgrshKnopilnu1xOHSZuhLD4y7
	 kjqm/f44h+1/dYfPvCrFYlLR9SLEERWI24zTIlt8ADGZDU0dn8viqsBgqrCtwC4Llz
	 /A9jjNO4Jhtig+Qfnr6p2HYaAO04XKlM5tm/dpyrWtOj3hlwAkcAnICTHFoO4q9ZQ5
	 yCmFiXmt2/5rQ==
Date: Fri, 14 Mar 2025 16:04:59 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc7
Message-ID: <20250314160458.GA9438@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_090504_873605_A4A2426B 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Please pull this pair of arm64 mm fixes for -rc7.

Summary in the tag, but the main one is a horrible macro fix for our
TLB flushing code which resulted in over-invalidation on the MMU
notifier path.

Cheers,

Will

--->8

The following changes since commit eed6bfa8b28230382b797a88569f2c7569a1a419:

  arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level (2025-02-27 17:40:58 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to f7edb07ad7c66eab3dce57384f33b9799d579133:

  Fix mmu notifiers for range-based invalidates (2025-03-11 11:37:43 +0000)

----------------------------------------------------------------
arm64 fixes for -rc7

- Fix population of the vmemmap for regions of memory that are smaller
  than a section (128 MiB)

- Fix range-based TLB over-invalidation when invoked via a MMU notifier

----------------------------------------------------------------
Piotr Jaroszynski (1):
      Fix mmu notifiers for range-based invalidates

Zhenhua Huang (1):
      arm64: mm: Populate vmemmap at the page level if not section aligned

 arch/arm64/include/asm/tlbflush.h | 22 ++++++++++++----------
 arch/arm64/mm/mmu.c               |  5 ++++-
 2 files changed, 16 insertions(+), 11 deletions(-)

