Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD22C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ABJ37/WI1CB55EvMnguSTLHMUUNf1p1/dEgpm6yM/aY=; b=ncaHZDfEjXg+BfaqzZ/qMGEgQ+
	YY/fY+cdXaF4qlFwTgHyiXlH0/+MBFPjmdSBA9+fsl04A5R+YeC6waGwHjxwCelydAnVqM9yg4jUv
	TplOqrZEK3kxtUp099AehA+K8+s+xVZI8GEFnNtu29gygUrYUJqHW1J3Qhh/2/EsP/Ln8r6/lrkvx
	QJiP5rrV7H43FHKlQkF29D1MML5UHdNbhwwo+j8Eb2K+02Z1W6XUDSAPSrfKC3X9wnZfbF1Xqvv9Y
	XwX6mbHxj0bG4g/V3mLyr8Yv/S6dbyniQE/gwqc8PeMSMYyzn23Ojiu9cwzJt71ng9Si2sp3rQUcw
	QM68cpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOU5-0000000DOEp-0XtX;
	Thu, 20 Mar 2025 22:35:29 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOSN-0000000DO2l-1LDK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742510023; x=1774046023;
  h=date:from:to:cc:subject:message-id;
  bh=2JQgqWczsAmhPpv/lAE/FjK07vKuxZU7mI3LWXPGoog=;
  b=ZDrIzAeZB0mNegEigSLOHqep/Yi5+qrw1Wt5ssEviCk6v9/LdX/cfHXa
   k73X+Bjfu5F/Pd4M9zqd9ArOQBeL1KIu9BZRUYPimSZgVgw0YDbEBtQzA
   nZAseRit3utdbdOJo6aF2dckURTYML73401l8ugJ5GyhllMelGmMwjB0K
   G9JTfMkZ4SQc6+7vyFLmdnYfNzjEX2pDt8Gd9dZxqbN/JOj6I0PVF79F6
   QaXZwoSAl04vtPrdd0K5asivYGsId0VOo00HJz9fc/UKRFaL9X6WyBZul
   vG8Z2HuJx5P7D85WHlbm8b3ipp3IEiu3Ddh7H42nfqEu52pXZEUXG6RBB
   Q==;
X-CSE-ConnectionGUID: pspyRrqXQ0m06iHnBj3l6w==
X-CSE-MsgGUID: AUtkxURoQAejgNuWEPH7NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43014940"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43014940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 15:33:42 -0700
X-CSE-ConnectionGUID: 2MMEnD2ASDSj0vBEm1RruQ==
X-CSE-MsgGUID: Zuho++keTUqGpErPR4SYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123402681"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2025 15:33:41 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvOSJ-0000pV-1G;
	Thu, 20 Mar 2025 22:33:39 +0000
Date: Fri, 21 Mar 2025 06:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 701340d3b78bcd72fee54aa481b5a4ac84c7ff2a
Message-ID: <202503210606.Ux5TtELF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_153343_398271_5ED56849 
X-CRM114-Status: UNSURE (   4.92  )
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
branch HEAD: 701340d3b78bcd72fee54aa481b5a4ac84c7ff2a  Merge tag 'qcom-arm64-defconfig-for-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

elapsed time: 1444m

configs tested: 13
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-14.2.0
arm                allnoconfig    clang-21
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20250320    clang-20
arm    randconfig-002-20250320    clang-16
arm    randconfig-003-20250320    gcc-8.5.0
arm    randconfig-004-20250320    gcc-6.5.0
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-14.2.0
arm64  randconfig-001-20250320    clang-21
arm64  randconfig-002-20250320    clang-21
arm64  randconfig-003-20250320    clang-19
arm64  randconfig-004-20250320    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

