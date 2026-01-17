Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F57C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BoTWwyEOiE4iPFpO637qzhdXt60YOck3Sc2tyG/LRk=; b=13TW8G/2U7mAb5Mf99pxwtOtos
	grDY0rw8lAZcb9KI/Q6ErdbeKD4KMqpC3wlpPaMjK/G7zt0KoqSy9rsKQvjQYo1zn2/NdECgDesKW
	kS9JDG0WcDe3y+W0ZDEPyDsSxk7W2NOet0mVGWsycrE7e1DYRRQ85+utG4n7cXCBIUSL0GETcRXrO
	FrmzdVs23Nq3x5sg5omkZDucibuPtfjNHZMqMwBoedh8sBZW0FkOwUd5qGKwt8nJWKS0p6v0QOMs8
	zAYa6IgDR47Qsx4kxzLhWDivz5RDUN6ehHxsBY0LMXBuGVdN8cdn2aJ3fcH4ZTf5bR0OvUwOR2a/C
	6W6uHYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh6vx-0000000FaDd-3Ysv;
	Sat, 17 Jan 2026 14:05:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh6vv-0000000FaDE-29Io
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 14:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46A1D43552;
	Sat, 17 Jan 2026 14:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCC2C4CEF7;
	Sat, 17 Jan 2026 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768658742;
	bh=vF+mU7/KmQT85TX8LyZU3XygKnEZbzAS9VQnTtaA88s=;
	h=Date:From:To:Cc:Subject:From;
	b=AIJhvjDU5fo+PSeDgUSBQLdMkpomq0c6h8Ol/lEIKs0rrbADbxwARiOK9b7bVobjD
	 YxW9KIaN+2LxSNR5AqBGB+Eda1DQs9uu/w/APWrUHUvSPZlHtdJ8lo0XWGhwJy7B0Q
	 XEXOloF6+ACDq7ZF4XR2bC3pxSvd1E0hSaBm8nsSu/64czfxXEEP2rEqYY15ul4Nli
	 oCQYPH3MZ2RREiM0ZTEuLLwCD7d+tNZcqkOajPr5qFlRP1gV0vQx1j1/SBHTj0GTgr
	 iHwVv5yShCApnVj3vxMgOL6rnaIAlSGIsLGGwomeI8+6M5p/HBv2pDqIhj2elF6O2d
	 UpUXHXrikmCCQ==
Date: Sat, 17 Jan 2026 14:05:37 +0000
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.19-rc6
Message-ID: <aWuXMab4BxnbUbOG@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_060543_593297_D1338DC7 
X-CRM114-Status: UNSURE (   7.77  )
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

Please pull the arm64 fixes below. Thanks.

The following changes since commit bdf3f4176092df5281877cacf42f843063b4784d:

  arm64: Fix cleared E0POE bit after cpu_suspend()/resume() (2026-01-09 10:41:45 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to b9f5c38e4af1a094384650d2fc79fb992d6d5e64:

  arm_mpam: Use non-atomic bitops when modifying feature bitmap (2026-01-16 12:04:20 +0000)

----------------------------------------------------------------
arm64/mpam fix to use non-atomic bitops on struct mmap_props member
(atomicity not required). For kunit testing, the structure is packed to
avoid memcmp() errors but this affects atomic bitops as they have strict
alignment requirements.

Also remove a duplicate include in the mpam driver.

----------------------------------------------------------------
Ben Horgan (1):
      arm_mpam: Use non-atomic bitops when modifying feature bitmap

Jiapeng Chong (1):
      arm_mpam: Remove duplicate linux/srcu.h header

 drivers/resctrl/mpam_internal.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
Catalin

