Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D74D41D46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBwiPjkDGc7BIiw4ZV3N4xRkpbJBKcbCoPljAEoAfXc=; b=G4Xrr5UAODNa+UrenKIiR8H55Y
	q7XTCCYxyxbRs+Efokvq2GYdLPRF4scriIlFMFR/+pnOjzBUvYbULgf8JtIcYXLZ8alQfr1kwnP2g
	tYxdrUztnRc6m0vmFwIkH24opqGvHID9lgMe+ym30f8oev+Cem8IJuHTPzsKzuNxUhdHt5QjFsKRF
	AWOaLf20uA5dwvEiMf0yEajELwzGpMMgZRq0oGlJMTTloYN1cKwq+qxIu7dYJ9/Cmmp/CKFsVdllL
	dJ3FqrgFYBxSoYrrRUVX8Zu4PHyPNqDasRpQCF/JRuoDCmrWP4RgkslmjdgVTi3lvKx6zX9mfS6T0
	xNFwQ48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYhL-00000009raN-0LVg;
	Thu, 14 Nov 2024 12:11:43 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYfK-00000009rGs-2gbn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 12:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731586179; x=1763122179;
  h=date:from:to:cc:subject:message-id;
  bh=5vwy9R/dOTw2upgapFgITNhK8+9WXgFcqS14dS54HaQ=;
  b=Qw96LOsmMjo4IDwxyenMPJFkpPmrCjYfy3NfkPNEeTFPjLLVo/q92o2r
   5IpjLp5Lr3VTYcEISobNWSUv9uP8oM9bmofW40bcigmTxUjjWXXVLYy2I
   dXDnjMBUM+viSAgdWv5hkAU9i04Wm+38KT1qf1jLao/+r8PJ6LmlcCMR8
   kJEWi7MHlBc2kpldUm6bOfer4jI1xemEEusQmV6o4FtPfwaD21Gv2CUVH
   ZTrBmi1re17luPShNASJqMDA8XaJCjyS6r35xfp0AHL3z/wujvT7AYaPd
   JDKxToq5JR1Sqo4uh9i7+tjBu9k6BS+Jt7fisaN6K7EHNPgaALdcmfnFN
   g==;
X-CSE-ConnectionGUID: Ta2R9Q21QOS4wzY8C3I72g==
X-CSE-MsgGUID: v+Ghe1mKQKelFKNNOlmHyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31304320"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31304320"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 04:09:37 -0800
X-CSE-ConnectionGUID: PZcsBHDwTzyr9NrR/XwUCw==
X-CSE-MsgGUID: yzsMCZI+RcuMsVig6m48Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88170750"
Received: from lkp-server01.sh.intel.com (HELO cf353f978a24) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2024 04:09:36 -0800
Received: from kbuild by cf353f978a24 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBYfF-00007f-1z;
	Thu, 14 Nov 2024 12:09:33 +0000
Date: Thu, 14 Nov 2024 20:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 de6dff2090ddfa74ae53e3e52243a9b9f3ff8526
Message-ID: <202411142026.FwKbnTeu-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_040938_811264_8CAB9D08 
X-CRM114-Status: UNSURE (   5.16  )
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
branch HEAD: de6dff2090ddfa74ae53e3e52243a9b9f3ff8526  Merge tag 'at91-defconfig-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/defconfig

elapsed time: 722m

configs tested: 11
configs skipped: 124

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-14.2.0
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20241114    gcc-14.2.0
arm    randconfig-002-20241114    gcc-14.2.0
arm    randconfig-003-20241114    gcc-14.2.0
arm    randconfig-004-20241114    clang-14
arm64             allmodconfig    clang-20
arm64  randconfig-001-20241114    clang-20
arm64  randconfig-002-20241114    gcc-14.2.0
arm64  randconfig-003-20241114    gcc-14.2.0
arm64  randconfig-004-20241114    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

