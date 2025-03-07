Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6206DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xagIauEMH2hsyco8lHzEvpdcABe5odxpu3TW12tDQlc=; b=Q19YtWaS/z9OsbSCH5BBKZ8O/6
	dQfSCNBcAu/kcm6n3l4HUPtzBcEmhSD2pVR3r/cu98Z2g/X6DEQ6sdLgy4eS4LVsROwmKbtudb4FB
	PQNMLuMLEWaptwam8CvF8v+pxuFYU0JRLjy1NKovuQY8nwSOb04gg9gcRemh98tPk0dIHs/Pqr00M
	oCAtxMgLQrBtwSUEUkmYqn4yij6YJuqTUrvjCDVQ/o5+FwFvVqUOiOAcejMgSQFcrUP3pr9XNisf5
	MIz2iabEDmdlVfqBh99vojhsLD3CCBK0Y6y4Oa91eeomfBMLwZ/eIAOejFkKcG0HRGDxCZPPAaM4x
	nXfuivhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaNH-0000000ErI3-0ud3;
	Fri, 07 Mar 2025 16:16:35 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaJJ-0000000EqGI-2iYw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741363949; x=1772899949;
  h=date:from:to:cc:subject:message-id;
  bh=VRoLuPo3xrt75CmGjktPfkYGpTEDc3ENUDbG3/QqJQ0=;
  b=QY8T+EEfUpu4Uo9zREPRIXxSNGEzt17Y5NXefrrFkHjOAxdhqP5Xku4X
   +SW+SMDpeL66PKszAX7qx1nn9Box/FIajW+zcOBrQYQoMJLctx5LugbiN
   A94gldjUeuEcRDVN4wMTT31eVzHNoY2D/TNDSJGmJ4k+F1hlimvC8rzw4
   XfNI0YdU+Jwz4kfIjFKO3vbcrrhytYwjn5Ec0iIJJWcU00Nz3FnqaPTWj
   3v+Goqsmh751Nqfq55WH5a6IoZvt+nWG9iVUVGbsqcs8gSI+q0xag3r1M
   uaCWY+pf/Hg/eXAc5dS7nvDH1xWJ/r1zLZ83w2KfEtfWRXWrh5Gr96lJK
   A==;
X-CSE-ConnectionGUID: y94/hsgdQrCDUGUuxOVlxQ==
X-CSE-MsgGUID: MBgL2aI5RjOnFsuJ28Ze3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53806042"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53806042"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:12:27 -0800
X-CSE-ConnectionGUID: hzEgr66/T/WXPOCCrvSCBA==
X-CSE-MsgGUID: ri6uC7xpQXeb24GCD6VUHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119113540"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2025 08:12:24 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqaJC-0000im-28;
	Fri, 07 Mar 2025 16:12:22 +0000
Date: Sat, 08 Mar 2025 00:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 98f3ab18a0a55aa1ff2cd6b74bd0c02c8f76f17e
Message-ID: <202503080042.qBbdAnTj-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_081229_731991_E9BA9A80 
X-CRM114-Status: UNSURE (   5.62  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 98f3ab18a0a55aa1ff2cd6b74bd0c02c8f76f17e  ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP

elapsed time: 1454m

configs tested: 64
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250307    gcc-13.2.0
arc                  randconfig-002-20250307    gcc-13.2.0
arm                  randconfig-001-20250307    clang-21
arm                  randconfig-002-20250307    gcc-14.2.0
arm                  randconfig-003-20250307    clang-19
arm                  randconfig-004-20250307    clang-21
arm64                randconfig-001-20250307    gcc-14.2.0
arm64                randconfig-002-20250307    clang-15
arm64                randconfig-003-20250307    gcc-14.2.0
arm64                randconfig-004-20250307    clang-15
csky                 randconfig-001-20250307    gcc-14.2.0
csky                 randconfig-002-20250307    gcc-14.2.0
hexagon              randconfig-001-20250307    clang-21
hexagon              randconfig-002-20250307    clang-21
i386       buildonly-randconfig-001-20250307    clang-19
i386       buildonly-randconfig-002-20250307    clang-19
i386       buildonly-randconfig-003-20250307    gcc-11
i386       buildonly-randconfig-004-20250307    clang-19
i386       buildonly-randconfig-005-20250307    gcc-12
i386       buildonly-randconfig-006-20250307    clang-19
loongarch            randconfig-001-20250307    gcc-14.2.0
loongarch            randconfig-002-20250307    gcc-14.2.0
m68k                             allnoconfig    gcc-14.2.0
nios2                randconfig-001-20250307    gcc-14.2.0
nios2                randconfig-002-20250307    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250307    gcc-14.2.0
parisc               randconfig-002-20250307    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250307    gcc-14.2.0
powerpc              randconfig-002-20250307    clang-21
powerpc              randconfig-003-20250307    clang-19
powerpc64            randconfig-001-20250307    clang-21
powerpc64            randconfig-002-20250307    gcc-14.2.0
powerpc64            randconfig-003-20250307    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250307    gcc-14.2.0
riscv                randconfig-002-20250307    clang-19
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250307    gcc-14.2.0
s390                 randconfig-002-20250307    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250307    gcc-14.2.0
sh                   randconfig-002-20250307    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250307    gcc-14.2.0
sparc                randconfig-002-20250307    gcc-14.2.0
sparc64              randconfig-001-20250307    gcc-14.2.0
sparc64              randconfig-002-20250307    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250307    clang-17
um                   randconfig-002-20250307    clang-21
x86_64     buildonly-randconfig-001-20250307    clang-19
x86_64     buildonly-randconfig-002-20250307    gcc-12
x86_64     buildonly-randconfig-003-20250307    clang-19
x86_64     buildonly-randconfig-004-20250307    clang-19
x86_64     buildonly-randconfig-005-20250307    clang-19
x86_64     buildonly-randconfig-006-20250307    gcc-12
xtensa               randconfig-001-20250307    gcc-14.2.0
xtensa               randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

