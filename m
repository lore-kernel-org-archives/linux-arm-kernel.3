Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110E3E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chR1HAjMnyfOiDJ+2XPpMuguYHTdDdUbZVNojaT3kgA=; b=LHy6GAl1bwoIlrVikwjLOtwPOg
	f9HebhOfuEgUluKQaS6wZuSQG0uEdncyFG0fjMFI3Ol9dwQ3fEo294IQt/Nt/Gvzhzs+ajpAON7W9
	kwHU9Cn0/J3hlwG8rtPwGp/WxPdsC6AcAV9pZPKV46143LGo15R+1y0OUJkp5mUnxkQi+874jQ4M5
	wnn3lSsgj9wbzyjltanJEfDakOK2Yjwkhr9kJBdMDfeay+7CKgMQ8hqYMsbVWQtoTw40CMcMc8vJn
	dm8ZA6bXNMR26O1p3PkOY9HagUS2CtcyO9Lu9VuufXocN8jw0OnwnnS8KgjyU6Ha/9nVct4AehO8O
	At31tD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOvgt-00000006mSX-1SRv;
	Sat, 21 Dec 2024 09:22:31 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOvfj-00000006mQV-0EAH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 09:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734772879; x=1766308879;
  h=date:from:to:cc:subject:message-id;
  bh=gTRAnEzleqbNg6cVtuNcTYInbHPYeF7DyQIp3muYK9s=;
  b=duwNr6tQi+ls42RLvAFfaVNpE3qY0/9zckYuCJU3SDqe8I6tHw7a80MF
   6kxEmDZx6JXEB958qvKUY4X06uEZrZE5ZwmXNdhqXuCRrtCQwFLKLkNTb
   rK2BLpu7VETFfdITC2o5tY0CcUl3COTgT/EtNvgXeIy4FTDKLHI613oOr
   XCcqQyyr8my8y/MI1QIYW994r4LiOuwBi7HFdcGL9t9cE/rDjYVCgMluu
   HZ3BmWcuTNWJERx0pKFdW0QQHY0sr4iQZlcabgW7oy9RAIYU2rgK7zOvi
   fqigASstGb9UmojY+0kN5/7q31AFAiq5TDIHTvfMU163zVXyO7uRwVr+s
   A==;
X-CSE-ConnectionGUID: nhK02Q1cSI+NbinKjsLgMg==
X-CSE-MsgGUID: E8bXwza3Rei/yFZLAlTSag==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38153747"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="38153747"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 01:21:18 -0800
X-CSE-ConnectionGUID: 5lYWc0TNSEGYgqGgrFPLpg==
X-CSE-MsgGUID: fFlBEx+VSraMoJ3z7+xcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="99133157"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 01:21:17 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOvff-000271-1G;
	Sat, 21 Dec 2024 09:21:15 +0000
Date: Sat, 21 Dec 2024 17:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 2981c62fb6542cf84e5e5eabb40949cd2d038603
Message-ID: <202412211743.OCKTDFBl-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_012119_109646_6510F09B 
X-CRM114-Status: UNSURE (   4.95  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: 2981c62fb6542cf84e5e5eabb40949cd2d038603  Merge tag 'renesas-arm-defconfig-for-v6.14-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig

elapsed time: 908m

configs tested: 11
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-14.2.0
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20241221    gcc-14.2.0
arm    randconfig-002-20241221    gcc-14.2.0
arm    randconfig-003-20241221    gcc-14.2.0
arm    randconfig-004-20241221    clang-18
arm64             allmodconfig    clang-18
arm64  randconfig-001-20241221    clang-18
arm64  randconfig-002-20241221    clang-16
arm64  randconfig-003-20241221    clang-20
arm64  randconfig-004-20241221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

