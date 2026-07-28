Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12497C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYX12eW2x3DQ1ndwH+cB2ikSIgugK2TLveb883QmQYY=; b=rV6+f1cGU+31oEU/xv3/q97nfq
	1OFHX+iYA7Kmiy8Hv+SCeE16vQRG1OoBiq/D6J8Obnd4FlcfOGdYXrjriOGqh5YYPVb1ydjWFU78/
	i/+gEpY50KJZ2EwHis5HCC3ch4j25sc3X2O0hSW5CmZdqXtTo0hF4Bnvei3NBGlNpdCJMyPsdWAm/
	owBezHW6xncPQbwIsuoVwTzLtdBqhc5sWfgvNEZRvonjfLlyNgh4u6QKb3EVOEaOtdwcnyFoxA91U
	wdjyMAljCYoex9gtoVJ4NlJx+MiZCvBq9MOENiRlFOj4XvR/QiyOADDka8JFBtQ7cXBXkEPm1ZTlA
	yjyOKHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofpd-000000053eP-2sPw;
	Tue, 28 Jul 2026 11:18:45 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofpb-000000053dO-02Xj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785237523; x=1816773523;
  h=date:from:to:cc:subject:message-id;
  bh=cJdzGdD3YA30v57mTw7w9KOKzZXEo+jem2i5ocTyxb8=;
  b=Wx4tBHGasaVY8Y77SlXSJ54gbAMKSwF/6td9IRhvOV44L5cyW3QMQcMU
   l+IKoW2mqn/yLiNe1lUGoqnI9XDNH4sFeMlPGwLm6RbkU1lzO16txZlFk
   WN2906UkMazqfehhcGau0IMTSa4IzJoP0Z0cmweOwVjzV65rm2ebxvDWj
   +rm4VwjnoRnUSxA9XYjZMc20b47yhhww27153jrQyweHFlu/nrYr3L+IV
   8CMRsiK1Elm6QP0s6GDvGbTF1kli3u4eR+SAM7F0ooEL/6ixlPGBN16vC
   j1mXfL19olnUCYc/fNT/DCQdxVEn0cf2TbJcSUZnJSNORG+vQKmGg9NtF
   A==;
X-CSE-ConnectionGUID: LrdTDxcaRryNXyIBH2//Zg==
X-CSE-MsgGUID: iIh8M6M3TXqCyfF3rippSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89709536"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="89709536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:18:42 -0700
X-CSE-ConnectionGUID: 7aOINau9SOuPOv/vrNpPVg==
X-CSE-MsgGUID: 00g9A/fATmC5BWX9XubbsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255367794"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2026 04:18:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wofpW-00000000eIZ-1skm;
	Tue, 28 Jul 2026 11:18:38 +0000
Date: Tue, 28 Jul 2026 19:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 88f46b866fe93b18abbca52085971ee382ece771
Message-ID: <202607281926.eqt0l45c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_041843_111192_E43AD260 
X-CRM114-Status: UNSURE (   4.93  )
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
branch HEAD: 88f46b866fe93b18abbca52085971ee382ece771  soc: document merges

elapsed time: 929m

configs tested: 102
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260728    gcc-8.5.0
arc                  randconfig-002-20260728    gcc-8.5.0
arm                      imx_v6_v7_defconfig    clang-24
arm                  randconfig-001-20260728    gcc-8.5.0
arm                  randconfig-002-20260728    gcc-8.5.0
arm                  randconfig-003-20260728    gcc-8.5.0
arm                  randconfig-004-20260728    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260728    gcc-14.3.0
arm64                randconfig-002-20260728    gcc-14.3.0
arm64                randconfig-003-20260728    gcc-14.3.0
arm64                randconfig-004-20260728    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260728    gcc-14.3.0
csky                 randconfig-002-20260728    gcc-14.3.0
hexagon              randconfig-001-20260728    gcc-11.5.0
hexagon              randconfig-002-20260728    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260728    gcc-14
i386       buildonly-randconfig-002-20260728    gcc-14
i386       buildonly-randconfig-003-20260728    gcc-14
i386       buildonly-randconfig-004-20260728    gcc-14
i386       buildonly-randconfig-005-20260728    gcc-14
i386       buildonly-randconfig-006-20260728    gcc-14
i386                 randconfig-001-20260728    gcc-14
i386                 randconfig-002-20260728    gcc-14
i386                 randconfig-003-20260728    gcc-14
i386                 randconfig-004-20260728    gcc-14
i386                 randconfig-005-20260728    gcc-14
i386                 randconfig-006-20260728    gcc-14
i386                 randconfig-007-20260728    gcc-14
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260728    gcc-14
i386                 randconfig-012-20260728    gcc-14
i386                 randconfig-013-20260728    gcc-14
i386                 randconfig-014-20260728    gcc-14
i386                 randconfig-015-20260728    gcc-14
i386                 randconfig-016-20260728    gcc-14
i386                 randconfig-017-20260728    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260728    gcc-11.5.0
loongarch            randconfig-002-20260728    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260728    gcc-11.5.0
nios2                randconfig-002-20260728    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260728    gcc-10.5.0
parisc               randconfig-002-20260728    gcc-10.5.0
powerpc              randconfig-001-20260728    gcc-10.5.0
powerpc              randconfig-002-20260728    gcc-10.5.0
powerpc64            randconfig-001-20260728    gcc-10.5.0
powerpc64            randconfig-002-20260728    gcc-10.5.0
riscv                randconfig-001-20260728    gcc-14.3.0
riscv                randconfig-002-20260728    gcc-14.3.0
s390                 randconfig-001-20260728    gcc-14.3.0
s390                 randconfig-002-20260728    gcc-14.3.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260728    gcc-14.3.0
sh                   randconfig-002-20260728    gcc-14.3.0
sparc                         randconfig-001    gcc-11.5.0
sparc                randconfig-001-20260728    gcc-11.5.0
sparc                randconfig-002-20260728    gcc-11.5.0
sparc64              randconfig-001-20260728    gcc-11.5.0
sparc64              randconfig-002-20260728    gcc-11.5.0
um                   randconfig-001-20260728    gcc-11.5.0
um                   randconfig-002-20260728    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260728    clang-22
x86_64     buildonly-randconfig-002-20260728    clang-22
x86_64     buildonly-randconfig-003-20260728    clang-22
x86_64     buildonly-randconfig-004-20260728    clang-22
x86_64     buildonly-randconfig-005-20260728    clang-22
x86_64     buildonly-randconfig-006-20260728    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260728    gcc-12
x86_64               randconfig-002-20260728    gcc-12
x86_64               randconfig-003-20260728    gcc-12
x86_64               randconfig-004-20260728    gcc-12
x86_64               randconfig-005-20260728    gcc-12
x86_64               randconfig-006-20260728    gcc-12
x86_64               randconfig-011-20260728    clang-22
x86_64               randconfig-012-20260728    clang-22
x86_64               randconfig-013-20260728    clang-22
x86_64               randconfig-014-20260728    clang-22
x86_64               randconfig-015-20260728    clang-22
x86_64               randconfig-016-20260728    clang-22
x86_64               randconfig-071-20260728    clang-22
x86_64               randconfig-072-20260728    clang-22
x86_64               randconfig-073-20260728    clang-22
x86_64               randconfig-074-20260728    clang-22
x86_64               randconfig-075-20260728    clang-22
x86_64               randconfig-076-20260728    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260728    gcc-11.5.0
xtensa               randconfig-002-20260728    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

