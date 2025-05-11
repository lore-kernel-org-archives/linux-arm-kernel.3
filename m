Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4775C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 05:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gQs76D3DGm24HATRAVSaWa/E1AwMo4ZdfR9zAwO6ypg=; b=DSwQ9fWow4R/r01++UfTGBUXW+
	wTw3DA4yZsRKDtP2maIJuhFtl4B7ylqlZdk17NE1M8QuYJ/6S53FOyvQgOgbM06ga9DeBfSjOP3m2
	iluFbQUSAt5Mm0ookbp0eUEmZq/yro3F2El7/Xqqmwso5S7t1rZ3TulE6sB/rSRZxhOu7IyuYlnZ/
	rpcN0ANaiLneFswI2m9e3c4YSPEiXn7TYGWrDuRBd2MiHvWDV34JIiodZciHzxlfKABpk3xGRZdw9
	nSybWhQOaBLi6FwRrO+8Bo54RC5+kdB+68c2RxVX5qHGpyB2M6BqYOAPX7BeyMh7FpKBNMvikB6IV
	ERpd791w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDyvO-00000006lbJ-1c2W;
	Sun, 11 May 2025 05:08:30 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDytE-00000006lUh-0e0J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 05:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746939976; x=1778475976;
  h=date:from:to:cc:subject:message-id;
  bh=SEO2qMuRefQJgHHEctEoLlGSinGB1r6q+ABYzpV67/0=;
  b=lv7iR0iGVSB+KLmQfEc4xrx0DcFnwD+RgXWEGHduGIyp5Pqdmy3RpNAc
   7SGIB/jV20X/e/xZmW8O3AY1OCSSCj6nZwcvrU2DW3fHiZZuoNa4kU+RM
   OhYjCGGcvD4eZ/mdBYaJY268iAOpYIVpQvrImNf2vrdckxAL6IuMrU4yu
   uVnqaSQLdnc7eQd0fSfWfj3DxGfNduwJOtSkxa/Si0AewKp5uJOeXIuME
   GIqddNK3I8Iy2CfMnr0B+xFMLR5dBdU26LDD5rnfif6e7d+wqePGUt0GD
   LneDpQgs7PBX8q80YAiWjX1Lcmd7JW8sEUVyVP2h9940/hXxRWW5mw+yu
   g==;
X-CSE-ConnectionGUID: oPTQXbhRR7+5MDuW71QT7w==
X-CSE-MsgGUID: XuoFGP7TRiyiiwjz1vdeww==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48438051"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48438051"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 22:06:09 -0700
X-CSE-ConnectionGUID: ZeA29GQOReKT3E+3iSrSIw==
X-CSE-MsgGUID: 0BmL9BiqTIWtjip8uUNjjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="138012396"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 May 2025 22:06:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDyt3-000Db9-15;
	Sun, 11 May 2025 05:06:05 +0000
Date: Sun, 11 May 2025 13:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 9477c3e68e0ada4655939b4d49fa79377f0882f3
Message-ID: <202505111347.AaVQKO2r-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_220616_274874_26823A72 
X-CRM114-Status: UNSURE (   4.78  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: 9477c3e68e0ada4655939b4d49fa79377f0882f3  Merge tag 'tee-for-v6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into soc/drivers

elapsed time: 1105m

configs tested: 124
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250510    gcc-14.2.0
arc                   randconfig-002-20250510    gcc-13.3.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250510    gcc-10.5.0
arm                   randconfig-002-20250510    clang-21
arm                   randconfig-003-20250510    gcc-10.5.0
arm                   randconfig-004-20250510    gcc-7.5.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250510    gcc-7.5.0
arm64                 randconfig-002-20250510    gcc-5.5.0
arm64                 randconfig-003-20250510    clang-21
arm64                 randconfig-004-20250510    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250510    gcc-14.2.0
csky                  randconfig-002-20250510    gcc-13.3.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250510    clang-21
hexagon               randconfig-002-20250510    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250510    gcc-12
i386        buildonly-randconfig-002-20250510    gcc-12
i386        buildonly-randconfig-003-20250510    gcc-12
i386        buildonly-randconfig-004-20250510    gcc-12
i386        buildonly-randconfig-005-20250510    gcc-12
i386        buildonly-randconfig-006-20250510    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250510    gcc-13.3.0
loongarch             randconfig-002-20250510    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-18
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250510    gcc-11.5.0
nios2                 randconfig-002-20250510    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250510    gcc-6.5.0
parisc                randconfig-002-20250510    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250510    gcc-7.5.0
powerpc               randconfig-002-20250510    clang-17
powerpc               randconfig-003-20250510    clang-21
powerpc64             randconfig-001-20250510    clang-18
powerpc64             randconfig-002-20250510    gcc-10.5.0
powerpc64             randconfig-003-20250510    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250510    gcc-14.2.0
riscv                 randconfig-002-20250510    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250510    gcc-7.5.0
s390                  randconfig-002-20250510    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250510    gcc-9.3.0
sh                    randconfig-002-20250510    gcc-11.5.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250510    gcc-12.4.0
sparc                 randconfig-002-20250510    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64               randconfig-001-20250510    gcc-10.5.0
sparc64               randconfig-002-20250510    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250510    gcc-12
um                    randconfig-002-20250510    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250510    clang-20
x86_64      buildonly-randconfig-002-20250510    clang-20
x86_64      buildonly-randconfig-003-20250510    gcc-12
x86_64      buildonly-randconfig-004-20250510    gcc-11
x86_64      buildonly-randconfig-005-20250510    gcc-12
x86_64      buildonly-randconfig-006-20250510    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250510    gcc-8.5.0
xtensa                randconfig-002-20250510    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

