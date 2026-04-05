Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CB4E64002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NRP6DSx5mKO7/34CaNTnfgg08vBQuRE6ffS8rrKn6G8=; b=b5lC4Vczu/AG91cyXy3CjjASKT
	axQ6HmcacSLSLTm4gOxB9dgu5Vly5sXviIIAnPYF4tDjCJqvBgqFHm6OL4QHFylkz4WUv3qji2b9s
	x53HtbWfgTN9ayAw8QiuZ4/3Do7gn2bs1LmiRUax6oyioG9X2v7WgWqNa48uIeXhjlkAO/tpehlSp
	mkFZI0myqK2f74O3FP0QPhV3duHvx+hrC+6T0zPNOpf+o8tXOEbYJpeefpQqm6V3mdwi+xzNbauEc
	A5mSWPN+fN6PK4Mx7Sm/n4RHfeqZ2pYYMlF7da4cUPzmn8se0Gl5tnSyRGTt7uE1C60xNSpYJwsd+
	gvWcimWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9IXb-00000004492-0DaG;
	Sun, 05 Apr 2026 08:09:07 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9IXZ-0000000448j-05IB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 08:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775376545; x=1806912545;
  h=date:from:to:cc:subject:message-id;
  bh=MnfyBsNgwG6SuNRFSnNyq7tsu27FV21LXyielB3y0uc=;
  b=DJNZZh1k6rSZBToGZGp++JF4AsbuCzIYBWtZ0WRKCH6FKkaasdiA7mqJ
   kFidVLUpWXwrXqVe0KJOl6Pg6VW+9yiuB6v55P10Xfiwa9AgpVzr/YFz/
   6ePAg6YzRtLYe5sII1L8xLkqHWaPPQUqEHpKX+dA+yXdD6Rcfaj95MVEz
   9iO8p2CqIA53i8FjhqT27Fph5A94xTuiHb+dD1zdJ+dyrEEIpMK/7E3eR
   I9pn543WHv/5xQQKacwIUqBwowOe2F9+SiE486MACc8iydNYykcFAXeg7
   pie+XMQxSW09jsxpmbQ7OsrdR2/vH/He+B4QTZU1LLeGTllSnY8zxWuBc
   A==;
X-CSE-ConnectionGUID: 8MCdJDEQRP67y64y3yEzKg==
X-CSE-MsgGUID: tFYfqWiLQNyb+pKO7FGa3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="93950481"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="93950481"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 01:09:03 -0700
X-CSE-ConnectionGUID: GLP5H+iGT4GAvVlEE+Uptw==
X-CSE-MsgGUID: qnmQnMeLTr2kmonbzMhuzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="227574187"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Apr 2026 01:09:01 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9IXS-00000000205-2GNS;
	Sun, 05 Apr 2026 08:08:58 +0000
Date: Sun, 05 Apr 2026 16:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 adb84024b2d4fa8e2defe1729f60a95bc70f5481
Message-ID: <202604051608.tClpgqYS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_010905_077635_DA600A77 
X-CRM114-Status: UNSURE (   4.48  )
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
branch HEAD: adb84024b2d4fa8e2defe1729f60a95bc70f5481  Merge branch 'soc/arm' into for-next

elapsed time: 748m

configs tested: 174
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260405    clang-23
arc                   randconfig-002-20260405    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260405    clang-23
arm                   randconfig-002-20260405    clang-23
arm                   randconfig-003-20260405    clang-23
arm                   randconfig-004-20260405    clang-23
arm                         socfpga_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260405    gcc-9.5.0
arm64                 randconfig-002-20260405    gcc-9.5.0
arm64                 randconfig-003-20260405    gcc-9.5.0
arm64                 randconfig-004-20260405    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260405    gcc-9.5.0
csky                  randconfig-002-20260405    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260405    clang-23
hexagon               randconfig-002-20260405    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260405    gcc-14
i386        buildonly-randconfig-002-20260405    gcc-14
i386        buildonly-randconfig-003-20260405    gcc-14
i386        buildonly-randconfig-004-20260405    gcc-14
i386        buildonly-randconfig-005-20260405    gcc-14
i386        buildonly-randconfig-006-20260405    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260405    gcc-14
i386                  randconfig-002-20260405    gcc-14
i386                  randconfig-003-20260405    gcc-14
i386                  randconfig-004-20260405    gcc-14
i386                  randconfig-005-20260405    gcc-14
i386                  randconfig-006-20260405    gcc-14
i386                  randconfig-007-20260405    gcc-14
i386                  randconfig-011-20260405    gcc-14
i386                  randconfig-012-20260405    gcc-14
i386                  randconfig-013-20260405    gcc-14
i386                  randconfig-014-20260405    gcc-14
i386                  randconfig-015-20260405    gcc-14
i386                  randconfig-016-20260405    gcc-14
i386                  randconfig-017-20260405    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260405    clang-23
loongarch             randconfig-002-20260405    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260405    clang-23
nios2                 randconfig-002-20260405    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260405    gcc-10.5.0
parisc                randconfig-002-20260405    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260405    gcc-10.5.0
powerpc               randconfig-002-20260405    gcc-10.5.0
powerpc64             randconfig-001-20260405    gcc-10.5.0
powerpc64             randconfig-002-20260405    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260405    clang-23
riscv                 randconfig-002-20260405    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260405    clang-23
s390                  randconfig-002-20260405    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-15.2.0
sh                    randconfig-001-20260405    clang-23
sh                    randconfig-002-20260405    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260405    clang-23
sparc                 randconfig-001-20260405    gcc-8.5.0
sparc                 randconfig-002-20260405    clang-23
sparc                 randconfig-002-20260405    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260405    clang-23
sparc64               randconfig-002-20260405    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260405    clang-23
um                    randconfig-002-20260405    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260405    gcc-14
x86_64      buildonly-randconfig-002-20260405    gcc-14
x86_64      buildonly-randconfig-003-20260405    gcc-14
x86_64      buildonly-randconfig-004-20260405    gcc-14
x86_64      buildonly-randconfig-005-20260405    gcc-14
x86_64      buildonly-randconfig-006-20260405    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260405    clang-20
x86_64                randconfig-002-20260405    clang-20
x86_64                randconfig-003-20260405    clang-20
x86_64                randconfig-004-20260405    clang-20
x86_64                randconfig-005-20260405    clang-20
x86_64                randconfig-006-20260405    clang-20
x86_64                randconfig-011-20260405    gcc-14
x86_64                randconfig-012-20260405    gcc-14
x86_64                randconfig-013-20260405    gcc-14
x86_64                randconfig-014-20260405    gcc-14
x86_64                randconfig-015-20260405    gcc-14
x86_64                randconfig-016-20260405    gcc-14
x86_64                randconfig-071-20260405    gcc-14
x86_64                randconfig-072-20260405    gcc-14
x86_64                randconfig-073-20260405    gcc-14
x86_64                randconfig-074-20260405    gcc-14
x86_64                randconfig-075-20260405    gcc-14
x86_64                randconfig-076-20260405    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260405    clang-23
xtensa                randconfig-001-20260405    gcc-12.5.0
xtensa                randconfig-002-20260405    clang-23
xtensa                randconfig-002-20260405    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

