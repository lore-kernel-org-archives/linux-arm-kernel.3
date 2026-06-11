Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21221CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7mP7yy/I0/qRdllU9rlkTPFKHcqIXXRC0BUVhZhFn1o=; b=0hNtpoK35aFoqyKXjb95uayaJz
	jtGFkD4EMS3WiRxOViEGrwTiUjo+G15SoXM3zYT+Tg295jCUQP2U8MKVA04LkUH53bno8eq3NK44l
	sV1sYBGQiCPaIz0Wv5QH/U+Gcb3g01hostwKSW3NUjz0/oJSFSwY1/1n8dY9So91oOXpUs2/FJG4C
	UWv4JHMnEU3bn4v8ZFo5+2uolGkqGVgU31LZ52kztcm/0H3SrY0dyeHTPfisx0mgq9PsuZJ/uJbWG
	WWE7OGQwfhz44wIqFC2iguXutYEoqsQ+vn5k0leJo5xgIhcOAbYeQJxhVzwo5wXPLquo4uuzz+z+p
	Lpcxhplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhEE-00000009fkp-1PgV;
	Thu, 11 Jun 2026 15:21:58 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhEA-00000009fk0-1Qom
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 15:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781191315; x=1812727315;
  h=date:from:to:cc:subject:message-id;
  bh=0a2FVf/i8BGuUdzcxrbqlLSYqTd4QGN7b5Nr3T6PFag=;
  b=NCXZoJYp2Y+rilg+0PBHjE76T+dfprf3TnsS2bi0QZu5WR/B6/WVzS4U
   shZhvoqoAbYowk3Rjzce5kGq4V5fVMZnNDvwF1s/oOs+6I9KQh5EufSdc
   ZimNoXgoFc4xgtPK697RLXnlzVa471ytXKAS9qkylGUx29ajSibgvXQT0
   d+d14hUv8JNnf+MLjMXV8OYuc+rY9fSvE1GR8gW0jPhPUwScO5TQMk/u+
   L+jjiGUfdb2zI9FOBCjoXDi3WKd8vSYECEQizHOuv6LHwTWhjO6C0RNQC
   AM2FxOzUdTs/C3nuHwHgoG2CFVJtuuGntKLTJ62youeBtj3+fyIBw+q+E
   w==;
X-CSE-ConnectionGUID: nYfqxjXdRB20YxA4SnQAbg==
X-CSE-MsgGUID: Xs2YKSNQTmed/BXF9sDThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85847276"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85847276"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:21:54 -0700
X-CSE-ConnectionGUID: YFuQqWYzSLqneC+HAyFARg==
X-CSE-MsgGUID: WXx4fYr/TT2FLYI4fR6tqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246387271"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2026 08:21:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXhE5-00000000NJw-1M29;
	Thu, 11 Jun 2026 15:21:49 +0000
Date: Thu, 11 Jun 2026 23:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 9f1945a3e364cc8b40c424666995b21c5f0e59eb
Message-ID: <202606112330.JeIJdkzb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_082154_400660_AF903BC1 
X-CRM114-Status: UNSURE (   5.30  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: 9f1945a3e364cc8b40c424666995b21c5f0e59eb  soc: document merges

elapsed time: 816m

configs tested: 236
configs skipped: 2

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
arc                            randconfig-001    gcc-14.3.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                            randconfig-002    gcc-14.3.0
arc                   randconfig-002-20260611    gcc-14.3.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                           omap1_defconfig    gcc-16.1.0
arm                          pxa910_defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-14.3.0
arm                   randconfig-001-20260611    gcc-14.3.0
arm                            randconfig-002    gcc-14.3.0
arm                   randconfig-002-20260611    gcc-14.3.0
arm                            randconfig-003    gcc-14.3.0
arm                   randconfig-003-20260611    gcc-14.3.0
arm                            randconfig-004    gcc-14.3.0
arm                   randconfig-004-20260611    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260611    gcc-14.3.0
arm64                 randconfig-002-20260611    gcc-14.3.0
arm64                 randconfig-003-20260611    gcc-14.3.0
arm64                 randconfig-004-20260611    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260611    gcc-14.3.0
csky                  randconfig-002-20260611    gcc-14.3.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260611    clang-16
hexagon               randconfig-001-20260611    clang-17
hexagon               randconfig-002-20260611    clang-16
hexagon               randconfig-002-20260611    clang-17
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260611    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260611    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260611    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260611    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260611    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260611    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260611    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260611    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260611    gcc-14
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260611    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260611    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260611    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260611    gcc-14
i386                  randconfig-011-20260611    gcc-14
i386                  randconfig-012-20260611    gcc-14
i386                  randconfig-013-20260611    gcc-14
i386                  randconfig-014-20260611    gcc-14
i386                  randconfig-015-20260611    gcc-14
i386                  randconfig-016-20260611    gcc-14
i386                  randconfig-017-20260611    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260611    clang-16
loongarch             randconfig-001-20260611    clang-17
loongarch             randconfig-002-20260611    clang-16
loongarch             randconfig-002-20260611    clang-17
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
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260611    clang-16
nios2                 randconfig-001-20260611    clang-17
nios2                 randconfig-002-20260611    clang-16
nios2                 randconfig-002-20260611    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260611    gcc-13.4.0
parisc                randconfig-002-20260611    gcc-13.4.0
parisc64                            defconfig    clang-23
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260611    gcc-13.4.0
powerpc               randconfig-002-20260611    gcc-13.4.0
powerpc                     tqm8540_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260611    gcc-13.4.0
powerpc64             randconfig-002-20260611    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-12.5.0
riscv                 randconfig-001-20260611    gcc-12.5.0
riscv                          randconfig-002    gcc-12.5.0
riscv                 randconfig-002-20260611    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-12.5.0
s390                  randconfig-001-20260611    gcc-12.5.0
s390                           randconfig-002    gcc-12.5.0
s390                  randconfig-002-20260611    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-12.5.0
sh                    randconfig-001-20260611    gcc-12.5.0
sh                             randconfig-002    gcc-12.5.0
sh                    randconfig-002-20260611    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260611    gcc-15.2.0
sparc                 randconfig-002-20260611    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260611    gcc-15.2.0
sparc64               randconfig-002-20260611    gcc-15.2.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260611    gcc-15.2.0
um                    randconfig-002-20260611    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260611    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260611    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260611    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260611    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260611    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260611    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260611    clang-22
x86_64                randconfig-001-20260611    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260611    clang-22
x86_64                randconfig-002-20260611    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260611    clang-22
x86_64                randconfig-003-20260611    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260611    clang-22
x86_64                randconfig-004-20260611    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260611    clang-22
x86_64                randconfig-005-20260611    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260611    clang-22
x86_64                randconfig-006-20260611    gcc-14
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260611    clang-22
x86_64                randconfig-011-20260611    gcc-14
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260611    clang-22
x86_64                randconfig-012-20260611    gcc-14
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260611    clang-22
x86_64                randconfig-013-20260611    gcc-14
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260611    clang-22
x86_64                randconfig-014-20260611    gcc-14
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260611    clang-22
x86_64                randconfig-015-20260611    gcc-14
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260611    clang-22
x86_64                randconfig-016-20260611    gcc-14
x86_64                randconfig-071-20260611    clang-22
x86_64                randconfig-072-20260611    clang-22
x86_64                randconfig-073-20260611    clang-22
x86_64                randconfig-074-20260611    clang-22
x86_64                randconfig-075-20260611    clang-22
x86_64                randconfig-076-20260611    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260611    gcc-15.2.0
xtensa                randconfig-002-20260611    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

