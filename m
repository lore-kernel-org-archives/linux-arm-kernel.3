Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2085CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bsyVpcpaueaVFJKQExVusIOwadRHa/sOI8JoILoWNbM=; b=ixw4GcY2amDFx0S4r9jrfoqqIq
	29hrpQzXM41EQEXF4uxs1ytANDr0SUq9Aas/D4TJZaAt5dgBEPfDsWEcxKZFL0HPuf9022MTSjbIN
	azBAKyd7eJkTYip9kfdzSCL0+CG7xDu+WiwjDZhSjmX9fd3oaoGropgx/29jI1Qw/L8GAcP6463Ve
	QkV0+ifFGj3RnaQcyrs+t55PfVN9f6BgEf56objQSjrlVtGgIl7akRtZLDTAqCCErXApyZPEYkz14
	rlb32LFVpanJTdEBEMInai4luuUPskbQqtHX5R0KtZEydGaW5+COsGME3On6HDZ26EwbGaYNB2BG2
	3u0tWZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Xg-0000000Fnii-25ua;
	Wed, 14 Oct 2026 15:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Xe-0000000FniA-2d6T
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 15:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bsyVpcpaueaVFJKQExVusIOwadRHa/sOI8JoILoWNbM=; b=VIKFwX2TyclVMrOApc6tglpxpg
	Ypn3uI8q36yH460h6ya9oDZbMEbbk5WeCVObyoZeToaDSr7hfpxMYfFkgCYAKlB0keJSgEJGsEuTR
	6s7Nwc/eE5OXMDdxCGbhY4QPFR+SADOsqDuUSZQxcehApcRYcnPXmz6qvKdsJffeinhy7nOoWVW/V
	V9ycmEBtlypF1ZPEGWV2ODaz1ohqE7tUoqWNLl7zQ9lf9URPaYdLeuRd5RkcI8kdKdUxgwnZnZXQX
	JRx4CIl4sVoy5BM4uu5Ag/dJHCHbW5ucharfnZcUJrPSWY6ZCwhJAz/2MwoC2QAkcQ2fHe9+IhbBi
	nck+CLhg==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH0Xa-0000000GupO-3erG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 15:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791990315; x=1823526315;
  h=date:from:to:cc:subject:message-id;
  bh=bMZPFRj/US0EgsWYXCvlJ0PPmy54qBR2cSmlKN3PYBM=;
  b=jIIEBtvXC0rtG5b/R80liPOBIQL9HWjBDU+GyfyQsbz/bpwqFn+W5INz
   Ru4V3ADfPd8tZGL4Ksded79rif1aL5mx4bXSvPud05EPsXKxpmRiXgEcY
   hCOdY7r5ZTawS5tcZdAzg5EDeCZdlmtSq9o6t+nR8MQp1lkiUJzWTaBms
   s5FDWuVPt3x5HDFeHegJoe/+Gq+A+9KN6cXGwrU0nUU13yZipx7MUnlYb
   i7iKstFNVoPahr1VBNV6OlaXCJNlfEdaMRleBU6dE/gIjGhVv0GxTVhWJ
   y0OZ5hpSZeflU6Rqtiz9g6gJEgH3nAS9264XA6N6ms1Umuk9NkMPBkFCP
   A==;
X-CSE-ConnectionGUID: d7zSkNeRRPebsRaWiwRU2Q==
X-CSE-MsgGUID: MhY3bD4mTT2Y12q4IgTm5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="644055"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="644055"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 08:05:12 -0700
X-CSE-ConnectionGUID: sD6SIgPJS1Gwl/3Fn7qklQ==
X-CSE-MsgGUID: oRoP6JcrRbWvkCyfgVg3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3291817"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 14 Oct 2026 08:05:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH0XT-00000000Elr-3pa6;
	Wed, 14 Oct 2026 15:05:07 +0000
Date: Wed, 14 Oct 2026 23:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc:defconfig] BUILD SUCCESS
 6db3ea21a541d34e45f3727b71575424495df44c
Message-ID: <202610142307.ohXMfWsf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_160515_572475_EE408811 
X-CRM114-Status: UNSURE (   6.26  )
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
branch HEAD: 6db3ea21a541d34e45f3727b71575424495df44c  Merge tag 'qcom-arm64-defconfig-for-7.4-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

elapsed time: 1322m

configs tested: 235
configs skipped: 207

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261014    gcc-8.5.0  cocci
alpha                randconfig-r2308-20261014    gcc-14.3.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261014    clang-17
arc                   randconfig-1001-20261014    clang-17
arc                   randconfig-2000-20261014    gcc-10.5.0
arc                   randconfig-2001-20261014    gcc-10.5.0
arc                  randconfig-r2102-20261014    gcc-8.5.0  cocci
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261014    clang-17
arm                   randconfig-1001-20261014    clang-17
arm                   randconfig-1002-20261014    clang-17
arm                   randconfig-1003-20261014    clang-17
arm                   randconfig-2000-20261014    gcc-10.5.0
arm                   randconfig-2001-20261014    gcc-10.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261014    gcc-16.1.0
arm64                 randconfig-1001-20261014    gcc-16.1.0
arm64                 randconfig-1002-20261014    gcc-16.1.0
arm64                 randconfig-1003-20261014    gcc-16.1.0
arm64                 randconfig-2000-20261014    gcc-16.1.0
arm64                 randconfig-2001-20261014    gcc-16.1.0
arm64                randconfig-r2101-20261014    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261014    gcc-10.5.0 cocci
arm64                randconfig-r2105-20261014    gcc-8.5.0  cocci
arm64                randconfig-r2305-20261014    clang-24   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261014    gcc-16.1.0
csky                  randconfig-1001-20261014    gcc-16.1.0
csky                  randconfig-2000-20261014    gcc-16.1.0
csky                  randconfig-2001-20261014    gcc-16.1.0
csky                 randconfig-r2106-20261014    gcc-10.5.0 cocci
csky                 randconfig-r2201-20261014    gcc-14.3.0 smatch
csky                 randconfig-r2309-20261014    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261014    clang-18
hexagon               randconfig-1001-20261014    clang-18
hexagon               randconfig-2000-20261014    gcc-16.1.0
hexagon               randconfig-2001-20261014    gcc-16.1.0
hexagon              randconfig-r2103-20261014    gcc-11.5.0 cocci
hexagon              randconfig-r2304-20261014    clang-24   sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261014    gcc-14
i386        buildonly-randconfig-1001-20261014    gcc-14
i386        buildonly-randconfig-1002-20261014    gcc-14
i386        buildonly-randconfig-1003-20261014    gcc-14
i386        buildonly-randconfig-1004-20261014    gcc-14
i386        buildonly-randconfig-1005-20261014    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261014    clang-22
i386                  randconfig-1001-20261014    clang-22
i386                  randconfig-1002-20261014    clang-22
i386                  randconfig-1003-20261014    clang-22
i386                  randconfig-1004-20261014    clang-22
i386                  randconfig-1005-20261014    clang-22
i386                  randconfig-1006-20261014    clang-22
i386                  randconfig-2000-20261014    gcc-10.5.0
i386                  randconfig-2001-20261014    gcc-10.5.0
i386                  randconfig-2100-20261014    gcc-13     cocci
i386                  randconfig-2101-20261014    gcc-13     cocci
i386                  randconfig-2102-20261014    gcc-13     cocci
i386                  randconfig-2103-20261014    gcc-13     cocci
i386                  randconfig-2104-20261014    gcc-13     cocci
i386                  randconfig-2105-20261014    gcc-13     cocci
i386                  randconfig-2200-20261014    clang-22   smatch
i386                  randconfig-2300-20261014    clang-22   sparse
i386                  randconfig-2301-20261014    clang-22   sparse
i386                  randconfig-2302-20261014    clang-22   sparse
i386                 randconfig-r2110-20261014    gcc-10.5.0 cocci
i386                 randconfig-r2111-20261014    gcc-8.5.0  cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261014    clang-18
loongarch             randconfig-1001-20261014    clang-18
loongarch             randconfig-2000-20261014    gcc-8.5.0
loongarch             randconfig-2001-20261014    gcc-8.5.0
loongarch            randconfig-r2104-20261014    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261014    gcc-10.5.0 cocci
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2107-20261014    gcc-10.5.0 cocci
m68k                 randconfig-r2200-20261014    gcc-9.5.0  smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261014    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261014    gcc-10.5.0 cocci
microblaze           randconfig-r2310-20261014    gcc-14.3.0 sparse
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2103-20261014    gcc-8.5.0  cocci
mips                 randconfig-r2201-20261014    clang-24   smatch
mips                 randconfig-r2307-20261014    gcc-14.3.0 sparse
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261014    clang-18
nios2                 randconfig-1001-20261014    clang-18
nios2                 randconfig-2000-20261014    gcc-8.5.0
nios2                 randconfig-2001-20261014    gcc-8.5.0
nios2                randconfig-r2102-20261014    gcc-11.5.0 cocci
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2108-20261014    gcc-11.5.0 cocci
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261014    clang-22
parisc                randconfig-1001-20261014    clang-22
parisc                randconfig-2000-20261014    gcc-8.5.0
parisc                randconfig-2001-20261014    gcc-8.5.0
parisc               randconfig-r2108-20261014    gcc-8.5.0  cocci
parisc               randconfig-r2202-20261014    gcc-12.5.0 smatch
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261014    clang-22
powerpc               randconfig-1001-20261014    clang-22
powerpc               randconfig-2000-20261014    clang-22
powerpc               randconfig-2001-20261014    clang-22
powerpc              randconfig-r2107-20261014    gcc-8.5.0  cocci
powerpc              randconfig-r2300-20261014    clang-24   sparse
powerpc64             randconfig-1000-20261014    clang-22
powerpc64             randconfig-1001-20261014    clang-22
powerpc64             randconfig-2000-20261014    clang-22
powerpc64             randconfig-2001-20261014    clang-22
powerpc64            randconfig-r2301-20261014    clang-24   sparse
powerpc64            randconfig-r2306-20261014    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-2000-20261014    gcc-16.1.0
riscv                 randconfig-2001-20261014    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-2000-20261014    gcc-16.1.0
s390                  randconfig-2001-20261014    gcc-16.1.0
s390                 randconfig-r2106-20261014    gcc-8.5.0  cocci
s390                 randconfig-r2200-20261014    gcc-8.5.0  smatch
s390                 randconfig-r2311-20261014    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-2000-20261014    gcc-16.1.0
sh                    randconfig-2001-20261014    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261014    clang-24
sparc                 randconfig-1001-20261014    clang-24
sparc                 randconfig-2000-20261014    gcc-14.3.0
sparc                 randconfig-2001-20261014    gcc-14.3.0
sparc                randconfig-r2110-20261014    gcc-8.5.0  cocci
sparc                randconfig-r2303-20261014    clang-24   sparse
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261014    clang-24
sparc64               randconfig-1001-20261014    clang-24
sparc64               randconfig-2000-20261014    gcc-14.3.0
sparc64               randconfig-2001-20261014    gcc-14.3.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261014    clang-24
um                    randconfig-1001-20261014    clang-24
um                    randconfig-2000-20261014    gcc-14.3.0
um                    randconfig-2001-20261014    gcc-14.3.0
um                   randconfig-r2109-20261014    gcc-8.5.0  cocci
um                   randconfig-r2302-20261014    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261014    clang-22
x86_64      buildonly-randconfig-1001-20261014    clang-22
x86_64      buildonly-randconfig-1002-20261014    clang-22
x86_64      buildonly-randconfig-1003-20261014    clang-22
x86_64      buildonly-randconfig-1004-20261014    clang-22
x86_64      buildonly-randconfig-1005-20261014    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1006-20261014    gcc-14
x86_64                randconfig-1007-20261014    gcc-14
x86_64                randconfig-1008-20261014    gcc-14
x86_64                randconfig-1009-20261014    gcc-14
x86_64                randconfig-1010-20261014    gcc-14
x86_64                randconfig-1011-20261014    gcc-14
x86_64                randconfig-1012-20261014    gcc-14
x86_64                randconfig-1013-20261014    gcc-14
x86_64                randconfig-1014-20261014    gcc-14
x86_64                randconfig-1015-20261014    gcc-14
x86_64                randconfig-1016-20261014    gcc-14
x86_64                randconfig-1017-20261014    gcc-14
x86_64                randconfig-2000-20261014    clang-22
x86_64                randconfig-2001-20261014    clang-22
x86_64                randconfig-2100-20261014    clang-22   cocci
x86_64                randconfig-2101-20261014    clang-22   cocci
x86_64                randconfig-2102-20261014    clang-22   cocci
x86_64                randconfig-2103-20261014    clang-22   cocci
x86_64                randconfig-2104-20261014    clang-22   cocci
x86_64                randconfig-2105-20261014    clang-22   cocci
x86_64                randconfig-2200-20261014    clang-22   smatch
x86_64                randconfig-2300-20261014    clang-22   sparse
x86_64                randconfig-2301-20261014    clang-22   sparse
x86_64                randconfig-2302-20261014    clang-22   sparse
x86_64               randconfig-r2109-20261014    gcc-11.5.0 cocci
x86_64               randconfig-r2202-20261014    clang-22   smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
xtensa                             allnoconfig    clang-24
xtensa                randconfig-1000-20261014    clang-24
xtensa                randconfig-1001-20261014    clang-24
xtensa                randconfig-2000-20261014    gcc-14.3.0
xtensa                randconfig-2001-20261014    gcc-14.3.0
xtensa               randconfig-r2100-20261014    gcc-11.5.0 cocci

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

