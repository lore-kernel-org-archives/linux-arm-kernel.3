Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECD2D65C57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qQWXXARqIP+hXXr8E5I9+T0VcnSKu95H5CHw7ZtCcRs=; b=nW+qp0hmf1nwkXIwiZISTtOi7e
	/Osbx15dgGVIKf14/z2hhwXuGMXZ5FCjOXijjSNIeFB2vGQOssfaj5sSCihsbz6PyneCjQ+F3POJ0
	6jbQbaJxAQGb11qtdVXou+/j2uHUry+YCR7JXsDvGCv3B1Sd1ZvgU4MpAg8jj4SsIxEzWPBmpZYLC
	cHPjpilPaGbA5DDqh3cTcpwCrJYOB7j5cGOxxT39PTyj65Y9p6psUk5dw7jps4WbWFKl1oX2ZBDMC
	wsz9skkpU63LGvTsY2p0NNZFThPPOljbcQIDfKWCdEQ1gbme0IhM4gRqCqig3zg0a9+N7P4g8d8YJ
	rZ1R+OeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUQN-0000000967O-3v8q;
	Thu, 14 Nov 2024 07:37:55 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUOa-000000095vp-0QGB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 07:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731569764; x=1763105764;
  h=date:from:to:cc:subject:message-id;
  bh=y/f96/RwlyW6K8mih8zEJr4JIAt/+stJZjirPQrwNZA=;
  b=aHdUixBK6ZTVM/K2ZZjUajHZgzFh2LtgrFeRmqvUdnRZ/WxmUWRqfzuO
   6bJs5Rhn8fPpkR0W7utLmy8gec5XkaYOC0EQtxDG7IMQu42ygw8A75vR5
   /jBvVoSC98hcDF/ftsZn+nZarGGFux7kh7R5uRFSkX43T7QTWcjOHMUqL
   1JdF2bBBf9LdN/uFLZqZ+nxDP3k/HxksKFdJV9v2PmOV6LQz5hpwNCKsc
   lyjaXuedNUet7PHDDHxguqSOFJWfIO/E0+UUsSk2O0AETohRjRgjLn/gw
   +TiXTTCuaSxlUPHxaLx7EoE/pzEy0UA9Pb4MTXgTc7/UIc4ILqILNUSGr
   A==;
X-CSE-ConnectionGUID: Sr5veJrFRJKf29StAjBFrg==
X-CSE-MsgGUID: i6iVfxVURxeqiPvy4Pg0Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42113178"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42113178"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 23:36:02 -0800
X-CSE-ConnectionGUID: aqZAzo3JSz+NvVvK7STsJQ==
X-CSE-MsgGUID: mv817oEmRneUI4679visZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88098094"
Received: from lkp-server01.sh.intel.com (HELO 8eed2ac03994) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 23:36:01 -0800
Received: from kbuild by 8eed2ac03994 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBUOU-00004N-2V;
	Thu, 14 Nov 2024 07:35:58 +0000
Date: Thu, 14 Nov 2024 14:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 1876c788bba174660b538dcf5d1bc2b75d7f6d66
Message-ID: <202411141442.S40LYZXW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_233604_182954_FFDC8768 
X-CRM114-Status: UNSURE (   5.36  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: 1876c788bba174660b538dcf5d1bc2b75d7f6d66  Merge tag 'qcom-drivers-for-6.13-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/drivers

elapsed time: 734m

configs tested: 53
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allyesconfig    clang-20
arm64                            allmodconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241114    clang-19
i386        buildonly-randconfig-002-20241114    gcc-11
i386        buildonly-randconfig-003-20241114    gcc-12
i386        buildonly-randconfig-004-20241114    gcc-12
i386        buildonly-randconfig-005-20241114    gcc-12
i386        buildonly-randconfig-006-20241114    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241114    gcc-12
i386                  randconfig-002-20241114    gcc-12
i386                  randconfig-003-20241114    clang-19
i386                  randconfig-004-20241114    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                               rhel-8.3    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

