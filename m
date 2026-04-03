Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9A9E7E373
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a+quUZ7UHrBkyIB/5sR9b1mecweSU2bj/jalwIC5b6g=; b=pNaMesku3XlFNdnMlF+CsE2j0g
	pi1fIAOFs68ukXyl555187LToCuF+7fvJwSPGvU5YElNm5Ycoeonj1hllomukmF3NGptJYOYtpPIk
	uIzp+lP4HxNMpATjGkC5ATg//RNqZ4QEewuro1h9ySw2gkIxLQOi2rRU8TPkpEcEr4diO6tR/HqnY
	gainIwWDWP2xxVZgAgcbh0IkXpXd5kAW50kvKQAq8c8ya8nqdmM5/pFX32ST0vZ98E9TqyjQ2LNa9
	oD8fuPDD8ey3jH8P29ihL5HK9kyJztYHS77zyGjEtlu5LcbLYNbeBXUegsOA2bMqPedO2j5DjXaHQ
	rJE/DBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cRy-00000001vYt-3QYG;
	Fri, 03 Apr 2026 11:12:30 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cRw-00000001vYa-2Gg0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 11:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775214749; x=1806750749;
  h=date:from:to:cc:subject:message-id;
  bh=aRWKUzhyDrgKONeqhclaafQ7y3IHjbZCCnGJ4zSMGsk=;
  b=BgIJiNJ1sM408+JApBV5WHXXszYiHVJ9u3BkaENsOXqMGCL7x6QPmeiT
   ODTUP3kMmIN2Usq+ctvFf+1wLQ3sKQgKgMw4e+xkaz8U8zZCgxQJZGRfu
   7SAnXPzjc0wwo5tZEiFuTQXWwNInk3ahI7gkJSzoIXetX9mp454j2lGBN
   650dHRgYXtfTJO1aODFzUKmK4fxPO55TYgXsvvZMLntIDsMscnz1isHIR
   1/Tc1OPFfjBf8k50tIHbKNp0RzTWCmynwcVVzgGqmHHuo0YSLHJxx0iDJ
   rIAhsatY/YplfMqq4ZVvTMbHarv1+Lu6JptHtvFDlFgoJjM1zZsNRTkKg
   Q==;
X-CSE-ConnectionGUID: JTEewz03QKW0TiaLjgu29A==
X-CSE-MsgGUID: x9AWefcBSACqMMz/1ouP0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76169423"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76169423"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 04:12:26 -0700
X-CSE-ConnectionGUID: buIeuXATRBOrqxeTYh5NGw==
X-CSE-MsgGUID: ED/0Esb5RXKRCGZ7SOTjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="220592961"
Received: from lkp-server01.sh.intel.com (HELO c7fa6caadbb2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2026 04:12:23 -0700
Received: from kbuild by c7fa6caadbb2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8cRo-0000000006j-3WeW;
	Fri, 03 Apr 2026 11:12:20 +0000
Date: Fri, 03 Apr 2026 19:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 8366b60cbea2fbf4263e68da39dc848ea1793568
Message-ID: <202604031919.Sga1lJvn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_041228_644616_CEBA0D96 
X-CRM114-Status: UNSURE (   5.21  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: 8366b60cbea2fbf4263e68da39dc848ea1793568  Merge tag 'qcom-arm64-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/dt

elapsed time: 739m

configs tested: 176
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-002-20260403    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-23
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-004-20260403    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-002-20260403    gcc-13.4.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-002-20260403    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-006-20260403    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260403    gcc-14
i386                  randconfig-002-20260403    gcc-14
i386                  randconfig-003-20260403    gcc-14
i386                  randconfig-004-20260403    gcc-14
i386                  randconfig-005-20260403    gcc-14
i386                  randconfig-006-20260403    gcc-14
i386                  randconfig-007-20260403    gcc-14
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-017-20260403    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-002-20260403    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-002-20260403    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260403    clang-23
riscv                 randconfig-002-20260403    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-002-20260403    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260403    clang-23
sh                    randconfig-002-20260403    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-002-20260403    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-002-20260403    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260403    clang-20
x86_64                randconfig-002-20260403    clang-20
x86_64                randconfig-003-20260403    clang-20
x86_64                randconfig-004-20260403    clang-20
x86_64                randconfig-005-20260403    clang-20
x86_64                randconfig-006-20260403    clang-20
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-071-20260403    gcc-14
x86_64                randconfig-072-20260403    gcc-14
x86_64                randconfig-073-20260403    gcc-14
x86_64                randconfig-074-20260403    gcc-14
x86_64                randconfig-075-20260403    gcc-14
x86_64                randconfig-076-20260403    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-002-20260403    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

