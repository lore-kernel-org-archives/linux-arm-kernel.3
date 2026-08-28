Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE29C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZMZ/kBarwjSgDXtkTwWShii9hMB72ImaIYEtvs34y2E=; b=r9R/6OLPTFeN9L8ME3ziyZfHjw
	v+a/MSW6tY0FyjouwJFfJi2Xe14vhkcqBUNkWvRkrIQMQVGs96xukrXBsMpdSRU9M+63OnxLhNLZT
	/skVc5rwyA5aaX3yAoU/KywbPdz/KEuPgEMBRfBVIfY8plgLiiya5gdBef2t8N3XQNy2TE/9hLOX9
	p8h/kQ/faD10yYqoCG3XI8nhzN+I5nnrdJaxFSod4sNRxQUdqY0EZ8RQm9/17Sl3j8ra+sPeDVC0B
	rdsOWDOF99PkuepgcjXHHGCHhbb8NKth8e7s+YbTGe2Lv2hDXLvSD1Krt8ptKGowpCO0CqjhSE9e3
	daCRv1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxBE-00000005vxZ-3w5U;
	Fri, 28 Aug 2026 14:03:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxBD-00000005vxR-1okw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 14:03:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 338B340BC6;
	Fri, 28 Aug 2026 14:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8D1F000E9;
	Fri, 28 Aug 2026 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925819;
	bh=ZMZ/kBarwjSgDXtkTwWShii9hMB72ImaIYEtvs34y2E=;
	h=Date:From:To:Cc:Subject;
	b=hYciaezoq6aRZ/YSZYVrOfuxrfHAn6D8HtKQyO3/l95vjtcWIjV+tTb0mzbSSSsCK
	 EwGsB5jB/HBhsCWNxghQ3P112fkV6JYCUljUYTKDLeTVVuibaTtkd1JgrtW+dtM1Va
	 P7FdfO4cBEfk0diyRvcRSvMrGjAw1SwyPy7lBjUQTVcI1udVmVHkjIjeqJWgR0DY0+
	 EMO9q0yzbGLh9iQLTc5j06Fm2AouEZFMJDkfmFgePqJB8Mhh8zU5OK8Ws3DC9oHH3b
	 oFolPXWBBB3rWKpTtvVi7xNYpIW6xiyLdHg2/cx9fPf7T+cvttwrq3a5iQUo5ObQQ6
	 P1MXctdEhD4bg==
Date: Fri, 28 Aug 2026 15:03:34 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc1
Message-ID: <apGVNo7DgJmIQRHm@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Please pull these arm64 fixes for -rc1. The usual summary is in the tag,
but there's a mixture of ptdump, compat and MTE fixes that came in
during the merge window.

Cheers,

Will

--->8

The following changes since commit 26b77009ee74f6122a067a4f9926ff6e09fffb94:

  Merge branch 'for-next/uapi' into for-next/core (2026-08-14 10:16:13 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 2bd533739234d79b74afabfece1abfe9c6d52c83:

  selftests/arm64: Add MTE test config fragment (2026-08-27 14:18:39 +0000)

----------------------------------------------------------------
arm64 fixes for -rc1

- Fix address handling of final memory region in ptdump

- Fix emulation of decrementing load/store multiple from 32-bit task

- Fix SCTLR context-switching for store-only MTE mode

- Fix numerous issues in MTE selftests

----------------------------------------------------------------
Karl Mehltretter (1):
      arm64: compat: Fix decrementing LDM/STM alignment emulation

Muhammad Usama Anjum (4):
      selftests/arm64: Print missing MTE TAP headers
      selftests/arm64: Treat KSM merge_across_nodes as optional
      selftests/arm64: Fix MTE prctl TAP plan
      selftests/arm64: Add MTE test config fragment

Vladimir Murzin (1):
      arm64: process: Fix context switching MTE store-only tag check

Wei-Lin Chang (2):
      arm64: ptdump: Make note_page_flush() range aware
      KVM: arm64: ptdump: Flush the last region

 arch/arm64/include/asm/processor.h                 |  2 +-
 arch/arm64/include/asm/ptdump.h                    |  2 ++
 arch/arm64/kernel/compat_alignment.c               |  4 +--
 arch/arm64/kvm/ptdump.c                            | 11 +++++---
 arch/arm64/mm/ptdump.c                             | 14 +++++++++-
 tools/testing/selftests/arm64/config               | 17 ++++++++++++
 .../selftests/arm64/mte/check_buffer_fill.c        |  2 ++
 .../selftests/arm64/mte/check_child_memory.c       |  2 ++
 .../selftests/arm64/mte/check_gcr_el1_cswitch.c    |  1 +
 .../selftests/arm64/mte/check_hugetlb_options.c    |  2 ++
 .../selftests/arm64/mte/check_ksm_options.c        | 31 +++++++++++++++++++---
 .../selftests/arm64/mte/check_mmap_options.c       |  2 ++
 tools/testing/selftests/arm64/mte/check_prctl.c    |  2 +-
 .../selftests/arm64/mte/check_tags_inclusion.c     |  2 ++
 tools/testing/selftests/arm64/mte/check_user_mem.c |  2 ++
 15 files changed, 84 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/config


