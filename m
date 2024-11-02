Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2286E677F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tn97tboLecOp1JLKaPSgRhylMLDlk5mOGq2gJogJzN0=; b=Kbh1JpHyjXJK5GWwKDnT3LgS9l
	K/YGyZk2Th4gVwVx/QXb0Zi8NdJtWue3rlQcsWi9MoXG51opSFloI2OyxDEvSEmJRhSD1OWzkXun6
	rNutAdNanJW1ZySiENWj07vHSx9jA/09FRmIBcneJY3pRFsrfx1hPa/NM6V+IT5VcSQvto6Q2q/G+
	LqTpcgUywgrdWpn87ovf/PAd/Ip1sFXm/jl+p2UIWRq9z/KSavGi1ULvqVFcDpoL7s+l9Br+V74OU
	pbBolj3fJV/g+FFKwl1LoABYjb8BTld9ZrA+FSstRfiQd/FvquBxBlZjN6U14mqHWqEB1l0BJPS9V
	nlda5DNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7APY-00000009Nea-05qo;
	Sat, 02 Nov 2024 09:27:12 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ANs-00000009NVi-1XGA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730539528; x=1762075528;
  h=date:from:to:cc:subject:message-id;
  bh=1UTYWQsSSdMFaLlt2TQ43x/Ao/qEDp8aTYGH/y1t9f8=;
  b=g0SxANlZKTO5HnfFfbnr7dSAnUvWfk6b9+i62jFJ0+cbA4vyuz70kOWF
   fqQY2+p6cMojxm/vnHyRF6JS8d9gT4bc3HT38GMn1p74XudrNq/jSqzY8
   jp/kWw3jasKPOA7/ZXYBuSZlPREHm3HW6sdrEtni15htL0/4QEMTqtiWt
   8OB6XcrrPYsLH4+TXdrtfQ0cCrGrvUK+iKbuZpyZrSPOmGlN3XG8FkLcS
   63JHm4TtA/Cgr5xX4uNEdizHpcpyXOY3d3PcEBeuipSgLgWMih1FtGlwG
   Po+Jo7jyTgpX09wwVTunW+asFJetGR9EAxMxH2vM+rt3deUTHuB0R/gY9
   A==;
X-CSE-ConnectionGUID: sXKv6ELiSB2XJOkxTO5Kfw==
X-CSE-MsgGUID: HHer292kTPqbx3aDLo39sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30457551"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30457551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 02:25:27 -0700
X-CSE-ConnectionGUID: HfLcD4tLRkCw1xRgIW/51w==
X-CSE-MsgGUID: I3rylGdFT3aCcPs/3iqc8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="120646000"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 02:25:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7ANo-000ig9-0M;
	Sat, 02 Nov 2024 09:25:24 +0000
Date: Sat, 02 Nov 2024 17:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 566064e57066a14ef5d2a90e29a7bb3495c0fed2
Message-ID: <202411021742.CpwZmgd4-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_022528_477674_F61221D0 
X-CRM114-Status: UNSURE (   5.40  )
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
branch HEAD: 566064e57066a14ef5d2a90e29a7bb3495c0fed2  Merge tag 'qcom-arm64-fixes-for-6.12-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into HEAD

elapsed time: 770m

configs tested: 128
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                           tb10x_defconfig    clang-14
arc                           tb10x_defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    clang-14
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    clang-14
arm                        multi_v5_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    clang-14
arm                           sunxi_defconfig    clang-14
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241102    gcc-12
i386        buildonly-randconfig-002-20241102    gcc-12
i386        buildonly-randconfig-003-20241102    gcc-12
i386        buildonly-randconfig-004-20241102    gcc-12
i386        buildonly-randconfig-005-20241102    gcc-12
i386        buildonly-randconfig-006-20241102    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241102    gcc-12
i386                  randconfig-002-20241102    gcc-12
i386                  randconfig-003-20241102    gcc-12
i386                  randconfig-004-20241102    gcc-12
i386                  randconfig-005-20241102    gcc-12
i386                  randconfig-006-20241102    gcc-12
i386                  randconfig-011-20241102    gcc-12
i386                  randconfig-012-20241102    gcc-12
i386                  randconfig-013-20241102    gcc-12
i386                  randconfig-014-20241102    gcc-12
i386                  randconfig-015-20241102    gcc-12
i386                  randconfig-016-20241102    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    clang-14
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    clang-14
mips                           ip30_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-14
nios2                            alldefconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    clang-14
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                      pasemi_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    clang-14
sh                          r7785rp_defconfig    clang-14
sh                           se7619_defconfig    clang-14
sh                           se7750_defconfig    clang-14
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-14
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-14
xtensa                          iss_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

