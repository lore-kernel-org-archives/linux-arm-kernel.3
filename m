Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BA4CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YDDudy93Qt6NRe3X6MCDF5AVld8isjkmSup5quV1GdU=; b=2tGYrCYfglkJmeTYzsurwqs0a9
	o8krzss8smQfAvhIOAyX82DnQTqEkHXQA3NUGwabF9sKHuBFs/+xww5yDwcK3+8JWyXmMfclkIVYY
	CO3GGa0fLIyHUdgQGh95Cswn2bBY0WgwG90O/v2j9bmk2WoiMV2hofIOOypZA5YgaDYEI8ZdgYaBf
	By0zIsyLZaSkLl8iMxkWIoZZak64OBT/wnfBwa0X6pt1MFHkWkVss7KiX3e1R2b6scwRDADQ0hbvM
	WWZAFt5dlh7ulV7q9P4iOp86AZWLRUocVYZBiyRvYYX3FUca36++xZRLFM/7IySdulJIQ9jKBkoR/
	H0vCsCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnQ-0000000EIXA-1rtj;
	Mon, 01 Sep 2025 23:18:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0i-0000000Dlm3-3DO9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YDDudy93Qt6NRe3X6MCDF5AVld8isjkmSup5quV1GdU=; b=SAs//vJqCmbVPlBWKcGXASO7He
	G+k7aTWy6JnLUG0+fju8jUbFV/pm33Y4Cdbv5aj6aDBVgYz9b62p7plp+dkAzCIuB49z+GQCjKFla
	LGB9KBhlsCVqUiNJu/b3aewT7u5hR0NTDvL5RvAT6uoYOeC1wLj1vyg+y5O7zvc2ZuXFkDPpxbBft
	x2HaduWiN5pIR5Kwkj9Ubt5OqlqfN7ZrixDZsqYesU+z23TIytj0EceXX5bAuDmnXwlYMcV/Kes6p
	fFHNQkOcslqYSjvZokfLNkXX5CeoyWw/DbHOw3HS5SP+qufa/TEhK6AihtcpIHy0sRudHEv/+7LEx
	Eg15xTeA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0a-00000003rmW-0JBS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6412448D3;
	Mon,  1 Sep 2025 20:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A09FC4CEF0;
	Mon,  1 Sep 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758002;
	bh=LoGorSDHkEkIDGpixgk16+eL3mYFxlvutZWyJcKrM/I=;
	h=From:To:Cc:Subject:Date:From;
	b=AIzhIB/CNTd0wQFTtQjTvf7CsPNPwGEkwECUVhQOAz+FgHxLrCvXjjQTQKSXXcMB7
	 HAFQwwyPtBlLZgivyflOdd+HxDbrXS1bYj7HuhR75Pf4piROorXcT+eMYY0cGTaJXz
	 jU20iRaetmGGLVL8ixBenxqd0DXxsVtgTe/XywK8pjUdRtp0wwsnSycmifhMWTHm3m
	 gMlqHexiPwAgKPX9uoJRLLtRAbl0TN0vofhHgWAlyV87Rxl7Aokfuo2luCm5+fDzeU
	 +NKtrOtCxyJd8LDrfZgg29Sxa9hqhUvlHTqooqlRV/VGc/rVqx0DbKF+ABC2/PoCyb
	 QZDoRWJ6VDFvA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/6] Curve25519 cleanup
Date: Mon,  1 Sep 2025 13:18:09 -0700
Message-ID: <20250901201815.594177-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212011_763954_8570DADA 
X-CRM114-Status: GOOD (  10.64  )
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

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git curve25519-v1

This series removes the unused crypto_kpp support for Curve25519,
migrates curve25519-selftest to a KUnit test suite, and reorganizes the
generic and arch-optimized Curve25519 code to all be located in
lib/crypto/ and built into a single libcurve25519 module.

Eric Biggers (6):
  crypto: curve25519 - Remove kpp support
  lib/crypto: tests: Migrate Curve25519 self-test to KUnit
  lib/crypto: tests: Add Curve25519 benchmark
  lib/crypto: curve25519: Move a couple functions out-of-line
  lib/crypto: curve25519: Consolidate into single module
  wireguard: kconfig: Simplify crypto kconfig selections

 arch/arm/crypto/Kconfig                       |   13 -
 arch/arm/crypto/Makefile                      |    2 -
 arch/arm/crypto/curve25519-glue.c             |  137 --
 arch/m68k/configs/amiga_defconfig             |    1 -
 arch/m68k/configs/apollo_defconfig            |    1 -
 arch/m68k/configs/atari_defconfig             |    1 -
 arch/m68k/configs/bvme6000_defconfig          |    1 -
 arch/m68k/configs/hp300_defconfig             |    1 -
 arch/m68k/configs/mac_defconfig               |    1 -
 arch/m68k/configs/multi_defconfig             |    1 -
 arch/m68k/configs/mvme147_defconfig           |    1 -
 arch/m68k/configs/mvme16x_defconfig           |    1 -
 arch/m68k/configs/q40_defconfig               |    1 -
 arch/m68k/configs/sun3_defconfig              |    1 -
 arch/m68k/configs/sun3x_defconfig             |    1 -
 arch/powerpc/crypto/Kconfig                   |   13 -
 arch/powerpc/crypto/Makefile                  |    2 -
 arch/s390/configs/debug_defconfig             |    1 -
 arch/s390/configs/defconfig                   |    1 -
 arch/x86/crypto/Kconfig                       |   13 -
 arch/x86/crypto/Makefile                      |    5 -
 crypto/Kconfig                                |    8 -
 crypto/Makefile                               |    1 -
 crypto/curve25519-generic.c                   |   91 --
 crypto/testmgr.c                              |    6 -
 crypto/testmgr.h                              | 1225 -----------------
 drivers/crypto/hisilicon/Kconfig              |    1 -
 drivers/crypto/hisilicon/hpre/hpre_crypto.c   |  394 ------
 drivers/net/Kconfig                           |   15 +-
 include/crypto/curve25519.h                   |   40 +-
 lib/crypto/Kconfig                            |   37 +-
 lib/crypto/Makefile                           |   27 +-
 .../crypto/arm}/curve25519-core.S             |    0
 lib/crypto/arm/curve25519.h                   |   47 +
 lib/crypto/curve25519-generic.c               |   25 -
 lib/crypto/curve25519.c                       |   64 +-
 .../crypto/powerpc}/curve25519-ppc64le_asm.S  |    0
 .../crypto/powerpc/curve25519.h               |  124 +-
 lib/crypto/tests/Kconfig                      |   10 +
 lib/crypto/tests/Makefile                     |    1 +
 .../curve25519_kunit.c}                       |  100 +-
 .../crypto/x86/curve25519.h                   |  127 +-
 42 files changed, 232 insertions(+), 2310 deletions(-)
 delete mode 100644 arch/arm/crypto/curve25519-glue.c
 delete mode 100644 crypto/curve25519-generic.c
 rename {arch/arm/crypto => lib/crypto/arm}/curve25519-core.S (100%)
 create mode 100644 lib/crypto/arm/curve25519.h
 delete mode 100644 lib/crypto/curve25519-generic.c
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/curve25519-ppc64le_asm.S (100%)
 rename arch/powerpc/crypto/curve25519-ppc64le-core.c => lib/crypto/powerpc/curve25519.h (56%)
 rename lib/crypto/{curve25519-selftest.c => tests/curve25519_kunit.c} (96%)
 rename arch/x86/crypto/curve25519-x86_64.c => lib/crypto/x86/curve25519.h (94%)

base-commit: 362f92286065d9f8282da5def89e173a12191568
-- 
2.50.1


