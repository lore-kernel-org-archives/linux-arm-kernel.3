Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B9CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pFEri1gc+lOziivF2NStUGXOlg7Y1X2jZxwurRE7KUk=; b=fzbGPJFqi7keHZuEKCC0Bd0ubG
	CKtiNcV8sNSUhiBjNOH+scPusZ+txpBUn0gJxZBqyrw7gxoy9QhMh6AjL0wfAKMu21g+1P0JnF9kP
	NUbQv13Buk9H1i47LHf0PrJxue8FXuKqZeBdchldukpwXH1kkUlcFpnDVkz8s3ssuAFD1R3tly6eS
	EchOEaZA9LsFo/DGJYK8M99r4GkH+rm8Dq+OM359qyV+cKOjQFZvfZZ1mrABOprSCNZgzoMBWSIwB
	Kx/uivsw2KD001ykhaAXv0KDJbQBu+ao1bIw6F5SQ1GCqvTVKrnesPG5N6QluECC95UCVGxoLELdr
	AIh/oLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4HD-0000000B9uX-1ohY;
	Fri, 26 Jun 2026 10:59:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4HC-0000000B9uK-1PEn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 10:59:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E843F42A77;
	Fri, 26 Jun 2026 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92BF1F000E9;
	Fri, 26 Jun 2026 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782471553;
	bh=pFEri1gc+lOziivF2NStUGXOlg7Y1X2jZxwurRE7KUk=;
	h=Date:From:To:Cc:Subject;
	b=XU2bcYX9yz8sXnBUFnpi20ZtWXPStNqicrd4VIkwWKdgU/5QUSvnHRmvPM/OAl0Bu
	 2E1T5y8O03nQ98j0L8aUp/W8mJ8fdXJSLugizCtQoKTQNZe13FOn2AgV6aii1RpkvP
	 PTMsgrQcwOHulPwpqhQV4ixqJhurU7NylDZqorBiy4NqJU9oCke+IFPNRGOSXiW30w
	 nt8FCe9uZ9C9hiIxL2m8CwWikVp8qg+YY1CKzn9QSLmn0gFyN/5Gl8FEVkvHPnum6E
	 UMk4nVw9uk1Ghgbc2PpKWw/OgH3XnJTx+fKcljG0tSZ83D5M62fk2bM6GtPfpz879N
	 AwT72NHhR3Erg==
Date: Fri, 26 Jun 2026 11:59:09 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc1
Message-ID: <aj5bfQ9E7Qjeeo1d@willie-the-truck>
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

Please pull this small crop of arm64 fixes for -rc1. We've got a build
fix for a new randconfig permutation, a fix for a long-standing
truncation issue with hardware watchpoints and a KVM initialisation fix
for the newly merged remapping of the kernel data and bss sections.

There will be more to come, but this is the solid stuff for now.

Cheers,

Will

--->8

The following changes since commit 61c19a9feb1d87156e46e38d7759f3ad23710e24:

  Merge branch 'for-next/sysregs' into for-next/core (2026-06-14 12:18:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 36fa5ffa60344bcc59fb3f50b33af8187e6b8753:

  arm64: mm: Defer read-only remap of data/bss linear alias (2026-06-24 14:52:14 +0100)

----------------------------------------------------------------
arm64 fixes for -rc1

- Fix randconfig build failure due to missing include of asm/insn.h.

- Reject unaligned hardware watchpoints which were silently being
  truncated.

- Fix crash in KVM initialisation by deferring the read-only remapping
  of the kernel data and bss sections.

----------------------------------------------------------------
Ard Biesheuvel (1):
      arm64: mm: Defer read-only remap of data/bss linear alias

Arnd Bergmann (1):
      arm64: static_call: include asm/insns.h

Breno Leitao (1):
      arm64/hw_breakpoint: reject unaligned watchpoints that would truncate BAS

 arch/arm64/kernel/hw_breakpoint.c |  9 +++++++++
 arch/arm64/kernel/static_call.c   |  1 +
 arch/arm64/mm/mmu.c               | 11 ++++++-----
 3 files changed, 16 insertions(+), 5 deletions(-)

