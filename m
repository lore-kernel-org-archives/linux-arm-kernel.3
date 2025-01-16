Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94374C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BQY7AK/ieM7KEyru9WPfofKrHParBemywj/MRntXWxM=; b=d1EITQFh7+6p2xEh3rjqRG1dtl
	IsnCGfTc1JAs0rZB1pWc18iz2ZSYPvrb/uBDJmAbdAFFuwFFaNh9d+h57ihVBE2/6/cCxbOU6ikgw
	3u8Lvw+kt+LqBvTZbf1d215tjh/FfQXIE3Sv46BENjZdiEXjWAlfJHPfg/0lmAvtNfequJ8ZxzXRo
	fbYStvrrc++73itlC8TuSg4aVURzOiFvQVd5xJfnD2vcRW8/Twl2bph94ea7hRntc8rDmBNp2wJcN
	eYDURUsKo8BH7s00kV/5BXHiOfGjft8B/AP6if49qxBekT7w2Ofv9a/Woy6gy2vlmnXq8lXuphbaZ
	nKUj6b0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUil-0000000FoCv-3emI;
	Thu, 16 Jan 2025 18:35:59 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUhW-0000000Fo9Y-1MYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737052482; x=1768588482;
  h=date:from:to:cc:subject:message-id;
  bh=YNOStX7+EffztRWLMMkdznqSGcIVB6RJv4Z59At1wHo=;
  b=PQvZTpWTvvjnIo7ZePW8lmHD8BmVx7jZdz5EGLpSUK6wh5O6aXyaj/hk
   E9/2s6PVMLYrtgC0V9Z2OLDCcRlSH9wn4c+2CT19a2dVHzykBhqWnK6rw
   g7MOuEwkxKsYcPOp8bdYidJHgaTI2y7/OzcvbjvSZpiZRuM36Ybq+ECA1
   Jt9D+Mm5J+dfhRJzVdHkskfq7PUP1ULr0Q7nzUK90zRKcwaCPtfjVnxPy
   Y358oTXj/BpFUC7eCC5kuBMTsMpuXgGXkDQixG0uzz/jJB/ZQKaTVbh1+
   WQOck/Kln7wCzJ4KudAnNi0/Y3bXe++rpg/7okXZaqPXswfHYVeLWmF54
   w==;
X-CSE-ConnectionGUID: Ze5p7dOVT1CJ2x60yfHcBA==
X-CSE-MsgGUID: lFAWnjjMRzCh24OFEPOdKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48872246"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48872246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 10:34:42 -0800
X-CSE-ConnectionGUID: 6DXBS3cSRmqyoU61+t3o2g==
X-CSE-MsgGUID: 4gKnR5OJTK+9i5Zi4QiJDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106045947"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jan 2025 10:34:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYUhS-000SGt-1U;
	Thu, 16 Jan 2025 18:34:38 +0000
Date: Fri, 17 Jan 2025 02:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 f51df260e82b81c3e8ea2ab4554926bf475d926c
Message-ID: <202501170256.7kfNrrUX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_103442_376357_BAE0947A 
X-CRM114-Status: UNSURE (   5.48  )
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
branch HEAD: f51df260e82b81c3e8ea2ab4554926bf475d926c  Merge tag 'reset-for-v6.14-2' of git://git.pengutronix.de/pza/linux into soc/drivers

elapsed time: 1455m

configs tested: 89
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250116    gcc-13.2.0
arc                   randconfig-002-20250116    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250116    gcc-14.2.0
arm                   randconfig-002-20250116    clang-15
arm                   randconfig-003-20250116    gcc-14.2.0
arm                   randconfig-004-20250116    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250116    gcc-14.2.0
arm64                 randconfig-002-20250116    gcc-14.2.0
arm64                 randconfig-003-20250116    clang-15
arm64                 randconfig-004-20250116    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250116    gcc-14.2.0
csky                  randconfig-002-20250116    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250116    clang-20
hexagon               randconfig-002-20250116    clang-20
i386        buildonly-randconfig-001-20250116    clang-19
i386        buildonly-randconfig-002-20250116    clang-19
i386        buildonly-randconfig-003-20250116    clang-19
i386        buildonly-randconfig-004-20250116    clang-19
i386        buildonly-randconfig-005-20250116    clang-19
i386        buildonly-randconfig-006-20250116    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250116    gcc-14.2.0
loongarch             randconfig-002-20250116    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250116    gcc-14.2.0
nios2                 randconfig-002-20250116    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250116    gcc-14.2.0
parisc                randconfig-002-20250116    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250116    clang-20
powerpc               randconfig-002-20250116    gcc-14.2.0
powerpc               randconfig-003-20250116    clang-20
powerpc64             randconfig-001-20250116    clang-19
powerpc64             randconfig-002-20250116    clang-20
powerpc64             randconfig-003-20250116    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250116    gcc-14.2.0
riscv                 randconfig-002-20250116    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250116    gcc-14.2.0
s390                  randconfig-002-20250116    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250116    gcc-14.2.0
sh                    randconfig-002-20250116    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250116    gcc-14.2.0
sparc                 randconfig-002-20250116    gcc-14.2.0
sparc64               randconfig-001-20250116    gcc-14.2.0
sparc64               randconfig-002-20250116    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250116    clang-19
um                    randconfig-002-20250116    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250116    gcc-12
x86_64      buildonly-randconfig-002-20250116    gcc-12
x86_64      buildonly-randconfig-003-20250116    gcc-12
x86_64      buildonly-randconfig-004-20250116    clang-19
x86_64      buildonly-randconfig-005-20250116    clang-19
x86_64      buildonly-randconfig-006-20250116    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250116    gcc-14.2.0
xtensa                randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

