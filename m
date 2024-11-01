Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D3FE6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g6cEvAREClCSfqjyZha+LqUc9gLH61MKgjcYBEJLo3M=; b=c/UgUIXI2Bfh5iEuL2IMbDgZWG
	h8j2jrJoh57dQ+2TgBpZtpAU8K8j9mPgrls5279+Y9FjvKqaaN6orGj+aiVfN5FJXlyooBmngzYxy
	vZoPY/BxS9rzBJyr+WAPA3EdQkA+9WNpkonmbYJGAdGR9matcubQS1ml05mDqS0ZWXT5tnNF56Rt0
	EUP6RfQyr63Akwi2+Np/clNsRMCxZBKTkcim7Q0qCWgGK6ahXvDqbkDosKSgsl8FLk/EZHIp+rQYy
	MGdWXvCeq+DokklG5XtoJc4Gdv1EB7riq7ZtJKrf2LGu2bPxjRuiCHIhmCO4tOCwnfPz6GfgFsR3/
	nOEKbU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pl9-00000006jt8-2SjV;
	Fri, 01 Nov 2024 11:24:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6pjU-00000006jhg-2I5W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F9B5A4361B;
	Fri,  1 Nov 2024 11:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAC8C4CECD;
	Fri,  1 Nov 2024 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730460142;
	bh=tdlKZn5k9PFGSFM3oyQ39p7jeTDTtFbsaHyBExgxcc4=;
	h=Date:From:To:Cc:Subject:From;
	b=u+vndXs6+N2NMKcDk1uYSOhshrJfQimS3Dj/T0hKQyyRlX32URiSTCa9ee7Et2ZUe
	 uFybPerwA5m7yvgpHLmLjS91DsdiJbFAEePvO/ipqptIKxSuT1evPNV7HOp3I02RN4
	 i9f9aleIBVO9GTQO1cyrfigqGpOO+22KSPZqeiraSZTNRqvQrsAC4FTFhgtLCpTXl9
	 fAmsR0aqjtjfKriH+F/+6aYC6EkHhEa0Upa058jV14S4uCdnZxi2ZG/1qfMQXGMOhT
	 srMc8xBrDSM8byIFGEbUIbwV572KBphqHkAppfkgEIjNFHKB9/1N1sLhPcMKEatJq3
	 WDvIxC/T/U2rg==
Date: Fri, 1 Nov 2024 11:22:08 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc6
Message-ID: <20241101112207.GA8472@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_042224_670321_B99541BC 
X-CRM114-Status: GOOD (  13.56  )
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

Please pull these arm64 fixes for -rc6. The important one is a change to
the way in which we handle protection keys around signal delivery so that
we're more closely aligned with the x86 behaviour, however there is also
a revert of the previous fix to disable software tag-based KASAN with
GCC, since a workaround materialised shortly afterwards.

I'd love to say we're done with 6.12, but we're aware of some longstanding
fpsimd register corruption issues that we're almost at the bottom of
resolving. Hopefully we'll be done reviewing the fixes next week, so
there'll be one more pull from me before the merge window opens.

Cheers,

Will

--->8

The following changes since commit 7aed6a2c51ffc97a126e0ea0c270fab7af97ae18:

  kasan: Disable Software Tag-Based KASAN with GCC (2024-10-15 11:38:10 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 2e8a1acea8597ff42189ea94f0a63fa58640223d:

  arm64: signal: Improve POR_EL0 handling to avoid uaccess failures (2024-10-29 17:59:12 +0000)

----------------------------------------------------------------
arm64 fixes for -rc6

- Fix handling of POR_EL0 during signal delivery so that pushing the
  signal context doesn't fail based on the pkey configuration of the
  interrupted context and align our user-visible behaviour with that of
  x86.

- Fix a bogus pointer being passed to the CPU hotplug code from the
  Arm SDEI driver.

- Re-enable software tag-based KASAN with GCC by using an alternative
  implementation of '__no_sanitize_address'.

----------------------------------------------------------------
Kevin Brodsky (1):
      arm64: signal: Improve POR_EL0 handling to avoid uaccess failures

Marco Elver (2):
      kasan: Fix Software Tag-Based KASAN with GCC
      Revert "kasan: Disable Software Tag-Based KASAN with GCC"

Xiongfeng Wang (1):
      firmware: arm_sdei: Fix the input parameter of cpuhp_remove_state()

 arch/arm64/kernel/signal.c   | 92 +++++++++++++++++++++++++++++++++++++-------
 drivers/firmware/arm_sdei.c  |  2 +-
 include/linux/compiler-gcc.h |  4 ++
 lib/Kconfig.kasan            |  7 +---
 4 files changed, 85 insertions(+), 20 deletions(-)

