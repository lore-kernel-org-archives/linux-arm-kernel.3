Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD4C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7OhcMV5Jq97oGhnj66XMKQLDQIsGHass9hg/TCR559w=; b=EkNHSZZ/e8NBg8knwYR2mTxFHK
	b71mEyobTx4dEH+wE8keQ27s7Ak6oUxRY4sqPlCKaYjI7OlTdeqkVxvLuRej2I7F4h0tb16vbnNJP
	Do23hrkgALJdGyloE29Ixi80oPL417kOVncv8kQN+c5R86U6Ek6rdKyTCo5RyhtJoNuwg9vw6e2Qy
	jAsO7KRBbJVHwiOAXz7FVxpUt2bSXIKIjcvuVCADxDNJ0jC0Kb4Ql18/yEYu8ex9trGu9Q/dlGV9e
	o84ka91uzxhoj/SBMKweYdPUVnSJuAwY/7Qhot16RkjXMa3GLQ6aT2A6s+gsGuLxIcMwcrPcPe0G+
	rY64vzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUAb-0000000CZSF-0avZ;
	Mon, 10 Aug 2026 17:52:17 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUAZ-0000000CZRv-0TDy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786384335; x=1817920335;
  h=date:from:to:cc:subject:message-id;
  bh=XWm7SpWIdXPG7sA7R5ms8LEe/I31w9PMl947w9c0ayQ=;
  b=hb70iRLF0zPKCNjuSpVlO11DtXZIK66OMXpGHvE32dgFBblBKExapiOq
   y1rono7FlL/koGXXXMF24CcrWDBo14BLI8wydqoGdJisqt7U63OhOONOI
   dkorSfJ5odQp9N5gJF1wMnzbRvvxyuzKsOfXXWHe9Wc0qFs9lXs6hD+5R
   Kl9294FR3/Fxt76OnnV7JgSWA8+0WtCGOgkWyMakegTHC9EcJHdz/sKSI
   W+0Y8prTDpwEnWr2weuRE7yqC/to7BVGXsV//1P8lL/6sAVMeCi7nVa6J
   ujUetkROyDXy5nNDtzQLm/L3h0/xlELF9AyoqzHEjYe8cu/W6vT8L8B9k
   w==;
X-CSE-ConnectionGUID: 50R63THgSy+68W6SKz/pXQ==
X-CSE-MsgGUID: udwqrxpBR3+6sSpkqFvMTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98423857"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="98423857"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 10:52:13 -0700
X-CSE-ConnectionGUID: FFFsaGq0TTWOoZSOYsMa5Q==
X-CSE-MsgGUID: c4k4O6+TQW6FjSH78e8NPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="267379031"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Aug 2026 10:52:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtUAT-00000000NZO-33dQ;
	Mon, 10 Aug 2026 17:52:09 +0000
Date: Tue, 11 Aug 2026 01:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 b9a43aeabca0162b4a405c1c093e0764a549ba77
Message-ID: <202608110154.UwjMIsYl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_105215_197871_4B4DC2F5 
X-CRM114-Status: UNSURE (   5.11  )
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
branch HEAD: b9a43aeabca0162b4a405c1c093e0764a549ba77  soc: document merges

elapsed time: 2381m

configs tested: 155
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260810    gcc-8.5.0
arc                  randconfig-002-20260810    gcc-8.5.0
arm                  randconfig-001-20260810    gcc-12.5.0
arm                  randconfig-001-20260810    gcc-8.5.0
arm                  randconfig-002-20260810    gcc-14.3.0
arm                  randconfig-002-20260810    gcc-8.5.0
arm                  randconfig-003-20260810    clang-24
arm                  randconfig-003-20260810    gcc-8.5.0
arm                  randconfig-004-20260810    clang-24
arm                  randconfig-004-20260810    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260810    gcc-10.5.0
arm64                randconfig-001-20260810    gcc-14.3.0
arm64                randconfig-001-20260810    gcc-16.1.0
arm64                randconfig-002-20260810    clang-24
arm64                randconfig-002-20260810    gcc-14.3.0
arm64                randconfig-002-20260810    gcc-16.1.0
arm64                randconfig-003-20260810    clang-24
arm64                randconfig-003-20260810    gcc-14.3.0
arm64                randconfig-003-20260810    gcc-16.1.0
arm64                randconfig-004-20260810    clang-22
arm64                randconfig-004-20260810    gcc-14.3.0
arm64                randconfig-004-20260810    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260810    gcc-14.3.0
csky                 randconfig-001-20260810    gcc-16.1.0
csky                 randconfig-002-20260810    gcc-14.3.0
csky                 randconfig-002-20260810    gcc-16.1.0
hexagon                       randconfig-001    gcc-10.5.0
hexagon              randconfig-001-20260810    clang-24
hexagon              randconfig-001-20260810    gcc-10.5.0
hexagon              randconfig-002-20260810    clang-24
hexagon              randconfig-002-20260810    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260810    clang-22
i386       buildonly-randconfig-002-20260810    clang-22
i386       buildonly-randconfig-003-20260810    clang-22
i386       buildonly-randconfig-004-20260810    clang-22
i386       buildonly-randconfig-005-20260810    clang-22
i386       buildonly-randconfig-006-20260810    clang-22
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260809    clang-22
i386                 randconfig-001-20260810    gcc-14
i386                 randconfig-002-20260809    gcc-14
i386                 randconfig-002-20260810    gcc-14
i386                 randconfig-003-20260809    clang-22
i386                 randconfig-003-20260810    gcc-14
i386                 randconfig-004-20260809    clang-22
i386                 randconfig-004-20260810    gcc-14
i386                 randconfig-005-20260809    clang-22
i386                 randconfig-005-20260810    gcc-14
i386                 randconfig-006-20260809    clang-22
i386                 randconfig-006-20260810    gcc-14
i386                 randconfig-007-20260809    gcc-14
i386                 randconfig-007-20260810    gcc-14
i386                          randconfig-011    clang-22
i386                 randconfig-011-20260810    clang-22
i386                 randconfig-011-20260810    gcc-14
i386                 randconfig-012-20260810    clang-22
i386                 randconfig-013-20260810    clang-22
i386                 randconfig-014-20260810    clang-22
i386                 randconfig-014-20260810    gcc-14
i386                 randconfig-015-20260810    clang-22
i386                 randconfig-016-20260810    clang-22
i386                 randconfig-016-20260810    gcc-14
i386                 randconfig-017-20260810    clang-22
i386                 randconfig-017-20260810    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260810    gcc-10.5.0
loongarch            randconfig-001-20260810    gcc-16.1.0
loongarch            randconfig-002-20260810    gcc-10.5.0
loongarch            randconfig-002-20260810    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260810    gcc-10.5.0
nios2                randconfig-002-20260810    gcc-10.5.0
nios2                randconfig-002-20260810    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260810    gcc-11.5.0
parisc               randconfig-001-20260810    gcc-8.5.0
parisc               randconfig-002-20260810    gcc-8.5.0
powerpc                       icon_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260810    clang-24
powerpc              randconfig-001-20260810    gcc-8.5.0
powerpc              randconfig-002-20260810    gcc-10.5.0
powerpc              randconfig-002-20260810    gcc-8.5.0
powerpc64            randconfig-001-20260810    gcc-8.5.0
powerpc64            randconfig-002-20260810    gcc-8.5.0
riscv                randconfig-001-20260810    clang-24
riscv                randconfig-001-20260810    gcc-8.5.0
riscv                randconfig-002-20260810    gcc-8.5.0
s390                 randconfig-001-20260810    gcc-8.5.0
s390                 randconfig-002-20260810    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260810    gcc-16.1.0
sh                   randconfig-001-20260810    gcc-8.5.0
sh                   randconfig-002-20260810    gcc-16.1.0
sh                   randconfig-002-20260810    gcc-8.5.0
sparc                         randconfig-001    gcc-11.5.0
sparc                randconfig-001-20260810    gcc-11.5.0
sparc                randconfig-001-20260810    gcc-16.1.0
sparc                randconfig-002-20260810    gcc-11.5.0
sparc64              randconfig-001-20260810    clang-20
sparc64              randconfig-001-20260810    gcc-11.5.0
sparc64              randconfig-002-20260810    gcc-11.5.0
um                   randconfig-001-20260810    gcc-11.5.0
um                   randconfig-001-20260810    gcc-14
um                   randconfig-002-20260810    gcc-11.5.0
um                   randconfig-002-20260810    gcc-14
x86_64     buildonly-randconfig-001-20260810    clang-22
x86_64     buildonly-randconfig-001-20260810    gcc-14
x86_64     buildonly-randconfig-002-20260810    gcc-14
x86_64     buildonly-randconfig-003-20260810    clang-22
x86_64     buildonly-randconfig-003-20260810    gcc-14
x86_64     buildonly-randconfig-004-20260810    gcc-14
x86_64     buildonly-randconfig-005-20260810    gcc-13
x86_64     buildonly-randconfig-005-20260810    gcc-14
x86_64     buildonly-randconfig-006-20260810    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260810    gcc-14
x86_64               randconfig-002-20260810    gcc-14
x86_64               randconfig-003-20260810    gcc-14
x86_64               randconfig-004-20260810    gcc-12
x86_64               randconfig-004-20260810    gcc-14
x86_64               randconfig-005-20260810    gcc-14
x86_64               randconfig-006-20260810    clang-22
x86_64               randconfig-006-20260810    gcc-14
x86_64               randconfig-011-20260810    clang-22
x86_64               randconfig-011-20260810    gcc-14
x86_64               randconfig-012-20260810    clang-22
x86_64               randconfig-013-20260810    clang-22
x86_64               randconfig-013-20260810    gcc-14
x86_64               randconfig-014-20260810    clang-22
x86_64               randconfig-015-20260810    clang-22
x86_64               randconfig-016-20260810    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260810    clang-22
x86_64               randconfig-072-20260810    clang-22
x86_64               randconfig-073-20260810    clang-22
x86_64               randconfig-074-20260810    clang-22
x86_64               randconfig-075-20260810    clang-22
x86_64               randconfig-076-20260810    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260810    gcc-11.5.0
xtensa               randconfig-001-20260810    gcc-9.5.0
xtensa               randconfig-002-20260810    gcc-11.5.0
xtensa               randconfig-002-20260810    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

