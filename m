Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A76C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 18:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7UJIu1C1+2V9e0vv22lKbZ1vYNnDjkar1T80QMKXIN0=; b=vZv8louseTHbOzlhBBM5H76zuc
	HCaJhl86WN45HjvK50hZsbPeuMRGtKDZD/YQXir5Yz2pB2/f5bvtbbByUOMDiLE3eGuH4ngCgZ6/I
	lLrmrYMO3rjNBOqeZUCT7U5FSka00yJsMK3iw8AwCrknpaSYaDLmnKOOeAnCo/P56Q/zwKq8YuMAI
	G1Zp6pgha7FBXgCU/fFRMhN6MaOLPSmSoGIXg6BUD3/ToATX53pcug95KB3t9NT375wiLpbLOdhTU
	kZYtY9eZhGA66DpdqIBv6g+Qdrf6RgGxVWr9cfuge5nlfnWE504koWtzSN/TgDBupoboTWK56WSIW
	MF8M2O0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedx0-00000005iqc-1hdJ;
	Wed, 23 Jul 2025 18:12:22 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueduZ-00000005idD-0G8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 18:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753294191; x=1784830191;
  h=date:from:to:cc:subject:message-id;
  bh=rXXv1X0iPwofx7wspiUXNjXtBXmqQ0RDDroP3/EcsLQ=;
  b=MUgLxwufGR2CZUudRbHHGYFB4JCTQeF9GBIsHchV8lVixJ3r3rxq9gcr
   HF5XE3bKylWiw4rlWKXKGqo9d0JJlBR7o0v3d5cdO2VLIRHUUUpEd512C
   FP2erjF+HmgazTwc6o1lxiP8loLENxVniK2OnSD9siRG41xumv4wpzIJ1
   9jcQAmyiE3wlG3Ff9k1ST0SN6LXjBLLJIT4QJhqOHRJfw98ZRi+CN6+zp
   53qxwrVH5hx1nlljhU1Y63HaOc0oLbuAd3OhM2uFdiTGXoUzKo4tob6o1
   3Lu+JLgMp2PCXrpzIt0aWr995h5riDrYivmMGzJNlkYGvBuDDPOm34MaQ
   g==;
X-CSE-ConnectionGUID: euNiPVUeRhGyMltQB3hsQw==
X-CSE-MsgGUID: 6IBU9InqRw6EB7Ps1JMPDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59247594"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="59247594"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 11:09:51 -0700
X-CSE-ConnectionGUID: 6YnLUeOtQ0+BA6pp0DA9Wg==
X-CSE-MsgGUID: qTHUredVTESr/ekzIXYgsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="158943134"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jul 2025 11:09:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueduU-000Jf3-2K;
	Wed, 23 Jul 2025 18:09:46 +0000
Date: Thu, 24 Jul 2025 02:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 5cfe03e1ca42fa97341fde7a8ad53be86a51d789
Message-ID: <202507240213.OZAs333k-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_110951_159621_19BAA4A4 
X-CRM114-Status: UNSURE (   5.27  )
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
branch HEAD: 5cfe03e1ca42fa97341fde7a8ad53be86a51d789  Merge tag 'v6.17-rockchip-defconfig64-1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig

elapsed time: 1221m

configs tested: 221
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250723    clang-16
arc                   randconfig-001-20250723    gcc-8.5.0
arc                   randconfig-002-20250723    clang-16
arc                   randconfig-002-20250723    gcc-9.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          pxa3xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250723    clang-16
arm                   randconfig-001-20250723    gcc-13.4.0
arm                   randconfig-002-20250723    clang-16
arm                   randconfig-002-20250723    gcc-13.4.0
arm                   randconfig-003-20250723    clang-16
arm                   randconfig-004-20250723    clang-16
arm                   randconfig-004-20250723    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250723    clang-16
arm64                 randconfig-001-20250723    clang-22
arm64                 randconfig-002-20250723    clang-16
arm64                 randconfig-003-20250723    clang-16
arm64                 randconfig-004-20250723    clang-16
arm64                 randconfig-004-20250723    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250723    gcc-12.5.0
csky                  randconfig-001-20250723    gcc-8.5.0
csky                  randconfig-002-20250723    gcc-14.3.0
csky                  randconfig-002-20250723    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250723    clang-22
hexagon               randconfig-001-20250723    gcc-8.5.0
hexagon               randconfig-002-20250723    clang-22
hexagon               randconfig-002-20250723    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250723    clang-20
i386        buildonly-randconfig-002-20250723    clang-20
i386        buildonly-randconfig-003-20250723    clang-20
i386        buildonly-randconfig-004-20250723    clang-20
i386        buildonly-randconfig-005-20250723    clang-20
i386        buildonly-randconfig-005-20250723    gcc-11
i386        buildonly-randconfig-006-20250723    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250723    clang-20
i386                  randconfig-002-20250723    clang-20
i386                  randconfig-003-20250723    clang-20
i386                  randconfig-004-20250723    clang-20
i386                  randconfig-005-20250723    clang-20
i386                  randconfig-006-20250723    clang-20
i386                  randconfig-007-20250723    clang-20
i386                  randconfig-011-20250723    clang-20
i386                  randconfig-012-20250723    clang-20
i386                  randconfig-013-20250723    clang-20
i386                  randconfig-014-20250723    clang-20
i386                  randconfig-015-20250723    clang-20
i386                  randconfig-016-20250723    clang-20
i386                  randconfig-017-20250723    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250723    gcc-15.1.0
loongarch             randconfig-001-20250723    gcc-8.5.0
loongarch             randconfig-002-20250723    clang-22
loongarch             randconfig-002-20250723    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250723    gcc-8.5.0
nios2                 randconfig-002-20250723    gcc-11.5.0
nios2                 randconfig-002-20250723    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250723    gcc-8.5.0
parisc                randconfig-002-20250723    gcc-15.1.0
parisc                randconfig-002-20250723    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250723    gcc-10.5.0
powerpc               randconfig-001-20250723    gcc-8.5.0
powerpc               randconfig-002-20250723    gcc-8.5.0
powerpc               randconfig-003-20250723    gcc-12.5.0
powerpc               randconfig-003-20250723    gcc-8.5.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250723    clang-22
powerpc64             randconfig-001-20250723    gcc-8.5.0
powerpc64             randconfig-002-20250723    clang-22
powerpc64             randconfig-002-20250723    gcc-8.5.0
powerpc64             randconfig-003-20250723    clang-22
powerpc64             randconfig-003-20250723    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250723    gcc-9.5.0
riscv                 randconfig-002-20250723    clang-22
riscv                 randconfig-002-20250723    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250723    clang-22
s390                  randconfig-001-20250723    gcc-9.5.0
s390                  randconfig-002-20250723    clang-20
s390                  randconfig-002-20250723    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250723    gcc-12.5.0
sh                    randconfig-001-20250723    gcc-9.5.0
sh                    randconfig-002-20250723    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250723    gcc-8.5.0
sparc                 randconfig-001-20250723    gcc-9.5.0
sparc                 randconfig-002-20250723    gcc-8.5.0
sparc                 randconfig-002-20250723    gcc-9.5.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250723    gcc-12.5.0
sparc64               randconfig-001-20250723    gcc-9.5.0
sparc64               randconfig-002-20250723    gcc-14.3.0
sparc64               randconfig-002-20250723    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250723    gcc-12
um                    randconfig-001-20250723    gcc-9.5.0
um                    randconfig-002-20250723    clang-22
um                    randconfig-002-20250723    gcc-9.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250723    gcc-11
x86_64      buildonly-randconfig-001-20250723    gcc-12
x86_64      buildonly-randconfig-002-20250723    gcc-11
x86_64      buildonly-randconfig-003-20250723    gcc-11
x86_64      buildonly-randconfig-004-20250723    clang-20
x86_64      buildonly-randconfig-004-20250723    gcc-11
x86_64      buildonly-randconfig-005-20250723    gcc-11
x86_64      buildonly-randconfig-005-20250723    gcc-12
x86_64      buildonly-randconfig-006-20250723    gcc-11
x86_64      buildonly-randconfig-006-20250723    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250723    gcc-12
x86_64                randconfig-002-20250723    gcc-12
x86_64                randconfig-003-20250723    gcc-12
x86_64                randconfig-004-20250723    gcc-12
x86_64                randconfig-005-20250723    gcc-12
x86_64                randconfig-006-20250723    gcc-12
x86_64                randconfig-007-20250723    gcc-12
x86_64                randconfig-008-20250723    gcc-12
x86_64                randconfig-071-20250723    clang-20
x86_64                randconfig-072-20250723    clang-20
x86_64                randconfig-073-20250723    clang-20
x86_64                randconfig-074-20250723    clang-20
x86_64                randconfig-075-20250723    clang-20
x86_64                randconfig-076-20250723    clang-20
x86_64                randconfig-077-20250723    clang-20
x86_64                randconfig-078-20250723    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250723    gcc-13.4.0
xtensa                randconfig-001-20250723    gcc-9.5.0
xtensa                randconfig-002-20250723    gcc-10.5.0
xtensa                randconfig-002-20250723    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

