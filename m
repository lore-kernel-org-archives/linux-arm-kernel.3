Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0807CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 23:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/F0c3gziMLCWpgc5UFC6sXPni/60CTjzPwZOJJZUoU=; b=lPd8vy1b7KRdskzoiiHGC9mNfP
	h+SViGaPJg/xKvGqAH+o+JfcNqeKl4FHg18D9V6FuJZ6A4gQXxiflyKQPrjWtehio7bm9VDgUnMcd
	9nytqR0uRxb8Jz1+ItOG8Q1VpGpWs+JB87YJPjPPh4bgRH+4Inkorgb4MOyxniqP2zrCyV2jUvkU+
	rBmsLOrhPljjLQ9N3ugnmuNAv7a+izShn51FU7gbnnXYk8erF+8aBcyR+yI6QoeYZpEuA1qUUs+r0
	8APJZwZlLbEvBMYmlsFWj0MrvgYDIU8XtkwkWi6l+6mTly50zut1mfVGR4eL8gi/pPJORbbfVbrsR
	HrFKYtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNJyW-0000000AoPc-325m;
	Sun, 23 Nov 2025 23:58:36 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNJyT-0000000AoPC-3SnP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 23:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763942314; x=1795478314;
  h=date:from:to:cc:subject:message-id;
  bh=jsEVAjHmKSy9W7ozoVdUeCHGN07TEqPjB+VopgtXhao=;
  b=IeplTHH6P5MaQ4/YC60N0EINsOZH9yk6U5MTFhJmOpUC8mI8SYqAV7J+
   Y6W915QYCCn+Hv88OAMrJ9qjcLWZaHv12NAMyuBvXfGMa2uCyZmJ6ksIK
   TYGTsLAb1RGgLuJCBVzq2fCzmgT3QqpKzpPAfOSYBIm6iV4M3x3Oylf6E
   Ibg0V+ykxKXWgtJv4RPtSN+gCpmfVNSH/PkoqmHps6ZhTfdJn98PGSczw
   b9FI3ssr5ohMMXYBOTLeiFp7MwVXMBo8m/WuUg2N7qnHsx5DXq4wbjL8v
   y40ZKQn4coG4A7u/g+h/37mSsKdXTB+PDM17fHwrnJamk324I07aDHkXy
   g==;
X-CSE-ConnectionGUID: weUNwHtTSRGWVXKYA+cUXA==
X-CSE-MsgGUID: g734pfbeSTijQ0Ca89XJNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65823569"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="65823569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 15:58:33 -0800
X-CSE-ConnectionGUID: L+sk34dJRyCXMLbITsE75A==
X-CSE-MsgGUID: mL9qoD71RvGWTultK+KqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="215539013"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Nov 2025 15:58:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNJyO-000000000F2-47wd;
	Sun, 23 Nov 2025 23:58:28 +0000
Date: Mon, 24 Nov 2025 07:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 9cb0ebd6fef266182e62dadbf9e6e964c95fb5e0
Message-ID: <202511240706.vihZWeIv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_155833_954678_FD35BF01 
X-CRM114-Status: UNSURE (   5.25  )
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
branch HEAD: 9cb0ebd6fef266182e62dadbf9e6e964c95fb5e0  Merge branch 'soc/dt' into for-next

elapsed time: 2980m

configs tested: 66
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251122    gcc-14.3.0
arc         randconfig-002-20251122    gcc-9.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251122    clang-22
arm         randconfig-002-20251122    clang-22
arm         randconfig-003-20251122    clang-22
arm         randconfig-004-20251122    gcc-12.5.0
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251123    gcc-8.5.0
arm64       randconfig-002-20251123    gcc-11.5.0
arm64       randconfig-003-20251123    clang-22
arm64       randconfig-004-20251123    clang-22
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251123    gcc-15.1.0
csky        randconfig-002-20251123    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                    allnoconfig    gcc-14
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                    allnoconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251123    gcc-14.3.0
parisc      randconfig-002-20251123    gcc-14.3.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251123    clang-22
powerpc     randconfig-002-20251123    gcc-8.5.0
powerpc64   randconfig-001-20251123    clang-22
powerpc64   randconfig-002-20251123    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251123    clang-20
riscv       randconfig-002-20251123    gcc-8.5.0
s390                    allnoconfig    clang-22
s390        randconfig-001-20251123    gcc-8.5.0
s390        randconfig-002-20251123    clang-22
sh                      allnoconfig    gcc-15.1.0
sh                        defconfig    gcc-15.1.0
sh          randconfig-001-20251123    gcc-12.5.0
sh          randconfig-002-20251123    gcc-14.3.0
sparc                   allnoconfig    gcc-15.1.0
sparc       randconfig-001-20251123    gcc-8.5.0
sparc       randconfig-002-20251123    gcc-15.1.0
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20251123    clang-22
sparc64     randconfig-002-20251123    clang-22
um                      allnoconfig    clang-22
um                        defconfig    clang-22
um                   i386_defconfig    gcc-14
um          randconfig-001-20251123    gcc-14
um          randconfig-002-20251123    gcc-14
um                 x86_64_defconfig    clang-22
x86_64                  allnoconfig    clang-20
x86_64                    defconfig    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa      randconfig-001-20251123    gcc-14.3.0
xtensa      randconfig-002-20251123    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

