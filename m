Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8A4C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QfFbbXcEi9EgZyonr0keAsZhBBbRED5Io0nmKgLvUUk=; b=q3myh6uQaNF5r+ghuvR5WNIDTx
	Zg7T+iPk7YEGBang7j16cQdvgZ4bUzhGxdHO1xBZvk92ZxNqZl1RK+q3LhvjtLuNpqudKu0sSO7C0
	HR8hsj1GcbluvBkyHmvVkWqT8fbkX1MbBoBMZq7gs3jIHEoBCisIzMymxXJQSHfyBZG7TYhBKfKks
	2wG8aLjjrYNiYErn2VMujiH+ajAQLxWGIqpAa4Kg8A+554TLX9YqsnZ5bDPcOua6nFlkq/tqaMLcH
	SkJfy716KaOigaO328ZaH+ukzJjEOYi4qzbZ8ATOT/El1I6f9kFhu9nLC6TNZj2B4wM2U7zvAnY0D
	BRQHetGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8ea-00000002S8g-0IVH;
	Sat, 18 Jan 2025 13:14:20 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Zg-00000002RXk-181M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 13:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737205757; x=1768741757;
  h=date:from:to:cc:subject:message-id;
  bh=1y558UeZ6G0J4tQ39K/X+2IRT70Lcz7HWovQm9i9PrQ=;
  b=iDhu3paAjVET+yc5na9xT3GIrdPV6F/JHYOIYyChzkc5++IM8L79PpYv
   n0sd2cOwO0tYkoLIu2BxrYj4XupPqAvGg6EDrSBYXtgn8kNTa2qSaHxJC
   AnI9B7m2oXCqBEjC+a/q/knvbdsoys+57GZpW9Q6e23SsUBNgIPNBYfty
   un7952br/gJSRlFyUFfn7auLQoDrebgunv/BjwFmcuqcRhiGBA2NcCwci
   ug2iXuuCXAT//Kl19RJXBYNRLVR2auQ6XwQheUU9flB/dMmRRpXb/OioQ
   0rWPnwIR/ZKiApTD2FIKfPsNwXbx7o3T8gpmCfEh2ZXhwUIwhJLUzSMiZ
   A==;
X-CSE-ConnectionGUID: loljv86zQpeOp0frJ3T3Vg==
X-CSE-MsgGUID: 7qnHJq1sReSj7t+4JVMgiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37323546"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37323546"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:09:12 -0800
X-CSE-ConnectionGUID: MzMX/X6hSPeNPcNzLwO+xQ==
X-CSE-MsgGUID: uzwHhfmTQvCfTlyXCx8glQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="106613502"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jan 2025 05:09:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ8ZY-000US3-1k;
	Sat, 18 Jan 2025 13:09:08 +0000
Date: Sat, 18 Jan 2025 21:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 2fd7a3f27892f1ca4fca24591a7a82fd0437e080
Message-ID: <202501182116.HbhAgrt0-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_050916_389395_D7177714 
X-CRM114-Status: UNSURE (   5.59  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: 2fd7a3f27892f1ca4fca24591a7a82fd0437e080  Merge tag 'at91-soc-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm

elapsed time: 1447m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250117    gcc-13.2.0
arc                   randconfig-002-20250117    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250117    clang-18
arm                   randconfig-002-20250117    gcc-14.2.0
arm                   randconfig-003-20250117    gcc-14.2.0
arm                   randconfig-004-20250117    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250117    gcc-14.2.0
arm64                 randconfig-002-20250117    clang-18
arm64                 randconfig-003-20250117    clang-20
arm64                 randconfig-004-20250117    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250117    gcc-14.2.0
csky                  randconfig-002-20250117    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250117    clang-20
hexagon               randconfig-002-20250117    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250117    clang-19
i386        buildonly-randconfig-002-20250117    clang-19
i386        buildonly-randconfig-003-20250117    gcc-12
i386        buildonly-randconfig-004-20250117    gcc-12
i386        buildonly-randconfig-005-20250117    clang-19
i386        buildonly-randconfig-006-20250117    gcc-11
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250117    gcc-14.2.0
loongarch             randconfig-002-20250117    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250117    gcc-14.2.0
nios2                 randconfig-002-20250117    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250117    gcc-14.2.0
parisc                randconfig-002-20250117    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250117    gcc-14.2.0
powerpc               randconfig-002-20250117    gcc-14.2.0
powerpc               randconfig-003-20250117    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20250117    clang-16
powerpc64             randconfig-002-20250117    clang-20
powerpc64             randconfig-003-20250117    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250117    gcc-14.2.0
riscv                 randconfig-002-20250117    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250117    gcc-14.2.0
s390                  randconfig-002-20250117    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20250117    gcc-14.2.0
sh                    randconfig-002-20250117    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250117    gcc-14.2.0
sparc                 randconfig-002-20250117    gcc-14.2.0
sparc64               randconfig-001-20250117    gcc-14.2.0
sparc64               randconfig-002-20250117    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250117    clang-20
um                    randconfig-002-20250117    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250117    gcc-12
x86_64      buildonly-randconfig-002-20250117    gcc-12
x86_64      buildonly-randconfig-003-20250117    gcc-12
x86_64      buildonly-randconfig-004-20250117    gcc-12
x86_64      buildonly-randconfig-005-20250117    gcc-12
x86_64      buildonly-randconfig-006-20250117    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250117    gcc-14.2.0
xtensa                randconfig-002-20250117    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

