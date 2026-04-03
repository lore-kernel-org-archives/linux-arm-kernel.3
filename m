Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA37E7E35E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ruCqB3/pL3/NGcM0sCiCf50HfVwh7yqzIADvTdNecvY=; b=o3ZD3/KDJOAp0AcO4n1pM0gcCY
	ZOlf7VGawjfDrbBf8Yk7Zt6LEYU1f31dCwtHWQCIfA8Dzaas97kgEnFv1QUJxqU5H0uEj8nc8bxXv
	XGd7Sz8xC0H3qvEx2qIqPZVZsdA19w5UVuxP+fVxoihYTp3EFm8ESWrlUHcAFbA/mh5Rl3Rqpa6+c
	iXYPEGj6hgfI1oGjx016ktH/nGT/dMLDJxV3OvNAW/aCaQM2+oWv4HZCpCT9TVl4UmwCYVn/STqF8
	jfuIFT4RfBvcCHteDDVmvSzdeeM4/zqAGFTkedH6yIP6ojX4cyoP3F3fI6+GDv2kFChxrhwwh14zi
	tVJwKuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b5J-00000001q1G-3arC;
	Fri, 03 Apr 2026 09:45:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b5J-00000001q0e-0vkS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39C1E60008;
	Fri,  3 Apr 2026 09:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347D2C4CEF7;
	Fri,  3 Apr 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775209499;
	bh=IuR4blB8wmpp6he85y4L3StdxuF4DElLSlSeh4ZnhRI=;
	h=Date:From:To:Cc:Subject:From;
	b=cR33W1v0ZEHORp/4TS1wFE1ScKMWDxVdk6XloO5zQv15jHquqgzR6KbYansGsVLkr
	 S6SFIZDgfpfNceuwqFCROagEpFq58bQq/stot06ZUYTpM5FdX2Haz+ifkU1eiUwQBy
	 NZXRZ0uN50vfxrNGg4xc3dLwFbIiJW+ESOIkbUwCvrYMKePt2D0KcuNlYi6M9jSB4F
	 RU9k/XvqcDGb58c52Gven2o4t/Nwc226P2IKV4RcR4Mchm2K5oQV1PNVsMF6hd9cmk
	 lfrnj0Jf+MbOC6EXUC5tSlnGZPlorBBZMz4ootqZ+9h9zK7ZSx4oOijJQJba363F5e
	 CggDsRAN1icoA==
Date: Fri, 3 Apr 2026 10:44:55 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	ardb@kernel.org
Subject: [GIT PULL] arm64 fix for 7.0
Message-ID: <ac-MF-N_-wrXkjrF@willie-the-truck>
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

Please pull this lone arm64 fix for v7.0.

Although it's slightly involved, it's been in the works for a while and
resolves a user-triggerable kCFI failure via perf.

Cheers,

Will

--->8

The following changes since commit 8c6e9b60f5c7985a9fe41320556a92d7a33451df:

  arm64: realm: Fix PTE_NS_SHARED for 52bit PA support (2026-03-19 12:46:05 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 54ac9ff8f1196afc49d644a1625e0af1c9fcf7f5:

  arm64: Use static call trampolines when kCFI is enabled (2026-04-01 15:29:59 +0100)

----------------------------------------------------------------
arm64 fix for v7.0

- Implement a basic static call trampoline to fix CFI failures with the
  generic implementation.

----------------------------------------------------------------
Ard Biesheuvel (1):
      arm64: Use static call trampolines when kCFI is enabled

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/static_call.h | 31 +++++++++++++++++++++++++++++++
 arch/arm64/kernel/Makefile           |  1 +
 arch/arm64/kernel/static_call.c      | 23 +++++++++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S      |  1 +
 5 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/include/asm/static_call.h
 create mode 100644 arch/arm64/kernel/static_call.c

