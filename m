Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFD6C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5MKkNNJwSAySVoJgv7kubhsLnrs7JqP3vpnaM27sJrE=; b=c5Nq2Anw8z64d6dNe1CDREJA38
	k4xv9pwNbO4aICMKGqblmIVjX+QAQ8jRVziWTrNsqDleLL2ygcTyoXjvD3Fyu+tZRRabErE7NX/Fm
	GTVNm62hLCNV8RJV91Hr6hY96+8k0rIhDIiYbVpVahSvRkpBHiDNDAZY2dK+owlY+QDUs8zuQeDv/
	MGsyy7Bc6MPVZtnNsy7aEaksMRmbjEDelEFdDvFJMGVs4RAkYxGlBgXxKKCO6eM0EVf4RlUbjtu6u
	fYYUucInqoles1JDj2vq/yzB7B0omvAithqX61lErkB0sLUwtWnUuHG9pk5RQyvqbf/vtjg5fLCHQ
	aiHQGEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cuA-000000021Wt-15Q8;
	Mon, 21 Sep 2026 12:13:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ctz-000000021TG-2qc8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=5MKkNNJwSAySVoJgv7kubhsLnrs7JqP3vpnaM27sJrE=; b=aRlUU3X6gORA92svTYSiDxdrQZ
	EOXnMEYyrAqiBki4FiY4E63rGWIEsnjkQEL4IWD4GayrjziAsTCwmY7oQ3o6wYw037dyDF5jeCq9t
	np9rfKozQVfe7bFm2kazT5+j4nLaXuoSYsQGE0Oq2HOpJLyiIEpC9qmuka5210RXEUEGlbQpdrYmK
	vFxMJXmNOnL3M8/9eWooxKMA3Djr7g+w4mu27rsUaiU/9S/uWyKEYY7kzWdQXzRPbFyX8QTWsbCm/
	6PPochEJJcA6k0hhmtJBH0oIUjEX+uSE2ho/Z5XpzMcVbiTUqhTlCvHoQoh+aPVz1wOaLq1wlO2rQ
	Mh2ujpZQ==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ctv-0000000CGFV-3Fwy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789992819; x=1821528819;
  h=date:from:to:cc:subject:message-id;
  bh=qg8X/hN0fJqM03gEiebgbhM0KDNvyXH+0wh3IBUSDkM=;
  b=mUmNmaQxGWrr1IX2GohQdCmpe78kFM4xwyyS1wAyAwLe6C7pwFEzoldz
   QHaM8OCTaSxkzO247tJ3n1FDShoMlbR0btBC0BWDSoJkZZsKIRmyD/ut2
   tr2n0JpNkK6SYWbprYk+y0+hR+V5dNncxfdVPnmBiF+MYnttOtHo1P6Dl
   enjDFtpnZED+SjNOWGSRKYSoTl8ZjEcs7bK9RswRO+0sm5AkbPm7wrJJZ
   73vRAVLXq/TmjWq5NXVizcauNnjZCx1bIsib2+tGTr29+nUChuTmI3HiF
   jkMB3ZYUYslZnQwsKmboL632oap74dzXcTIfh2H2aPO3R2eReX6tfcEE3
   A==;
X-CSE-ConnectionGUID: m3d+SmejRn2XKxjb7mQ88A==
X-CSE-MsgGUID: ra3OlnPWR3mSp94TBqt9pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="94325637"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="94325637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:13:35 -0700
X-CSE-ConnectionGUID: FRKCN0TmTRq8LjOq37uASQ==
X-CSE-MsgGUID: +6ZU4/ITRT6M9Zh74OOgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="272096414"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2026 05:13:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8ctn-00000000DjR-1Pm9;
	Mon, 21 Sep 2026 12:13:31 +0000
Date: Mon, 21 Sep 2026 20:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-audio-graph-card2] BUILD REGRESSION
 ba26e4e9cae9a3e1c396d1f4a34970d7caa166b0
Message-ID: <202609212048.ts97yata-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_131340_451897_8DD1BB80 
X-CRM114-Status: UNSURE (   4.53  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-audio-graph-card2
branch HEAD: ba26e4e9cae9a3e1c396d1f4a34970d7caa166b0  ARM: config: u8500: Enable audio graph card2

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609211120.1ric2KZz-lkp@intel.com

    ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x734): unknown relocation (41) against symbol etrap_irq
    ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x744): unknown relocation (8) against symbol rtrap_xcall
    ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x9e8): unknown relocation (41) against symbol etrap
    ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x9fc): unknown relocation (41) against symbol rtrap

Error/Warning ids grouped by kconfigs:

recent_errors
`-- sparc64-randconfig-1001-20260921
    |-- ld.lld:error:vmlinux.a(arch-sparc-mm-ultra.o):(.text):unknown-relocation-()-against-symbol-etrap
    |-- ld.lld:error:vmlinux.a(arch-sparc-mm-ultra.o):(.text):unknown-relocation-()-against-symbol-etrap_irq
    |-- ld.lld:error:vmlinux.a(arch-sparc-mm-ultra.o):(.text):unknown-relocation-()-against-symbol-rtrap
    `-- ld.lld:error:vmlinux.a(arch-sparc-mm-ultra.o):(.text):unknown-relocation-()-against-symbol-rtrap_xcall

elapsed time: 2708m

configs tested: 208
configs skipped: 9

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20260918    gcc-9.5.0
alpha                randconfig-r2101-20260918    gcc-15.2.0
alpha                randconfig-r2102-20260918    gcc-13.4.0
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260921    gcc-9.5.0
arc                   randconfig-1001-20260921    gcc-15.2.0
arc                  randconfig-r1306-20260921    gcc-8.5.0  sparse
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                                  defconfig    clang-24
arm                            h3600_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260921    clang-24
arm                   randconfig-1001-20260921    gcc-13.4.0
arm                   randconfig-1002-20260921    gcc-15.2.0
arm                   randconfig-1003-20260921    clang-24
arm                  randconfig-r1300-20260921    clang-24   sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260921    clang-24
arm64                 randconfig-1001-20260921    clang-24
arm64                 randconfig-1002-20260921    clang-24
arm64                 randconfig-1003-20260921    gcc-16.1.0
arm64                randconfig-r2201-20260918    gcc-8.5.0
arm64                randconfig-r2202-20260918    gcc-15.2.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260921    gcc-9.5.0
csky                  randconfig-1001-20260921    gcc-11.5.0
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20260921    clang-18
hexagon               randconfig-1001-20260921    clang-17
hexagon              randconfig-r1305-20260921    clang-17   sparse
i386                               allnoconfig    gcc-14
i386        buildonly-randconfig-1000-20260920    clang-22
i386        buildonly-randconfig-1001-20260920    clang-22
i386        buildonly-randconfig-1002-20260920    clang-22
i386        buildonly-randconfig-1003-20260920    gcc-14
i386        buildonly-randconfig-1004-20260920    clang-22
i386        buildonly-randconfig-1005-20260920    clang-22
i386                                 defconfig    clang-22
i386                  randconfig-1000-20260921    clang-22
i386                  randconfig-1001-20260921    clang-22
i386                  randconfig-1002-20260921    clang-22
i386                  randconfig-1003-20260921    gcc-14
i386                  randconfig-1004-20260921    gcc-13
i386                  randconfig-1005-20260921    clang-22
i386                  randconfig-1006-20260921    clang-22
i386                  randconfig-1007-20260921    gcc-14
i386                  randconfig-1008-20260921    clang-22
i386                  randconfig-1009-20260921    gcc-14
i386                  randconfig-1010-20260921    gcc-14
i386                  randconfig-1011-20260921    clang-22
i386                  randconfig-1012-20260921    clang-22
i386                  randconfig-1013-20260921    clang-22
i386                  randconfig-1302-20260921    gcc-14     sparse
i386                  randconfig-2100-20260918    clang-22
i386                  randconfig-2101-20260918    gcc-14
i386                  randconfig-2102-20260918    clang-22
i386                  randconfig-2103-20260918    clang-22
i386                  randconfig-2200-20260918    clang-22
i386                 randconfig-r2105-20260918    clang-22
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260921    clang-18
loongarch             randconfig-1001-20260921    gcc-16.1.0
loongarch            randconfig-r2103-20260918    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    clang-24
mips                       loongson1_defconfig    gcc-16.1.0
mips                       loongson3_defconfig    gcc-16.1.0
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260921    gcc-8.5.0
nios2                 randconfig-1001-20260921    gcc-11.5.0
nios2                randconfig-r1304-20260921    gcc-10.5.0 sparse
nios2                randconfig-r1307-20260921    gcc-11.5.0 sparse
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1309-20260921    gcc-10.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260921    gcc-8.5.0
parisc                randconfig-1001-20260921    gcc-13.4.0
parisc64                             defconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                  canyonlands_defconfig    clang-22
powerpc                        ebony_defconfig    clang-24
powerpc                      rainier_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260921    clang-17
powerpc               randconfig-1001-20260921    clang-24
powerpc              randconfig-r1308-20260921    clang-20   sparse
powerpc                      redwood_defconfig    clang-24
powerpc64             randconfig-1000-20260921    gcc-10.5.0
powerpc64             randconfig-1001-20260921    gcc-8.5.0
powerpc64            randconfig-r1302-20260921    clang-24   sparse
powerpc64            randconfig-r1303-20260921    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20260921    gcc-12.5.0
riscv                 randconfig-1001-20260921    gcc-8.5.0
riscv                 randconfig-2000-20260918    gcc-12.5.0
riscv                 randconfig-2001-20260918    clang-24
riscv                randconfig-r2107-20260918    gcc-12.5.0
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20260921    clang-24
s390                  randconfig-1001-20260921    clang-24
s390                  randconfig-2000-20260918    gcc-8.5.0
s390                  randconfig-2001-20260918    clang-17
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-16.1.0
sh                    randconfig-1000-20260921    gcc-9.5.0
sh                    randconfig-1001-20260921    gcc-16.1.0
sh                    randconfig-2000-20260918    gcc-13.4.0
sh                    randconfig-2001-20260918    gcc-11.5.0
sh                   randconfig-r1301-20260921    gcc-13.4.0 sparse
sh                   randconfig-r2106-20260918    gcc-16.1.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260921    gcc-8.5.0
sparc                 randconfig-1001-20260921    gcc-11.5.0
sparc                 randconfig-2000-20260918    gcc-8.5.0
sparc                 randconfig-2001-20260918    gcc-11.5.0
sparc                randconfig-r2104-20260918    gcc-8.5.0
sparc                randconfig-r2200-20260918    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64               randconfig-1000-20260921    clang-21
sparc64               randconfig-1001-20260921    clang-22
sparc64               randconfig-2000-20260918    gcc-8.5.0
sparc64               randconfig-2001-20260918    clang-20
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                                   defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260921    gcc-14
um                    randconfig-1001-20260921    gcc-14
um                    randconfig-2000-20260918    gcc-14
um                    randconfig-2001-20260918    gcc-14
um                            x86_64_defconfig    clang-24
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20260921    clang-22
x86_64      buildonly-randconfig-1001-20260921    gcc-13
x86_64      buildonly-randconfig-1002-20260921    clang-22
x86_64      buildonly-randconfig-1003-20260921    clang-22
x86_64      buildonly-randconfig-1004-20260921    clang-22
x86_64      buildonly-randconfig-1005-20260921    clang-22
x86_64                               defconfig    gcc-14
x86_64                randconfig-1000-20260921    gcc-13
x86_64                randconfig-1001-20260921    clang-22
x86_64                randconfig-1002-20260921    gcc-14
x86_64                randconfig-1003-20260921    gcc-14
x86_64                randconfig-1004-20260921    clang-22
x86_64                randconfig-1005-20260921    clang-22
x86_64                randconfig-1006-20260921    gcc-14
x86_64                randconfig-1007-20260921    clang-22
x86_64                randconfig-1008-20260921    clang-22
x86_64                randconfig-1009-20260921    clang-22
x86_64                randconfig-1010-20260921    gcc-14
x86_64                randconfig-1011-20260921    clang-22
x86_64                randconfig-1012-20260921    clang-22
x86_64                randconfig-1013-20260921    clang-22
x86_64                randconfig-1014-20260921    clang-22
x86_64                randconfig-1015-20260921    clang-22
x86_64                randconfig-1016-20260921    clang-22
x86_64                randconfig-1017-20260921    gcc-12
x86_64                randconfig-1300-20260921    gcc-14     sparse
x86_64                randconfig-2100-20260918    clang-22
x86_64                randconfig-2101-20260918    clang-22
x86_64                randconfig-2102-20260918    gcc-14
x86_64                randconfig-2103-20260918    clang-22
x86_64                randconfig-2200-20260918    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260921    gcc-11.5.0
xtensa                randconfig-1001-20260921    gcc-9.5.0
xtensa                randconfig-2000-20260918    gcc-8.5.0
xtensa                randconfig-2001-20260918    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

