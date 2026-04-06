Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3348EF4EA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D3BAnOBFDx3l933w+SKAGlgzQ8wdPTcgm5J/Ir1oaCI=; b=qkX+9yAkzQrtgnm2o9Rr7f+PcZ
	22TwK6cv0MZ0OptKgEWCramWqQGm832GDlDLs21ERD35/h0EhSFwCNxv6/1IrLA0K4zU8dw5cMCbf
	HzVC0C+0NYSEzJX6rZI8BZoHnS2Akos+EhHuSG1VHRff6XFfkFpsxTMTRJvbplNsawU43X9ubTmAx
	u+8CDH5f1KdKaPrxeD+f1bv2AgH+QB5/oTNhx+OvKDogjjRJqiMrVYJeTVhexBIF5DXa+fwgfaEHx
	BNoRX9EPUUnTa2kSmlyyepP0ccKc0mUvEWn3c9hkrYsqylvvO1QU97iE6FczQmxaAVtd1vf8Umh/o
	1QMiWf/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9fCE-00000004ukC-1KKW;
	Mon, 06 Apr 2026 08:20:34 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9fCB-00000004ujt-1nyz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 08:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775463631; x=1806999631;
  h=date:from:to:cc:subject:message-id;
  bh=ZrxDgWaG41UkmEZigpZpHZbtFxMNQRd+s77CiuTgkFY=;
  b=XvUsjQof1aBy8TLzluvJVVzVf5UxbL3aDUn/xoADzEgqcJ5ZWAwSR4cx
   aLBvxe4lSORsM+gbXGxZeXBys40RtS4nuoZ8vsVzQvs1OlaY+CkirgATL
   C6sspOoGCjMhch3/gJbbBzFDb7jHiSD8GvOYiG9e0BYcIHHFPRqisODNw
   m2bmI/kYbjq4F5sDRkD9UPHe0mmlG5jwSv+do2nqfdiOwQAIYlqKa+3sV
   4cTVInlD6V2Ofim0+2Rmclh03USJTjzr4diHrjwcNGo9nXEV5vXP7HnWh
   7rdiAzWraj0iZfOiqYBzc2357igEQil52m+mpkRO1GaRXjFbY/BToe0uR
   g==;
X-CSE-ConnectionGUID: JhXvfyQNTIKTVtdiwB9Q1g==
X-CSE-MsgGUID: SzfusdYyQkq+l+p86s8f4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75586335"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="75586335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 01:20:26 -0700
X-CSE-ConnectionGUID: LamYO0/vTOmSMrrMZr42fw==
X-CSE-MsgGUID: asUp3cXaSLW3JDhApV+a7A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2026 01:20:25 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9fC2-000000002q5-3jOH;
	Mon, 06 Apr 2026 08:20:22 +0000
Date: Mon, 06 Apr 2026 16:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 ebe732aa782f33372a1f2189d6308ba102a3141d
Message-ID: <202604061657.3IbAd9Tq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_012031_572526_42E7F14D 
X-CRM114-Status: UNSURE (   4.86  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: ebe732aa782f33372a1f2189d6308ba102a3141d  soc: document merges

elapsed time: 731m

configs tested: 219
configs skipped: 13

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
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260406    clang-23
arc                   randconfig-001-20260406    gcc-10.5.0
arc                   randconfig-002-20260406    clang-23
arc                   randconfig-002-20260406    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      footbridge_defconfig    clang-17
arm                            mmp2_defconfig    gcc-15.2.0
arm                   randconfig-001-20260406    clang-17
arm                   randconfig-001-20260406    clang-23
arm                   randconfig-002-20260406    clang-23
arm                   randconfig-003-20260406    clang-23
arm                   randconfig-004-20260406    clang-23
arm                   randconfig-004-20260406    gcc-13.4.0
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260406    clang-20
arm64                 randconfig-001-20260406    gcc-10.5.0
arm64                 randconfig-002-20260406    clang-23
arm64                 randconfig-002-20260406    gcc-10.5.0
arm64                 randconfig-003-20260406    gcc-10.5.0
arm64                 randconfig-004-20260406    gcc-10.5.0
arm64                 randconfig-004-20260406    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260406    gcc-10.5.0
csky                  randconfig-001-20260406    gcc-14.3.0
csky                  randconfig-002-20260406    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260406    clang-23
hexagon               randconfig-002-20260406    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260406    clang-20
i386        buildonly-randconfig-001-20260406    gcc-14
i386        buildonly-randconfig-002-20260406    clang-20
i386        buildonly-randconfig-002-20260406    gcc-14
i386        buildonly-randconfig-003-20260406    clang-20
i386        buildonly-randconfig-003-20260406    gcc-14
i386        buildonly-randconfig-004-20260406    gcc-14
i386        buildonly-randconfig-005-20260406    clang-20
i386        buildonly-randconfig-005-20260406    gcc-14
i386        buildonly-randconfig-006-20260406    gcc-13
i386        buildonly-randconfig-006-20260406    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260406    clang-20
i386                  randconfig-002-20260406    clang-20
i386                  randconfig-003-20260406    clang-20
i386                  randconfig-004-20260406    clang-20
i386                  randconfig-005-20260406    clang-20
i386                  randconfig-006-20260406    clang-20
i386                  randconfig-007-20260406    clang-20
i386                  randconfig-011-20260406    gcc-14
i386                  randconfig-012-20260406    gcc-14
i386                  randconfig-013-20260406    gcc-14
i386                  randconfig-014-20260406    gcc-14
i386                  randconfig-015-20260406    gcc-14
i386                  randconfig-016-20260406    gcc-14
i386                  randconfig-017-20260406    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260406    clang-23
loongarch             randconfig-002-20260406    clang-23
loongarch             randconfig-002-20260406    gcc-11.5.0
loongarch             randconfig-002-20260406    gcc-15.2.0
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
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260406    clang-23
nios2                 randconfig-001-20260406    gcc-11.5.0
nios2                 randconfig-002-20260406    clang-23
nios2                 randconfig-002-20260406    gcc-11.5.0
nios2                 randconfig-002-20260406    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260406    clang-23
parisc                randconfig-001-20260406    gcc-15.2.0
parisc                randconfig-002-20260406    clang-23
parisc                randconfig-002-20260406    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260406    clang-20
powerpc               randconfig-001-20260406    clang-23
powerpc               randconfig-002-20260406    clang-18
powerpc               randconfig-002-20260406    clang-23
powerpc                     tqm8548_defconfig    clang-23
powerpc64             randconfig-001-20260406    clang-23
powerpc64             randconfig-001-20260406    gcc-14.3.0
powerpc64             randconfig-002-20260406    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260406    gcc-8.5.0
riscv                 randconfig-002-20260406    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260406    gcc-8.5.0
s390                  randconfig-002-20260406    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260406    gcc-8.5.0
sh                    randconfig-002-20260406    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260406    clang-17
sparc                 randconfig-001-20260406    gcc-11.5.0
sparc                 randconfig-002-20260406    clang-17
sparc                 randconfig-002-20260406    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260406    clang-17
sparc64               randconfig-001-20260406    clang-23
sparc64               randconfig-002-20260406    clang-17
sparc64               randconfig-002-20260406    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260406    clang-17
um                    randconfig-002-20260406    clang-17
um                    randconfig-002-20260406    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260406    gcc-14
x86_64      buildonly-randconfig-002-20260406    gcc-14
x86_64      buildonly-randconfig-003-20260406    gcc-14
x86_64      buildonly-randconfig-004-20260406    gcc-14
x86_64      buildonly-randconfig-005-20260406    gcc-14
x86_64      buildonly-randconfig-006-20260406    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260406    gcc-14
x86_64                randconfig-002-20260406    gcc-14
x86_64                randconfig-003-20260406    gcc-14
x86_64                randconfig-004-20260406    gcc-14
x86_64                randconfig-005-20260406    gcc-14
x86_64                randconfig-006-20260406    gcc-14
x86_64                randconfig-011-20260406    clang-20
x86_64                randconfig-012-20260406    clang-20
x86_64                randconfig-013-20260406    clang-20
x86_64                randconfig-014-20260406    clang-20
x86_64                randconfig-015-20260406    clang-20
x86_64                randconfig-016-20260406    clang-20
x86_64                randconfig-071-20260406    clang-20
x86_64                randconfig-071-20260406    gcc-13
x86_64                randconfig-072-20260406    clang-20
x86_64                randconfig-072-20260406    gcc-13
x86_64                randconfig-073-20260406    clang-20
x86_64                randconfig-073-20260406    gcc-13
x86_64                randconfig-074-20260406    clang-20
x86_64                randconfig-074-20260406    gcc-13
x86_64                randconfig-075-20260406    clang-20
x86_64                randconfig-075-20260406    gcc-13
x86_64                randconfig-076-20260406    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260406    clang-17
xtensa                randconfig-001-20260406    gcc-12.5.0
xtensa                randconfig-002-20260406    clang-17
xtensa                randconfig-002-20260406    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

