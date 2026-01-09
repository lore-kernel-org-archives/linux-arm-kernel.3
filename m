Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1939D26D8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 18:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jja8ThL6rgLzr/oZUoKTJO9gol8v7VUb5wvDr63vWw4=; b=ncgcwYnao67H4tVi7bmBnkqFTV
	kZwBerNQ0mZb5lYJofQEeHW+iAN8+My18veald0dqhQKPvoJdTQG1KhoO/iHkAW2LMcXM+531pYhw
	57u86PxKazX0XfTxXMXG4bWDH7mXnQxEXpYiGeBntJdSPcWUkFn7gWRHvpIIcrIVEtYXb6NR+H2hG
	1kZlM+Z1DbRgadoEab0Cb3rmMNoKI+TrjxtmQUxmau3WCvQCc2cKtkRyW9x/YQjtkio0vjnedS2lW
	TRRhKA+H8KE7VsAVHu7pZopPH8dPL9ALM8i9JJXLrE8NTiZMB+ZGoKzrlElXww8uwLF918ECtPbLN
	TtyQBQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHCv-00000002soO-2qu0;
	Fri, 09 Jan 2026 18:27:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHCu-00000002soH-1qRj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 18:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88AAF600B0;
	Fri,  9 Jan 2026 18:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5493AC4CEF1;
	Fri,  9 Jan 2026 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767983251;
	bh=TvQl9Qf3hEAIfbGSczlay12HmrEEnB0WT5qdvpK6iZw=;
	h=Date:From:To:Cc:Subject:From;
	b=e63yYhmOOIOARhpAT0+gOLJ39IgaIkaHkIte1DB26AOiZPfFYOoxrBftCc+jpkZmq
	 eKIBKasaKpbcqxivlPt022bHd8zWX9wKBAjBnSq8u91gTnnNmvtym9MwCHceNOupmB
	 IbFGTp91buFtHWXTi/wJea5HpV/G6DKZdgnAGxJEuh3ZMkjjtj6oHa/cigetaSRgds
	 z2ebtbpf2RTMk965lygeiRORvFiOXCzqk0T8smUd9SNXStMr+A85k21xcW5CMLxwIH
	 zbZ4Xuv/Xn48abgKudTtZgBEEDEhR86titdEms+PHHDiZHIBywPJ1Pg482TYF1YadP
	 bOsQmY5fhz0Cg==
Date: Fri, 9 Jan 2026 18:27:27 +0000
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.19-rc5
Message-ID: <aWFIj0hGUQK1ywDu@arm.com>
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

Please pull the arm64 fixes below. Thanks.

The following changes since commit f4ea8e05f2a857d5447c25f7daf00807d38b307d:

  lkdtm/bugs: Do not confuse the clang/objtool with busy wait loop (2025-12-19 15:09:09 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to bdf3f4176092df5281877cacf42f843063b4784d:

  arm64: Fix cleared E0POE bit after cpu_suspend()/resume() (2026-01-09 10:41:45 +0000)

----------------------------------------------------------------
arm64 fixes:

 - Do not return false if !preemptible() in current_in_efi(). EFI
   runtime services can now run with preemption enabled

 - Fix uninitialised variable in the arm MPAM driver, reported by sparse

 - Fix partial kasan_reset_tag() use in change_memory_common() when
   calculating page indices or comparing ranges

 - Save/restore TCR2_EL1 during suspend/resume, otherwise the E0POE bit
   is lost

----------------------------------------------------------------
Ben Horgan (2):
      arm64/efi: Don't fail check current_in_efi() if preemptible
      arm_mpam: Stop using uninitialized variables in __ris_msmon_read()

Jiayuan Chen (1):
      arm64: mm: Fix incomplete tag reset in change_memory_common()

Yeoreum Yun (1):
      arm64: Fix cleared E0POE bit after cpu_suspend()/resume()

 arch/arm64/include/asm/efi.h     | 2 +-
 arch/arm64/include/asm/suspend.h | 2 +-
 arch/arm64/mm/pageattr.c         | 6 ++++--
 arch/arm64/mm/proc.S             | 8 ++++++++
 drivers/resctrl/mpam_devices.c   | 7 ++++---
 5 files changed, 18 insertions(+), 7 deletions(-)

-- 
Catalin

