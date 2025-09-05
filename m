Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BDFCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRufCPMFDRB5BP7WufrbsHc7OBquOwEP4BACQjpn5S8=; b=Ry4KXz9I+BmqrW3Dr013DZKPFY
	NHvOoOe1r9CEJdC2MFeYl5u+2N+FfLUjjHJPVT1IubDstJjsF4EXVsbPaVoM4KM/gdsETqTZ55pWl
	Wh7VCsMcTbA5LoOMwDgA4jb9TUXVIZyBuZC737osK1eBFQ4S/wzRLm7F1ExTTGNiCT01UjZvFCWE+
	glOX5+EPznMFls6141qlxaWN+IZwlojOMykkVtCYhmnC1LAtIV9Ek3RizGi22v+Pt0Bu1kwXmcgDa
	AAB1G3u/ph34oEpY3VbshlACE3PuHgQ/4mHIzNSi3Hmy/cizL+Wv88N6et+cNZ316yunGkJvJJn8G
	olipUufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVc-00000005Rdk-3UmZ;
	Sat, 06 Sep 2025 00:10:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaLz-00000003WOJ-1rk4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 17:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7534B444E6;
	Fri,  5 Sep 2025 17:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668F5C4CEF1;
	Fri,  5 Sep 2025 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757093762;
	bh=umg3I6wPb8guAG/qPCKFRIIy4aNrvO/HLOtPHL8FpMI=;
	h=Date:From:To:Cc:Subject:From;
	b=VnVo+TTaKMzoU/HUmR6xMccJWH/cGlE+veh7agFbYMdgrmK1KW61uOcEViNn1/xth
	 TQK/MdaGT+rPeT5d2z7CPtIcog+zj0KkgkcJ81Fv/8F9v9xznAa9XUr9Qwg7S5959M
	 80K+BtTjfaeRA+MGJOMO3iYOKhXL1Glkg7jcTZLAOXsFigvR9KVKpLJByguety2jYO
	 s5vK7sI+S70t8AvJuCyPmzU3qsd15uds6YOjgdIOldgHg7396f0ojRAm461d7m1xlD
	 x/R5ZaeM3FE2UOdz7mZNE2kQ6qc7QTL+QMW2nFI615zFdUARe1nAdnh3yeNY1CeG3v
	 JxyGTtLA+Kvig==
Date: Fri, 5 Sep 2025 18:35:58 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.17-rc5
Message-ID: <aLsffo3bIIH4hYSQ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_103603_502489_FB412DF4 
X-CRM114-Status: GOOD (  10.22  )
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

The following changes since commit d82aa5d3501b25bfb7bc2a24a68ad0a83b2ad10b:

  kselftest/arm64: Don't open code SVE_PT_SIZE() in fp-ptrace (2025-08-30 11:31:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to a7ed7b9d0ebb038db9963d574da0311cab0b666a:

  arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE (2025-09-05 16:56:20 +0100)

----------------------------------------------------------------
arm64 fixes:

 - Incorrect __BITS_PER_LONG as 64 when compiling the compat vDSO

 - Unreachable PLT for ftrace_caller() in a module's .init.text
   following past reworking of the module VA range selection

 - Memory leak in the ACPI iort_rmr_alloc_sids() after a failed
   krealloc_array()

----------------------------------------------------------------
Miaoqian Lin (1):
      ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()

Thomas Weiﬂschuh (1):
      arm64: uapi: Provide correct __BITS_PER_LONG for the compat vDSO

panfan (1):
      arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE

 arch/arm64/include/asm/module.h           |  1 +
 arch/arm64/include/asm/module.lds.h       |  1 +
 arch/arm64/include/uapi/asm/bitsperlong.h |  5 +++++
 arch/arm64/kernel/ftrace.c                | 13 ++++++++++---
 arch/arm64/kernel/module-plts.c           | 12 +++++++++++-
 arch/arm64/kernel/module.c                | 11 +++++++++++
 drivers/acpi/arm64/iort.c                 |  4 +++-
 7 files changed, 42 insertions(+), 5 deletions(-)

-- 
Catalin

