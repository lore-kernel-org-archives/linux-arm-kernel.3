Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E392AC3ABCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kygn5OfCMaFwrigU5Jfdz3S0EdTnF7yVIhmX5bew10Y=; b=jL8kF8ytu1PVEImqZzZA3D2H5X
	Kpx/Ys6FkV3ufT60mDo/xtGn5LJzC7jWIZ+HS73XQ4U5M1fpqfx7ND/uGT/WwoarW/pupoYDQGe21
	n+4YP37//Zhl0GJiHcuS4YeLIFqnMDL/34BkhaCjhg7l4oDuK2dc/d64IWC803LHkn7ot1jh8s8Ah
	nV7rOqDTW6V7wY+f8kBJLulrjU1tF9NekGLCiusE89QjiYZ/P3EIUE5T2nS8dGUnFVG3BXUSb1Hmp
	eTfPEniFuyigKk1wC7Odktvqqs2a9tJ72Pej/0mRphjbPIvQjR/UJCq7+2aV/llAksRqw4wDtjyFz
	R/xHWJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHy-00000004muq-2mDz;
	Fri, 09 May 2025 20:25:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRBF-00000004OWp-1VQ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 17:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 777E2A4CC01;
	Fri,  9 May 2025 17:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B5FC4CEE4;
	Fri,  9 May 2025 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746810396;
	bh=bLrG4AeCKcaCZecQ3OBE7o5nVNNOZXHqtgg2+3E4HV0=;
	h=Date:From:To:Cc:Subject:From;
	b=M4Z87hjapxMsxwQN5+tN7SFmT+BSolRWLPpHPkxTCYYqJdJj0YZ8OLr/9hah/T+/T
	 qYmpwEiqTyuMPwXDpOSuSO20hz1aS0LD5R0KCxYvGpIN+3IWPnScjDtft3lrmsZ2+P
	 91Ex18SojWYhgxx9r/g/7FuIngP6XcvyH/Y+48px4wQVPtKhSaoNQQiVStEs8rGelf
	 JLfDRuXB4dExsJm7hjSv/OD3V4uPOnMOa8BaQebqxo18kS8NYLT/YWywBIwX5+kAjM
	 GVIb8lWbl6qkl2uzqYzhSIfSdX64a16KkFNnAQbvhlgFnrBL/ilr6/SWfibVGWruZM
	 bOk7u935yI9ZQ==
Date: Fri, 9 May 2025 18:06:32 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.15-rc6
Message-ID: <aB42GJfIypFqk9aC@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_100637_463725_D6802118 
X-CRM114-Status: UNSURE (   9.11  )
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

Please pull the arm64 fix below. Thanks.

The following changes since commit fee4d171451c1ad9e8aaf65fc0ab7d143a33bd72:

  arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays (2025-05-01 17:44:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552:

  arm64: cpufeature: Move arm64_use_ng_mappings to the .data section to prevent wrong idmap generation (2025-05-06 11:43:44 +0100)

----------------------------------------------------------------
Move the arm64_use_ng_mappings variable from the .bss to the .data
section as it is accessed very early during boot with the MMU off and
before the .bss has been initialised. This can lead to incorrect idmap
page table.

----------------------------------------------------------------
Yeoreum Yun (1):
      arm64: cpufeature: Move arm64_use_ng_mappings to the .data section to prevent wrong idmap generation

 arch/arm64/kernel/cpufeature.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
Catalin

