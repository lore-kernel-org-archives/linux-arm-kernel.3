Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 23:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7MDrgeUhJWbE7sp5fnz2b8a6FYagH+pP/VJzhmDRiyA=; b=GPDXDc3rI2HMksG/e/mt4TedWL
	j0P6NWZ4xRtDQzTOmPs9KrRreuD0j9lgxLcUky+d0tItC+AHojCE/+RExzPOSf6BiKypKGLsi6ejP
	I6mCJT6WD+Af5a/fh7xRC4igRBgJF8lGRHBeYOY6NszfbgaE1/7FUCVwcIJIQm4UYRnAWxtt7D+lH
	4M4JYnKYYzW5Z4uN+YHga0NuSAmhMtLPJZA0L4lMu9VXnmTZbthgQro900aIllxxltD8MLWPtGQGL
	xdMXmj+El+5NNZt0kzwfvl/kRgxmMI2SNEbXNayZU+WSgJY8l1ATDyi3qvexLs5g8iZaADVIb5oo0
	VENP4RpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBLth-00000004a6u-3e94;
	Sat, 03 May 2025 23:03:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBLrn-00000004Zxi-44Ty
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 23:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A46749EA4;
	Sat,  3 May 2025 23:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7050FC4CEE3;
	Sat,  3 May 2025 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746313314;
	bh=D04544YY5YKWIz+eOOancW9M0tIDtWJNvQo1W+YhcT8=;
	h=From:To:Cc:Subject:Date:From;
	b=U8H3Nx7fg8O4Zbd2BdnB5FwH/GXIQDayV/jEpHLxSpWW/FoKlMzI+RULL9IG9z1aX
	 pPzavXXcQ5VrXBfCk7w9WiA1fF9Zk7zvcWlDJ0LbcBY1yBwuOuGPI+B8APhRgPgVzd
	 RHCuk9O1Hsq379RzC10htGKnATBuscJmGtUGjbVoXkccZu32gh1IP5nMVRfSyo/zxg
	 zVVHC8MfZT3tM2bDzccoHS7R7/ME6U107EZLHFDr8p22tUszWTEE7Hp0Q4IC0L9iQQ
	 f3MPvIDzgH3EEujJn35QCrufmEzAytCftplRVaaMqAOcpOFFdK1FxAtNhBZRfG2VT/
	 /MUBWitJD/Hng==
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.15-rc5
Date: Sun,  4 May 2025 00:01:51 +0100
Message-Id: <20250503230151.2578203-1-cmarinas@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_160156_032502_221D3E3E 
X-CRM114-Status: UNSURE (   6.44  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to fee4d171451c1ad9e8aaf65fc0ab7d143a33bd72:

  arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays (2025-05-01 17:44:18 +0100)

----------------------------------------------------------------
Add missing sentinels to the arm64 Spectre-BHB MIDR arrays, otherwise
is_midr_in_range_list() reads beyond the end of these arrays.

----------------------------------------------------------------
Will Deacon (1):
      arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays

 arch/arm64/kernel/proton-pack.c | 2 ++
 1 file changed, 2 insertions(+)

