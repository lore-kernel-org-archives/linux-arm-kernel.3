Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B76C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9IuwqsGlZjI33H0qsRcuoXsHEUzl7oV+77uaxI+CUSc=; b=PPY1YxFIIeIGUFUJGkTu0U/Zad
	D8fazcpEai7oOtwEHiSV6D67FZBsp1YrU4vzMn37FD8Q3CtmS9YMrkYs426gR/KHtTOJN7ICeHr5m
	Fv5cDVugYhDme1n0ssNgr8J+LkQLreqiNvLu3aYIP92sZfRuTkhQdLpUgpQermR1hc1LdrbSMW+is
	dH2zJcllJshUaP+kUgtcRhRueEO3jZG/UaIInGLJen30w/WcE+hE4WJ/rZYDdgwKH+fIpcm+fH7Uu
	UvRx7YT9IDJHIbV7Su844DOjGTTeCptFpHW0qriA8GAUuQubRXIOdPNXmynVCQJ10eBXeSzrl4G55
	HXYnOVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwKX-0000000F63y-2P2Q;
	Fri, 14 Feb 2025 14:06:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwJ4-0000000F5ru-2YqJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:04:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F33B5C58FC;
	Fri, 14 Feb 2025 14:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F99FC4CED1;
	Fri, 14 Feb 2025 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739541877;
	bh=OAmsH9wXdR9cCoL774VIgncB0RHMbJP2b2IZgPv+F+8=;
	h=Date:From:To:Cc:Subject:From;
	b=XQ96pBjjiIqxEgGDR75mtdrCy825EmAZajcvIuVyGCxcOQ4CtV3fGH7AvL6lHKtW8
	 lI10/7WXLRU6o4BBgdyaLBn1JIYwUC4JzBxyuI+3yUh5bXFpZbqaRP+TgPdsrgcA8K
	 7qV2TyImit40bF28WASYR3iR6381EokbZ2Z/Dt3rJxyTuK0RMpeZU4bk2w+2huVtV9
	 g9/gbGnjvYbE78600SQe6GaPrwboXfAxN7NvRQO+cGZYneAu0ts4gVBCoV0pgPOpUg
	 LE035uZnG0P+6+zdG28YdKaU9j2dQ+awZw0BLV1pETpJtUGld2TR0t6bMP05TDJNwa
	 K35braZjZaphg==
Date: Fri, 14 Feb 2025 14:04:32 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	ojeda@kernel.org
Subject: [GIT PULL] arm64 fixes for -rc3
Message-ID: <20250214140431.GA13374@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_060438_765613_94E6ECF0 
X-CRM114-Status: GOOD (  10.38  )
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

Please pull this batch of arm64 fixes for -rc3. I've provided the usual
summary in the tag but there's nothing particularly major here.

Cheers,

Will

--->8

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 446a8351f160d65a1c5df7097f31c74102ed2bb1:

  arm64: rust: clean Rust 1.85.0 warning using softfloat target (2025-02-13 11:45:49 +0000)

----------------------------------------------------------------
arm64 fixes for -rc3

* Fix kexec and hibernation when using 5-level page-table configuration

* Remove references to non-existent SF8MM4 and SF8MM8 ID register
  fields, hooking up hwcaps for the FPRCVT, F8MM4 and F8MM8 fields
  instead

* Drop unused .ARM.attributes ELF sections

* Fix array indexing when probing CPU cache topology from firmware

* Fix potential use-after-free in AMU initialisation code

* Work around broken GTDT entries by tolerating excessively large timer
  arrays

* Force use of Rust's "softfloat" target to avoid a threatening warning
  about the NEON target feature

* Typo fix in GCS documentation and removal of duplicate Kconfig select

----------------------------------------------------------------
Ard Biesheuvel (1):
      arm64: Fix 5-level paging support in kexec/hibernate trampoline

Beata Michalska (1):
      arm64: amu: Delay allocating cpumask for AMU FIE support

Lukas Bulwahn (1):
      arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL

Mark Brown (3):
      arm64/gcs: Fix documentation for HWCAP
      arm64/hwcap: Remove stray references to SF8MMx
      arm64: Add missing registrations of hwcaps

Miguel Ojeda (1):
      arm64: rust: clean Rust 1.85.0 warning using softfloat target

Nathan Chancellor (1):
      arm64: Handle .ARM.attributes section in linker scripts

Oliver Upton (1):
      ACPI: GTDT: Relax sanity checking on Platform Timers array count

Radu Rendec (1):
      arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array

 Documentation/arch/arm64/gcs.rst  |  2 +-
 arch/arm64/Kconfig                |  1 -
 arch/arm64/Makefile               |  4 ++++
 arch/arm64/kernel/cacheinfo.c     | 12 +++++++-----
 arch/arm64/kernel/cpufeature.c    |  5 +++--
 arch/arm64/kernel/topology.c      | 22 ++++++++++------------
 arch/arm64/kernel/vdso/vdso.lds.S |  1 +
 arch/arm64/kernel/vmlinux.lds.S   |  1 +
 arch/arm64/mm/trans_pgd.c         |  7 +++++++
 drivers/acpi/arm64/gtdt.c         | 12 ++++++++----
 10 files changed, 42 insertions(+), 25 deletions(-)

