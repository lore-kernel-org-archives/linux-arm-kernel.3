Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B92C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLdPMW3xH8KkoLPxK1kHgTgSsusSJpiSzKC/jMfU26w=; b=LFRSZdUA5U1oiA4XEVCVbam5Ig
	bPl1NZ5n1xwe2Aq7sky9bWtaFUks8rg3L6RbPCUYYo6NcK0RS6n9YZZen9xauUYfwJNcqSEXmtauH
	ppD8ZYDKSWJjs68UgGFH6JYaE1xO7jUAASrm+fK8uI5JseDI7A00iZBAx4G7FMP0YDYajMUBUPshQ
	n5/iuy5/Y8U34cMocnorubF+UNxrUxEA426VW/pH4ECyKFNvbsE4klYhs00XWo0jiXL+1kVnkAIyH
	Zev2izjcIh/BuY/tmY6XcOx9ggkTjCvEfQF4U6uumXBVbA0CAy54O0gCUkgT0IUJ1HS1gUZRvlt0H
	GXK66WLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUgr-0000000Fo6E-0X84;
	Thu, 16 Jan 2025 18:34:01 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUfb-0000000Fnz3-2yw7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737052363; x=1768588363;
  h=date:from:to:cc:subject:message-id;
  bh=IXA+cxxVHU9/QmoeoHl/m8LSmY4BSRUrYO1HL1+Y+TI=;
  b=J/PwdoHD9/r+Yk/mAw+kLogGxWDhJQYg2CzDLBua6QB6c2NWDhAdql0M
   6MLR6LgjWlDC0txU3D23uQa520ZVkdKyGIQ67+l0gHSO89f48To1CXu6t
   25XBUpNftR+3Fd5571jGyUfhH2ScmVLdOWcOJzvVumSrIEgQ4XP5sg+Xb
   RpymEpf3vOVcPg9BRYiql3rlLrurg0e8BKUWdqw17vkiQs2/l+4IfxXoi
   d/ZJckKdVCusi+ulhGYSeu/V4YL7Gov/mWSB638j2vEuB58WBjLB3hhs8
   MVk8jwWoJM1k40nQMSlKjUuW4DuyD5kvtQZLNbSrxQ03KsActiOInn4Fo
   g==;
X-CSE-ConnectionGUID: 2/1om0NlQ8O+0OpBHG9dgw==
X-CSE-MsgGUID: 8wX13y69THCnFZQbvLHt5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="59934551"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="59934551"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 10:32:43 -0800
X-CSE-ConnectionGUID: VQDU/BPTRuOQGfariHaVIw==
X-CSE-MsgGUID: rhzszQ1DTYirBbfbdS4U/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="110555068"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 10:32:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYUfW-000SGi-0y;
	Thu, 16 Jan 2025 18:32:38 +0000
Date: Fri, 17 Jan 2025 02:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 fa8592f24944faf552c9a553ed64a3d5fe4e2cd9
Message-ID: <202501170209.I1AmZB6v-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_103243_791938_30838297 
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
branch HEAD: fa8592f24944faf552c9a553ed64a3d5fe4e2cd9  Merge tag 'riscv-config-for-v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/defconfig

elapsed time: 1454m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                  randconfig-001-20250116    gcc-13.2.0
arc                  randconfig-002-20250116    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250116    gcc-14.2.0
arm                  randconfig-002-20250116    clang-15
arm                  randconfig-003-20250116    gcc-14.2.0
arm                  randconfig-004-20250116    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250116    gcc-14.2.0
arm64                randconfig-002-20250116    gcc-14.2.0
arm64                randconfig-003-20250116    clang-15
arm64                randconfig-004-20250116    clang-20
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250116    gcc-14.2.0
csky                 randconfig-002-20250116    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250116    clang-20
hexagon              randconfig-002-20250116    clang-20
i386       buildonly-randconfig-001-20250116    clang-19
i386       buildonly-randconfig-002-20250116    clang-19
i386       buildonly-randconfig-003-20250116    clang-19
i386       buildonly-randconfig-004-20250116    clang-19
i386       buildonly-randconfig-005-20250116    clang-19
i386       buildonly-randconfig-006-20250116    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250116    gcc-14.2.0
loongarch            randconfig-002-20250116    gcc-14.2.0
nios2                randconfig-001-20250116    gcc-14.2.0
nios2                randconfig-002-20250116    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                           defconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                             defconfig    gcc-14.2.0
parisc               randconfig-001-20250116    gcc-14.2.0
parisc               randconfig-002-20250116    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250116    clang-20
powerpc              randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-003-20250116    clang-20
powerpc64            randconfig-001-20250116    clang-19
powerpc64            randconfig-002-20250116    clang-20
powerpc64            randconfig-003-20250116    clang-15
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250116    gcc-14.2.0
riscv                randconfig-002-20250116    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250116    gcc-14.2.0
s390                 randconfig-002-20250116    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250116    gcc-14.2.0
sh                   randconfig-002-20250116    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250116    gcc-14.2.0
sparc                randconfig-002-20250116    gcc-14.2.0
sparc64              randconfig-001-20250116    gcc-14.2.0
sparc64              randconfig-002-20250116    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250116    clang-19
um                   randconfig-002-20250116    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250116    gcc-12
x86_64     buildonly-randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-003-20250116    gcc-12
x86_64     buildonly-randconfig-004-20250116    clang-19
x86_64     buildonly-randconfig-005-20250116    clang-19
x86_64     buildonly-randconfig-006-20250116    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250116    gcc-14.2.0
xtensa               randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

