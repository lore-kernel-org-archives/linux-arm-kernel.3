Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A33ECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bpl9ugiqo+/G72vAFLZ0svH/aqOx0T30YzqazCycQ+8=; b=nRsHY2fXt5jP9aTHK8JQ3v76UP
	PK4dmu3d/mhQOvUmSe6h7ajgUjyxkadqcrekBAbWy53XEf41i+KBeHZLIZXMyaXj8+aNa9UUlaedd
	WwZYjTKWVacv32aK38GVCKFopsyLOyffYW22+M91xFWs4ulEBREKP6HJujBHUYsjNewSquU4M6Hrw
	3pdEVZmGGN2gKnBiJIiyrKm7vmDZ1hk672VPK+lODZMmlVDpkYjFDiTShKanN/WhfU/ug03s5g1jn
	/3pUFU39t46R2We3z4gh2b5LtK95q+3iYgpxRDY3Ir6hAQRlnGPJYS4QK0hs78qUyjNCFBM0Kni5v
	CEWl8QTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUve-00000007nRw-2Ppe;
	Tue, 16 Sep 2025 12:37:02 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUvc-00000007nR1-29xj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 12:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758026221; x=1789562221;
  h=date:from:to:cc:subject:message-id;
  bh=QkDjdfhs9ERveMVFooTk3yn8+jpDUARPsYb4y46VDCQ=;
  b=Xi9M2ck+Xb+tRbqHab1NNZRCalW6P1TKS+6ClvgMADais0cmrG6Rkzqo
   LTofYJpvuT1NHEcRul6Sn/EZmppQRSvsV0Nbi6ZKP/frMWHO6FnR/Vn3e
   MlLV/YkVx786ueB81ICC69LTE5G7KAnDnNc152yJAUYUiNO3kk2bDYZL8
   KZRLULDTMXWx9eq3nbocYMdTQvwbzHrgfcbKUb0ZBSdZFlee5pWcqk+7d
   ZHIMCc27DGULf1cicCEOYpahBd/I5OzmBqCjjiXjEVUgQQrT0mEMimg7m
   if3+88qVE6Zy8ipjOQ894qWHHyJyu099Hia5QnA+wdcf8vPne1p25DVwi
   A==;
X-CSE-ConnectionGUID: vePXF+tLRzKRiTznIAGh1A==
X-CSE-MsgGUID: BtNV8yokSbKR1MSy9USy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60171900"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="60171900"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:37:00 -0700
X-CSE-ConnectionGUID: cTttwXOxQo+huwwiNVAjtg==
X-CSE-MsgGUID: P8Yzpo96SJSMxkGyXUsHJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="179211194"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Sep 2025 05:36:58 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyUvY-0000Gr-2E;
	Tue, 16 Sep 2025 12:36:56 +0000
Date: Tue, 16 Sep 2025 20:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 8193017c718201ffcc9a3cb6f379ee07182a7096
Message-ID: <202509162044.TSgQQKHa-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_053700_589790_7E6AFD76 
X-CRM114-Status: UNSURE (   5.47  )
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
branch HEAD: 8193017c718201ffcc9a3cb6f379ee07182a7096  Merge tag 'imx-defconfig-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/defconfig

elapsed time: 1251m

configs tested: 129
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
arc                               allnoconfig    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                            mmp2_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20250916    gcc-11.5.0
arm                   randconfig-002-20250916    clang-22
arm                   randconfig-003-20250916    gcc-12.5.0
arm                   randconfig-004-20250916    clang-22
arm                           sama7_defconfig    clang-22
arm                        spear6xx_defconfig    clang-22
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250916    clang-18
arm64                 randconfig-002-20250916    clang-22
arm64                 randconfig-003-20250916    clang-22
arm64                 randconfig-004-20250916    clang-22
csky                              allnoconfig    clang-22
csky                  randconfig-001-20250916    clang-22
csky                  randconfig-002-20250916    clang-22
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20250916    clang-22
hexagon               randconfig-002-20250916    clang-22
i386        buildonly-randconfig-001-20250916    clang-20
i386        buildonly-randconfig-002-20250916    clang-20
i386        buildonly-randconfig-003-20250916    clang-20
i386        buildonly-randconfig-004-20250916    clang-20
i386        buildonly-randconfig-005-20250916    clang-20
i386        buildonly-randconfig-006-20250916    clang-20
i386                  randconfig-001-20250916    clang-20
i386                  randconfig-002-20250916    clang-20
i386                  randconfig-003-20250916    clang-20
i386                  randconfig-004-20250916    clang-20
i386                  randconfig-005-20250916    clang-20
i386                  randconfig-006-20250916    clang-20
i386                  randconfig-007-20250916    clang-20
i386                  randconfig-011-20250916    gcc-14
i386                  randconfig-012-20250916    gcc-14
i386                  randconfig-013-20250916    gcc-14
i386                  randconfig-014-20250916    gcc-14
i386                  randconfig-015-20250916    gcc-14
i386                  randconfig-016-20250916    gcc-14
i386                  randconfig-017-20250916    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250916    clang-22
loongarch             randconfig-002-20250916    clang-22
m68k                            q40_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                           ip32_defconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250916    clang-22
nios2                 randconfig-002-20250916    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-14
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250916    clang-22
parisc                randconfig-002-20250916    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20250916    clang-22
powerpc               randconfig-002-20250916    clang-22
powerpc               randconfig-003-20250916    clang-22
powerpc64             randconfig-001-20250916    clang-22
powerpc64             randconfig-002-20250916    clang-22
powerpc64             randconfig-003-20250916    clang-22
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250916    gcc-15.1.0
riscv                 randconfig-002-20250916    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250916    gcc-15.1.0
s390                  randconfig-002-20250916    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250916    gcc-15.1.0
sh                    randconfig-002-20250916    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250916    gcc-15.1.0
sparc                 randconfig-002-20250916    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250916    gcc-15.1.0
sparc64               randconfig-002-20250916    gcc-15.1.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250916    gcc-15.1.0
um                    randconfig-002-20250916    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64      buildonly-randconfig-001-20250916    clang-20
x86_64      buildonly-randconfig-002-20250916    clang-20
x86_64      buildonly-randconfig-003-20250916    clang-20
x86_64      buildonly-randconfig-004-20250916    clang-20
x86_64      buildonly-randconfig-005-20250916    clang-20
x86_64      buildonly-randconfig-006-20250916    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250916    clang-20
x86_64                randconfig-002-20250916    clang-20
x86_64                randconfig-003-20250916    clang-20
x86_64                randconfig-004-20250916    clang-20
x86_64                randconfig-005-20250916    clang-20
x86_64                randconfig-006-20250916    clang-20
x86_64                randconfig-007-20250916    clang-20
x86_64                randconfig-008-20250916    clang-20
x86_64                randconfig-071-20250916    gcc-14
x86_64                randconfig-072-20250916    gcc-14
x86_64                randconfig-073-20250916    gcc-14
x86_64                randconfig-074-20250916    gcc-14
x86_64                randconfig-075-20250916    gcc-14
x86_64                randconfig-076-20250916    gcc-14
x86_64                randconfig-077-20250916    gcc-14
x86_64                randconfig-078-20250916    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                randconfig-001-20250916    gcc-15.1.0
xtensa                randconfig-002-20250916    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

