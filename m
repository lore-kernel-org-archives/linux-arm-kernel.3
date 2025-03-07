Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73613C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3IKLMIA7CBcH7MnwDH36sV9Q5qEghEi/O1Z5TpEyrk=; b=MZ8OoH/h3LvJgpGtf6EI9lbWG2
	O821ZHqpvKEyNKU67+IUUzsw3IvyniLWWFU5mgQCCo0CIYE4B63xxM+MJdUpYGFiSCxuesnn/KB03
	Rt5gZQuAGzMHkEGj2vqASKQ0NkwrS9dfM8EYvz0eHWjXoPoBLLCAqD1IxAwzuNZSIdh8O0QoT4WG7
	rRr8/oRTpsS9hEDV2ot7tn4J5jyEK+s2e8sXCvoqWDDW4DCIm2uigA+UjwsS/532XQxiP1YWerMil
	dxzm0eEOAYklP36xAqhPyOFPgNYAakSkurGaacZS+NJ0Sm9zhzpJhDH8ytsCF3nmtI6RT5NMphrKT
	ajEeVbLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqc5S-0000000FADc-07DM;
	Fri, 07 Mar 2025 18:06:18 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbdd-0000000F4Ie-44y9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741369055; x=1772905055;
  h=date:from:to:cc:subject:message-id;
  bh=HoisvTAve/i2XZXjO3B7EzMgqF+FZl/MgaE3yJn6jqs=;
  b=AVJDOm/ypESWW/ToUHwN09koys4F6U0Hyszka24cKITCjgWbNMLjbCXS
   vVeMqIZmtKqM6y/+qFTDG8TgfJ2ZDCWiOjRgzVsxPiQ/Q5HknAAFpw+ho
   xUbpKupwtEUzR0ue2Hinbqo0Fu2Pt/EYwbl/uSuQI1MTiAUgPPwEy5SaI
   afqMyONdY3bjQjiboAPr1WaOuALj2wJhQAPZkfd0i+GTFtdnYWLcyxZO9
   KIyaugaDjb8WlqEnMo6J+gyBg6SCEPy4izTeSuiU4N1Yfp0Mai+Z2eQ1E
   qxoQCZTKgR+rBLCEdh1DOPtuYVhpq78nvPEFgYmMEePtjb+01nuMBZOXm
   A==;
X-CSE-ConnectionGUID: 0JU1S8JSRc2uMfRL8uMk8A==
X-CSE-MsgGUID: Lncobb6MTquVrYYL5cwnpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42281841"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42281841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:37:33 -0800
X-CSE-ConnectionGUID: CfX1LHUAQZazjz9SGJxeCA==
X-CSE-MsgGUID: tCIG44TLRiyoJc/IqQ//5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120294078"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2025 09:37:31 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbdY-0000rz-1y;
	Fri, 07 Mar 2025 17:37:28 +0000
Date: Sat, 08 Mar 2025 01:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 a84db892511ab79e7a817a171fb4765daccffb88
Message-ID: <202503080132.BdRVQJNr-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093734_053087_90F38E91 
X-CRM114-Status: UNSURE (   5.51  )
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
branch HEAD: a84db892511ab79e7a817a171fb4765daccffb88  soc: document merges

elapsed time: 1457m

configs tested: 74
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250307    gcc-13.2.0
arc                   randconfig-002-20250307    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                         assabet_defconfig    clang-21
arm                   randconfig-001-20250307    clang-21
arm                   randconfig-002-20250307    gcc-14.2.0
arm                   randconfig-003-20250307    clang-19
arm                   randconfig-004-20250307    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250307    gcc-14.2.0
arm64                 randconfig-002-20250307    clang-15
arm64                 randconfig-003-20250307    gcc-14.2.0
arm64                 randconfig-004-20250307    clang-15
csky                  randconfig-001-20250307    gcc-14.2.0
csky                  randconfig-002-20250307    gcc-14.2.0
hexagon               randconfig-001-20250307    clang-21
hexagon               randconfig-002-20250307    clang-21
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250307    clang-19
i386        buildonly-randconfig-002-20250307    clang-19
i386        buildonly-randconfig-003-20250307    gcc-11
i386        buildonly-randconfig-004-20250307    clang-19
i386        buildonly-randconfig-005-20250307    gcc-12
i386        buildonly-randconfig-006-20250307    clang-19
loongarch             randconfig-001-20250307    gcc-14.2.0
loongarch             randconfig-002-20250307    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250307    gcc-14.2.0
nios2                 randconfig-002-20250307    gcc-14.2.0
parisc                randconfig-001-20250307    gcc-14.2.0
parisc                randconfig-002-20250307    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    clang-18
powerpc               randconfig-001-20250307    gcc-14.2.0
powerpc               randconfig-002-20250307    clang-21
powerpc               randconfig-003-20250307    clang-19
powerpc64             randconfig-001-20250307    clang-21
powerpc64             randconfig-002-20250307    gcc-14.2.0
powerpc64             randconfig-003-20250307    gcc-14.2.0
riscv                 randconfig-001-20250307    gcc-14.2.0
riscv                 randconfig-002-20250307    clang-19
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250307    gcc-14.2.0
s390                  randconfig-002-20250307    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250307    gcc-14.2.0
sh                    randconfig-002-20250307    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250307    gcc-14.2.0
sparc                 randconfig-002-20250307    gcc-14.2.0
sparc64               randconfig-001-20250307    gcc-14.2.0
sparc64               randconfig-002-20250307    gcc-14.2.0
um                    randconfig-001-20250307    clang-17
um                    randconfig-002-20250307    clang-21
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250307    clang-19
x86_64      buildonly-randconfig-002-20250307    gcc-12
x86_64      buildonly-randconfig-003-20250307    clang-19
x86_64      buildonly-randconfig-004-20250307    clang-19
x86_64      buildonly-randconfig-005-20250307    clang-19
x86_64      buildonly-randconfig-006-20250307    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250307    gcc-14.2.0
xtensa                randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

