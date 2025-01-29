Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F8C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 00:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJQf0TPyuhEeQZ0a4V+OZ72Iu2iKhB0OFe4o6fsP+TM=; b=xH1A0TgOX0FV221emC18ZyMU0P
	z3/hCtGlb0O1qAMXoQhX1TfZctJ5qPMDIUGVPJg6/10QigjeY+gIMr4sbzF5ZJV2HkU1g0/G7ySVy
	TNelSrQxwuQvPTj6QLsaKuidhGP6qOobTjDE0oz2Vpkn2GDdf9lfMdJthhyoXsEUsd2YlCkxmGTXx
	VQnzD2ySlr4OIW+tLaPZHwUvDQJhjARMr64vrdzCXomqvyTDv8xTnzXyKcIPHyWYGd9M0y0G1jnAQ
	QzSMeF0ltxGzI0IhluRZcd6Kf4QJNG3UHWStzSGuAAfvedK8AWSw3uyvRB1p6aYcQk6uMnV4NacWD
	xa7RAWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwOD-000000067T6-1hCp;
	Wed, 29 Jan 2025 00:57:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwMs-000000067G4-2ELP;
	Wed, 29 Jan 2025 00:55:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6219CA415EA;
	Wed, 29 Jan 2025 00:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0E2C4CED3;
	Wed, 29 Jan 2025 00:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738112144;
	bh=7lLgfsbUvvXkuZ/CHyObEqTqK07OIPpnMi3L8CLFkWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a0Tp33LEr5mdpx4Jdes8W04nWqwEaLorvXlTwLQeltYmYb4klZ+1dz2ywlTC1b8vX
	 3+k4ui1fUmLbcFjL5APZZHqXajEfDw8XK18yEtuoVQbYLE2/KJ3OWDxcoyJSsIsYNE
	 DtQEthCyYqS56sQa1kB1Swn6qPUBhCaLAgWkwja3f55uChLvycrhuijZWm8POhmtni
	 ykUeyJuvAvFNmoLZJQP4RIXBzVayDzL59pE6M7xHqHJCz+rWiTvl4EPHbNFmFx8Chm
	 4j7efWWME8OF3uvIkfJk+9cFoNkYjHICLOSesiRjPTBgLZGNKhAvpDasPjs5mHTnv5
	 F99y903Tt3oVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE01380AA66;
	Wed, 29 Jan 2025 00:56:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v4 00/19] Wire up CRC32 library functions to
 arch-optimized code
From: patchwork-bot+f2fs@kernel.org
Message-Id: <173811217076.3973351.8137382917166262630.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jan 2025 00:56:10 +0000
References: <20241202010844.144356-1-ebiggers@kernel.org>
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_165546_702317_576D15DE 
X-CRM114-Status: GOOD (  11.04  )
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

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Sun,  1 Dec 2024 17:08:25 -0800 you wrote:
> This patchset applies to v6.13-rc1 and is also available in git via:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v4
> 
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,01/19] lib/crc32: drop leading underscores from __crc32c_le_base
    https://git.kernel.org/jaegeuk/f2fs/c/0a499a7e9819
  - [f2fs-dev,v4,02/19] lib/crc32: improve support for arch-specific overrides
    https://git.kernel.org/jaegeuk/f2fs/c/d36cebe03c3a
  - [f2fs-dev,v4,03/19] lib/crc32: expose whether the lib is really optimized at runtime
    https://git.kernel.org/jaegeuk/f2fs/c/b5ae12e0ee09
  - [f2fs-dev,v4,04/19] crypto: crc32 - don't unnecessarily register arch algorithms
    https://git.kernel.org/jaegeuk/f2fs/c/780acb2543ea
  - [f2fs-dev,v4,05/19] arm/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/1e1b6dbc3d9c
  - [f2fs-dev,v4,06/19] loongarch/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/72f51a4f4b07
  - [f2fs-dev,v4,07/19] mips/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/289c270eab5e
  - [f2fs-dev,v4,08/19] powerpc/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/372ff60ac4dd
  - [f2fs-dev,v4,09/19] s390/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/008071917dfc
  - [f2fs-dev,v4,10/19] sparc/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/0f60a8ace577
  - [f2fs-dev,v4,11/19] x86/crc32: update prototype for crc_pcl()
    https://git.kernel.org/jaegeuk/f2fs/c/64e3586c0b61
  - [f2fs-dev,v4,12/19] x86/crc32: update prototype for crc32_pclmul_le_16()
    https://git.kernel.org/jaegeuk/f2fs/c/1e6b72e60a5a
  - [f2fs-dev,v4,13/19] x86/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/55d1ecceb8d6
  - [f2fs-dev,v4,14/19] bcachefs: Explicitly select CRYPTO from BCACHEFS_FS
    https://git.kernel.org/jaegeuk/f2fs/c/cc354fa7f016
  - [f2fs-dev,v4,15/19] lib/crc32: make crc32c() go directly to lib
    https://git.kernel.org/jaegeuk/f2fs/c/38a9a5121c3b
  - [f2fs-dev,v4,16/19] ext4: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/f2b4fa19647e
  - [f2fs-dev,v4,17/19] jbd2: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/dd348f054b24
  - [f2fs-dev,v4,18/19] f2fs: switch to using the crc32 library
    https://git.kernel.org/jaegeuk/f2fs/c/3ca4bec40ee2
  - [f2fs-dev,v4,19/19] scsi: target: iscsi: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/31e4cdde4d8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



