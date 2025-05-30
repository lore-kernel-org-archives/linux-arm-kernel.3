Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3ADC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9yrYiN9prEo+OO6sc9fo3FDSPyG2CkihxTlubKGzhQ=; b=rjYYH1nM9Rb9G5BqZP79GhZypW
	6c54VNWr890Q/CNHPU68pJfoFw1ek47laFBQJkLxH+ZRr2Z5Lj4dn/U4w4gGVGnPySWT22BhTcHXk
	dSlxtuF1HzhnMLKgkAOAdrnKSHYOqwsov+sWqtddTzcSanhQd3VRsh4HtxYzwZhy4rMplgRUOpDcs
	2MC415ouNgi/gx3DZ++ou+pSBEFR6nCJ8udGmbuUF4N/pO0yfkTt/q57QOXYmOGKlxKxuyAKxvoq4
	JX3ddosQqnmKjULnktNaOtrXNLnCPUw71s6BmFM3ENDBWN218+QfYvkLe4NeL6lkDCwUmC7IQqO9K
	2/vY+8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL5bG-00000001crh-2XCT;
	Fri, 30 May 2025 19:41:06 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL5Z7-00000001cfP-3XDi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 19:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748633934; x=1780169934;
  h=date:from:to:cc:subject:message-id;
  bh=q1JEwOfGkELsBWpM27vuEC7S9ArBNQ+wgq8CsiPPgoc=;
  b=Sw2ewfv/glRILTIVJ4AfF/J1woA4Sz3/qme0eJeS4dp8TBS/lIe/A/1/
   QJmWHEcUoQMPHrRm4+IAHc6+Nn0hgImgGUKIoY6EWOyX4JQCPbnZm+hrx
   9Cgm3pdPQM+1aNBT3cn331Ip7QmqKognI6xE5XZX9eBYKfP8d3FTHt14o
   zEl/17UxmOGBtYntSQF02qh6hFyqcJZT8jNAFXCVqWsyw6eGeeiEv7Ii8
   NKAcCAwWBjLIMGg0S0Rmms84mPHRi8C0F/taHroejupi5QKYm/4AAmAu7
   Hm7n73q+myYHnaP2mMw+6ScTD566qwKKG3EVUiVDLRadXRqWpneqzmXgL
   w==;
X-CSE-ConnectionGUID: cTM4I3jUQd2NassC54J3Lg==
X-CSE-MsgGUID: X+0h7VTTT4ik71Z+GKYXkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54531521"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54531521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 12:38:52 -0700
X-CSE-ConnectionGUID: KB2puAFpRcSAnPNf/XggUw==
X-CSE-MsgGUID: oHaXR15MSlu78xjd1+38xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144938057"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2025 12:38:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL5Z2-000Xuo-31;
	Fri, 30 May 2025 19:38:48 +0000
Date: Sat, 31 May 2025 03:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 3f07353e2fd3e154921e539044b26e85ca910dbe
Message-ID: <202505310301.nPzF55Hj-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_123853_956316_55FD7213 
X-CRM114-Status: UNSURE (   5.93  )
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
branch HEAD: 3f07353e2fd3e154921e539044b26e85ca910dbe  Merge tag 'renesas-dts-for-v6.16-tag5' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/dt

elapsed time: 721m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250530    gcc-15.1.0
arc                   randconfig-002-20250530    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20250530    gcc-15.1.0
arm                   randconfig-002-20250530    gcc-14.3.0
arm                   randconfig-003-20250530    clang-21
arm                   randconfig-004-20250530    clang-21
arm                           sama5_defconfig    gcc-15.1.0
arm                           sunxi_defconfig    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250530    gcc-12.3.0
arm64                 randconfig-002-20250530    gcc-5.5.0
arm64                 randconfig-003-20250530    gcc-7.5.0
arm64                 randconfig-004-20250530    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250530    gcc-15.1.0
csky                  randconfig-002-20250530    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250530    clang-21
hexagon               randconfig-002-20250530    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250530    clang-20
i386        buildonly-randconfig-002-20250530    clang-20
i386        buildonly-randconfig-003-20250530    clang-20
i386        buildonly-randconfig-004-20250530    clang-20
i386        buildonly-randconfig-005-20250530    clang-20
i386        buildonly-randconfig-006-20250530    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250530    gcc-15.1.0
loongarch             randconfig-002-20250530    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-21
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250530    gcc-5.5.0
nios2                 randconfig-002-20250530    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250530    gcc-12.4.0
parisc                randconfig-002-20250530    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc               randconfig-001-20250530    gcc-14.3.0
powerpc               randconfig-002-20250530    clang-21
powerpc               randconfig-003-20250530    gcc-8.5.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250530    gcc-14.3.0
powerpc64             randconfig-002-20250530    clang-21
powerpc64             randconfig-003-20250530    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250530    gcc-15.1.0
riscv                 randconfig-002-20250530    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250530    clang-20
s390                  randconfig-002-20250530    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250530    gcc-14.3.0
sh                    randconfig-002-20250530    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250530    gcc-8.5.0
sparc                 randconfig-002-20250530    gcc-10.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250530    gcc-8.5.0
sparc64               randconfig-002-20250530    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250530    gcc-11
um                    randconfig-002-20250530    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250530    clang-20
x86_64      buildonly-randconfig-002-20250530    clang-20
x86_64      buildonly-randconfig-003-20250530    gcc-12
x86_64      buildonly-randconfig-004-20250530    gcc-11
x86_64      buildonly-randconfig-005-20250530    clang-20
x86_64      buildonly-randconfig-006-20250530    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250530    gcc-15.1.0
xtensa                randconfig-002-20250530    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

