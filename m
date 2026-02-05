Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5058EA7950
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 02:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w0iGws56UreFeu02fTKxO+fTfKS4dn+3ME8C5ojYIfk=; b=S53GjaI2uUXneo1fEV0GrI6anx
	7VYSaweBehUoSMPW8B7U2YW25lYY1fzKEiLWn8CAob/t78aTc0dukfclkBsJu5N4EFcsfbXQ039NC
	v3luCAHoD6n3Myrbdzpf/wIvMKdKpu0JW0te4GG0IRJyRvcsH0MkPLFEGhR4E1DI4m6AOh/YpNlup
	cWIPgUGyfAjyNy8ux5WIspL/t2+j6c/rtUvKxS/JRxplqRr4QbGIAcpbV22NAWQk4xwRicEmv5JeH
	RVIOTglafLkg8NIWa7rP4u4ubK/LI1T9l4DSTHd2TmzegmBcQ0DawmwcRyfhvl9P/5Pervuck/vac
	zUlNhCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnp41-00000009JhA-13d8;
	Thu, 05 Feb 2026 02:25:51 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnp3y-00000009Jgl-3PM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 02:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770258347; x=1801794347;
  h=date:from:to:cc:subject:message-id;
  bh=+cLV+xfdHiFCpgDnBelu0MNlScYISjrLYhVTxQ9dSiw=;
  b=PNNTd7TdpM2++GLegTzel5PWUY1UdCF7HeZ9+4jCerv1BLkqflA3xw4o
   BCdTETU5bxLC7yfnsh4NtvicjUUDJ5UH2rmdnqp+sKOWhKfJRFNOdOxmA
   j8O+HHraLgHFZ/0wsCVEDqSLmN/owud7IPhVwjA+p3mK1koq4GEJ2zFd8
   D8iQVlK9kKROXQUvU1lqOsfj8kQafUzlZDI3Y9PIgLIKpLkeQ44xGRk4S
   frKUu2ok7uqsljGeSdqE7wM9+LD6YOkAgIpYhzcCMc/g5YzJS8zBeLTml
   /6RYwRw4WIe6sSmkH1kpLJJ4ysebB+Dv++LL+HpMjHpQQRoELk0mvTKse
   Q==;
X-CSE-ConnectionGUID: jRoUrIPzQvSbH27E39keIw==
X-CSE-MsgGUID: kGhpsp5cTki2GqUUU5oP7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81766398"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="81766398"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 18:25:46 -0800
X-CSE-ConnectionGUID: T9Ev9mFhT7KJkEBwM90iAA==
X-CSE-MsgGUID: qMW/GJ35QVm3ToYwgJqntw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="241018615"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2026 18:25:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnp3u-00000000jL1-04RH;
	Thu, 05 Feb 2026 02:25:42 +0000
Date: Thu, 05 Feb 2026 10:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 f51d34065de4f29fd237276a49cad06ac7356a55
Message-ID: <202602051022.XSiCrUhF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_182546_977151_45DCB087 
X-CRM114-Status: UNSURE (   5.11  )
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
branch HEAD: f51d34065de4f29fd237276a49cad06ac7356a55  Merge tag 'socfpga_dts_updates_for_v6.20_v3' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt

elapsed time: 812m

configs tested: 286
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                          axs101_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260204    gcc-8.5.0
arc                   randconfig-001-20260205    gcc-8.5.0
arc                   randconfig-002-20260204    gcc-8.5.0
arc                   randconfig-002-20260205    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                           imxrt_defconfig    gcc-15.2.0
arm                           omap1_defconfig    gcc-15.2.0
arm                          pxa168_defconfig    gcc-15.2.0
arm                            qcom_defconfig    gcc-15.2.0
arm                   randconfig-001-20260204    gcc-8.5.0
arm                   randconfig-001-20260205    gcc-8.5.0
arm                   randconfig-002-20260204    gcc-8.5.0
arm                   randconfig-002-20260205    gcc-8.5.0
arm                   randconfig-003-20260204    gcc-8.5.0
arm                   randconfig-003-20260205    gcc-8.5.0
arm                   randconfig-004-20260204    gcc-8.5.0
arm                   randconfig-004-20260205    gcc-8.5.0
arm                         socfpga_defconfig    gcc-15.2.0
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           sunxi_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260204    gcc-11.5.0
arm64                 randconfig-001-20260205    gcc-10.5.0
arm64                 randconfig-002-20260204    gcc-11.5.0
arm64                 randconfig-002-20260205    gcc-10.5.0
arm64                 randconfig-003-20260204    gcc-11.5.0
arm64                 randconfig-003-20260205    gcc-10.5.0
arm64                 randconfig-004-20260204    gcc-11.5.0
arm64                 randconfig-004-20260205    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260204    gcc-11.5.0
csky                  randconfig-001-20260205    gcc-10.5.0
csky                  randconfig-002-20260204    gcc-11.5.0
csky                  randconfig-002-20260205    gcc-10.5.0
hexagon                          alldefconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260204    gcc-15.2.0
hexagon               randconfig-001-20260205    gcc-15.2.0
hexagon               randconfig-002-20260204    gcc-15.2.0
hexagon               randconfig-002-20260205    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260204    gcc-14
i386        buildonly-randconfig-001-20260205    gcc-14
i386        buildonly-randconfig-002-20260204    gcc-14
i386        buildonly-randconfig-002-20260205    gcc-14
i386        buildonly-randconfig-003-20260204    gcc-14
i386        buildonly-randconfig-003-20260205    gcc-14
i386        buildonly-randconfig-004-20260204    gcc-14
i386        buildonly-randconfig-004-20260205    gcc-14
i386        buildonly-randconfig-005-20260204    gcc-14
i386        buildonly-randconfig-005-20260205    gcc-14
i386        buildonly-randconfig-006-20260204    gcc-14
i386        buildonly-randconfig-006-20260205    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260204    gcc-14
i386                  randconfig-001-20260205    gcc-13
i386                  randconfig-002-20260204    gcc-14
i386                  randconfig-002-20260205    gcc-13
i386                  randconfig-003-20260204    gcc-14
i386                  randconfig-003-20260205    gcc-13
i386                  randconfig-004-20260204    gcc-14
i386                  randconfig-004-20260205    gcc-13
i386                  randconfig-005-20260204    gcc-14
i386                  randconfig-005-20260205    gcc-13
i386                  randconfig-006-20260204    gcc-14
i386                  randconfig-006-20260205    gcc-13
i386                  randconfig-007-20260204    gcc-14
i386                  randconfig-007-20260205    gcc-13
i386                  randconfig-011-20260204    clang-20
i386                  randconfig-011-20260205    clang-20
i386                  randconfig-012-20260204    clang-20
i386                  randconfig-012-20260205    clang-20
i386                  randconfig-013-20260204    clang-20
i386                  randconfig-013-20260205    clang-20
i386                  randconfig-014-20260204    clang-20
i386                  randconfig-014-20260205    clang-20
i386                  randconfig-015-20260204    clang-20
i386                  randconfig-015-20260205    clang-20
i386                  randconfig-016-20260204    clang-20
i386                  randconfig-016-20260205    clang-20
i386                  randconfig-017-20260204    clang-20
i386                  randconfig-017-20260205    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260204    gcc-15.2.0
loongarch             randconfig-001-20260205    gcc-15.2.0
loongarch             randconfig-002-20260204    gcc-15.2.0
loongarch             randconfig-002-20260205    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260204    gcc-15.2.0
nios2                 randconfig-001-20260205    gcc-15.2.0
nios2                 randconfig-002-20260204    gcc-15.2.0
nios2                 randconfig-002-20260205    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                    or1ksim_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260204    gcc-8.5.0
parisc                randconfig-001-20260205    gcc-9.5.0
parisc                randconfig-002-20260204    gcc-8.5.0
parisc                randconfig-002-20260205    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc834x_itx_defconfig    gcc-15.2.0
powerpc                      ppc6xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260204    gcc-8.5.0
powerpc               randconfig-001-20260205    gcc-9.5.0
powerpc               randconfig-002-20260204    gcc-8.5.0
powerpc               randconfig-002-20260205    gcc-9.5.0
powerpc                     tqm8548_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260204    gcc-8.5.0
powerpc64             randconfig-001-20260205    gcc-9.5.0
powerpc64             randconfig-002-20260204    gcc-8.5.0
powerpc64             randconfig-002-20260205    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260204    gcc-8.5.0
riscv                 randconfig-001-20260205    clang-19
riscv                 randconfig-002-20260204    gcc-8.5.0
riscv                 randconfig-002-20260205    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260204    gcc-8.5.0
s390                  randconfig-001-20260205    clang-19
s390                  randconfig-002-20260204    gcc-8.5.0
s390                  randconfig-002-20260205    clang-19
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260204    gcc-8.5.0
sh                    randconfig-001-20260205    clang-19
sh                    randconfig-002-20260204    gcc-8.5.0
sh                    randconfig-002-20260205    clang-19
sh                          rsk7201_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260204    gcc-8.5.0
sparc                 randconfig-001-20260205    gcc-12.5.0
sparc                 randconfig-002-20260204    gcc-8.5.0
sparc                 randconfig-002-20260205    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260204    gcc-8.5.0
sparc64               randconfig-001-20260205    gcc-12.5.0
sparc64               randconfig-002-20260204    gcc-8.5.0
sparc64               randconfig-002-20260205    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-15.2.0
um                    randconfig-001-20260204    gcc-8.5.0
um                    randconfig-001-20260205    gcc-12.5.0
um                    randconfig-002-20260204    gcc-8.5.0
um                    randconfig-002-20260205    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260204    clang-20
x86_64      buildonly-randconfig-001-20260204    gcc-12
x86_64      buildonly-randconfig-001-20260205    gcc-14
x86_64      buildonly-randconfig-002-20260204    clang-20
x86_64      buildonly-randconfig-002-20260204    gcc-14
x86_64      buildonly-randconfig-002-20260205    gcc-14
x86_64      buildonly-randconfig-003-20260204    clang-20
x86_64      buildonly-randconfig-003-20260205    gcc-14
x86_64      buildonly-randconfig-004-20260204    clang-20
x86_64      buildonly-randconfig-004-20260204    gcc-14
x86_64      buildonly-randconfig-004-20260205    gcc-14
x86_64      buildonly-randconfig-005-20260204    clang-20
x86_64      buildonly-randconfig-005-20260205    gcc-14
x86_64      buildonly-randconfig-006-20260204    clang-20
x86_64      buildonly-randconfig-006-20260204    gcc-14
x86_64      buildonly-randconfig-006-20260205    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260204    gcc-14
x86_64                randconfig-002-20260204    gcc-14
x86_64                randconfig-003-20260204    gcc-14
x86_64                randconfig-004-20260204    gcc-14
x86_64                randconfig-005-20260204    gcc-14
x86_64                randconfig-006-20260204    gcc-14
x86_64                randconfig-011-20260204    clang-20
x86_64                randconfig-011-20260205    clang-20
x86_64                randconfig-012-20260204    clang-20
x86_64                randconfig-012-20260205    clang-20
x86_64                randconfig-013-20260204    clang-20
x86_64                randconfig-013-20260205    clang-20
x86_64                randconfig-014-20260204    clang-20
x86_64                randconfig-014-20260205    clang-20
x86_64                randconfig-015-20260204    clang-20
x86_64                randconfig-015-20260205    clang-20
x86_64                randconfig-016-20260204    clang-20
x86_64                randconfig-016-20260205    clang-20
x86_64                randconfig-071-20260204    gcc-14
x86_64                randconfig-071-20260205    clang-20
x86_64                randconfig-072-20260204    gcc-14
x86_64                randconfig-072-20260205    clang-20
x86_64                randconfig-073-20260204    gcc-14
x86_64                randconfig-073-20260205    clang-20
x86_64                randconfig-074-20260204    gcc-14
x86_64                randconfig-074-20260205    clang-20
x86_64                randconfig-075-20260204    gcc-14
x86_64                randconfig-075-20260205    clang-20
x86_64                randconfig-076-20260204    gcc-14
x86_64                randconfig-076-20260205    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260204    gcc-8.5.0
xtensa                randconfig-001-20260205    gcc-12.5.0
xtensa                randconfig-002-20260204    gcc-8.5.0
xtensa                randconfig-002-20260205    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

