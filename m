Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD80C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v97slEjqJksOBDQ5IXs9+rz8GRsMHhFhKLezMzGz3TU=; b=dTRC1frfOLdyh25FR1VVTQVNyj
	Cf75PdgcZMP5o6oMLgVFJi8+eG4HMN70/478mbuFn5W8IDaizf/3tI+C+xQnURNnGKham3piJ8FhJ
	sA+RS0IFFCyE5YMoz9EZlTf8a8yhRcH90ym60PwLfHqk+kdQfXVmpcX22RLOKY0ApTfJPSLPqut3J
	lOt2Qdf5uhC49qkkCs4lqITjzpQm/j5mgMen97NBbHYFrfASllvh0qkmpyrN5Qf9pDErR05y4skRR
	bJJcpRmCr7NIiI4UCvcKz/Tw+cyQqskxOuSTmZg6KhJvnVLonra2Cm4zE6H/YwnUs8uBwI/UbnKx3
	Uzbonk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AYE-0000000BDmU-1Veu;
	Thu, 17 Sep 2026 11:45:14 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AYB-0000000BDlI-2YbM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645511; x=1821181511;
  h=date:from:to:cc:subject:message-id;
  bh=6mqDqk0C0bXlR0UuRw6XttkdOJMLaqCwa3VPFU94ko4=;
  b=dPurz/G4IHbLtUvC0ZxZuoavvDpZjq94bDchoNOn6Q2WuZt0XHhQ2TyI
   Un9NtJi856nS6zm9QilwohKuwB/63A7rlLPBiSxRyMmUe/UHpy18nkI0b
   NzJASfaBKhfeuir7jKLOvUP4UrG81OUU5XMO16G7r6uXCZvbNFMLvjBch
   agcwm3VDJ+SbVft/UxXLgVvcRk+Gtl4Nmvmdhy//MrOSOsUhYBamu2+ZF
   vxFj165H8bCsPjUvm+8uVXmdn4m4tO4BmPXS3O/u9IAkwkGtJn7H6wd6i
   +qAXexFADphm5wactkcTwwyfyK/abC84uSnE5weVHjCYiExFs3VUbbqNM
   Q==;
X-CSE-ConnectionGUID: CWcdKQwJS4Gs6SQD/ZuFFQ==
X-CSE-MsgGUID: 4LxkUdq5RFuJ1CCunAAAxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90075439"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90075439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:45:07 -0700
X-CSE-ConnectionGUID: JU0MoeMUSK6Fi/8o7/PtCw==
X-CSE-MsgGUID: XT7xblo9RvyxGFJLu2e+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270440240"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2026 04:45:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7AY3-000000007fh-1qMP;
	Thu, 17 Sep 2026 11:45:03 +0000
Date: Thu, 17 Sep 2026 19:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ab8500-regulators] BUILD SUCCESS
 a527b3ad1d54b558d8872d50af3ecf0f9a98309a
Message-ID: <202609171909.BxtXss1U-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044511_702877_67E5792C 
X-CRM114-Status: UNSURE (   5.06  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ab8500-regulators
branch HEAD: a527b3ad1d54b558d8872d50af3ecf0f9a98309a  regulator: ab8500: Use scoped guard for shared mode mutex

elapsed time: 3722m

configs tested: 295
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                 randconfig-r063-20260915    gcc-8.5.0
alpha                randconfig-r1307-20260917    gcc-9.5.0  sparse
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260917    gcc-15.2.0
arc                   randconfig-1000-20260917    gcc-8.5.0
arc                   randconfig-1001-20260917    gcc-15.2.0
arc                   randconfig-r062-20260915    gcc-8.5.0
arc                  randconfig-r1305-20260917    gcc-8.5.0  sparse
arc                         vdk_hs38_defconfig    clang-24
arm                                allnoconfig    clang-17
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    gcc-16.1.0
arm                                  defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260917    gcc-15.2.0
arm                   randconfig-1000-20260917    gcc-8.5.0
arm                   randconfig-1001-20260917    gcc-15.2.0
arm                   randconfig-1001-20260917    gcc-8.5.0
arm                   randconfig-1002-20260917    clang-17
arm                   randconfig-1002-20260917    gcc-15.2.0
arm                   randconfig-1003-20260917    gcc-15.2.0
arm                   randconfig-1003-20260917    gcc-8.5.0
arm                   randconfig-r051-20260915    clang-19
arm                          s5pv210_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260917    gcc-11.5.0
arm64                 randconfig-1000-20260917    gcc-8.5.0
arm64                 randconfig-1001-20260917    gcc-11.5.0
arm64                 randconfig-1001-20260917    gcc-8.5.0
arm64                 randconfig-1002-20260917    clang-24
arm64                 randconfig-1002-20260917    gcc-11.5.0
arm64                 randconfig-1003-20260917    clang-17
arm64                 randconfig-1003-20260917    gcc-11.5.0
arm64                 randconfig-r062-20260915    gcc-8.5.0
arm64                 randconfig-r072-20260915    gcc-11.5.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260917    gcc-11.5.0
csky                  randconfig-1000-20260917    gcc-9.5.0
csky                  randconfig-1001-20260917    gcc-11.5.0
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    clang-24
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260917    clang-20
hexagon               randconfig-1001-20260917    clang-17
hexagon               randconfig-r054-20260915    clang-17
hexagon              randconfig-r1302-20260917    clang-18   sparse
i386                              allmodconfig    gcc-14
i386                               allnoconfig    gcc-14
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    gcc-14
i386        buildonly-randconfig-1000-20260917    clang-22
i386        buildonly-randconfig-1000-20260917    gcc-13
i386        buildonly-randconfig-1001-20260917    gcc-13
i386        buildonly-randconfig-1002-20260917    gcc-13
i386        buildonly-randconfig-1002-20260917    gcc-14
i386        buildonly-randconfig-1003-20260917    clang-22
i386        buildonly-randconfig-1003-20260917    gcc-13
i386        buildonly-randconfig-1004-20260917    clang-22
i386        buildonly-randconfig-1004-20260917    gcc-13
i386        buildonly-randconfig-1005-20260917    clang-22
i386        buildonly-randconfig-1005-20260917    gcc-13
i386                                 defconfig    clang-22
i386                                 defconfig    gcc-16.1.0
i386                   randconfig-051-20260915    clang-22
i386                   randconfig-052-20260915    clang-22
i386                   randconfig-053-20260915    clang-22
i386                   randconfig-054-20260915    clang-22
i386                  randconfig-1000-20260917    clang-22
i386                  randconfig-1001-20260917    clang-22
i386                  randconfig-1002-20260917    clang-22
i386                  randconfig-1003-20260917    clang-22
i386                  randconfig-1003-20260917    gcc-14
i386                  randconfig-1004-20260917    clang-22
i386                  randconfig-1005-20260917    clang-22
i386                  randconfig-1006-20260917    clang-22
i386                  randconfig-1007-20260917    clang-22
i386                  randconfig-1008-20260917    clang-22
i386                  randconfig-1009-20260917    clang-22
i386                  randconfig-1010-20260917    clang-22
i386                  randconfig-1011-20260917    clang-22
i386                  randconfig-1012-20260917    clang-22
i386                  randconfig-1013-20260917    clang-22
i386                  randconfig-1300-20260917    gcc-14     sparse
i386                  randconfig-1301-20260917    gcc-14     sparse
i386                  randconfig-1302-20260917    gcc-14     sparse
i386                   randconfig-141-20260915    clang-22
i386                  randconfig-r051-20260915    clang-17
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260917    clang-24
loongarch             randconfig-1001-20260917    clang-24
loongarch             randconfig-r053-20260915    clang-19
loongarch             randconfig-r072-20260915    gcc-16.1.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                                 defconfig    gcc-16.1.0
m68k                  randconfig-r051-20260915    gcc-8.5.0
m68k                  randconfig-r053-20260915    gcc-8.5.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                           defconfig    gcc-16.1.0
microblaze            randconfig-r073-20260915    gcc-8.5.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq5_defconfig    gcc-16.1.0
mips                            gcw0_defconfig    clang-24
mips                         omega2p_defconfig    clang-24
mips                  randconfig-r063-20260915    gcc-8.5.0
mips                  randconfig-r064-20260915    gcc-8.5.0
mips                  randconfig-r073-20260915    gcc-16.1.0
mips                 randconfig-r1301-20260917    clang-24   sparse
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    clang-24
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260917    gcc-11.5.0
nios2                 randconfig-1001-20260917    gcc-11.5.0
nios2                 randconfig-r053-20260915    clang-17
nios2                randconfig-r1300-20260917    gcc-8.5.0  sparse
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    clang-24
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc              randconfig-r071-20260915    gcc-14.3.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260917    gcc-11.5.0
parisc                randconfig-1001-20260917    gcc-9.5.0
parisc                randconfig-r052-20260915    clang-17
parisc                randconfig-r052-20260915    clang-19
parisc                randconfig-r052-20260915    gcc-8.5.0
parisc                randconfig-r054-20260915    gcc-8.5.0
parisc64                             defconfig    clang-24
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                            allnoconfig    gcc-16.1.0
powerpc                       chrp32_defconfig    clang-24
powerpc                        ebony_defconfig    clang-24
powerpc                           g5_defconfig    clang-24
powerpc                   mpc866_ads_defconfig    clang-17
powerpc               randconfig-1000-20260917    clang-24
powerpc               randconfig-1001-20260917    clang-24
powerpc               randconfig-r071-20260915    clang-24
powerpc              randconfig-r1306-20260917    clang-24   sparse
powerpc                  xes_mpc85xx_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260917    clang-24
powerpc64             randconfig-1001-20260917    clang-22
powerpc64             randconfig-r054-20260915    clang-19
powerpc64            randconfig-r1303-20260917    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    clang-24
riscv                 randconfig-1000-20260917    clang-17
riscv                 randconfig-1001-20260917    clang-17
riscv                 randconfig-r064-20260915    gcc-8.5.0
riscv                 randconfig-r072-20260915    clang-19
riscv                randconfig-r1304-20260917    clang-24   sparse
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260917    clang-17
s390                  randconfig-1001-20260917    clang-17
s390                  randconfig-r064-20260915    gcc-8.5.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                                   defconfig    gcc-16.1.0
sh                           kfr2r09_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260917    clang-17
sh                    randconfig-1001-20260917    clang-17
sh                            se7750_defconfig    clang-24
sh                            se7780_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260917    clang-17
sparc                 randconfig-1000-20260917    gcc-8.5.0
sparc                 randconfig-1001-20260917    clang-17
sparc                 randconfig-1001-20260917    gcc-15.2.0
sparc                 randconfig-r061-20260915    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260917    clang-17
sparc64               randconfig-1000-20260917    clang-24
sparc64               randconfig-1001-20260917    clang-17
sparc64               randconfig-1001-20260917    gcc-8.5.0
sparc64               randconfig-r061-20260915    gcc-8.5.0
sparc64               randconfig-r071-20260915    gcc-15.2.0
sparc64              randconfig-r1309-20260917    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260917    clang-17
um                    randconfig-1000-20260917    gcc-14
um                    randconfig-1001-20260917    clang-17
um                            x86_64_defconfig    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260917    gcc-13
x86_64      buildonly-randconfig-1000-20260917    gcc-14
x86_64      buildonly-randconfig-1001-20260917    gcc-14
x86_64      buildonly-randconfig-1002-20260917    gcc-14
x86_64      buildonly-randconfig-1003-20260917    gcc-14
x86_64      buildonly-randconfig-1004-20260917    gcc-14
x86_64      buildonly-randconfig-1005-20260917    clang-22
x86_64      buildonly-randconfig-1005-20260917    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260917    clang-22
x86_64                randconfig-1000-20260917    gcc-14
x86_64                randconfig-1001-20260917    clang-22
x86_64                randconfig-1002-20260917    clang-22
x86_64                randconfig-1002-20260917    gcc-14
x86_64                randconfig-1003-20260917    clang-22
x86_64                randconfig-1004-20260917    clang-22
x86_64                randconfig-1004-20260917    gcc-14
x86_64                randconfig-1005-20260917    clang-22
x86_64                randconfig-1005-20260917    gcc-14
x86_64                 randconfig-101-20260915    clang-22
x86_64                randconfig-1012-20260917    clang-22
x86_64                randconfig-1012-20260917    gcc-14
x86_64                randconfig-1013-20260917    clang-22
x86_64                randconfig-1013-20260917    gcc-14
x86_64                randconfig-1014-20260917    clang-22
x86_64                randconfig-1015-20260917    clang-22
x86_64                randconfig-1016-20260917    clang-22
x86_64                randconfig-1017-20260917    clang-22
x86_64                 randconfig-102-20260915    clang-22
x86_64                 randconfig-103-20260915    clang-22
x86_64                 randconfig-104-20260915    clang-22
x86_64                randconfig-1300-20260917    gcc-14     sparse
x86_64                randconfig-1301-20260917    gcc-14     sparse
x86_64                randconfig-1302-20260917    gcc-14     sparse
x86_64                 randconfig-161-20260915    clang-22
x86_64                randconfig-r063-20260915    gcc-8.5.0
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260917    clang-17
xtensa                randconfig-1000-20260917    gcc-8.5.0
xtensa                randconfig-1001-20260917    clang-17
xtensa                randconfig-1001-20260917    gcc-13.4.0
xtensa                randconfig-r061-20260915    gcc-8.5.0
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

