Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2EDCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 03:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mll4mjTgR8CvpEaO3cEaBd3E9y/x+irrZx4hNCSEj5I=; b=X4PytV5llGkEH2JvS5NPOPFib9
	mHrWtTELuvYQJYhkeM8fIpZ62HTaIA+ognONivJScymCdNU6kOgvOmz9IZHlQpwkLMTCsDEqOMS0m
	gyms9uqnQn7kgMdACsmNnrooQkxMDgEBOU+lsue9xiW6vhqpsuo3ea61o897MreEF2X0P14iSSYMR
	4YeQGSJbtP2YjZtVjyapklPf2bbfgBVgVV1xx4kvaG7GGe0TcfFgrE7Pd2ngHblQRtXvrFzSU63S3
	mlJbAbsl1/Wl9NSqYNDkLkAk+QB8suABb7E7/cKkk6OQoNm64qqH2tyyxyOUI8DPCO9bU7R5PKrUW
	gSWl/RoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGyg-00000009gj7-3tki;
	Fri, 22 May 2026 03:55:14 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGye-00000009gib-0pkU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 03:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779422112; x=1810958112;
  h=date:from:to:cc:subject:message-id;
  bh=8KJKDgby89q8g3UesjWkv6Tl2cuMUueCQgL90IRfRAw=;
  b=PF7NRHxmOSC3sInwlrh/Ub+aa5r4KmX/ykXF5IMgwREzD+vCn549xg9D
   I60G86DWkBoSCgqB3GeP3rC+9Lqst82vKC2r8kYQWyihri7sVms5GUSFc
   BUwsVOVXIuJr2icVMZd+AaaeVdqUztCXLRoRe0mdAvul/pCvUsPtAe5Fx
   IVkNydXaltoQTXvpLf41JwudX/f1TcJKxz1tKVzmrU4m4R3WSssN5IluX
   9FYjioIKJhTPoBnIEXKy2EN8vqnkoY84rnBMxWhwOcswc2WZlrCLaeDs/
   5Ghsn5ZjJTrKhA9jFuKDEHAaFU2B28xJwnnobESPSfdqf5smWijC83KYH
   Q==;
X-CSE-ConnectionGUID: etgXlzADQziSEJVMeu2qtQ==
X-CSE-MsgGUID: USSGhQtURb+mQZgC1oP9jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79383125"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="79383125"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 20:55:11 -0700
X-CSE-ConnectionGUID: buUfNU7pRViJJ/K6wbdtsw==
X-CSE-MsgGUID: HCNiPs/VS+yftwcnuqX1Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="264586761"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2026 20:55:10 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQGyZ-000000001fL-35J7;
	Fri, 22 May 2026 03:55:07 +0000
Date: Fri, 22 May 2026 11:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 9f86df230e276e5c24f5c6800f3ee63ab33167f7
Message-ID: <202605221145.cTgnjQgF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_205512_280996_B7456E64 
X-CRM114-Status: UNSURE (   5.30  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: 9f86df230e276e5c24f5c6800f3ee63ab33167f7  Merge tag 'cix-defconfig-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into soc/defconfig

elapsed time: 727m

configs tested: 135
configs skipped: 133

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                   randconfig-001-20260522    clang-23
arc                   randconfig-002-20260522    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                   randconfig-001-20260522    clang-23
arm                   randconfig-002-20260522    clang-23
arm                   randconfig-003-20260522    clang-23
arm                   randconfig-004-20260522    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260522    gcc-14.3.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260522    gcc-14.3.0
arm64                          randconfig-003    gcc-14.3.0
arm64                 randconfig-003-20260522    gcc-14.3.0
arm64                          randconfig-004    gcc-14.3.0
arm64                 randconfig-004-20260522    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                           randconfig-001    gcc-14.3.0
csky                  randconfig-001-20260522    gcc-14.3.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260522    gcc-14.3.0
hexagon                           allnoconfig    gcc-15.2.0
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260522    clang-20
i386        buildonly-randconfig-002-20260522    clang-20
i386        buildonly-randconfig-003-20260522    clang-20
i386        buildonly-randconfig-004-20260522    clang-20
i386        buildonly-randconfig-005-20260522    clang-20
i386        buildonly-randconfig-006-20260522    clang-20
i386                  randconfig-011-20260522    clang-20
i386                  randconfig-012-20260522    clang-20
i386                  randconfig-013-20260522    clang-20
i386                  randconfig-014-20260522    clang-20
i386                  randconfig-015-20260522    clang-20
i386                  randconfig-016-20260522    clang-20
i386                  randconfig-017-20260522    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260522    gcc-12.5.0
parisc                randconfig-002-20260522    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260522    gcc-12.5.0
powerpc               randconfig-002-20260522    gcc-12.5.0
powerpc64             randconfig-001-20260522    gcc-12.5.0
powerpc64             randconfig-002-20260522    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260522    gcc-9.5.0
sparc                 randconfig-002-20260522    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260522    gcc-9.5.0
sparc64               randconfig-002-20260522    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260522    gcc-9.5.0
um                    randconfig-002-20260522    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-23
x86_64      buildonly-randconfig-001-20260522    gcc-14
x86_64      buildonly-randconfig-002-20260522    gcc-14
x86_64      buildonly-randconfig-003-20260522    gcc-14
x86_64      buildonly-randconfig-004-20260522    gcc-14
x86_64      buildonly-randconfig-005-20260522    gcc-14
x86_64      buildonly-randconfig-006-20260522    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260522    gcc-14
x86_64                randconfig-002-20260522    gcc-14
x86_64                randconfig-003-20260522    gcc-14
x86_64                randconfig-004-20260522    gcc-14
x86_64                randconfig-005-20260522    gcc-14
x86_64                randconfig-006-20260522    gcc-14
x86_64                randconfig-011-20260522    gcc-14
x86_64                randconfig-012-20260522    gcc-14
x86_64                randconfig-013-20260522    gcc-14
x86_64                randconfig-014-20260522    gcc-14
x86_64                randconfig-015-20260522    gcc-14
x86_64                randconfig-016-20260522    gcc-14
x86_64                randconfig-071-20260522    clang-20
x86_64                randconfig-072-20260522    clang-20
x86_64                randconfig-073-20260522    clang-20
x86_64                randconfig-074-20260522    clang-20
x86_64                randconfig-075-20260522    clang-20
x86_64                randconfig-076-20260522    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260522    gcc-9.5.0
xtensa                randconfig-002-20260522    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

