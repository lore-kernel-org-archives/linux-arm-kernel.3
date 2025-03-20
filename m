Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4426DC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q4ZCJfEccZI3jmWmasjNXu732Bul52iWqFQrhQTpNK4=; b=uH62Ni/qlWu4VZVnIKipM/0INw
	5LgHg8P/QOJYP3BsL7Uv2j2xwraL/IoaI82CKs78JegPvV5wEyhPVNhEhIOW6VI+P5/9LkXZFx+db
	dFiXoJte/v5sB0X1k3kw3sv7i1jMTPal1eGOIWo0+tuiCHD/H7KCFardiyKpBrAUovkpjmWqPHtJB
	PMK5Ic+VIYaGXpvbUfST5QZwF+x3kOSUQEpGWENxPLoZuYOYmpyiTdYyasaGG64UccAe+WywKE4c0
	GVQg85rWLcn3ZHkk7TZCteXfNwK3IBKDSKVvCjjmDfLISnaGHiAVIlPlnhSm/DLbnQuP48G7sd35G
	XIkaRGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHn2-0000000CXUg-2imo;
	Thu, 20 Mar 2025 15:26:36 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHk3-0000000CWuz-1IeS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742484211; x=1774020211;
  h=date:from:to:cc:subject:message-id;
  bh=Mc3UIUYegGRWFQD9uy3UNOXJ0Jw3xvvBrPbR1LQdOfY=;
  b=gcq9Gs4+GNLSnfOGeKolmkf2Zb0zCfdo0jhkiSrnPBmBdC2pr0P/5gKq
   Md70zkZ2DgmHqTRv+3pfU4R75o0djpLUKpmaGyNLaDOMajOrpi2adMd+W
   qkA+/6JTZbN+TCzx+roo1+/SitLnr4oLcxcsejKjZ4SH2UJp/MlfL9Ai8
   d2yIyhMcYLPaTpQAIn50Psdv2j6atbNpDjmpgEB1DqLufafSMTTrvEX05
   tJf4p2UTBidh+KUFbUB35fwplCX5WektdJN0F09XnJpGqPkl+yLFU2n8o
   wTQrPneCQB7bqI93+mrBo6ExfjfaeYvwogfV/QkP+HCF7QjBbOv9z4kyL
   w==;
X-CSE-ConnectionGUID: x9R0BXXcRJKTa6jGe86yxw==
X-CSE-MsgGUID: GjpOXx2xRE+X9JEfRqW0zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43855262"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43855262"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 08:23:29 -0700
X-CSE-ConnectionGUID: Ky8i+4+VSA+n25bgh9sN/w==
X-CSE-MsgGUID: cyD9imkzQjOA4+yCMv7jkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123134912"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 08:23:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvHjx-0000X1-0Z;
	Thu, 20 Mar 2025 15:23:25 +0000
Date: Thu, 20 Mar 2025 23:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:qcom/defconfig] BUILD SUCCESS
 dd20903cc09ac40e71096370a9564e6523e87c22
Message-ID: <202503202315.OVMstnDa-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082331_364439_20E55CAD 
X-CRM114-Status: UNSURE (   5.01  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/defconfig
branch HEAD: dd20903cc09ac40e71096370a9564e6523e87c22  arm64: defconfig: Enable USB retimer and redriver

elapsed time: 1456m

configs tested: 152
configs skipped: 204

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    clang-15
arc                   randconfig-001-20250320    gcc-7.5.0
arc                   randconfig-002-20250320    gcc-7.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                       aspeed_g5_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-15
arm                   randconfig-001-20250320    gcc-7.5.0
arm                   randconfig-002-20250320    gcc-7.5.0
arm                   randconfig-003-20250320    gcc-7.5.0
arm                   randconfig-004-20250320    gcc-7.5.0
arm                           tegra_defconfig    clang-15
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-15
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250320    clang-21
arm64                 randconfig-001-20250320    gcc-7.5.0
arm64                 randconfig-002-20250320    clang-21
arm64                 randconfig-002-20250320    gcc-7.5.0
arm64                 randconfig-003-20250320    clang-19
arm64                 randconfig-003-20250320    gcc-7.5.0
arm64                 randconfig-004-20250320    gcc-7.5.0
arm64                 randconfig-004-20250320    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250320    gcc-12.4.0
csky                  randconfig-002-20250320    gcc-12.4.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250320    gcc-12.4.0
hexagon               randconfig-002-20250320    gcc-12.4.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250320    clang-20
i386                  randconfig-002-20250320    clang-20
i386                  randconfig-003-20250320    clang-20
i386                  randconfig-004-20250320    clang-20
i386                  randconfig-005-20250320    clang-20
i386                  randconfig-006-20250320    clang-20
i386                  randconfig-007-20250320    clang-20
i386                  randconfig-011-20250320    gcc-12
i386                  randconfig-012-20250320    gcc-12
i386                  randconfig-013-20250320    gcc-12
i386                  randconfig-014-20250320    gcc-12
i386                  randconfig-015-20250320    gcc-12
i386                  randconfig-016-20250320    gcc-12
i386                  randconfig-017-20250320    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    clang-15
loongarch             randconfig-001-20250320    gcc-12.4.0
loongarch             randconfig-002-20250320    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250320    gcc-12.4.0
nios2                 randconfig-002-20250320    gcc-12.4.0
openrisc                          allnoconfig    clang-15
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250320    gcc-12.4.0
parisc                randconfig-002-20250320    gcc-12.4.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    clang-15
powerpc                      bamboo_defconfig    clang-15
powerpc                 mpc8313_rdb_defconfig    clang-15
powerpc               randconfig-001-20250320    gcc-12.4.0
powerpc               randconfig-002-20250320    gcc-12.4.0
powerpc               randconfig-003-20250320    gcc-12.4.0
powerpc64             randconfig-001-20250320    gcc-12.4.0
powerpc64             randconfig-002-20250320    gcc-12.4.0
powerpc64             randconfig-003-20250320    gcc-12.4.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    clang-15
sh                            migor_defconfig    clang-15
sh                          sdk7780_defconfig    clang-15
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                               allyesconfig    clang-19
x86_64                           alldefconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250320    clang-20
x86_64      buildonly-randconfig-002-20250320    clang-20
x86_64      buildonly-randconfig-003-20250320    clang-20
x86_64      buildonly-randconfig-004-20250320    clang-20
x86_64      buildonly-randconfig-005-20250320    clang-20
x86_64      buildonly-randconfig-006-20250320    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250320    clang-20
x86_64                randconfig-002-20250320    clang-20
x86_64                randconfig-003-20250320    clang-20
x86_64                randconfig-004-20250320    clang-20
x86_64                randconfig-005-20250320    clang-20
x86_64                randconfig-006-20250320    clang-20
x86_64                randconfig-007-20250320    clang-20
x86_64                randconfig-008-20250320    clang-20
x86_64                randconfig-071-20250320    gcc-12
x86_64                randconfig-072-20250320    gcc-12
x86_64                randconfig-073-20250320    gcc-12
x86_64                randconfig-074-20250320    gcc-12
x86_64                randconfig-075-20250320    gcc-12
x86_64                randconfig-076-20250320    gcc-12
x86_64                randconfig-077-20250320    gcc-12
x86_64                randconfig-078-20250320    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

