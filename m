Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5E1C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nZVjKkTCCQN3HAHhlsWgKQsZhQoT7iREp0Ouolp4hOQ=; b=Ut9fUa/drjSrsoAgUx+mW6vTRp
	0oI5GYtlKsLksq4pKvCsgBF6UVefU1hEihQD2oaw/5+9xap7tNB3zyY0GVMcSDq5ONrzlwi42rcCy
	cl8CfpdevWdrKI+FO05H1FVtQBWUvj4/Po7fS/xWo8vVlTAsaZCBlLi4CRuAI+9Tou5JL2Fu3Jn/R
	NaFqr3nezAcW2B6GH0VDWap7n3HyyZKUOYSPC7JPHMG5x5FSJ22SC8J+qNPraHv3Z3VJyHSs6zhas
	ORK+grxlnx55KfGe7jiVD6A24KizQlwoR4EsleyTV5bs4B2Hy5jSj3dV+1aenyidJUT42agv1Lr3W
	Pj8tx4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk1t-00000004bud-38FF;
	Wed, 05 Aug 2026 22:24:05 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrk1q-00000004btp-277C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785968643; x=1817504643;
  h=date:from:to:cc:subject:message-id;
  bh=g2Jy9OW1xc2gRtP5DR1ooTfNatjBvbeJabzbZaW/h5s=;
  b=YYtCZrainzxfDe1WuhnaNkPFRAn45i7yhuC8NF2YMPDrh75AwFYJaB/A
   zO657vqOOswe7bVW0FFI9TZfCJmgQPkHXHqgLRFQLCkvC3K2sfQRyAfrX
   MOidtlvEemQJnyEFgMp/7AXL8IRB8un6yhyGTrULYDRh9sxULIYq03jJK
   Huh/0o8uoeYb3qpEOqmORQHLaPx45TYZc3T2wpO8k025lgcdXOkUuIky5
   XCXIOO4xGje3LiSFwpJa28TGxRZ//9olhtE1vtoREdphSWJRWV8kfBldv
   +voKcxpinSQxKCPGCgMDlcJDDEpsL1oS0L6u54iZVob6uzHjhCdGpNzyo
   Q==;
X-CSE-ConnectionGUID: mQjOS1LOSjKsG6KO/bZOlQ==
X-CSE-MsgGUID: K8RdQg7xSU2hYY/bOFMVJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="89077197"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="89077197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:24:02 -0700
X-CSE-ConnectionGUID: YfkxN8GNQrem3Pqup1yOIg==
X-CSE-MsgGUID: WvMujhfmQISJHLUE4OkgCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="260151973"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2026 15:24:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrk1m-00000000DZY-1GGd;
	Wed, 05 Aug 2026 22:23:58 +0000
Date: Thu, 06 Aug 2026 06:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 ec26714d2205da69222a9f2bfec4c7f7f95784bb
Message-ID: <202608060645.WpUj1Eu9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_152402_553094_262A8994 
X-CRM114-Status: UNSURE (   5.41  )
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
branch HEAD: ec26714d2205da69222a9f2bfec4c7f7f95784bb  Merge tag 'sunxi-config-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into soc/defconfig

elapsed time: 1548m

configs tested: 166
configs skipped: 100

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260805    gcc-12.5.0
arc                  randconfig-001-20260806    gcc-11.5.0
arc                  randconfig-002-20260805    gcc-12.5.0
arc                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-001-20260805    gcc-12.5.0
arm                  randconfig-001-20260806    gcc-11.5.0
arm                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-003-20260805    gcc-12.5.0
arm                  randconfig-003-20260806    gcc-11.5.0
arm                  randconfig-004-20260805    gcc-12.5.0
arm                  randconfig-004-20260806    gcc-11.5.0
arm64                         randconfig-001    gcc-10.5.0
arm64                randconfig-001-20260805    gcc-10.5.0
arm64                randconfig-001-20260806    gcc-13.4.0
arm64                randconfig-002-20260805    gcc-10.5.0
arm64                randconfig-002-20260806    gcc-13.4.0
arm64                randconfig-003-20260805    gcc-10.5.0
arm64                randconfig-003-20260806    gcc-13.4.0
arm64                randconfig-004-20260805    gcc-10.5.0
arm64                randconfig-004-20260806    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260805    gcc-10.5.0
csky                 randconfig-001-20260806    gcc-13.4.0
csky                 randconfig-002-20260805    gcc-10.5.0
csky                 randconfig-002-20260806    gcc-13.4.0
hexagon                       randconfig-001    clang-18
hexagon              randconfig-001-20260805    clang-18
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-002-20260805    clang-18
hexagon              randconfig-002-20260806    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260805    clang-22
i386       buildonly-randconfig-002-20260805    clang-22
i386       buildonly-randconfig-003-20260805    clang-22
i386       buildonly-randconfig-004-20260805    clang-22
i386       buildonly-randconfig-005-20260805    clang-22
i386       buildonly-randconfig-006-20260805    clang-22
i386                 randconfig-001-20260805    gcc-13
i386                 randconfig-002-20260805    gcc-13
i386                 randconfig-003-20260805    gcc-13
i386                 randconfig-004-20260805    gcc-13
i386                 randconfig-005-20260805    gcc-13
i386                 randconfig-006-20260805    gcc-13
i386                 randconfig-007-20260805    gcc-13
i386                 randconfig-011-20260805    gcc-14
i386                 randconfig-011-20260806    clang-22
i386                 randconfig-012-20260805    gcc-14
i386                 randconfig-012-20260806    clang-22
i386                 randconfig-013-20260805    gcc-14
i386                 randconfig-013-20260806    clang-22
i386                 randconfig-014-20260805    gcc-14
i386                 randconfig-014-20260806    clang-22
i386                 randconfig-015-20260805    gcc-14
i386                 randconfig-015-20260806    clang-22
i386                 randconfig-016-20260805    gcc-14
i386                 randconfig-016-20260806    clang-22
i386                 randconfig-017-20260805    gcc-14
i386                 randconfig-017-20260806    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260805    clang-18
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-002-20260805    clang-18
loongarch            randconfig-002-20260806    clang-24
m68k                      m5208evb_defconfig    gcc-16.1.0
mips                 cavium_octeon_defconfig    gcc-16.1.0
mips                          jazz_defconfig    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260805    clang-18
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-002-20260805    clang-18
nios2                randconfig-002-20260806    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-9.5.0
parisc               randconfig-001-20260805    gcc-9.5.0
parisc               randconfig-001-20260806    gcc-8.5.0
parisc               randconfig-002-20260805    gcc-9.5.0
parisc               randconfig-002-20260806    gcc-8.5.0
powerpc              randconfig-001-20260805    gcc-9.5.0
powerpc              randconfig-001-20260806    gcc-8.5.0
powerpc              randconfig-002-20260805    gcc-9.5.0
powerpc              randconfig-002-20260806    gcc-8.5.0
powerpc64            randconfig-001-20260805    gcc-9.5.0
powerpc64            randconfig-001-20260806    gcc-8.5.0
powerpc64            randconfig-002-20260805    gcc-9.5.0
powerpc64            randconfig-002-20260806    gcc-8.5.0
riscv                         randconfig-001    gcc-8.5.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-002-20260805    gcc-8.5.0
riscv                randconfig-002-20260806    gcc-13.4.0
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-002-20260805    gcc-8.5.0
s390                 randconfig-002-20260806    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260805    gcc-8.5.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-002-20260805    gcc-8.5.0
sh                   randconfig-002-20260806    gcc-13.4.0
sh                          se7705_defconfig    gcc-16.1.0
sparc                randconfig-001-20260805    gcc-11.5.0
sparc                randconfig-001-20260806    gcc-8.5.0
sparc                randconfig-002-20260805    gcc-11.5.0
sparc                randconfig-002-20260806    gcc-8.5.0
sparc64              randconfig-001-20260805    gcc-11.5.0
sparc64              randconfig-001-20260806    gcc-8.5.0
sparc64              randconfig-002-20260805    gcc-11.5.0
sparc64              randconfig-002-20260806    gcc-8.5.0
um                   randconfig-001-20260805    gcc-11.5.0
um                   randconfig-001-20260806    gcc-8.5.0
um                   randconfig-002-20260805    gcc-11.5.0
um                   randconfig-002-20260806    gcc-8.5.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260805    gcc-14
x86_64     buildonly-randconfig-002-20260805    gcc-14
x86_64     buildonly-randconfig-003-20260805    gcc-14
x86_64     buildonly-randconfig-004-20260805    gcc-14
x86_64     buildonly-randconfig-005-20260805    gcc-14
x86_64     buildonly-randconfig-006-20260805    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260805    gcc-14
x86_64               randconfig-001-20260806    clang-22
x86_64               randconfig-002-20260805    gcc-14
x86_64               randconfig-002-20260806    clang-22
x86_64               randconfig-003-20260805    gcc-14
x86_64               randconfig-003-20260806    clang-22
x86_64               randconfig-004-20260805    gcc-14
x86_64               randconfig-004-20260806    clang-22
x86_64               randconfig-005-20260805    gcc-14
x86_64               randconfig-005-20260806    clang-22
x86_64               randconfig-006-20260805    gcc-14
x86_64               randconfig-006-20260806    clang-22
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-014-20260805    gcc-14
x86_64               randconfig-015-20260805    gcc-14
x86_64               randconfig-016-20260805    gcc-14
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-071-20260806    gcc-14
x86_64               randconfig-072-20260805    clang-22
x86_64               randconfig-072-20260806    gcc-14
x86_64               randconfig-073-20260805    clang-22
x86_64               randconfig-073-20260806    gcc-14
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-074-20260806    gcc-14
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-075-20260806    gcc-14
x86_64               randconfig-076-20260805    clang-22
x86_64               randconfig-076-20260806    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260805    gcc-11.5.0
xtensa               randconfig-001-20260806    gcc-8.5.0
xtensa               randconfig-002-20260805    gcc-11.5.0
xtensa               randconfig-002-20260806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

