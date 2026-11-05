Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1DB606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4tbtbqUv;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VFERPor+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ByyobXLELE/bjFm4Au6yl7YQTeoCQ2kyUgxykdqnO0c=; b=4tbtbqUvtPHrKtorpyDOKQ9LQ2
	jkvtnj04B9eQoFiC6FcEAG0n/qBHAeE1+TVCNhPuLuzg7RseekT93nd+7qMp4Wz6RXg4sXZD7nhGV
	rJRwdC1JrvBtIoqXHf3IwU2m9S0U7bGNvkUzFqxhG5fAF17DGJTnlSmFnb9k6PNADjf/jDymGEeS3
	gUa0eTfEAfX5wlz2RPRaNoE2lsNomWx2lQRSmZ8ZMOTae8OZnGg2Awc051h30yyD8GT/SIQgGQ6+a
	W/GolQ1VufJxjUj6ZFYKSFm+pl1ZfdhD89aEQnLVfmfeaCjjyqrb7tERGVhFYip1KvT1Hd5AqpYL+
	vO6NA6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6i3-0000000Ar7x-1sVG;
	Thu, 05 Nov 2026 23:17:31 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6i0-0000000Ar7e-0Mno
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 23:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793920648; x=1825456648;
  h=date:from:to:cc:subject:message-id;
  bh=VbCKN44mPAvdPLDkyfv/gIH8rB1O7pNJcO3wL4Z7pHQ=;
  b=VFERPor+Fi/VNrgew4EqmcVgSGQC0pAMT0nlLS8aXN5MRJw1U7b+jUIW
   XSXOKuA5W0+W4rOrEXSa8M6Ex+UmH8dENgZUw8irxCycGtR8MrGNeEcuK
   am79ht5/7lfPlrTTSJebnTKFV5FWYOBon8j/Zeqxk7pFkRKOwCYwWVOQg
   aA1/jC1QATW2U6rcWn3ddRoKMlEdnBif1F1yCezcQpiDJlqLfDBR2KJiL
   R2NiK5BBC/rab/znVc2wIR5Yt0AvA+lTknPJ4/Wbyo8GCZ17Pdcteab0P
   U0hsi4DtNvTaqBbwXxMyoGsMDSXgbiwocuVwMWVn2Az5O+nk6JP9mpsYQ
   g==;
X-CSE-ConnectionGUID: pW7bJpHOSJa6v5DjYXiJVA==
X-CSE-MsgGUID: 9Mg4l1NeS/mFHIiBWNeOGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2758878"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2758878"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:17:27 -0800
X-CSE-ConnectionGUID: kLCrB59ESKuK8uYbwjt/sg==
X-CSE-MsgGUID: 0daS2pjVQfe4I/icIjh/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7252657"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2026 15:17:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP6hv-00000000n0V-0Wa7;
	Thu, 05 Nov 2026 23:17:23 +0000
Date: Fri, 06 Nov 2026 07:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-pd-genpd-v7.5] BUILD SUCCESS
 9ae477db090b44816741fd9c49a3c459fc7d407b
Message-ID: <20261106071626.KkPcfYs2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_151728_229255_F9CF7374 
X-CRM114-Status: UNSURE (   5.22  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-pd-genpd-v7.5
branch HEAD: 9ae477db090b44816741fd9c49a3c459fc7d407b  pmdomain: st: ux500: Control DB8500 EPODs

elapsed time: 1467m

configs tested: 316
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261105    gcc-15.3.0
alpha                 randconfig-2001-20261105    gcc-15.3.0
alpha                 randconfig-2200-20261105    gcc-9.5.0  smatch
alpha                randconfig-r2100-20261105    clang-20   cocci
alpha                randconfig-r2106-20261105    gcc-11.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261105    gcc-14.4.0
arc                   randconfig-1001-20261105    gcc-14.4.0
arc                   randconfig-2000-20261105    gcc-8.5.0
arc                   randconfig-2001-20261105    gcc-8.5.0
arc                   randconfig-2002-20261105    gcc-8.5.0
arc                   randconfig-2003-20261105    gcc-8.5.0
arc                   randconfig-2004-20261105    gcc-8.5.0
arc                   randconfig-2005-20261105    gcc-8.5.0
arc                   randconfig-2200-20261105    gcc-8.5.0  smatch
arc                  randconfig-r2100-20261105    gcc-10.5.0 cocci
arc                  randconfig-r2108-20261105    gcc-11.5.0 cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                   randconfig-1000-20261105    gcc-14.4.0
arm                   randconfig-1001-20261105    gcc-14.4.0
arm                   randconfig-1002-20261105    gcc-14.4.0
arm                   randconfig-1003-20261105    gcc-14.4.0
arm                   randconfig-2000-20261105    clang-24
arm                   randconfig-2001-20261105    clang-24
arm                   randconfig-2002-20261105    clang-24
arm                   randconfig-2200-20261105    gcc-15.3.0 smatch
arm                  randconfig-r2108-20261105    gcc-16.2.0 cocci
arm                  randconfig-r2311-20261105    clang-24   sparse
arm                            sama5_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261105    gcc-13.5.0
arm64                 randconfig-1001-20261105    gcc-13.5.0
arm64                 randconfig-1002-20261105    gcc-13.5.0
arm64                 randconfig-1003-20261105    gcc-13.5.0
arm64                 randconfig-2000-20261105    clang-24
arm64                 randconfig-2001-20261105    clang-24
arm64                 randconfig-2002-20261105    clang-24
arm64                 randconfig-2200-20261105    clang-20   smatch
arm64                randconfig-r2104-20261105    clang-20   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261105    gcc-13.5.0
csky                  randconfig-1001-20261105    gcc-13.5.0
csky                  randconfig-2200-20261105    gcc-9.5.0  smatch
csky                 randconfig-r2101-20261105    gcc-10.5.0 cocci
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261105    clang-24
hexagon               randconfig-1001-20261105    clang-24
hexagon               randconfig-2200-20261105    clang-17   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261105    gcc-14
i386        buildonly-randconfig-1001-20261105    gcc-14
i386        buildonly-randconfig-1002-20261105    gcc-14
i386        buildonly-randconfig-1003-20261105    gcc-14
i386        buildonly-randconfig-1004-20261105    gcc-14
i386        buildonly-randconfig-1005-20261105    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261105    clang-22
i386                  randconfig-1001-20261105    clang-22
i386                  randconfig-1002-20261105    clang-22
i386                  randconfig-1003-20261105    clang-22
i386                  randconfig-1004-20261105    clang-22
i386                  randconfig-1005-20261105    clang-22
i386                  randconfig-1006-20261105    clang-22
i386                  randconfig-1007-20261105    clang-22
i386                  randconfig-1008-20261105    clang-22
i386                  randconfig-1009-20261105    clang-22
i386                  randconfig-1010-20261105    clang-22
i386                  randconfig-1011-20261105    clang-22
i386                  randconfig-1012-20261105    clang-22
i386                  randconfig-1013-20261105    clang-22
i386                  randconfig-2000-20261105    clang-22
i386                  randconfig-2001-20261105    clang-22
i386                  randconfig-2002-20261105    clang-22
i386                  randconfig-2003-20261105    clang-22
i386                  randconfig-2004-20261105    clang-22
i386                  randconfig-2005-20261105    clang-22
i386                  randconfig-2100-20261105    gcc-14     cocci
i386                  randconfig-2101-20261105    gcc-14     cocci
i386                  randconfig-2102-20261105    gcc-14     cocci
i386                  randconfig-2103-20261105    gcc-14     cocci
i386                  randconfig-2104-20261105    gcc-14     cocci
i386                  randconfig-2105-20261105    gcc-14     cocci
i386                  randconfig-2200-20261105    clang-22   smatch
i386                 randconfig-r2102-20261105    clang-20   cocci
i386                 randconfig-r2102-20261105    gcc-10.5.0 cocci
i386                 randconfig-r2107-20261105    gcc-11.5.0 cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261105    clang-24
loongarch             randconfig-1001-20261105    clang-24
loongarch             randconfig-2000-20261105    gcc-16.2.0
loongarch             randconfig-2001-20261105    gcc-16.2.0
loongarch             randconfig-2200-20261105    gcc-16.2.0 smatch
loongarch            randconfig-r2306-20261105    clang-24   sparse
loongarch            randconfig-r2309-20261105    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                       m54418evb_defconfig    clang-24
m68k                         mvme147_defconfig    clang-24
m68k                  randconfig-2000-20261105    gcc-15.3.0
m68k                  randconfig-2001-20261105    gcc-15.3.0
m68k                  randconfig-2200-20261105    gcc-8.5.0  smatch
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261105    gcc-15.3.0
microblaze            randconfig-2001-20261105    gcc-15.3.0
microblaze            randconfig-2200-20261105    gcc-9.5.0  smatch
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                  randconfig-2000-20261105    gcc-9.5.0
mips                  randconfig-2001-20261105    gcc-9.5.0
mips                  randconfig-2002-20261105    gcc-9.5.0
mips                  randconfig-2200-20261105    gcc-11.5.0 smatch
mips                 randconfig-r2110-20261105    gcc-16.2.0 cocci
mips                           rb532_defconfig    clang-24
nios2                          3c120_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261105    clang-24
nios2                 randconfig-1001-20261105    clang-24
nios2                 randconfig-2000-20261105    gcc-16.2.0
nios2                 randconfig-2001-20261105    gcc-16.2.0
nios2                 randconfig-2200-20261105    gcc-9.5.0  smatch
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261105    gcc-9.5.0
openrisc              randconfig-2001-20261105    gcc-9.5.0
openrisc              randconfig-2002-20261105    gcc-9.5.0
openrisc              randconfig-2200-20261105    gcc-16.2.0 smatch
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-24
parisc                randconfig-1000-20261105    clang-21
parisc                randconfig-1001-20261105    clang-21
parisc                randconfig-2000-20261105    gcc-16.2.0
parisc                randconfig-2001-20261105    gcc-16.2.0
parisc                randconfig-2200-20261105    gcc-15.3.0 smatch
parisc               randconfig-r2101-20261105    clang-20   cocci
parisc               randconfig-r2104-20261105    gcc-10.5.0 cocci
parisc               randconfig-r2105-20261105    gcc-10.5.0 cocci
parisc               randconfig-r2111-20261105    gcc-11.5.0 cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    clang-24
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261105    clang-21
powerpc               randconfig-1001-20261105    clang-21
powerpc               randconfig-2000-20261105    clang-18
powerpc               randconfig-2001-20261105    clang-18
powerpc               randconfig-2002-20261105    clang-18
powerpc               randconfig-2200-20261105    clang-17   smatch
powerpc64             randconfig-1000-20261105    clang-21
powerpc64             randconfig-1001-20261105    clang-21
powerpc64             randconfig-2000-20261105    clang-18
powerpc64             randconfig-2001-20261105    clang-18
powerpc64             randconfig-2002-20261105    clang-18
powerpc64             randconfig-2200-20261105    clang-24   smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261105    clang-24
riscv                 randconfig-1001-20261105    clang-24
riscv                 randconfig-2000-20261105    clang-24
riscv                 randconfig-2001-20261105    clang-24
riscv                 randconfig-2002-20261105    clang-24
riscv                 randconfig-2003-20261105    clang-24
riscv                 randconfig-2004-20261105    clang-24
riscv                 randconfig-2005-20261105    clang-24
riscv                 randconfig-2200-20261105    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261105    clang-24
s390                  randconfig-1001-20261105    clang-24
s390                  randconfig-2000-20261105    clang-24
s390                  randconfig-2001-20261105    clang-24
s390                  randconfig-2002-20261105    clang-24
s390                  randconfig-2003-20261105    clang-24
s390                  randconfig-2004-20261105    clang-24
s390                  randconfig-2005-20261105    clang-24
s390                  randconfig-2200-20261105    clang-24   smatch
s390                 randconfig-r2106-20261105    gcc-16.2.0 cocci
s390                 randconfig-r2107-20261105    gcc-16.2.0 cocci
s390                 randconfig-r2109-20261105    gcc-11.5.0 cocci
s390                 randconfig-r2307-20261105    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    gcc-16.2.0
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261105    clang-24
sh                    randconfig-1001-20261105    clang-24
sh                    randconfig-2000-20261105    gcc-16.2.0
sh                    randconfig-2001-20261105    gcc-16.2.0
sh                    randconfig-2002-20261105    gcc-16.2.0
sh                    randconfig-2003-20261105    gcc-16.2.0
sh                    randconfig-2004-20261105    gcc-16.2.0
sh                    randconfig-2005-20261105    gcc-16.2.0
sh                    randconfig-2200-20261105    gcc-13.5.0 smatch
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261105    gcc-8.5.0
sparc                 randconfig-1001-20261105    gcc-8.5.0
sparc                 randconfig-2000-20261105    clang-24
sparc                 randconfig-2001-20261105    clang-24
sparc                 randconfig-2200-20261105    gcc-16.2.0 smatch
sparc                randconfig-r2111-20261105    gcc-16.2.0 cocci
sparc64                           alldefconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261105    gcc-8.5.0
sparc64               randconfig-1001-20261105    gcc-8.5.0
sparc64               randconfig-2000-20261105    clang-24
sparc64               randconfig-2001-20261105    clang-24
sparc64               randconfig-2200-20261105    gcc-8.5.0  smatch
sparc64              randconfig-r2103-20261105    gcc-10.5.0 cocci
sparc64              randconfig-r2105-20261105    clang-20   cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261105    gcc-8.5.0
um                    randconfig-1001-20261105    gcc-8.5.0
um                    randconfig-2000-20261105    clang-24
um                    randconfig-2001-20261105    clang-24
um                    randconfig-2200-20261105    clang-19   smatch
um                   randconfig-r2103-20261105    clang-20   cocci
um                   randconfig-r2310-20261105    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261105    gcc-14
x86_64      buildonly-randconfig-1001-20261105    gcc-14
x86_64      buildonly-randconfig-1002-20261105    gcc-14
x86_64      buildonly-randconfig-1003-20261105    gcc-14
x86_64      buildonly-randconfig-1004-20261105    gcc-14
x86_64      buildonly-randconfig-1005-20261105    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261105    clang-22
x86_64                randconfig-1001-20261105    clang-22
x86_64                randconfig-1002-20261105    clang-22
x86_64                randconfig-1003-20261105    clang-22
x86_64                randconfig-1004-20261105    clang-22
x86_64                randconfig-1005-20261105    clang-22
x86_64                randconfig-1006-20261105    clang-22
x86_64                randconfig-1007-20261105    clang-22
x86_64                randconfig-1008-20261105    clang-22
x86_64                randconfig-1009-20261105    clang-22
x86_64                randconfig-1010-20261105    clang-22
x86_64                randconfig-1011-20261105    clang-22
x86_64                randconfig-1012-20261105    clang-22
x86_64                randconfig-1013-20261105    clang-22
x86_64                randconfig-1014-20261105    clang-22
x86_64                randconfig-1015-20261105    clang-22
x86_64                randconfig-1016-20261105    clang-22
x86_64                randconfig-1017-20261105    clang-22
x86_64                randconfig-2100-20261105    gcc-14     cocci
x86_64                randconfig-2101-20261105    gcc-14     cocci
x86_64                randconfig-2102-20261105    gcc-14     cocci
x86_64                randconfig-2103-20261105    gcc-14     cocci
x86_64                randconfig-2104-20261105    gcc-14     cocci
x86_64                randconfig-2105-20261105    gcc-14     cocci
x86_64                randconfig-2200-20261105    clang-22   smatch
x86_64               randconfig-r2308-20261105    clang-24   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261105    gcc-8.5.0
xtensa                randconfig-1001-20261105    gcc-8.5.0
xtensa                randconfig-2200-20261105    gcc-8.5.0  smatch
xtensa               randconfig-r2109-20261105    gcc-16.2.0 cocci
xtensa               randconfig-r2110-20261105    gcc-11.5.0 cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

