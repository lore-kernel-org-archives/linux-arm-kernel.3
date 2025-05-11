Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC62AC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dss2YvD3bKi+smSo91+0Yw13pRlnD8TSMFbeVv7CFok=; b=YYWwqmEMl3aLisR9eM0WBLoBD3
	JTLESc+gwkncgSLEmJ0GQQ76fuinAhr1zgyAVTl5T8j2uIgHKaR86m7p2RlNGrM1Q7AIlYhpPkq9t
	uSUa5XCfBAd2Jqk5IzU1VsDZcwSBn7kG4/szKOC9qaKd7GhxBVqFSm9PCdxLiZKE1FjhR065hMmgD
	wbjRjUdb3o/YQO3yOgereayDvv9RzAdwsMaKcbxa5A3rhXGSXbOFSdhhWU+0XtRuUA6UQNa7Ys9ax
	ZmVuLaqxZQMNXO/xxUXbsBUf01rrvtZZoozIo4etv1T2cwNKrrIbfCaPhqm6aLPKKnu89dfU6EdO8
	p5mwVsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE34u-000000070yJ-2RVh;
	Sun, 11 May 2025 09:34:36 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE32u-000000070q2-2eQN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 09:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746955953; x=1778491953;
  h=date:from:to:cc:subject:message-id;
  bh=+u69fbPDqmS7yihkLJe6whNnKfwb3XjaMqDZMEj6/30=;
  b=TCQ5uQv9e8Rp8gdWLbhzGXaoIrbPcim5Qf1xnvPs7cpcABVSjtORLPQo
   bIONxhW86Eid7S5DetgGLcwrknL8hsfQ6UYNE+tKSDiTF6SLddknxbFfY
   9E0q0tZRYplUBCGKuxp6c/h2VUf8xU/GP1gBeFGMWFK3A/fpbNyiRlthJ
   Xr6avdDRuMZe5Gma131BLvarv5PGLl2lGLV4kP8+k4zGhr6/Eo5xftfAg
   besED92tL8uiVhYH8CAVF4PE1EEbX41DHpbXgbZDTxrSOdzEelKsJSn8u
   Bs6sNGGdIYC5Xx+8LQs4njkVDeW3055GF7jkPkkuB4ET51hay1F1OdVdQ
   A==;
X-CSE-ConnectionGUID: 3f31iWWHSj+PjubwMSK2ag==
X-CSE-MsgGUID: Kr7YjgsLT367AdqWyLS5zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48682125"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="48682125"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 02:32:28 -0700
X-CSE-ConnectionGUID: 2RI10UJZS+andPn/SBZsMA==
X-CSE-MsgGUID: zrWFGL/9SjiBcKbc2peXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="136794022"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2025 02:32:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE32l-000Dh2-34;
	Sun, 11 May 2025 09:32:23 +0000
Date: Sun, 11 May 2025 17:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 ef934c51cb44043da93c563aed3a13cfe016ccdf
Message-ID: <202505111734.CvQ8MABF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_023232_713884_C31ACAE6 
X-CRM114-Status: UNSURE (   5.26  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: ef934c51cb44043da93c563aed3a13cfe016ccdf  Merge tag 'tegra-for-6.16-arm-dt' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/dt

elapsed time: 1371m

configs tested: 179
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250510    gcc-14.2.0
arc                   randconfig-002-20250510    gcc-13.3.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    clang-21
arm                   randconfig-001-20250510    gcc-10.5.0
arm                   randconfig-002-20250510    clang-21
arm                   randconfig-003-20250510    gcc-10.5.0
arm                   randconfig-004-20250510    gcc-7.5.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250510    gcc-7.5.0
arm64                 randconfig-002-20250510    gcc-5.5.0
arm64                 randconfig-003-20250510    clang-21
arm64                 randconfig-004-20250510    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250510    gcc-14.2.0
csky                  randconfig-002-20250510    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250510    clang-21
hexagon               randconfig-002-20250510    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250510    gcc-12
i386        buildonly-randconfig-002-20250510    gcc-12
i386        buildonly-randconfig-003-20250510    gcc-12
i386        buildonly-randconfig-004-20250510    gcc-12
i386        buildonly-randconfig-005-20250510    gcc-12
i386        buildonly-randconfig-006-20250510    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250511    clang-20
i386                  randconfig-002-20250511    clang-20
i386                  randconfig-003-20250511    clang-20
i386                  randconfig-004-20250511    clang-20
i386                  randconfig-005-20250511    clang-20
i386                  randconfig-006-20250511    clang-20
i386                  randconfig-007-20250511    clang-20
i386                  randconfig-011-20250511    clang-20
i386                  randconfig-012-20250511    clang-20
i386                  randconfig-013-20250511    clang-20
i386                  randconfig-014-20250511    clang-20
i386                  randconfig-015-20250511    clang-20
i386                  randconfig-016-20250511    clang-20
i386                  randconfig-017-20250511    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250510    gcc-13.3.0
loongarch             randconfig-002-20250510    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                          rb532_defconfig    clang-21
nios2                         3c120_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250510    gcc-11.5.0
nios2                 randconfig-002-20250510    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250510    gcc-6.5.0
parisc                randconfig-002-20250510    gcc-12.4.0
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    clang-21
powerpc                    mvme5100_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250510    gcc-7.5.0
powerpc               randconfig-002-20250510    clang-17
powerpc               randconfig-003-20250510    clang-21
powerpc64             randconfig-001-20250510    clang-18
powerpc64             randconfig-002-20250510    gcc-10.5.0
powerpc64             randconfig-003-20250510    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250510    gcc-14.2.0
riscv                 randconfig-002-20250510    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250510    gcc-7.5.0
s390                  randconfig-002-20250510    clang-21
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250510    gcc-9.3.0
sh                    randconfig-002-20250510    gcc-11.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250510    gcc-12.4.0
sparc                 randconfig-002-20250510    gcc-14.2.0
sparc64                          alldefconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250510    gcc-10.5.0
sparc64               randconfig-002-20250510    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250510    gcc-12
um                    randconfig-002-20250510    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250510    clang-20
x86_64      buildonly-randconfig-002-20250510    clang-20
x86_64      buildonly-randconfig-003-20250510    gcc-12
x86_64      buildonly-randconfig-004-20250510    gcc-11
x86_64      buildonly-randconfig-005-20250510    gcc-12
x86_64      buildonly-randconfig-006-20250510    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250511    gcc-12
x86_64                randconfig-002-20250511    gcc-12
x86_64                randconfig-003-20250511    gcc-12
x86_64                randconfig-004-20250511    gcc-12
x86_64                randconfig-005-20250511    gcc-12
x86_64                randconfig-006-20250511    gcc-12
x86_64                randconfig-007-20250511    gcc-12
x86_64                randconfig-008-20250511    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250510    gcc-8.5.0
xtensa                randconfig-002-20250510    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

