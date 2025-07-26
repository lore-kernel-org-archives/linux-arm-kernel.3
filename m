Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UEaXPAyAWOVHn5anrR5DiEkB4GW7u5wjA2dG8gUz0WY=; b=jSDS2jY4NytJzcoPw+tl2Q4Ecw
	O1BpsqIU64XF+N46rYVBtkD51gheFWLwZxl0LSoq3nfso76/pb+j3uZLyA9h4J9Hsu2/O+cixX9YW
	4Km++Auf9vevdP+ZfveCQuJm/fWOuGB56QC6acAFQXQuKExlw394lHYWTLqLT9JV7PHftondf/YOJ
	5t66AvgTN8wKWcd6hEI6l7cIyos1Tr2sYBGd9u+OvzXI/X0teaCQ+d2L1Hd5R6KdleVnpN+ea+mFC
	YyViKF7VQD6KV0cJ313mpWRQz3akBfa/zE2AXdBxdt+LgQDR/QvZMYSTvlKk3F56mcTVGN02MD5jU
	KHkSs0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflZp-0000000Br8H-1623;
	Sat, 26 Jul 2025 20:33:05 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflXI-0000000Br1y-3SFU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 20:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753561829; x=1785097829;
  h=date:from:to:cc:subject:message-id;
  bh=6GqbBbG2779CHcrLqM4tpu/a16aXy28jzL5bHrkFsD8=;
  b=L/R+Gvu690+g6PImcx00j30DzjFy2aACb6Kc7FiWrD4BjJjI4jLu38gG
   XtdarJLgt6XED/ywd7UTHJgxR2K3x6AEgOM4M86sBPIszaJ2WTuChz+ME
   v2R/VHTswQEsoXpIwilyFpAHZ6WOQ6+jId1rlErQ0gsMDIKS/3YVX9Axi
   k4kqlAdd1YpsTjA1kIjZS0nlSmXRm29sREB2xAezrHKbbgQUqxsaa58jl
   uQK2Zd4mMus7ZycdJI9IxWAnVbn2OWgelitV72ZR0CZ4I1I04O5eaJxFb
   vRLNdgchpBB1gdWnqsXxlUHjKgl+ZYZjaB6XgumuCpMW5r8XlrASFwECi
   w==;
X-CSE-ConnectionGUID: KU0Iawu6R0+QHXBHqOmhqQ==
X-CSE-MsgGUID: cjzwLnMqRIqVy4Nmg2GFTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55073178"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55073178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 13:30:22 -0700
X-CSE-ConnectionGUID: DSsfe0CVRsyO4bfUPyMsAw==
X-CSE-MsgGUID: WNUCxLvZQDyT8Iw64pT/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162034199"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 13:30:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uflX9-000MGJ-0y;
	Sat, 26 Jul 2025 20:30:19 +0000
Date: Sun, 27 Jul 2025 04:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 4507d205f10216d3a6b873f0a2e9c634e23f35ac
Message-ID: <202507270402.ndeU6vjV-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_133028_910264_07A6664D 
X-CRM114-Status: UNSURE (   5.42  )
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
branch HEAD: 4507d205f10216d3a6b873f0a2e9c634e23f35ac  Merge tag 'hisi-drivers-for-6.17' of https://github.com/hisilicon/linux-hisi into soc/drivers

elapsed time: 1333m

configs tested: 177
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250726    gcc-14.3.0
arc                   randconfig-002-20250726    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                                 defconfig    clang-19
arm                          moxart_defconfig    clang-22
arm                   randconfig-001-20250726    gcc-8.5.0
arm                   randconfig-002-20250726    gcc-10.5.0
arm                   randconfig-003-20250726    gcc-10.5.0
arm                   randconfig-004-20250726    gcc-8.5.0
arm                        realview_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250726    gcc-8.5.0
arm64                 randconfig-002-20250726    clang-22
arm64                 randconfig-003-20250726    gcc-12.5.0
arm64                 randconfig-004-20250726    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250726    gcc-15.1.0
csky                  randconfig-001-20250727    gcc-11.5.0
csky                  randconfig-002-20250726    gcc-15.1.0
csky                  randconfig-002-20250727    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250726    clang-22
hexagon               randconfig-001-20250727    gcc-11.5.0
hexagon               randconfig-002-20250726    clang-20
hexagon               randconfig-002-20250727    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250726    gcc-12
i386        buildonly-randconfig-002-20250726    gcc-12
i386        buildonly-randconfig-003-20250726    clang-20
i386        buildonly-randconfig-004-20250726    gcc-12
i386        buildonly-randconfig-005-20250726    clang-20
i386        buildonly-randconfig-006-20250726    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-011-20250727    clang-20
i386                  randconfig-012-20250727    clang-20
i386                  randconfig-013-20250727    clang-20
i386                  randconfig-014-20250727    clang-20
i386                  randconfig-015-20250727    clang-20
i386                  randconfig-016-20250727    clang-20
i386                  randconfig-017-20250727    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250726    gcc-15.1.0
loongarch             randconfig-001-20250727    gcc-11.5.0
loongarch             randconfig-002-20250726    gcc-14.3.0
loongarch             randconfig-002-20250727    gcc-11.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    clang-22
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250726    gcc-8.5.0
nios2                 randconfig-001-20250727    gcc-11.5.0
nios2                 randconfig-002-20250726    gcc-8.5.0
nios2                 randconfig-002-20250727    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250726    gcc-8.5.0
parisc                randconfig-001-20250727    gcc-11.5.0
parisc                randconfig-002-20250726    gcc-8.5.0
parisc                randconfig-002-20250727    gcc-11.5.0
parisc64                         alldefconfig    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250726    clang-16
powerpc               randconfig-001-20250727    gcc-11.5.0
powerpc               randconfig-002-20250726    gcc-11.5.0
powerpc               randconfig-002-20250727    gcc-11.5.0
powerpc               randconfig-003-20250726    gcc-8.5.0
powerpc               randconfig-003-20250727    gcc-11.5.0
powerpc64             randconfig-001-20250726    clang-22
powerpc64             randconfig-001-20250727    gcc-11.5.0
powerpc64             randconfig-002-20250726    gcc-10.5.0
powerpc64             randconfig-002-20250727    gcc-11.5.0
powerpc64             randconfig-003-20250726    clang-22
powerpc64             randconfig-003-20250727    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250726    gcc-11.5.0
riscv                 randconfig-002-20250726    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250726    clang-22
s390                  randconfig-002-20250726    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250726    gcc-12.5.0
sh                    randconfig-002-20250726    gcc-9.5.0
sh                           se7712_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250726    gcc-8.5.0
sparc                 randconfig-002-20250726    gcc-15.1.0
sparc64               randconfig-001-20250726    clang-22
sparc64               randconfig-002-20250726    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250726    gcc-12
um                    randconfig-002-20250726    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250726    gcc-12
x86_64      buildonly-randconfig-002-20250726    gcc-12
x86_64      buildonly-randconfig-003-20250726    gcc-12
x86_64      buildonly-randconfig-004-20250726    clang-20
x86_64      buildonly-randconfig-005-20250726    clang-20
x86_64      buildonly-randconfig-006-20250726    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250726    clang-20
x86_64                randconfig-002-20250726    clang-20
x86_64                randconfig-003-20250726    clang-20
x86_64                randconfig-004-20250726    clang-20
x86_64                randconfig-005-20250726    clang-20
x86_64                randconfig-006-20250726    clang-20
x86_64                randconfig-007-20250726    clang-20
x86_64                randconfig-008-20250726    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250726    gcc-8.5.0
xtensa                randconfig-002-20250726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

