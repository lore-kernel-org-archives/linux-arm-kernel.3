Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0741E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 18:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+PARc4nCdFK2zYV+dkw747a4BiAtOPzHsrvnOQQtM8=; b=mDXm/50OPiXzXxY92Wygu7lapZ
	z99uN1tWet2DtcLDe7F98c78ye83zX6Em2Mpyev8f9o5lM7WunMMWFvSi9oqFKzRGVtx+RQxiy4M9
	4ag1r3kv5qNu89TVzLalDjXPrvmRy8smrjm/DIpfYE4hPJc1FhEQxqcRs8U7V735u+heS+cPLxcV5
	IQO1BqGfnv7kwjuYGI40uUfz7/G3pcOy83UMuUzj2gCKqt12BHXkAxQlnbmu7lCbauVauKTYAyDp4
	NkMAKP1vOxpNpqLJVLUsc4gf4seibXm6/cjJ5p8fe4T/EHh6Cvi1qDMHabZN7HitwCnGxj2aq0iw7
	w97/tdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP45o-00000007H5Z-1xWp;
	Sat, 21 Dec 2024 18:20:48 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP44b-00000007Gyz-3vMu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 18:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734805174; x=1766341174;
  h=date:from:to:cc:subject:message-id;
  bh=zrLEbhgOhQNXREtxy4Z5s40NVFGFwq8ntMYyydOrHqw=;
  b=Aif8G2pUHUYrKAmSUx15+4Mj6PODLcRFle2NKAudOdQvgP7OdgBfIAp5
   BPZfpTzOb9hYuWcjscbHoBRgcGwb94tz24IVLsOIdQtoq7Y5Pkjak/kEP
   F1JfjHuFD9ZPkDG5++tY0A/sNhMYF65a0GBtQqVznCQ2SAXzeFF+mlfay
   jA68ua7u5nFjI8q8lJSS72xIqWqsUqsx6JLMAj/ipNu/rZc+veu5D9nGg
   blrH7utIgz71YtBeDphYtF/RovtFjhodLE6YF7Kh4s8asYABHclQaWqZc
   GxXeVnUCM68ZamYJXG2ukA8dyhrzDz0Su+eYCOLCaadiSlQCBrgCj/W2j
   w==;
X-CSE-ConnectionGUID: Cz/spZ6/QJWjlhmqYZtnFg==
X-CSE-MsgGUID: zbhaRx5OQgqS9JLsiSAA7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="45933679"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="45933679"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:19:30 -0800
X-CSE-ConnectionGUID: GwNmx4zcQy2XyrXrZlT5Ew==
X-CSE-MsgGUID: +GnA9W4hRm+x7D9gB3b+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98873719"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2024 10:19:30 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP44U-0002NI-2y;
	Sat, 21 Dec 2024 18:19:26 +0000
Date: Sun, 22 Dec 2024 02:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 a31ffd6ed5ee994e1c04dc794499a0c04618dc55
Message-ID: <202412220215.Cy3XSl95-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_101934_035071_19DB33A5 
X-CRM114-Status: UNSURE (   4.75  )
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
branch HEAD: a31ffd6ed5ee994e1c04dc794499a0c04618dc55  Merge tag 'arm-soc/for-6.13/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes

elapsed time: 1446m

configs tested: 209
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    clang-20
arc                        nsim_700_defconfig    clang-20
arc                   randconfig-001-20241221    gcc-13.2.0
arc                   randconfig-002-20241221    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20241221    gcc-13.2.0
arm                   randconfig-001-20241221    gcc-14.2.0
arm                   randconfig-002-20241221    gcc-13.2.0
arm                   randconfig-002-20241221    gcc-14.2.0
arm                   randconfig-003-20241221    gcc-13.2.0
arm                   randconfig-003-20241221    gcc-14.2.0
arm                   randconfig-004-20241221    clang-18
arm                   randconfig-004-20241221    gcc-13.2.0
arm                           sunxi_defconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241221    clang-18
arm64                 randconfig-001-20241221    gcc-13.2.0
arm64                 randconfig-002-20241221    clang-16
arm64                 randconfig-002-20241221    gcc-13.2.0
arm64                 randconfig-003-20241221    clang-20
arm64                 randconfig-003-20241221    gcc-13.2.0
arm64                 randconfig-004-20241221    gcc-13.2.0
arm64                 randconfig-004-20241221    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241221    gcc-14.2.0
csky                  randconfig-002-20241221    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-002-20241221    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241221    clang-19
i386        buildonly-randconfig-001-20241221    gcc-12
i386        buildonly-randconfig-002-20241221    clang-19
i386        buildonly-randconfig-002-20241221    gcc-12
i386        buildonly-randconfig-003-20241221    clang-19
i386        buildonly-randconfig-004-20241221    clang-19
i386        buildonly-randconfig-005-20241221    clang-19
i386        buildonly-randconfig-006-20241221    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241221    gcc-12
i386                  randconfig-002-20241221    gcc-12
i386                  randconfig-003-20241221    gcc-12
i386                  randconfig-004-20241221    gcc-12
i386                  randconfig-005-20241221    gcc-12
i386                  randconfig-006-20241221    gcc-12
i386                  randconfig-007-20241221    gcc-12
i386                  randconfig-011-20241221    gcc-12
i386                  randconfig-012-20241221    gcc-12
i386                  randconfig-013-20241221    gcc-12
i386                  randconfig-014-20241221    gcc-12
i386                  randconfig-015-20241221    gcc-12
i386                  randconfig-016-20241221    gcc-12
i386                  randconfig-017-20241221    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241221    gcc-14.2.0
loongarch             randconfig-002-20241221    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241221    gcc-14.2.0
nios2                 randconfig-002-20241221    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241221    gcc-14.2.0
parisc                randconfig-002-20241221    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-20
powerpc                        icon_defconfig    clang-20
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241221    gcc-14.2.0
powerpc               randconfig-002-20241221    gcc-14.2.0
powerpc               randconfig-003-20241221    gcc-14.2.0
powerpc64             randconfig-001-20241221    gcc-14.2.0
powerpc64             randconfig-002-20241221    gcc-14.2.0
powerpc64             randconfig-003-20241221    clang-18
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241221    clang-18
riscv                 randconfig-001-20241221    gcc-14.2.0
riscv                 randconfig-002-20241221    clang-18
riscv                 randconfig-002-20241221    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241221    clang-18
s390                  randconfig-001-20241221    gcc-14.2.0
s390                  randconfig-002-20241221    clang-18
s390                  randconfig-002-20241221    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241221    clang-18
sh                    randconfig-001-20241221    gcc-14.2.0
sh                    randconfig-002-20241221    clang-18
sh                    randconfig-002-20241221    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241221    clang-18
sparc                 randconfig-001-20241221    gcc-14.2.0
sparc                 randconfig-002-20241221    clang-18
sparc                 randconfig-002-20241221    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241221    clang-18
sparc64               randconfig-001-20241221    gcc-14.2.0
sparc64               randconfig-002-20241221    clang-18
sparc64               randconfig-002-20241221    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241221    clang-18
um                    randconfig-002-20241221    clang-18
um                    randconfig-002-20241221    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241221    gcc-12
x86_64      buildonly-randconfig-002-20241221    gcc-12
x86_64      buildonly-randconfig-003-20241221    gcc-12
x86_64      buildonly-randconfig-004-20241221    gcc-12
x86_64      buildonly-randconfig-005-20241221    gcc-11
x86_64      buildonly-randconfig-005-20241221    gcc-12
x86_64      buildonly-randconfig-006-20241221    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241221    gcc-11
x86_64                randconfig-002-20241221    gcc-11
x86_64                randconfig-003-20241221    gcc-11
x86_64                randconfig-004-20241221    gcc-11
x86_64                randconfig-005-20241221    gcc-11
x86_64                randconfig-006-20241221    gcc-11
x86_64                randconfig-007-20241221    gcc-11
x86_64                randconfig-008-20241221    gcc-11
x86_64                randconfig-071-20241221    gcc-12
x86_64                randconfig-072-20241221    gcc-12
x86_64                randconfig-073-20241221    gcc-12
x86_64                randconfig-074-20241221    gcc-12
x86_64                randconfig-075-20241221    gcc-12
x86_64                randconfig-076-20241221    gcc-12
x86_64                randconfig-077-20241221    gcc-12
x86_64                randconfig-078-20241221    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241221    clang-18
xtensa                randconfig-001-20241221    gcc-14.2.0
xtensa                randconfig-002-20241221    clang-18
xtensa                randconfig-002-20241221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

