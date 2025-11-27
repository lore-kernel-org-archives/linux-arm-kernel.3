Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E701BD116E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 02:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYQo3s2RRlNPnlVoz1rpCtx9jvNzDfsvI29ReIeH2rc=; b=JTqpasq1ArM2Yt6DfCZqCKaSZA
	uLCLzuViSPHYCRIkkEgDAtxC6lI5Np9vGUwn2gt22+9u5s/MBgSW39EP2hLyit1ZhLfyczU5WU3tB
	s8QfGrpJ95DVolfakMFDjwNPh50LXLew7xjGzdqry4JaQVLvEVciloke6SBDnl7VW3UivxnGrkqU4
	FZ83XfW66KwmkopilBicK0+D4l66lsQLr2JkotgZrAgq9qfRBDML5ddL0gXX6bG4LqMPwSWU2Vu3K
	coVFsGMmVbmqcRb8DBon6obU90qTscJgQaoSQFYS04ftOXlkGlLPkO7Gvi3baKUYIaDwZ43trv8Qx
	TtnIVOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORJJ-0000000Fs0p-3YAk;
	Thu, 27 Nov 2025 02:00:41 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORJH-0000000Fryx-2FNS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 02:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764208840; x=1795744840;
  h=date:from:to:cc:subject:message-id;
  bh=N0Z0uAkUpQtI8p3O3eD/dRQcSnpMxca7UqlP7oxxaDE=;
  b=QUuGNht20Msg0cPiJmKpyKg84BH5DXlkOfzhYezJv25tfRBKI/fTsW5+
   NZhJJ0/ZX0bgwYTUnAZawGCzSen3x7lRt8s/g6F8kQYjjiJTGrXxUL3pq
   Et6/1VUDgbRFdbSOVzmtcNS3PCz3pmJVZNdR9pj5/7phH4EVm6tapfgPL
   qhrK88afIUFUSZoAPr5TqDkeTS/oboz73/dv2s4LTdr9iyw57naUaXg1H
   4mqG40/pTNkPmyeh4CgxRo7yl/UywEh5rvbfuImwdonpzM0YYobKZQ1QP
   r24Tg/gveI0uXTwuNJIn7ZOIi+F1lIxtn4NBi2Bbwl1PT8GrbX0HMwNdQ
   Q==;
X-CSE-ConnectionGUID: JG7UgMx6Qn+aWaeOU/K5sA==
X-CSE-MsgGUID: HXF5ydvtRuu/TxMrSxMBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53821299"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="53821299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:00:38 -0800
X-CSE-ConnectionGUID: AyvSl5yiQZ6hFvF2XeZ/cQ==
X-CSE-MsgGUID: uhs1KKeGQauQhjY1WaAz0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197582510"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2025 18:00:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORJB-000000003Yz-1y69;
	Thu, 27 Nov 2025 02:00:33 +0000
Date: Thu, 27 Nov 2025 10:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:k3/dt] BUILD SUCCESS
 00fb4c73b67d36783c5ab95a830f0cf0142b9fc3
Message-ID: <202511271004.JITIcIt9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_180039_580912_E844DD6B 
X-CRM114-Status: UNSURE (   5.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git k3/dt
branch HEAD: 00fb4c73b67d36783c5ab95a830f0cf0142b9fc3  arm64: dts: ti: k3-am62l: add initial reference board file

elapsed time: 7712m

configs tested: 61
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

