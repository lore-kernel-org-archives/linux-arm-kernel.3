Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A3C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Vv/Ch9Ed1uj9rAUQe5LxEklCDsjBu6M+sDoqRii5+Q=; b=DMHqoof/v87N20dTYBCXCcw5kR
	j7l06vcvOWcs/fBVTNSHhjmQ6/1eNWjYKsNBpX0v+2AUKnQ2WNZL14RwslCNekySD6d2oXeqwir/L
	5yJ1WCqlQF0lYlOlefoS050LImFlxx/zNusDOcD2DZt0LA2lswm3HB8DT15S/X75nmu3tkGyngiAl
	ug79U1Pk/jZSjSoiYSWuVfYIhSRLH7FSFefxFHA5sGbmwxgbrpyBgq9HRkGRthgEtTV7QkNBQT8AI
	NZwrvxJcoMZTW4IgESrdCv7A3yfgqBb1IZ90/lyeg/mcIjzRP0YCSOyIoJbxasVw7oLJJsCzafFK3
	jEeQVttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7Bo-0000000G5bZ-00g0;
	Wed, 12 Aug 2026 11:32:08 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7BS-0000000G5WN-0Jud
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786534306; x=1818070306;
  h=date:from:to:cc:subject:message-id;
  bh=0stUbdhw23AKLVOfD+urksm2oh/2s3lw6w2l3zlK7g8=;
  b=SbPS/v59MYAQhz4oLUuEULo9j7th8HV6JAOAowjwU0hOF6mGlaQIf2nz
   3XsiqbPJVL0gV3LjjGNtBXrvHen76qnsnA8jY7dl46WdnI4PMf7vqwInY
   AYMPO0lbEUNrYlLcCnQLCr3X6qjF2elofGVxMSCc59ybBoYQKwBXdL8lX
   IiLpDIda3lw7EOWVsqocibz6F7LvXwwcXoTE21oA8hxamB5hy0ybfFI2r
   ZRRLjJr1mp2i93A4WyUldyA5yBYWaLTIGtrDVHGxOUqZPv9nUGfouToZH
   olhTEecCQMmA/kIot3qgm3GnJZLkNWED7G6Xw5yr2hC4QzDALKa7BFaiW
   g==;
X-CSE-ConnectionGUID: Iqc8OkxJTBW3N6hNtidibA==
X-CSE-MsgGUID: QQNZsRDvRcSzdZh593ETvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86941210"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86941210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:31:45 -0700
X-CSE-ConnectionGUID: K+3GM5nYRoeyqBt03OJwAg==
X-CSE-MsgGUID: xWq4QzHlR9eovzb+7cS6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="260996353"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2026 04:31:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu7BN-00000000QXS-22ec;
	Wed, 12 Aug 2026 11:31:41 +0000
Date: Wed, 12 Aug 2026 19:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 373eab9eec316c315e884e9cb520c6d8c3236e0f
Message-ID: <202608121923.rMNCGydm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_043147_663246_388A5007 
X-CRM114-Status: UNSURE (   5.76  )
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
branch HEAD: 373eab9eec316c315e884e9cb520c6d8c3236e0f  Merge tag 'ti-k3-config-for-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig

elapsed time: 1519m

configs tested: 119
configs skipped: 110

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260811    gcc-13.4.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260811    gcc-15.2.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260811    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-004-20260811    clang-24
arm                  randconfig-004-20260812    gcc-12.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260811    gcc-8.5.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260811    gcc-9.5.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260811    clang-17
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260811    gcc-13.4.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-002-20260812    clang-17
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-002-20260812    clang-17
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-17
riscv                randconfig-001-20260811    clang-24
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260811    clang-24
riscv                randconfig-002-20260812    clang-24
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-002-20260812    clang-24
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260812    gcc-13.4.0
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

