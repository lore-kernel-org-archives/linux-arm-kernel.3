Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BC1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0y7+FHm9xbLi1NJlxjrDvozBfjg+VFMF49DAeTdiy2s=; b=rz2oWsFw//o2whh3/ylANaWND1
	7FrarFrrxTyhG8lvOh0fW5uVUdjX1iN1hkWyWKhB3FUsbltXGq14YtgF5wu/Wt03jfo48459hghaI
	rb2K+4ScHpje8mUztaqdzg5unYSUJgz2eIedPIel3bl5qGQEkCdXerHCKzu/5h3pbBMmPTWJSLLMc
	V/KHrtbNnFq958mTo/t1orRi+BuY9ZPLyxsFpQ+t9xK0cgsNiMru/dxZJwSk8lPuYx7yqnM8P1IeI
	gg/zkcbVxJH65QKu4N4bY6L9faNZwWyg9GCRmDOKYZ8sFlcoo4hY8gvVkBdxF8mNz0Mzp8f9itaJh
	7bEeRNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukosT-00000004phW-0ddS;
	Sat, 09 Aug 2025 19:05:13 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukopI-00000004pSj-0GTt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 19:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754766116; x=1786302116;
  h=date:from:to:cc:subject:message-id;
  bh=qPifj/pgl5GwRJfAoIua8jo+r3nCwCShUi4Y/Eq4y34=;
  b=L3GwXy3/kjI3SoKEhp6zRCwq9S4ihZ66HAWtiAbhhBJGvynMpNlqwSTf
   0lvDKnpKLeiiaBKKHmwvlYiZ/EHzNxN4ZX2tZGgxfjuogmIIxG41omOVA
   K5DDT7jaYPwOcQwK4jsNjl8yP1ekSdLkFRHLB0zP2Mn189ar3l6bvkY2H
   ePbstQUVUeqpYwpMIv4PiGwnKDrhorMEWHyy+659aNlrTwwxbCA9E+Oxs
   C9zdk978M/qkI0I5ikzYga1/vdLOkD77loYclPaVZ1apJU+fqERyGM3fU
   VlTaOOtIoGDQwPNru0mfwpeA64cIMBMWRa1FB7hdei9iT7mLhhH4TpsFT
   A==;
X-CSE-ConnectionGUID: /IM0HvjSSxCYWMBtbPmOGQ==
X-CSE-MsgGUID: XCG35XvGS6qXqdHIJSg3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="59690071"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59690071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 12:01:48 -0700
X-CSE-ConnectionGUID: qjr+iRnVQmKBZt/kmyA3NQ==
X-CSE-MsgGUID: D0m5P2gjSm+kHuoyhrJc0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165885507"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Aug 2025 12:01:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukoow-000516-2x;
	Sat, 09 Aug 2025 19:01:39 +0000
Date: Sun, 10 Aug 2025 03:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 0c952efa0d7cf5258879406077df33d23cb06d5e
Message-ID: <202508100356.7VyYyuWB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_120156_141776_F130B823 
X-CRM114-Status: UNSURE (   5.25  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 0c952efa0d7cf5258879406077df33d23cb06d5e  Merge tag 'tegra-for-6.17-arm64-dt-v3' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes

elapsed time: 1293m

configs tested: 169
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250809    gcc-13.4.0
arc                   randconfig-002-20250809    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                        mvebu_v7_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250809    gcc-10.5.0
arm                   randconfig-002-20250809    clang-20
arm                   randconfig-003-20250809    gcc-8.5.0
arm                   randconfig-004-20250809    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250809    gcc-8.5.0
arm64                 randconfig-002-20250809    clang-22
arm64                 randconfig-003-20250809    clang-22
arm64                 randconfig-004-20250809    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250809    gcc-9.5.0
csky                  randconfig-002-20250809    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250809    clang-22
hexagon               randconfig-002-20250809    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250809    gcc-12
i386        buildonly-randconfig-002-20250809    clang-20
i386        buildonly-randconfig-003-20250809    gcc-12
i386        buildonly-randconfig-004-20250809    clang-20
i386        buildonly-randconfig-005-20250809    clang-20
i386        buildonly-randconfig-006-20250809    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250809    gcc-12
i386                  randconfig-002-20250809    gcc-12
i386                  randconfig-003-20250809    gcc-12
i386                  randconfig-004-20250809    gcc-12
i386                  randconfig-005-20250809    gcc-12
i386                  randconfig-006-20250809    gcc-12
i386                  randconfig-007-20250809    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250809    gcc-15.1.0
loongarch             randconfig-002-20250809    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250809    gcc-11.5.0
nios2                 randconfig-002-20250809    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250809    gcc-8.5.0
parisc                randconfig-002-20250809    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      arches_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250809    gcc-10.5.0
powerpc               randconfig-002-20250809    clang-22
powerpc               randconfig-003-20250809    gcc-12.5.0
powerpc64             randconfig-001-20250809    gcc-10.5.0
powerpc64             randconfig-002-20250809    clang-22
powerpc64             randconfig-003-20250809    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20250809    clang-22
riscv                 randconfig-002-20250809    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250809    clang-22
s390                  randconfig-002-20250809    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          kfr2r09_defconfig    gcc-15.1.0
sh                    randconfig-001-20250809    gcc-10.5.0
sh                    randconfig-002-20250809    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250809    gcc-8.5.0
sparc                 randconfig-002-20250809    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250809    gcc-8.5.0
sparc64               randconfig-002-20250809    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250809    clang-22
um                    randconfig-002-20250809    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250809    gcc-12
x86_64      buildonly-randconfig-002-20250809    clang-20
x86_64      buildonly-randconfig-003-20250809    gcc-12
x86_64      buildonly-randconfig-004-20250809    clang-20
x86_64      buildonly-randconfig-005-20250809    gcc-12
x86_64      buildonly-randconfig-006-20250809    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250809    gcc-12
x86_64                randconfig-002-20250809    gcc-12
x86_64                randconfig-003-20250809    gcc-12
x86_64                randconfig-004-20250809    gcc-12
x86_64                randconfig-005-20250809    gcc-12
x86_64                randconfig-006-20250809    gcc-12
x86_64                randconfig-007-20250809    gcc-12
x86_64                randconfig-008-20250809    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250809    gcc-8.5.0
xtensa                randconfig-002-20250809    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

