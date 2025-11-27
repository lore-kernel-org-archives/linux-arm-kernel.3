Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC83ED11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qsI419fLpwm444scjTtF/k0vG27kHSYlqJD/WSz2+qw=; b=yoeGH5xhKrmoej2qIV8xqz7QkH
	5eVBdHqe/xm67CIuGS6YSWSFuqo3TyQ/0JktVvu4W1l2gf9NuQOYQiSKO9QNXzjSrCgHIfVZZxqJP
	Jy05iHJ+Ic1OLO5EwPAqg7H44iXxQ7JNAuuHGAlDqAn6r13Z/vJaCAQcTYK8yl1gdOnAJlx8kuY5y
	UPHAjpsuAgPmmjuACmmisuMQNex7DN+QmoHWd25WG7ZpRu+Z4HgcsZr1LeAHfXo7YMf5p9jxzTmCS
	On+BnECxqJrd6FQkITQalDwIuLZ+bu7HWItXTDhK2p3oWUN83c1K27fsf89wz7pQLVzeaAyKGHhf8
	1j9ryfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY1w-0000000GFye-2QcI;
	Thu, 27 Nov 2025 09:11:12 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY1s-0000000GFxy-2tSl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764234669; x=1795770669;
  h=date:from:to:cc:subject:message-id;
  bh=YtA8KBZUa02rGKNk0UeEYO5kJWOioKglJ1oGmhi+8QU=;
  b=Cr9JXriPnpX1KohV/HiJ29GeOudpWCMLW4YGwvXA26IMnGQAO16pySHO
   wdsXWxpivbFtZAuQWuKRmeid1TCwjTR5L9p9Mr2SY1aW/ApnEVKMxs0R8
   c+YftZ3ScncsezlnzoQbeHFLNafTuDMwCBE+MN5KbvKXQQFH/3vTMfiYX
   msj9qfWde18dRpPKqkmOanZ8f6u5DD6VUAk997hN13fab2gX/RcdhNjka
   g0EWP2YenTDnT/2vUWLddJDkIXw4C4Z8DneucPoZauRqkq0u0pwCBAW3w
   MV/YzAKdB46vDUnuJBb3SOPG5WJvKnRqyKyBxcjOIOMxPpb+luhCv+kwp
   Q==;
X-CSE-ConnectionGUID: LjoJHNHWSce5UsVVMJ6TPg==
X-CSE-MsgGUID: 1aULvTRUR8W3zFiLlyjXNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66225239"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66225239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:11:08 -0800
X-CSE-ConnectionGUID: zthPFTaqTwebo8z/C6/dqA==
X-CSE-MsgGUID: 0K/5c2hSSbOk9SRp0GmqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192997697"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2025 01:11:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOY1o-00000000486-1enh;
	Thu, 27 Nov 2025 09:11:04 +0000
Date: Thu, 27 Nov 2025 17:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 4b1e81570144f03521482f7659fee060d8f63481
Message-ID: <202511271727.j551RHP7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_011109_961879_AD24DB35 
X-CRM114-Status: UNSURE (   5.47  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: 4b1e81570144f03521482f7659fee060d8f63481  Merge tag 'mtk-soc-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/drivers

elapsed time: 2467m

configs tested: 180
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20251126    gcc-13.4.0
arc                   randconfig-001-20251127    clang-22
arc                   randconfig-002-20251126    gcc-11.5.0
arc                   randconfig-002-20251127    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                      integrator_defconfig    clang-22
arm                   randconfig-001-20251126    clang-22
arm                   randconfig-001-20251127    clang-22
arm                   randconfig-002-20251126    clang-22
arm                   randconfig-002-20251127    clang-22
arm                   randconfig-003-20251126    clang-19
arm                   randconfig-003-20251127    clang-22
arm                   randconfig-004-20251126    clang-22
arm                   randconfig-004-20251127    clang-22
arm                         s3c6400_defconfig    clang-22
arm                         s3c6400_defconfig    gcc-15.1.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251127    gcc-15.1.0
arm64                 randconfig-002-20251127    gcc-15.1.0
arm64                 randconfig-003-20251127    gcc-15.1.0
arm64                 randconfig-004-20251127    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251127    gcc-15.1.0
csky                  randconfig-002-20251127    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon               randconfig-001-20251127    gcc-15.1.0
hexagon               randconfig-002-20251127    gcc-15.1.0
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20251127    clang-20
i386        buildonly-randconfig-002-20251127    clang-20
i386        buildonly-randconfig-003-20251127    clang-20
i386        buildonly-randconfig-004-20251127    clang-20
i386        buildonly-randconfig-005-20251127    clang-20
i386        buildonly-randconfig-006-20251127    clang-20
i386                  randconfig-011-20251127    clang-20
i386                  randconfig-012-20251127    clang-20
i386                  randconfig-013-20251127    clang-20
i386                  randconfig-014-20251127    clang-20
i386                  randconfig-015-20251127    clang-20
i386                  randconfig-016-20251127    clang-20
i386                  randconfig-017-20251127    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251127    gcc-15.1.0
loongarch             randconfig-002-20251127    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251127    gcc-15.1.0
nios2                 randconfig-002-20251127    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251126    gcc-8.5.0
parisc                randconfig-001-20251127    gcc-13.4.0
parisc                randconfig-002-20251126    gcc-15.1.0
parisc                randconfig-002-20251127    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc                   bluestone_defconfig    clang-22
powerpc                 linkstation_defconfig    clang-22
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20251126    gcc-10.5.0
powerpc               randconfig-001-20251127    gcc-13.4.0
powerpc               randconfig-002-20251126    gcc-8.5.0
powerpc               randconfig-002-20251127    gcc-13.4.0
powerpc                     skiroot_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251126    clang-19
powerpc64             randconfig-001-20251127    gcc-13.4.0
powerpc64             randconfig-002-20251126    clang-22
powerpc64             randconfig-002-20251127    gcc-13.4.0
riscv                            allmodconfig    clang-16
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251126    gcc-10.5.0
riscv                 randconfig-001-20251127    gcc-12.5.0
riscv                 randconfig-002-20251126    clang-22
riscv                 randconfig-002-20251127    gcc-12.5.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251126    gcc-8.5.0
s390                  randconfig-001-20251127    gcc-12.5.0
s390                  randconfig-002-20251126    gcc-8.5.0
s390                  randconfig-002-20251127    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    clang-22
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251126    gcc-14.3.0
sh                    randconfig-001-20251127    gcc-12.5.0
sh                    randconfig-002-20251126    gcc-11.5.0
sh                    randconfig-002-20251127    gcc-12.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251126    gcc-8.5.0
sparc                 randconfig-001-20251127    clang-22
sparc                 randconfig-002-20251126    gcc-14.3.0
sparc                 randconfig-002-20251127    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251126    gcc-8.5.0
sparc64               randconfig-001-20251127    clang-22
sparc64               randconfig-002-20251126    clang-22
sparc64               randconfig-002-20251127    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251126    clang-19
um                    randconfig-001-20251127    clang-22
um                    randconfig-002-20251126    clang-22
um                    randconfig-002-20251127    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20251127    clang-20
x86_64      buildonly-randconfig-002-20251127    clang-20
x86_64      buildonly-randconfig-003-20251127    clang-20
x86_64      buildonly-randconfig-004-20251127    clang-20
x86_64      buildonly-randconfig-005-20251127    clang-20
x86_64      buildonly-randconfig-006-20251127    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251127    gcc-14
x86_64                randconfig-002-20251127    gcc-14
x86_64                randconfig-003-20251127    gcc-14
x86_64                randconfig-004-20251127    gcc-14
x86_64                randconfig-005-20251127    gcc-14
x86_64                randconfig-006-20251127    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251126    gcc-14.3.0
xtensa                randconfig-001-20251127    clang-22
xtensa                randconfig-002-20251126    gcc-10.5.0
xtensa                randconfig-002-20251127    clang-22
xtensa                    xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

