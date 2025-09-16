Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99FACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 05:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5v7XucDD0rklqXzXaUQElkSds2AFIOKOGdxwJgiujw=; b=EFlXtOVAXxKh2FrlCJeK6Xmp7i
	X8kFtEK+fFb9rbeFtwB6yT2qEKNxo2FRJyuNroiFxVBzI54MeTMkbSS+bs4EzmMGZvIR3CBnm9A6B
	8Am0dSHuIByMKLNw9ciZNKjeNqQvEb3Pl3R4O1H8j37x1R8/vyR4SYl2MQDt1uFwb+i2oeTRsqcTP
	XW8xHg1z0e1mJn1mbzkNnvp+leDSBNNLZsiFfZiWSUl57NsHeiJqUpCl/1uRV4qyNhuV+l7O5nwin
	1dYr6eSnCAAXA0DkgdZGDEm6svBoO152LniCdj4DCPBkZnK9zdE5cu9DLmE0XergHVdyaYGYWxi7r
	dQkguabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNyI-00000006miZ-49hN;
	Tue, 16 Sep 2025 05:11:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNyF-00000006mi6-3ZI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 05:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757999476; x=1789535476;
  h=date:from:to:cc:subject:message-id;
  bh=DiAk6qa+xqoZkaNFYhJZ4Vg7KEjwHX08LF7B2u0Du3o=;
  b=HGmpxxU76Cq0mII4S819nsWwXdPKxgKE2HUxF5lMGza+Sg5KV4Dg5mvb
   IZUX2UU04GwRG3sZFAcZU0L2xeWVyNTEZJiKT7tB33W6g0L4ryJlg0YAO
   yQ9ABzNDc3ZKIE764nc7gKawZPElZBB4vR7udTxGIgPSa75B0GfuNZ7Iz
   hDcBt5KC1/ZUHit3Nmc/AMX9jptpTHQwcMKBzvcZBMJvjs6qCY7DnXcG/
   HsfHBGLF/MIkRgJVAM2+3WtqzBBCCuY01mD2m81TKa+zuzVIKbOmMifrr
   HNYECFlbRBPtaXaFYt9wExSbVSOBlJxWoqX2/btbeMvmz/1r//O7kxLZa
   g==;
X-CSE-ConnectionGUID: CvPkMLd/Ti223SEE/VnjHg==
X-CSE-MsgGUID: sUtY7+65TwCkktlOpCkEnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="64089456"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="64089456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 22:11:12 -0700
X-CSE-ConnectionGUID: 1W9CrRdvSreXevxcPeOJqw==
X-CSE-MsgGUID: GAEkMvgaTd+j1CmBy4pigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="179127746"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Sep 2025 22:11:10 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyNy8-00010V-1E;
	Tue, 16 Sep 2025 05:11:08 +0000
Date: Tue, 16 Sep 2025 13:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:thead/dt] BUILD SUCCESS
 dfa743da83ab7ba51ec5692d5939ba1bab4b78c1
Message-ID: <202509161343.kdcCh2Me-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_221115_947247_73DEED2A 
X-CRM114-Status: UNSURE (   5.46  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git thead/dt
branch HEAD: dfa743da83ab7ba51ec5692d5939ba1bab4b78c1  MAINTAINERS: Add RISC-V T-HEAD SoC patchwork

Unverified Warning (likely false positive, kindly check if interested):

    arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
    arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: gpu@ffef400000 (thead,th1520-gpu): 'power-domain-names' is a required property
    arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: gpu@ffef400000 (thead,th1520-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
    arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
    arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpu@ffef400000 (thead,th1520-gpu): 'power-domain-names' is a required property
    arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpu@ffef400000 (thead,th1520-gpu): compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
|-- riscv-randconfig-051-20250916
|   |-- arch-riscv-boot-dts-thead-th1520-beaglev-ahead.dtb:gpu-ffef400000-(thead-th1520-gpu):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-riscv-boot-dts-thead-th1520-beaglev-ahead.dtb:gpu-ffef400000-(thead-th1520-gpu):power-domain-names-is-a-required-property
|   |-- arch-riscv-boot-dts-thead-th1520-beaglev-ahead.dtb:soc-gpu-ffef400000:failed-to-match-any-schema-with-compatible:thead-th1520-gpu-img-img-bxm-img-img-rogue
|   |-- arch-riscv-boot-dts-thead-th1520-lichee-pi-4a.dtb:gpu-ffef400000-(thead-th1520-gpu):compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-riscv-boot-dts-thead-th1520-lichee-pi-4a.dtb:gpu-ffef400000-(thead-th1520-gpu):power-domain-names-is-a-required-property
|   `-- arch-riscv-boot-dts-thead-th1520-lichee-pi-4a.dtb:soc-gpu-ffef400000:failed-to-match-any-schema-with-compatible:thead-th1520-gpu-img-img-bxm-img-img-rogue
`-- riscv-randconfig-052-20250916
    |-- arch-riscv-boot-dts-thead-th1520-beaglev-ahead.dtb:gpu-ffef400000-(thead-th1520-gpu):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-riscv-boot-dts-thead-th1520-beaglev-ahead.dtb:gpu-ffef400000-(thead-th1520-gpu):power-domain-names-is-a-required-property
    |-- arch-riscv-boot-dts-thead-th1520-beaglev-ahead.dtb:soc-gpu-ffef400000:failed-to-match-any-schema-with-compatible:thead-th1520-gpu-img-img-bxm-img-img-rogue
    |-- arch-riscv-boot-dts-thead-th1520-lichee-pi-4a.dtb:gpu-ffef400000-(thead-th1520-gpu):compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-riscv-boot-dts-thead-th1520-lichee-pi-4a.dtb:gpu-ffef400000-(thead-th1520-gpu):power-domain-names-is-a-required-property
    `-- arch-riscv-boot-dts-thead-th1520-lichee-pi-4a.dtb:soc-gpu-ffef400000:failed-to-match-any-schema-with-compatible:thead-th1520-gpu-img-img-bxm-img-img-rogue

elapsed time: 952m

configs tested: 242
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250915    gcc-9.5.0
arc                   randconfig-001-20250916    clang-22
arc                   randconfig-002-20250915    gcc-9.5.0
arc                   randconfig-002-20250916    clang-22
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            mmp2_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250915    gcc-13.4.0
arm                   randconfig-001-20250916    clang-22
arm                   randconfig-002-20250915    clang-20
arm                   randconfig-002-20250916    clang-22
arm                   randconfig-003-20250915    gcc-8.5.0
arm                   randconfig-003-20250916    clang-22
arm                   randconfig-004-20250915    gcc-11.5.0
arm                   randconfig-004-20250916    clang-22
arm                           sama7_defconfig    clang-22
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250915    clang-22
arm64                 randconfig-001-20250916    clang-22
arm64                 randconfig-002-20250915    clang-22
arm64                 randconfig-002-20250916    clang-22
arm64                 randconfig-003-20250915    gcc-8.5.0
arm64                 randconfig-003-20250916    clang-22
arm64                 randconfig-004-20250915    gcc-11.5.0
arm64                 randconfig-004-20250916    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250915    gcc-15.1.0
csky                  randconfig-001-20250916    clang-22
csky                  randconfig-002-20250915    gcc-15.1.0
csky                  randconfig-002-20250916    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250915    clang-22
hexagon               randconfig-001-20250916    clang-22
hexagon               randconfig-002-20250915    clang-22
hexagon               randconfig-002-20250916    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250915    clang-20
i386        buildonly-randconfig-001-20250916    clang-20
i386        buildonly-randconfig-002-20250915    gcc-14
i386        buildonly-randconfig-002-20250916    clang-20
i386        buildonly-randconfig-003-20250915    gcc-14
i386        buildonly-randconfig-003-20250916    clang-20
i386        buildonly-randconfig-004-20250915    gcc-14
i386        buildonly-randconfig-004-20250916    clang-20
i386        buildonly-randconfig-005-20250915    gcc-14
i386        buildonly-randconfig-005-20250916    clang-20
i386        buildonly-randconfig-006-20250915    gcc-14
i386        buildonly-randconfig-006-20250916    clang-20
i386                                defconfig    clang-20
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
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250915    clang-22
loongarch             randconfig-001-20250916    clang-22
loongarch             randconfig-002-20250915    gcc-12.5.0
loongarch             randconfig-002-20250916    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250915    gcc-11.5.0
nios2                 randconfig-001-20250916    clang-22
nios2                 randconfig-002-20250915    gcc-11.5.0
nios2                 randconfig-002-20250916    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250915    gcc-9.5.0
parisc                randconfig-001-20250916    clang-22
parisc                randconfig-002-20250915    gcc-14.3.0
parisc                randconfig-002-20250916    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250915    gcc-14.3.0
powerpc               randconfig-001-20250916    clang-22
powerpc               randconfig-002-20250915    gcc-8.5.0
powerpc               randconfig-002-20250916    clang-22
powerpc               randconfig-003-20250915    clang-22
powerpc               randconfig-003-20250916    clang-22
powerpc64             randconfig-001-20250915    clang-20
powerpc64             randconfig-001-20250916    clang-22
powerpc64             randconfig-002-20250915    clang-22
powerpc64             randconfig-002-20250916    clang-22
powerpc64             randconfig-003-20250915    clang-22
powerpc64             randconfig-003-20250916    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250915    gcc-8.5.0
riscv                 randconfig-001-20250916    gcc-15.1.0
riscv                 randconfig-002-20250915    clang-22
riscv                 randconfig-002-20250916    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250915    clang-22
s390                  randconfig-001-20250916    gcc-15.1.0
s390                  randconfig-002-20250915    clang-22
s390                  randconfig-002-20250916    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250915    gcc-15.1.0
sh                    randconfig-001-20250916    gcc-15.1.0
sh                    randconfig-002-20250915    gcc-13.4.0
sh                    randconfig-002-20250916    gcc-15.1.0
sh                           se7619_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250915    gcc-8.5.0
sparc                 randconfig-001-20250916    gcc-15.1.0
sparc                 randconfig-002-20250915    gcc-8.5.0
sparc                 randconfig-002-20250916    gcc-15.1.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250915    gcc-13.4.0
sparc64               randconfig-001-20250916    gcc-15.1.0
sparc64               randconfig-002-20250915    gcc-12.5.0
sparc64               randconfig-002-20250916    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250915    gcc-14
um                    randconfig-001-20250916    gcc-15.1.0
um                    randconfig-002-20250915    gcc-14
um                    randconfig-002-20250916    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250915    clang-20
x86_64      buildonly-randconfig-001-20250916    clang-20
x86_64      buildonly-randconfig-002-20250915    gcc-12
x86_64      buildonly-randconfig-002-20250916    clang-20
x86_64      buildonly-randconfig-003-20250915    gcc-14
x86_64      buildonly-randconfig-003-20250916    clang-20
x86_64      buildonly-randconfig-004-20250915    clang-20
x86_64      buildonly-randconfig-004-20250916    clang-20
x86_64      buildonly-randconfig-005-20250915    clang-20
x86_64      buildonly-randconfig-005-20250916    clang-20
x86_64      buildonly-randconfig-006-20250915    gcc-14
x86_64      buildonly-randconfig-006-20250916    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
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
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250915    gcc-9.5.0
xtensa                randconfig-001-20250916    gcc-15.1.0
xtensa                randconfig-002-20250915    gcc-11.5.0
xtensa                randconfig-002-20250916    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

