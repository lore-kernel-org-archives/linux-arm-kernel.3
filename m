Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675BDC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ahWUbVsPEqh8i4DZU3dFL1OLqQHS8Axu5i+NfAisXXE=; b=wtdRTb3KTpniIH8k1ve8avwhj/
	znV1LfAS2PrufnhWO5tc5uYA9QZhNm4WWP4dnTQWXuL+2ILEYgPnzzaHmu4YUhKb9T5NIcCBgq8MX
	wCM+HcNItmfJhYoGGWxH8S7+uZ/o+9HdJCMFpo9fJtkfq+2x5zdQAhMc8McClOiL0kPf7Yt0r3Q5O
	ifwsbRZLJ90b/JGklFvfGIL4TTy639GrqiBL0kKwpb0BASXkqHDkUA6hOpDZehirwtkExHD2Qn09l
	GuW/CXbuNQvmt9LFLFV1Ehlv5u81dTqdhdq0kdJ5lOseWucWuDem8LntyEF7GvN7p27hl7ITAH1gs
	5we/ppeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3IR-000000072PX-0RZY;
	Sun, 11 May 2025 09:48:35 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3GP-000000072Fl-3tf0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 09:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746956790; x=1778492790;
  h=date:from:to:cc:subject:message-id;
  bh=0/dcZp2p7ce5QPJKo7kvReWyCo8rTPGgnV3VIWibWmw=;
  b=erWwVo9ui4ODizKlShAbToYJ2kIUObnIp39YK7d8CzIqIifYaL2h21gP
   ySolFkR8HihopBPRgDFqR8pyaOW9cdlVLJ9TkhTZOsZIKRcPdP/WKSAnr
   cJw9PM7oW5ZDOgFXTFGh6kme2VIu/cQKDu7OdmjPLTZIYl/zCEGks9Qbd
   WQwuOuGWxHf9assD6uI1Kz71RYBpFMUXBVnIq2Yx9khusIVKDNUKpv/VQ
   J3UA55MfNLzZ38y4qZUjvcjkrQlm7lYS9Kbk23QgPuolJwFjY93rU7q3d
   /PHbIOdtqLiyO63etkt59w/Y6UnYeEKux7aXB32BjZd+HvcC3Au0joP4D
   Q==;
X-CSE-ConnectionGUID: Qkk4CyCHSsGBrGTPQDkCdA==
X-CSE-MsgGUID: xtvs1f+jRxu6eXIwzeUNGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="60160126"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="60160126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 02:46:28 -0700
X-CSE-ConnectionGUID: nkyYhrXHQOiMCSXQlXvEpw==
X-CSE-MsgGUID: CArrladnRoafgzOUPue5lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="138059437"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2025 02:46:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE3GK-000DhT-2o;
	Sun, 11 May 2025 09:46:24 +0000
Date: Sun, 11 May 2025 17:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 15eaaa71e8ef142b122942b35653d513cfb90050
Message-ID: <202505111750.SkjIe4yN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_024630_018374_10AE7C41 
X-CRM114-Status: UNSURE (   5.16  )
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
branch HEAD: 15eaaa71e8ef142b122942b35653d513cfb90050  Merge tag 'imx-fixes-6.15-2' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes

elapsed time: 1387m

configs tested: 132
configs skipped: 2

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
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250510    gcc-10.5.0
arm                   randconfig-002-20250510    clang-21
arm                   randconfig-003-20250510    gcc-10.5.0
arm                   randconfig-004-20250510    gcc-7.5.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250510    gcc-7.5.0
arm64                 randconfig-002-20250510    gcc-5.5.0
arm64                 randconfig-003-20250510    clang-21
arm64                 randconfig-004-20250510    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250510    gcc-14.2.0
csky                  randconfig-002-20250510    gcc-13.3.0
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
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-17
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
powerpc                       holly_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
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
s390                                defconfig    clang-21
s390                  randconfig-001-20250510    gcc-7.5.0
s390                  randconfig-002-20250510    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250510    gcc-9.3.0
sh                    randconfig-002-20250510    gcc-11.5.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250510    gcc-12.4.0
sparc                 randconfig-002-20250510    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250510    gcc-10.5.0
sparc64               randconfig-002-20250510    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250510    gcc-12
um                    randconfig-002-20250510    gcc-12
um                           x86_64_defconfig    clang-21
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
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250510    gcc-8.5.0
xtensa                randconfig-002-20250510    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

