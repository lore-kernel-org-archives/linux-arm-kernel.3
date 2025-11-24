Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B832CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hPrnW81QHnCZ42YaYrQa7N6HXZcJsB4kmrASqY2kv6A=; b=4EouQhGSQtdo0c2iZwP3BQmk9Z
	Qnlg8WTlMe3JyPKIg8tInHzmLHM84jx5hk2rCepVitdtJifVBTbBoPPQ6doqkUdNimjhaiUUdaFyb
	g16qe8eZcHbs5N+2hrg5zFMVuaS1RSyonTREJRhEww8nXdKu8xcvCJ93urvQt06i3HeIjLNgDKVAX
	basqDwB3nchH9X9ssVezCFNJynZTY4nrKvaUj8ualjCigSAmoSyA/r4fClvt47S7jyh9kTxLQLlyf
	jWy4HDW+/xaiigsmgwf3Ezs+7M5Wm9YYeAZcC9UuO+FdihYe2meihaWnQzPc2hMfwjNnJU91/q+Y0
	z+0YYmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU0G-0000000BRSg-0wK6;
	Mon, 24 Nov 2025 10:41:04 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU0D-0000000BRSL-2reu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763980862; x=1795516862;
  h=date:from:to:cc:subject:message-id;
  bh=FvYjHlkPMRrKKtUJYERqZStSGmyNstiWrLtAiD+szCI=;
  b=L4swe7DJ6EOkyis7IUe7wisCQWR/r2U9fcELo59gtkfXGFj+xrGV2J0P
   2cVQP+oa2EIlejTwCv117RR9U93kEmGZOZHMfZGop/Co9vQeHqw4croms
   NN0lu2lBaMD9LISz8CYoOANVLAUchFJGNZt43OkgVkoB3XyldNqjqAR/P
   BzzXloO1ahJdSSLoNJ91E3hdcTtV0yKz+AV2NzGZnZGVVQG+TNGajUmaH
   VDVpMOF4A5kK23WlwiWGhO2XlOP48XlwsFuRjiRck4F0NriYpAWmZlXce
   QERq3o3jTVWkRLriwLRrzuX4H/Zxmp532T8Covl3oEpoR8D4K9PF15i3U
   A==;
X-CSE-ConnectionGUID: l0f4DavDR4ioz9dbz4i6qg==
X-CSE-MsgGUID: 103sE6MTRRqnH6gdsi1xEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83365289"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="83365289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:41:01 -0800
X-CSE-ConnectionGUID: frQQfVOZSriBSo1HOOpvDg==
X-CSE-MsgGUID: 9EffjiMgTO60WFg7m+a2Tw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2025 02:41:00 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNU09-000000000cF-371f;
	Mon, 24 Nov 2025 10:40:57 +0000
Date: Mon, 24 Nov 2025 18:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:imx/dt-bindings] BUILD SUCCESS
 5ffac985b5f4272c8fccb0ef58369724bd10cd8d
Message-ID: <202511241846.rk9BzmRC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_024101_777445_FE28BA80 
X-CRM114-Status: UNSURE (   5.17  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/dt-bindings
branch HEAD: 5ffac985b5f4272c8fccb0ef58369724bd10cd8d  dt-bindings: arm: fsl: add Toradex SMARC iMX95

elapsed time: 10144m

configs tested: 47
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
riscv                   allnoconfig    gcc-15.1.0
s390                    allnoconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

