Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA72CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B2hii9U0ly5I5+BpHSuyxkBVrh8ws1BO6suNspssNmQ=; b=AcBpz6PGPoyHRObU72jsLwrLdH
	0CpLvYofLq70rgogQXIiTRh0pMqdjwvV/OX5mLKVRH6hY+1sqlLmgnABiVXLsFvsxbUwiLxubo8gD
	L+GemYRJXoXCLNLXOplaVi/ar4FSWxPbIe9a2kBBvpRp2a+QU41US0Lf5N0f6ob827RV9Lkoy+ySM
	xhSsdeUJZUsGQ1exKharMHOiI6e1J/HYoIKBnxXtjE6s3JnfM8cOjyF3w1uT745SZQY7R5bH4Pf8S
	Rp08MnQMLWSNnbirUjZ4swBgR3mrvLQPvOcRY0ADTKPH4Qh6S4/CcfTX1r+Sjh8wscuvC9CToSDGX
	R2He+hyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbh6q-00000005A06-1x1t;
	Mon, 22 Jun 2026 16:02:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbh6n-000000059vH-3Eje
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782144170; x=1813680170;
  h=date:from:to:cc:subject:message-id;
  bh=1kjgrbguCC5bc7RX/V9DPlUjzUolxO00tVoAE1hbUbw=;
  b=hEnZunLrPYkm01FlDxK7W4iIEytk96sx4l7XHGXWMBujseUH2V/rrwOA
   ABiSjPiRxLt/OYNO9hSZI9ILmfZqzAq2Nie2M6rjocURaIVeg3OT1LtxN
   cdA3Wfqxb5Q1KoHkhpnG7sRuG6mpBTPjIoPIXFt8cw28UK72dj4oCbcII
   4IO41YwzeeJkEeSMfNWK/9YvsaVWSe7FsADh/3ZyKZQs+2Yl1Ui2UlWja
   mtJiuUvmvMg6mxdk1rox2d9LpaTojqyTQNs6+u/6FDnEpPwz77jgVlvkl
   tX50z4hlA+KoRQgjXA/B13mRZMOoBrur4wXUBs++VhdS5c/rC/8GB1snn
   A==;
X-CSE-ConnectionGUID: 0XGWya30TB+CBooVg51NLQ==
X-CSE-MsgGUID: Hj6SfpcAT7u676ZBxFBjgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82746978"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82746978"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 09:00:47 -0700
X-CSE-ConnectionGUID: zgbvCoiMTb29e0/y4YAfbA==
X-CSE-MsgGUID: B2b9dbiyTJiYH32V5WT5jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="242910552"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jun 2026 09:00:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbh4l-000000001Sm-1xYX;
	Mon, 22 Jun 2026 16:00:43 +0000
Date: Tue, 23 Jun 2026 00:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:rfc-arm-deprecation-7.2] BUILD SUCCESS
 1a31334b581c956c261b6618f03fa08041c6e95e
Message-ID: <202606230010.FV8wy4Pl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_090249_828118_4466D099 
X-CRM114-Status: UNSURE (   5.34  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git rfc-arm-deprecation-7.2
branch HEAD: 1a31334b581c956c261b6618f03fa08041c6e95e  ARM: mark mv78xx0 support as deprecated

elapsed time: 740m

configs tested: 179
configs skipped: 137

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260622    gcc-8.5.0
arc                   randconfig-002-20260622    gcc-8.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260622    gcc-8.5.0
arm                   randconfig-002-20260622    gcc-8.5.0
arm                   randconfig-003-20260622    gcc-8.5.0
arm                   randconfig-004-20260622    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260622    gcc-8.5.0
arm64                 randconfig-002-20260622    gcc-8.5.0
arm64                 randconfig-003-20260622    gcc-8.5.0
arm64                 randconfig-004-20260622    gcc-8.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260622    gcc-8.5.0
csky                  randconfig-002-20260622    gcc-8.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260622    gcc-8.5.0
hexagon               randconfig-002-20260622    gcc-8.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260622    gcc-14
i386        buildonly-randconfig-002-20260622    gcc-14
i386        buildonly-randconfig-003-20260622    gcc-14
i386        buildonly-randconfig-004-20260622    gcc-14
i386        buildonly-randconfig-005-20260622    gcc-14
i386        buildonly-randconfig-006-20260622    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260622    clang-22
i386                  randconfig-002-20260622    clang-22
i386                  randconfig-003-20260622    clang-22
i386                  randconfig-004-20260622    clang-22
i386                  randconfig-005-20260622    clang-22
i386                  randconfig-006-20260622    clang-22
i386                  randconfig-007-20260622    clang-22
i386                  randconfig-011-20260622    gcc-14
i386                  randconfig-012-20260622    gcc-14
i386                  randconfig-013-20260622    gcc-14
i386                  randconfig-014-20260622    gcc-14
i386                  randconfig-015-20260622    gcc-14
i386                  randconfig-016-20260622    gcc-14
i386                  randconfig-017-20260622    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260622    gcc-8.5.0
loongarch             randconfig-002-20260622    gcc-8.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        qi_lb60_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260622    gcc-8.5.0
nios2                 randconfig-002-20260622    gcc-8.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260622    gcc-14.3.0
parisc                randconfig-002-20260622    gcc-14.3.0
parisc64                            defconfig    clang-23
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260622    gcc-14.3.0
powerpc               randconfig-002-20260622    gcc-14.3.0
powerpc64             randconfig-001-20260622    gcc-14.3.0
powerpc64             randconfig-002-20260622    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260622    gcc-16.1.0
sparc                          randconfig-002    gcc-16.1.0
sparc                 randconfig-002-20260622    gcc-16.1.0
sparc                       sparc32_defconfig    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-16.1.0
sparc64               randconfig-001-20260622    gcc-16.1.0
sparc64                        randconfig-002    gcc-16.1.0
sparc64               randconfig-002-20260622    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-16.1.0
um                    randconfig-001-20260622    gcc-16.1.0
um                             randconfig-002    gcc-16.1.0
um                    randconfig-002-20260622    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260622    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260622    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260622    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260622    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260622    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260622    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260622    clang-22
x86_64                randconfig-002-20260622    clang-22
x86_64                randconfig-003-20260622    clang-22
x86_64                randconfig-004-20260622    clang-22
x86_64                randconfig-005-20260622    clang-22
x86_64                randconfig-006-20260622    clang-22
x86_64                randconfig-011-20260622    clang-22
x86_64                randconfig-012-20260622    clang-22
x86_64                randconfig-013-20260622    clang-22
x86_64                randconfig-014-20260622    clang-22
x86_64                randconfig-015-20260622    clang-22
x86_64                randconfig-016-20260622    clang-22
x86_64                randconfig-071-20260622    gcc-14
x86_64                randconfig-072-20260622    gcc-14
x86_64                randconfig-073-20260622    gcc-14
x86_64                randconfig-074-20260622    gcc-14
x86_64                randconfig-075-20260622    gcc-14
x86_64                randconfig-076-20260622    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-16.1.0
xtensa                randconfig-001-20260622    gcc-16.1.0
xtensa                         randconfig-002    gcc-16.1.0
xtensa                randconfig-002-20260622    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

