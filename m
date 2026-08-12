Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E2C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+jArOd7V4z7B/4istyGL1yrAbFScgxtCwg3wE6sVI94=; b=hAqnkU9n/FrGQjGkkVtoLQkRKy
	sOr2LrgVkNq5YTP9OS3QJabFumjoQ/TXFzoLL7vTNXwZ0VG7XghYizIvzPBytIcDItEwztKHwR3ff
	N+3o5q08sGjqdE3c0Ay3RpQz8sykQLGfaa53fBSRsFFfB7xMXMzNNV0BvkSwwZbdKVWG8AR35jeKN
	XwxHG6nckcA20hg84O61Cn1t25hubshk6HOJvWixDGYStis9dhPrX+yxhrkm59Gw9ZzulJTP0ax5r
	2NfJzWgBIOWD5kaFbpfxGcbJ3DhpDBFPYO0C3x7hesfLfcinGzUf7Ffj57IBGPRU/kkPM+OnajdiH
	aR6dHmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7DR-0000000G6P4-1inm;
	Wed, 12 Aug 2026 11:33:49 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7DO-0000000G6NF-1UF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786534426; x=1818070426;
  h=date:from:to:cc:subject:message-id;
  bh=3yFCyaaz6WKnHY/u4AS6fqjlwo88njJUu3vcwHR/QuM=;
  b=IBHT5BL8f+seVnhFiErNxkdnA1Yj9+qK7yC0DBJGbQSbeC+ulx9KOBdn
   DL5ctNCvcM502/3Eg5IUeYRIP4uyqhijqwEyDYEWb9CwV3E999T0BYiOG
   D3pew+F9KGJayRXK4H1FlHzwEq9t47zG0+05Nl5JS/mULjYWqk9thW3et
   awQgl1mjmGt+b1hNaNfnt5B23sHeRoJs9ZbXAT2X6CPmQy7xgMmqOVVC2
   HGLmJKi9Bw/Wa2hEB6e8oxaBBUW7sKSG4lvxuIIXTcujGCi8efLk/l4go
   htCtjbzOA+GXTB1uLPHMS/V0cIMiK/JP1mjJwFD0HcYG9zkxxYsIlx9J3
   A==;
X-CSE-ConnectionGUID: AdnFNt5DSKukucPbt85FJA==
X-CSE-MsgGUID: 6bFXVJJqSwKjiGsfWdh1Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86203530"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86203530"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:33:46 -0700
X-CSE-ConnectionGUID: 5YNaLwQAT0+wIGwyw8YhKQ==
X-CSE-MsgGUID: 57Vi9qAhQBW9q2hDdl5PZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="261868027"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Aug 2026 04:33:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu7DK-00000000QXq-0GpR;
	Wed, 12 Aug 2026 11:33:42 +0000
Date: Wed, 12 Aug 2026 19:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:sophgo/dt-arm] BUILD SUCCESS
 d5e1ea5b05fe62c296701251c628ced6c68a6a80
Message-ID: <202608121935.ls5iHv1m-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_043346_411216_B1C51F3E 
X-CRM114-Status: UNSURE (   5.76  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt-arm
branch HEAD: d5e1ea5b05fe62c296701251c628ced6c68a6a80  arm64: dts: sophgo: add initial Milk-V Duo S board support

elapsed time: 1520m

configs tested: 113
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-004-20260812    gcc-12.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260811    gcc-8.5.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260811    gcc-9.5.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260811    clang-17
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260811    gcc-13.4.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-002-20260812    clang-17
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-002-20260812    clang-17
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-17
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260812    clang-24
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-002-20260812    clang-24
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260812    gcc-13.4.0
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

