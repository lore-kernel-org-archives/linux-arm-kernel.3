Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552A6F55434
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 00:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dmNLWqmpH0YXE7//a6TrAsSHxL5iwp/0mdHMXmHAdvY=; b=1fnJ1EYcsgm3uqqIi6BjORdd++
	iHaLlyel9OGsgZ8XvXnIjpPsnXp/BLjetygvAh1O7jvoas7cyTkJ9DkH5OvJl5yoLSuU0IJpCSw0m
	U7/Jh0RGlY9tUP3z2wY0lCoBW5m8Ukc/CINn8R0a3z9cwMDjapDVeSuwPG3l6dA5ryzRAeD8TZCEu
	gynz8EAdVIdXrnaO4cgz0Jx1DaTDh3QfNHPA/m7STbhxuC0gXeZQXvMeokVv+a1univgkLlaBOg7r
	H4dlbf8/Dp7gTmibBG5jwu0ZGy98HYa6PUtvFkPbkBicF7vbnH478mdS5WD0kNymzZDx6KREkfdcJ
	jl25X/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2dq-00000002z3H-1GGh;
	Wed, 25 Feb 2026 00:20:38 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2dn-00000002z16-2rfT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 00:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771978835; x=1803514835;
  h=date:from:to:cc:subject:message-id;
  bh=WToVzToJ4nq/FN64M9m+xjhvqBRH2POOmN2NrNPJTyw=;
  b=Bo62uNvePF1Hvl46Z6TQIFDFmGujDC71nUN9ap5+0GJ6kxYNm41ullh2
   eUOelg1OmJdtzZCPBzzLzJe+/vbdYcraEXsi6mUke0iphm/Nk7Hm9L4dx
   Y2QeyWgO0vWAsotqWBTCTu+aZYUwdkeH/njlzbFWiOJ782DEbO1s/P9Zw
   eCrfsXCHsUQ3cc/ZxqMh56PqpVSQ0xaOjw197ct68VlCmFml7mF2uO9G+
   bByHRaEA5AYK6JFfVIa78uDA7SnSnyZJwDDtoKk0Mci38jKVEo08Ane0m
   /vaB/MNUFJZVI4SuuDVVggYa+1rKj+76HruEc6BXnDZLahVjvp+ANhcGj
   g==;
X-CSE-ConnectionGUID: vxE1ixZGSXyYoUxefpb+dg==
X-CSE-MsgGUID: 8HlTyf6URbez6kndnc8asw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72712186"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72712186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 16:20:34 -0800
X-CSE-ConnectionGUID: ZyO13zCZQJ+cSCxEDqFWVQ==
X-CSE-MsgGUID: ce324UF2QeaN67sgwB704A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="214383015"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Feb 2026 16:20:32 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv2dJ-000000002c7-0Nqg;
	Wed, 25 Feb 2026 00:20:10 +0000
Date: Wed, 25 Feb 2026 08:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:juno/dt] BUILD SUCCESS
 f2f0587dcdecc29a8da59b1f0e720955f25ab015
Message-ID: <202602250847.QvmuLaDH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_162035_853825_2C784248 
X-CRM114-Status: UNSURE (   5.70  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git juno/dt
branch HEAD: f2f0587dcdecc29a8da59b1f0e720955f25ab015  ARM: dts: arm: Use lowercase hex

elapsed time: 720m

configs tested: 304
configs skipped: 146

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260224    gcc-14.3.0
arc                   randconfig-001-20260225    gcc-8.5.0
arc                   randconfig-002-20260224    gcc-14.3.0
arc                   randconfig-002-20260225    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    clang-23
arm                           h3600_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                       omap2plus_defconfig    clang-23
arm                   randconfig-001-20260224    clang-18
arm                   randconfig-001-20260224    gcc-14.3.0
arm                   randconfig-001-20260225    gcc-8.5.0
arm                   randconfig-002-20260224    clang-23
arm                   randconfig-002-20260224    gcc-14.3.0
arm                   randconfig-002-20260225    gcc-8.5.0
arm                   randconfig-003-20260224    gcc-14.3.0
arm                   randconfig-003-20260224    gcc-8.5.0
arm                   randconfig-003-20260225    gcc-8.5.0
arm                   randconfig-004-20260224    clang-23
arm                   randconfig-004-20260224    gcc-14.3.0
arm                   randconfig-004-20260225    gcc-8.5.0
arm                        spear6xx_defconfig    clang-23
arm                           spitz_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260224    gcc-14.3.0
arm64                 randconfig-001-20260225    gcc-9.5.0
arm64                 randconfig-002-20260224    gcc-14.3.0
arm64                 randconfig-002-20260225    gcc-9.5.0
arm64                 randconfig-003-20260224    gcc-14.3.0
arm64                 randconfig-003-20260225    gcc-9.5.0
arm64                 randconfig-004-20260224    gcc-14.3.0
arm64                 randconfig-004-20260225    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260224    gcc-14.3.0
csky                  randconfig-001-20260225    gcc-9.5.0
csky                  randconfig-002-20260224    gcc-14.3.0
csky                  randconfig-002-20260225    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260224    clang-16
hexagon               randconfig-001-20260225    clang-23
hexagon               randconfig-002-20260224    clang-16
hexagon               randconfig-002-20260225    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260224    clang-20
i386        buildonly-randconfig-001-20260225    clang-20
i386        buildonly-randconfig-002-20260224    clang-20
i386        buildonly-randconfig-002-20260225    clang-20
i386        buildonly-randconfig-003-20260224    clang-20
i386        buildonly-randconfig-003-20260225    clang-20
i386        buildonly-randconfig-004-20260224    clang-20
i386        buildonly-randconfig-004-20260225    clang-20
i386        buildonly-randconfig-005-20260224    clang-20
i386        buildonly-randconfig-005-20260225    clang-20
i386        buildonly-randconfig-006-20260224    clang-20
i386        buildonly-randconfig-006-20260225    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260224    gcc-14
i386                  randconfig-001-20260225    gcc-14
i386                  randconfig-002-20260224    gcc-14
i386                  randconfig-002-20260225    gcc-14
i386                  randconfig-003-20260224    gcc-14
i386                  randconfig-003-20260225    gcc-14
i386                  randconfig-004-20260224    gcc-14
i386                  randconfig-004-20260225    gcc-14
i386                  randconfig-005-20260224    gcc-14
i386                  randconfig-005-20260225    gcc-14
i386                  randconfig-006-20260224    gcc-14
i386                  randconfig-006-20260225    gcc-14
i386                  randconfig-007-20260224    gcc-14
i386                  randconfig-007-20260225    gcc-14
i386                  randconfig-011-20260224    gcc-14
i386                  randconfig-011-20260225    gcc-13
i386                  randconfig-012-20260224    gcc-14
i386                  randconfig-012-20260225    gcc-13
i386                  randconfig-013-20260224    gcc-14
i386                  randconfig-013-20260225    gcc-13
i386                  randconfig-014-20260224    gcc-14
i386                  randconfig-014-20260225    gcc-13
i386                  randconfig-015-20260224    gcc-14
i386                  randconfig-015-20260225    gcc-13
i386                  randconfig-016-20260224    gcc-14
i386                  randconfig-016-20260225    gcc-13
i386                  randconfig-017-20260224    gcc-14
i386                  randconfig-017-20260225    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260224    clang-16
loongarch             randconfig-001-20260225    clang-23
loongarch             randconfig-002-20260224    clang-16
loongarch             randconfig-002-20260225    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                 decstation_r4k_defconfig    gcc-15.2.0
mips                           ip27_defconfig    gcc-15.2.0
mips                       lemote2f_defconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-23
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260224    clang-16
nios2                 randconfig-001-20260225    clang-23
nios2                 randconfig-002-20260224    clang-16
nios2                 randconfig-002-20260225    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                       virt_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260224    clang-23
parisc                randconfig-001-20260225    clang-19
parisc                randconfig-002-20260224    clang-23
parisc                randconfig-002-20260225    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                    amigaone_defconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    gcc-15.2.0
powerpc                      cm5200_defconfig    gcc-15.2.0
powerpc                       ebony_defconfig    clang-23
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc                 mpc8315_rdb_defconfig    clang-23
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc                      pasemi_defconfig    clang-23
powerpc               randconfig-001-20260224    clang-23
powerpc               randconfig-001-20260225    clang-19
powerpc               randconfig-002-20260224    clang-23
powerpc               randconfig-002-20260225    clang-19
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc                         wii_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260224    clang-23
powerpc64             randconfig-001-20260225    clang-19
powerpc64             randconfig-002-20260224    clang-23
powerpc64             randconfig-002-20260225    clang-19
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260224    gcc-10.5.0
riscv                 randconfig-001-20260225    gcc-12.5.0
riscv                 randconfig-002-20260224    gcc-10.5.0
riscv                 randconfig-002-20260225    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260224    gcc-10.5.0
s390                  randconfig-001-20260225    gcc-12.5.0
s390                  randconfig-002-20260224    gcc-10.5.0
s390                  randconfig-002-20260225    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                         ecovec24_defconfig    clang-23
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260224    gcc-10.5.0
sh                    randconfig-001-20260225    gcc-12.5.0
sh                    randconfig-002-20260224    gcc-10.5.0
sh                    randconfig-002-20260225    gcc-12.5.0
sh                      rts7751r2d1_defconfig    clang-23
sh                   rts7751r2dplus_defconfig    gcc-15.2.0
sh                           se7619_defconfig    clang-23
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sh                  sh7785lcr_32bit_defconfig    clang-23
sh                            titan_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260224    gcc-12.5.0
sparc                 randconfig-001-20260225    gcc-11.5.0
sparc                 randconfig-002-20260224    gcc-12.5.0
sparc                 randconfig-002-20260225    gcc-11.5.0
sparc                       sparc32_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260224    gcc-12.5.0
sparc64               randconfig-001-20260225    gcc-11.5.0
sparc64               randconfig-002-20260224    gcc-12.5.0
sparc64               randconfig-002-20260225    gcc-11.5.0
um                               alldefconfig    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260224    gcc-12.5.0
um                    randconfig-001-20260225    gcc-11.5.0
um                    randconfig-002-20260224    gcc-12.5.0
um                    randconfig-002-20260225    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260224    gcc-14
x86_64      buildonly-randconfig-001-20260225    clang-20
x86_64      buildonly-randconfig-002-20260224    gcc-14
x86_64      buildonly-randconfig-002-20260225    clang-20
x86_64      buildonly-randconfig-003-20260224    gcc-14
x86_64      buildonly-randconfig-003-20260225    clang-20
x86_64      buildonly-randconfig-004-20260224    gcc-14
x86_64      buildonly-randconfig-004-20260225    clang-20
x86_64      buildonly-randconfig-005-20260224    gcc-14
x86_64      buildonly-randconfig-005-20260225    clang-20
x86_64      buildonly-randconfig-006-20260224    gcc-14
x86_64      buildonly-randconfig-006-20260225    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260224    gcc-14
x86_64                randconfig-001-20260225    gcc-14
x86_64                randconfig-002-20260224    gcc-14
x86_64                randconfig-002-20260225    gcc-14
x86_64                randconfig-003-20260224    gcc-14
x86_64                randconfig-003-20260225    gcc-14
x86_64                randconfig-004-20260224    gcc-14
x86_64                randconfig-004-20260225    gcc-14
x86_64                randconfig-005-20260224    gcc-14
x86_64                randconfig-005-20260225    gcc-14
x86_64                randconfig-006-20260224    gcc-14
x86_64                randconfig-006-20260225    gcc-14
x86_64                randconfig-011-20260224    clang-20
x86_64                randconfig-011-20260225    gcc-14
x86_64                randconfig-012-20260224    clang-20
x86_64                randconfig-012-20260225    gcc-14
x86_64                randconfig-013-20260224    clang-20
x86_64                randconfig-013-20260225    gcc-14
x86_64                randconfig-014-20260224    clang-20
x86_64                randconfig-014-20260225    gcc-14
x86_64                randconfig-015-20260224    clang-20
x86_64                randconfig-015-20260225    gcc-14
x86_64                randconfig-016-20260224    clang-20
x86_64                randconfig-016-20260225    gcc-14
x86_64                randconfig-071-20260224    clang-20
x86_64                randconfig-071-20260225    clang-20
x86_64                randconfig-072-20260224    clang-20
x86_64                randconfig-072-20260225    clang-20
x86_64                randconfig-073-20260224    clang-20
x86_64                randconfig-073-20260225    clang-20
x86_64                randconfig-074-20260224    clang-20
x86_64                randconfig-074-20260225    clang-20
x86_64                randconfig-075-20260224    clang-20
x86_64                randconfig-075-20260225    clang-20
x86_64                randconfig-076-20260224    clang-20
x86_64                randconfig-076-20260225    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    clang-23
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260224    gcc-12.5.0
xtensa                randconfig-001-20260225    gcc-11.5.0
xtensa                randconfig-002-20260224    gcc-12.5.0
xtensa                randconfig-002-20260225    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

