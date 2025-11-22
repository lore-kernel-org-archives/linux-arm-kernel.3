Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742D8CFD30D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 22:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=90ieWVEFnrmkah40DdoyKIPrvrjOMmfo0X2Y0d4qC9o=; b=j9oaulsZ23ZZn0O1E5z0bl+ehV
	UXR4sfjuVBpdk7P5y1odx6W7jUo8AV+vAYPlUQttAr2DbKEigKYCkOkrXQMhZp6vJAVe3aK5HffX5
	ln2Oto2eghoUjqgi3MaGasWOejyyrF7MaVp6ItVAXbBMtTVvw61ajKdNVpykD6yacDY5+QZekXrno
	JchIF9xb75QhhiEyfj9NNXC+2hwintGr5QG5cL9gc6cuuUmex3KTXVxmdch56ytfgN0/C4VzYno3J
	et/c3et3+0ajCyeMqA0btAsdtMc/hauksHliLPB0rNAlvb/4iTEmYgVBnMpeuhhJ9dqQ7sclA8zm7
	KDsrkSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMwEA-00000009w6d-3xQL;
	Sat, 22 Nov 2025 22:37:10 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMwE9-00000009w67-03Jb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 22:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763851029; x=1795387029;
  h=date:from:to:cc:subject:message-id;
  bh=06evhm11Q7L5GeVZ77SE0AVVK9kShMr2oUE+1331+2g=;
  b=QXzXkv6WRFAqtStb7PRykhK9hXMAAEDa2fWMRbwAiY+O/auseyfz+zg9
   xJxiPbZx7ANeFhX49ralBlnuX7192Ejz+P4WvhwfOdIxFYtakj4sqHfvl
   hegVN7yzI+DSe38n9/dmhRwPVS6Mq160IwcuDjM2KGUUT9D2+4zvIPy6X
   Hz8rHZCQHwE5qNS4s6uAAm/5zS+XqcKF2RahEwA/sJu9lZ6sjib5qWK5S
   9Q/CHpJA4aHtz5SHlrLH0ZBgihqm/1yA6zkOqmGJDqxpO3RrzeiCfzqJ9
   l6xBEVWsKvmjpBxRFF13BZm8Zs9GaRkT8Yg4k5fw1xqo1oTfhfRlcvwh6
   A==;
X-CSE-ConnectionGUID: BW2AcCWEThybqJDrzuFmHQ==
X-CSE-MsgGUID: hMMA7b3bSpyhHnbPAtgUWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65934583"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65934583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 14:37:07 -0800
X-CSE-ConnectionGUID: m+fIY40qR2SvmFRhyqkijQ==
X-CSE-MsgGUID: d7pnESvbTx+SotV5CWeiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191775373"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2025 14:37:06 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMwE4-0007sh-0b;
	Sat, 22 Nov 2025 22:37:04 +0000
Date: Sun, 23 Nov 2025 06:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:omap/defconfig] BUILD SUCCESS
 393f40ef96628f603b40e97b6da9847d20a904c0
Message-ID: <202511230646.96iLGo2D-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_143709_085451_2070B697 
X-CRM114-Status: UNSURE (   4.75  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/defconfig
branch HEAD: 393f40ef96628f603b40e97b6da9847d20a904c0  ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver

elapsed time: 1529m

configs tested: 1
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm  allnoconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

