Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE877C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Petj8VRD5XHVs4ImvOPFtBu6RyPeWZ9cvsXdkN4l7Bk=; b=CXccZKuboJ7LQgA5JCsmnigeZE
	u3yZVMC1PEz+IrQ2+MiUrsnnR3Jw/XOUA6KEDib6rVdLAYopMj+oZG8eHSJTtIOuqMZMM4VTRj2lE
	g+fTg6EW+qorrZs19UI/H82aaPc25HSC5veuVOmyhMNyu/NHP+FMss+IXo4l4kwlTfSHISfwzlBWw
	w2RJrjA8QOHwF95y5uHrzTIK3XdyaNY5upqtdXO0cUSVf1xEzzhJtrCqDTd3ThOXylSBPwR51Q9sG
	tOAxHJenbecO5SUlYNq05tIpisPoew3e/6ixW5TBnmS1EI2DC3e4kCoVnVdKKwugo05B4DzHMJ1w6
	x+g5SZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6B8X-00000004QmQ-0FUZ;
	Mon, 14 Sep 2026 18:10:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6B8Q-00000004Qm3-3WmQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 18:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789409431; x=1820945431;
  h=date:from:to:cc:subject:message-id;
  bh=mWG2aEuLfr8xUtHvZW8ycMro5o4dh6baHWiaTd9BSNs=;
  b=kd9nouWUAuUGPPpMvA+jvwqhugJBwjt+Nas8Bq2DFzeZ0pcsKA6uBilD
   YxItTWmQ+Yy7t69y0pgdglQCqGbCjnTVv2sUrsbq80s14Vaord2cDAx5n
   Pi7rvqP37sfoHkutmaSY13cOi7JZbBP9f/rAv+2vM/Cx7texcgvW9ezWZ
   wPjz2crvMQE7HeGqp5koIvG53U6qEAiQX1qICAX+6OvmL9XpImZ1622g4
   qcIaISm4Y09tT8YyatYJKLLivSv9IMxaayo0RLec7zE+Y0wg1BmsaSPZl
   JddJ1hcZ7QN5SCL4HYJ+kglZNyyztOt4c9eI7aT93N702FDl+aCHhoa+D
   A==;
X-CSE-ConnectionGUID: gozwmvkCQ3CuXolcyLI6kg==
X-CSE-MsgGUID: Jl2OzL2pREOsY4Gw4lnADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101284983"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101284983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 11:10:30 -0700
X-CSE-ConnectionGUID: XKKg4jCyQU6VXFBwKPGoQQ==
X-CSE-MsgGUID: MXfpWVw3RT6Yf5OSdk3qmA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2026 11:10:27 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6B8L-000000003J3-0cjP;
	Mon, 14 Sep 2026 18:10:25 +0000
Date: Tue, 15 Sep 2026 02:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove-7.3] BUILD SUCCESS WITH UNVERIFIED WARNING
 1982025236bc9eee5a8895ee4d9743f989e20abf
Message-ID: <202609150228.bNYnpbc7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_111030_919462_5420F57E 
X-CRM114-Status: UNSURE (   4.19  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
branch HEAD: 1982025236bc9eee5a8895ee4d9743f989e20abf  power: supply: sbs-battery: remove platform_data based probing

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm/mach-omap2/id.c:101:12: warning: variable 'tap_prod_id' set but not used [-Wunused-but-set-global]

Warning ids grouped by kconfigs:

recent_errors
`-- arm-defconfig
    `-- arch-arm-mach-omap2-id.c:warning:variable-tap_prod_id-set-but-not-used

elapsed time: 2629m

configs tested: 173
configs skipped: 13

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                randconfig-r133-20260914    gcc-11.5.0 sparse
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260914    gcc-8.5.0
arc                   randconfig-002-20260914    gcc-11.5.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-24
arm                          pxa168_defconfig    clang-24
arm                   randconfig-001-20260914    clang-24
arm                   randconfig-002-20260914    clang-19
arm                   randconfig-003-20260914    gcc-8.5.0
arm                   randconfig-004-20260914    gcc-13.4.0
arm                       versatile_defconfig    gcc-16.1.0
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260914    gcc-8.5.0
arm64                 randconfig-002-20260914    clang-24
arm64                 randconfig-003-20260914    gcc-8.5.0
arm64                 randconfig-004-20260914    clang-24
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260914    gcc-11.5.0
csky                  randconfig-002-20260914    gcc-9.5.0
hexagon                          allmodconfig    clang-24
hexagon                           allnoconfig    clang-24
hexagon                             defconfig    clang-24
hexagon               randconfig-001-20260914    clang-24
hexagon               randconfig-002-20260914    clang-17
hexagon              randconfig-r123-20260914    clang-17 sparse
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20260914    clang-22
i386        buildonly-randconfig-002-20260914    gcc-14
i386        buildonly-randconfig-003-20260914    clang-22
i386        buildonly-randconfig-004-20260914    gcc-14
i386        buildonly-randconfig-005-20260914    gcc-14
i386        buildonly-randconfig-006-20260914    gcc-14
i386                                defconfig    clang-22
i386                  randconfig-001-20260914    clang-22
i386                  randconfig-002-20260914    gcc-14
i386                  randconfig-003-20260914    clang-22
i386                  randconfig-004-20260914    clang-22
i386                  randconfig-005-20260914    gcc-14
i386                  randconfig-006-20260914    clang-22
i386                  randconfig-007-20260914    clang-22
i386                  randconfig-011-20260914    clang-22
i386                  randconfig-012-20260914    gcc-13
i386                  randconfig-013-20260914    clang-22
i386                  randconfig-014-20260914    clang-22
i386                  randconfig-015-20260914    clang-22
i386                  randconfig-016-20260914    gcc-14
i386                  randconfig-017-20260914    gcc-14
i386                  randconfig-061-20260914    gcc-12 sparse
i386                  randconfig-062-20260914    gcc-14 sparse
i386                  randconfig-063-20260914    gcc-14 sparse
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260914    gcc-13.4.0
loongarch             randconfig-002-20260914    clang-24
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    gcc-16.1.0
m68k                 randconfig-r113-20260914    gcc-9.5.0 sparse
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260914    gcc-8.5.0
nios2                 randconfig-002-20260914    gcc-11.5.0
nios2                randconfig-r122-20260914    gcc-10.5.0 sparse
nios2                randconfig-r132-20260914    gcc-11.5.0 sparse
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260914    gcc-12.5.0
parisc                randconfig-002-20260914    gcc-14.3.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       ebony_defconfig    clang-24
powerpc                     mpc5200_defconfig    clang-24
powerpc               randconfig-001-20260914    clang-17
powerpc               randconfig-002-20260914    clang-24
powerpc                     stx_gp3_defconfig    gcc-16.1.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20260914    gcc-8.5.0
powerpc64             randconfig-002-20260914    gcc-15.2.0
powerpc64            randconfig-r111-20260914    gcc-8.5.0 sparse
powerpc64            randconfig-r131-20260914    clang-17 sparse
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                               defconfig    clang-24
riscv                    nommu_virt_defconfig    clang-24
riscv                 randconfig-001-20260914    clang-18
riscv                 randconfig-002-20260914    clang-24
s390                             allmodconfig    clang-24
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260914    clang-19
s390                  randconfig-002-20260914    clang-24
s390                 randconfig-r134-20260914    clang-24 sparse
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260914    gcc-11.5.0
sh                    randconfig-002-20260914    gcc-13.4.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260914    gcc-16.1.0
sparc                 randconfig-002-20260914    gcc-16.1.0
sparc                randconfig-r121-20260914    gcc-16.1.0 sparse
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-24
sparc64               randconfig-001-20260914    gcc-14.3.0
sparc64               randconfig-002-20260914    clang-20
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-14
um                                  defconfig    clang-24
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260914    gcc-14
um                    randconfig-002-20260914    clang-24
um                   randconfig-r112-20260914    clang-24 sparse
um                           x86_64_defconfig    clang-24
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260914    gcc-14
x86_64      buildonly-randconfig-002-20260914    clang-22
x86_64      buildonly-randconfig-003-20260914    gcc-14
x86_64      buildonly-randconfig-004-20260914    gcc-14
x86_64      buildonly-randconfig-005-20260914    gcc-14
x86_64      buildonly-randconfig-006-20260914    gcc-12
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260914    gcc-14
x86_64                randconfig-002-20260914    gcc-14
x86_64                randconfig-003-20260914    clang-22
x86_64                randconfig-004-20260914    gcc-13
x86_64                randconfig-005-20260914    clang-22
x86_64                randconfig-006-20260914    clang-22
x86_64                randconfig-071-20260914    clang-22
x86_64                randconfig-072-20260914    clang-22
x86_64                randconfig-073-20260914    clang-22
x86_64                randconfig-074-20260914    gcc-12
x86_64                randconfig-075-20260914    clang-22
x86_64                randconfig-076-20260914    clang-22
x86_64                randconfig-121-20260914    clang-22 sparse
x86_64                randconfig-122-20260914    gcc-14 sparse
x86_64                randconfig-123-20260914    gcc-14 sparse
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                  cadence_csp_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260914    gcc-10.5.0
xtensa                randconfig-002-20260914    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

