Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF87D6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vi9Y1yLyW+dwp/hCKFaCNmZJCk118Vb6eNMTk/V0i0A=; b=P4i+dGdQpr+GslquyD/6pbQQQ6
	WrlpnJZfJalLRV7GExu3a5fCDobF+jBmwkMBYezsHHs3kWExie9HXqLWBMln4Yq0GtdTt5xN89EkF
	5l8jJ4AXjNjLZeC0tvKQ38gHkB3JIuLyAVps3IBHdD1XNCsIcgthGmPkM4blxU4BcpGybiL319HHD
	j1YJRaBjNRuz2cQ2AefHqDD7jTyHFaLDtnKK0o5Jepw/MMcRiV6AyN9iz04xn1UsrzWmoFWSszFmI
	pkjFpoLSPzOEDf4o1a3YVxIr8k3Edv2MJy7AFzH3JPxZbHFd2AAE/cDEayGdwUAFtQhy/wvqhweVM
	OsNYPQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBe7w-00000000POe-3uvg;
	Thu, 14 Nov 2024 17:59:32 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBe70-00000000PDM-452d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731607115; x=1763143115;
  h=date:from:to:cc:subject:message-id;
  bh=dnvgRBMFlFPn86yvEBCMzNZt26HMsq5eitLFM3lkHbc=;
  b=TkAICsF+hoCPZW3DS/nXtyDdVyuH6ArXnIKR4Li62e5c2fu/CAuz61Mf
   lsGpsYQBmY4XAY9i3l8M8/O2QL7oKwlN0nHj/DIcLdGkxjLqPbh55oAXE
   5VDc/KKbmQuZWN/p4Zm1FdduVmFHE5F1X8RI2lM0wKJekGOzzsQFrPLjv
   Jw7/VDKD3QFNbJcWDNkRNCqRHlpWiS8qofmrRsxRHV9EXFZGZjL/lfxb8
   zsFTh/Jz4/Y63M32bs0wJvnnbluSfU+ENglmhe6eIl9rKXuVzOSGeYduZ
   8xX3mEsJyFG52l+I+UIxylMoD3VTuWekJcDOQrWlus22v+3DAFnXXLpaz
   A==;
X-CSE-ConnectionGUID: GrNsuoisSjiRgAPUTPhE0w==
X-CSE-MsgGUID: 3XsVDx9OTnKaoalHAmzbXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35290490"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="35290490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 09:58:32 -0800
X-CSE-ConnectionGUID: 5F+OdVWISjyXH+npzdx7gw==
X-CSE-MsgGUID: CkUPCV0rRqO66jvqOno/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="119224350"
Received: from lkp-server01.sh.intel.com (HELO b4edda5b478d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2024 09:58:25 -0800
Received: from kbuild by b4edda5b478d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBe6p-00001L-0o;
	Thu, 14 Nov 2024 17:58:23 +0000
Date: Fri, 15 Nov 2024 01:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 daa20223dee942ebea45bc72b517480af226c370
Message-ID: <202411150121.z1U2vFhe-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_095835_052148_45D92B71 
X-CRM114-Status: UNSURE (   4.98  )
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
branch HEAD: daa20223dee942ebea45bc72b517480af226c370  soc: document merges

elapsed time: 1071m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20241114    gcc-13.2.0
arc                   randconfig-002-20241114    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-14
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20241114    gcc-14.2.0
arm                   randconfig-002-20241114    gcc-14.2.0
arm                   randconfig-003-20241114    gcc-14.2.0
arm                   randconfig-004-20241114    clang-14
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241114    clang-20
arm64                 randconfig-002-20241114    gcc-14.2.0
arm64                 randconfig-003-20241114    gcc-14.2.0
arm64                 randconfig-004-20241114    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241114    gcc-14.2.0
csky                  randconfig-002-20241114    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241114    clang-20
hexagon               randconfig-002-20241114    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241114    clang-19
i386        buildonly-randconfig-002-20241114    gcc-11
i386        buildonly-randconfig-003-20241114    gcc-12
i386        buildonly-randconfig-004-20241114    gcc-12
i386        buildonly-randconfig-005-20241114    gcc-12
i386        buildonly-randconfig-006-20241114    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241114    gcc-12
i386                  randconfig-002-20241114    gcc-12
i386                  randconfig-003-20241114    clang-19
i386                  randconfig-004-20241114    gcc-12
i386                  randconfig-005-20241114    clang-19
i386                  randconfig-006-20241114    clang-19
i386                  randconfig-011-20241114    clang-19
i386                  randconfig-012-20241114    gcc-12
i386                  randconfig-013-20241114    clang-19
i386                  randconfig-014-20241114    clang-19
i386                  randconfig-015-20241114    gcc-12
i386                  randconfig-016-20241114    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241114    gcc-14.2.0
loongarch             randconfig-002-20241114    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241114    gcc-14.2.0
nios2                 randconfig-002-20241114    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241114    gcc-14.2.0
parisc                randconfig-002-20241114    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    clang-20
powerpc               randconfig-001-20241114    gcc-14.2.0
powerpc               randconfig-002-20241114    clang-14
powerpc               randconfig-003-20241114    gcc-14.2.0
powerpc64             randconfig-001-20241114    gcc-14.2.0
powerpc64             randconfig-002-20241114    clang-20
powerpc64             randconfig-003-20241114    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241114    gcc-14.2.0
riscv                 randconfig-002-20241114    clang-14
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241114    gcc-14.2.0
s390                  randconfig-002-20241114    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20241114    gcc-14.2.0
sh                    randconfig-002-20241114    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241114    gcc-14.2.0
sparc64               randconfig-002-20241114    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241114    gcc-11
um                    randconfig-002-20241114    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241114    gcc-12
x86_64      buildonly-randconfig-002-20241114    gcc-12
x86_64      buildonly-randconfig-003-20241114    gcc-11
x86_64      buildonly-randconfig-004-20241114    gcc-12
x86_64      buildonly-randconfig-005-20241114    gcc-12
x86_64      buildonly-randconfig-006-20241114    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241114    gcc-12
x86_64                randconfig-002-20241114    gcc-12
x86_64                randconfig-003-20241114    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241114    gcc-14.2.0
xtensa                randconfig-002-20241114    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

