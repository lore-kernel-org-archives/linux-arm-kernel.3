Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC212C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 04:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCmsp9y5FRbFu5q5BXYjlki2p22XzikbqGhuRMOQFL4=; b=i81+/tPHKzxN+3+BLamOO4u7z7
	Vs8hzHV3LznozcFW8umoZ0Oc9PTcS9pTB07zjel7xoHUI1/iUw8wP0B+aEwsQR3QDKko6BHjRgNZV
	9fVzk7Da0cWipUjcHm9Qf6kwr30toombSog8kJqG0C9OiitNKm/natJ5+UuOk3ImVpoYCpi/e+P74
	HmpbnIpMhLcOdBie3yD8VTpGtmUzsmyHJFe/fsN8ral+INsAghLIo7bsZ/5qyqPp2SrSgzBgz/ZUJ
	pbWPNu4nc9JH+ErZ1D2DLn5ECjDtemXqItQotgOF5Om27xB2JrTl1Nhm/CK/daZ4ojiTaaKWvfsUf
	bQEJ5QfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4wG-00000001H1w-2HVF;
	Tue, 22 Jul 2025 04:49:16 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3oK-00000001Bjc-1hdM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753155420; x=1784691420;
  h=date:from:to:cc:subject:message-id;
  bh=bYrbfDIJjmIaZdfGiWskaGsN8URZRQUCqzWyg0bgGvY=;
  b=nuUyGWn26Om/+1cSuvHx8yyjXt8o8s1UsI5devir2vpxqDd4BmZn3vk7
   eN6Gw87fCo06p3vYKn2I1W8XiGIJMsRBP4HYSXdQVmax+oDXkLp7MXpim
   CVFJrkbdgLPdsWqaBfZ3ExP2EWF52wsyn+AAVerZuAwGiL9DRybzgiT9P
   nUHfrUZazSNVafQNSolbaZAsrLx8XKAP9lN2KG8mREEY2Qk2Y7BKWp7Rs
   5GLLyWHUyS5geGLP88r8/F9Za26xnhakHQ0SZKH6QUV5U8L02Hv3nHdQj
   8R7DSIJOAMbU3GTirHZyLzHi6mGyh5YWFpOy0n7nnpLFVykHK4NHwgakq
   w==;
X-CSE-ConnectionGUID: 7xKwDEUxQjq1fgUcUDVMmA==
X-CSE-MsgGUID: uu72loAWRza0z3u/0dmo8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72958606"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="72958606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 20:37:00 -0700
X-CSE-ConnectionGUID: z33I7Qq3RoO9eVNWIkj7Ag==
X-CSE-MsgGUID: UnB91uOnThK4sTQKI6vbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="158340893"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2025 20:36:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue3oG-000HOm-2F;
	Tue, 22 Jul 2025 03:36:56 +0000
Date: Tue, 22 Jul 2025 11:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 816309d500ac34b9ae3ff88f130ca7dbbe467bfb
Message-ID: <202507221128.6puBaBYa-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_203700_457252_F6C775C5 
X-CRM114-Status: UNSURE (   5.65  )
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
branch HEAD: 816309d500ac34b9ae3ff88f130ca7dbbe467bfb  Merge tag 'sunxi-fixes-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes

elapsed time: 724m

configs tested: 6
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250722    clang-22
arm64  randconfig-002-20250722    clang-22
arm64  randconfig-003-20250722    clang-22
arm64  randconfig-004-20250722    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

