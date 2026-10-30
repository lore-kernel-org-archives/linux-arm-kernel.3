Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3aDiBQBi;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hp4F5d2j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=41o/DgL+nFsgsid8TUUhF8UMTGKy2cZolj/OO47kSSA=; b=3aDiBQBiQgy1lgZcGOM8x4BgmN
	DK8vBZTS/PF3U1HFp+txRsvlsl44EAXOcQ4goywJ68CLTEN658a30rQaoIYv1WQZDg8RXq4l3lANn
	Nl18eogriaHYs9yRD8qmb05+HYiGRbXV/tYzhmZ4mwLnFQxEiJzQIHykPw2peb2UqVQorXe8+g6XT
	JJR0KEprONHEXMwDbDmKDSyjloxDlu0gAA0LDKdsP2sfgS52I87mEEHb/fzy1EqqSSCt66mStcQmJ
	BcWv3qV8hr7UMr/6uzwjIqHsRbzvltxB0mEwPccuPZYe+n8t6wp+GRbuWNg5nm6PTjd4IckHEcVPy
	6x4TArAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrHl-0000000CP8v-1Loc;
	Fri, 30 Oct 2026 18:25:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrHh-0000000CP7m-1Up2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 18:25:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797331576;
	Fri, 30 Oct 2026 11:24:54 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2AA03F673;
	Fri, 30 Oct 2026 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793384697; bh=Hncs4sYrggz4WDHbAbVosY9saDcGH6y08xLwvNmlY1k=;
	h=Date:From:To:Cc:Subject:From;
	b=hp4F5d2jY3YM6uMlyJaG4ge3pwI1CwDW+i6DjDsVgIB+7FFO37YxnNCQelnVxb1Uh
	 NxEur+hb4SV3N454QfyHO/3UQjbJ8PqKsscMGq1TwQZ/vKK+zvDqszUMf6UjLApkz9
	 kDky0JxLx98gu4gHZx/KQbmwxwOU/qK1jhaVlsIw=
Date: Fri, 30 Oct 2026 18:24:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.4-rc1
Message-ID: <auTg9t-da3RFo9nx@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_112501_558045_9C03A5C4 
X-CRM114-Status: GOOD (  14.70  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

Here are three fixes that turned up during the merging window: shadow
stack not freed during a failed fork or it is unmapped from parent when
a worker thread exits (same commit covers both); PTE_CONT set on
PROT_NONE entries but subsequently ignored by the unfolding code since
pte_valid() is false (pte_present() is true); an MPAM lock not released
on the error path. Thanks!

The following changes since commit d0de3a73194a250a2e5ffbf1dc604c0bcbb16e8a:

  Merge branch 'for-next/fw-rmi' into for-next/core (2026-10-15 19:09:31 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to f46be4da2cbb17574b5369517a9a1e1b414063b4:

  selftests/arm64: GCS must not leak on a failed clone3 (2026-10-29 20:42:23 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Release the GCS on a failed fork. copy_thread() can allocate a GCS
   for CLONE_VM threads but a later copy_process() failure left the VMA
   in the parent's mm. Implement exit_thread() to free it and stop
   kernel threads and user workers inheriting the parent's GCS
   base/size. Add a kselftest for the clone3() failure case

 - Do not set PTE_CONT on invalid PTEs in contpte_set_ptes(). Batched
   set_ptes() of present-invalid entries (e.g. PROT_NONE) created contpte
   groups that the single-PTE helpers did not unfold, corrupting a
   neighbouring guard marker via test_and_clear_young_ptes()

 - Release the MPAM mon_sel lock on the mpam_save_mbwu_state() error
   paths

----------------------------------------------------------------
Iván Ezequiel Rodriguez (2):
      arm64/gcs: release GCS on failed fork
      selftests/arm64: GCS must not leak on a failed clone3

Ping Li (1):
      arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors

Zhao Gongyi (1):
      arm64/mm: restrict transparent contpte mappings to valid PTEs

 arch/arm64/Kconfig                                 |   1 +
 arch/arm64/include/asm/pgtable.h                   |   3 +
 arch/arm64/kernel/process.c                        |  17 +++
 arch/arm64/mm/contpte.c                            |   4 +-
 drivers/resctrl/mpam_devices.c                     |  12 +-
 tools/testing/selftests/arm64/gcs/.gitignore       |   1 +
 tools/testing/selftests/arm64/gcs/Makefile         |   3 +-
 .../testing/selftests/arm64/gcs/gcs-clone-pidfd.c  | 168 +++++++++++++++++++++
 tools/testing/selftests/arm64/gcs/gcs-locking.c    |  20 ---
 tools/testing/selftests/arm64/gcs/gcs-util.h       |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c       |  20 ---
 11 files changed, 224 insertions(+), 49 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c

-- 
Catalin

