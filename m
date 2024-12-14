Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3942E77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AynVHPy3qsIcPixt9wXeQVEl4t6/CeiWl3VBySp48qI=; b=BrLwP+HCxbMbZiiGpH7FlBBd4N
	yI2mQzdlU3HA7Zrg/x3FG+hwImPYdL/j7sexIryuYW5wW3EGER4YEvfbP2TkciD/CWBXuFg2PCv9L
	ASIFrLIMdkCGE6r2Bkam4Lq81iyuOPNzKjq7v3Hm3AdW0MbkVOc9T4LdjHIY9YhWFOUOPCC5V+OQy
	eys7UV4rQL/ksjzSP2GqVPCES287bBumhlGiG6uS7elqeW5DX0RwA2JPRD5gn3Ilwx0NrvySv3OFA
	zz+Mm8Ui6LkJHMgNqyxhOvm7+oVh13JhzzHzjmIv5UvSoOEqY1UZ4TLYNF8AQR350HsZ5gFDwPNfo
	w/puIQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMX9H-00000006nYr-3ELO;
	Sat, 14 Dec 2024 18:45:55 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW8J-00000006jO3-2uAN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734198051; x=1765734051;
  h=date:from:to:cc:subject:message-id;
  bh=8O6HIylMBgS1fi98kd/3peiBXFXmU9YrrN6lYixkvtk=;
  b=D92tkxKO9ytI3wMooybRoCARQbVoKWH338I//ZkkiRc4vbH8AIdoxRB+
   /c2GiLkyEXIkulfs7SV99RwoCkFB09BpWZQJ2a+ZWeNNIOtiIOP65MMcv
   JsVqCThlVayP+oAOMSUc3H9OR0jS8VuBxzujEKsNj62KyvuK2+ZgjRyx/
   g1ecTgUNHmvnrmqlGAen62rYYQBhfzTK66jqF549w0SBjv0RV8QZ2auU0
   a6Jb9CDdFrN4nUKoqtvFAMvINVBCZZOLfdWWJ435yy0tbN6zIstbkNR6p
   kNq9eRxEDe5AfM6a3MD0QG6XKnnKJSPdgxzEAsnRI8zAXJt2rtRmFSN5R
   w==;
X-CSE-ConnectionGUID: fSCvlCaYRjODh4k1yfr24w==
X-CSE-MsgGUID: XDNs7mj+T4a0vR4CO//tYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34782149"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34782149"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 09:40:51 -0800
X-CSE-ConnectionGUID: 02xdEIAkQ12OEY0WjrAe3Q==
X-CSE-MsgGUID: 8V4TZJeYQsePo51nm4HrPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="96884401"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2024 09:40:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMW8F-000D6s-28;
	Sat, 14 Dec 2024 17:40:47 +0000
Date: Sun, 15 Dec 2024 01:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 160825131614bbf0afaee837180391e313d9d08b
Message-ID: <202412150110.TsOzD253-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_094051_740464_2E6DB952 
X-CRM114-Status: UNSURE (   4.49  )
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
branch HEAD: 160825131614bbf0afaee837180391e313d9d08b  arm64: defconfig: Enable Amazon Elastic Network Adaptor

elapsed time: 1446m

configs tested: 4
configs skipped: 120

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64  randconfig-001-20241214    clang-15
arm64  randconfig-002-20241214    clang-20
arm64  randconfig-003-20241214    clang-15
arm64  randconfig-004-20241214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

