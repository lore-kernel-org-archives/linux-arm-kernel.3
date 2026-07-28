Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D14C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 04:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ji6pwkGQ+ZzojlcubSeNRg5g8pZeiROG+fNezLW0/A0=; b=NyM/g033jdTUpF/nkNE1r5cOk9
	3e6x/Zfw46nIAFO7N0Dt+Gtp3FXtdjZEPcDjzNR+pF2NDP75VTBsDYGhZ7GAI2h8RRkYD537ePLA+
	/TAiZPC7J/jsMkLoJRaIXsFG1/cii6SN+fvxlJktwqhMijRulxdZdcdoQPZmybfrGaXfPwgA8XgyK
	R94Ym0XoEKwhO4J1ntfA3k/pU1HjGgCImxQtHwZ0KM6/DSc37tmjuVYGPZHlCTEwBPryd/gAC/8yi
	sf320X9PYBjXtSzuMgkAYIHS08b2lJn8aXmhCP9SSodNuK7Wfe/RGlcYPsKzuxRFt8CLGTEK3uoAI
	s3twfkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZk0-00000004PLE-0Ewp;
	Tue, 28 Jul 2026 04:48:32 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZjw-00000004PKt-2rNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 04:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785214109; x=1816750109;
  h=date:from:to:cc:subject:message-id;
  bh=18smv+ubaVGhBUq41FBoTntjDfAUn4Dvpu3JV2RzUK4=;
  b=dam5gTE2jlUsczGnCBfY65pUHzDZiLEwEU1uMfo7MM1lLeFcG+BO8m7i
   L9lT/5xzU6VRBwGrWlpx1+EmK1XTNLGcNL808QzSBEx/eM36RBBm5pkdV
   m2Y2ZeCGh4l2xQyZK8xBNcCs6Kr1eLEWmvY8eVe/9bO2V4wX6J2Nh2Y0h
   d/855X0X9letbBXpjx64eK05By849HjcKxFHZPcKOsTYZwaS91d5t56H2
   AECL0jkGnFVLKtQ41LIebHCuOBstjkmFOkY1L4XDW83JksXwF0XK/pdDQ
   1grUPnAOsTRIp/0KJHyhjpvmaV5vsDQAJbL0mtEtMvIK6xp4cJSYl2EFZ
   A==;
X-CSE-ConnectionGUID: sej00/OARVezsNAJ20haIA==
X-CSE-MsgGUID: qHbP3EehTma2QZ4IUkTmng==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85875536"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85875536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 21:48:28 -0700
X-CSE-ConnectionGUID: RRZxegA/Tu2KZZY1eFXrUg==
X-CSE-MsgGUID: vkRAiKgmRpCtdFvqBpx8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="264589938"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jul 2026 21:48:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woZjr-00000000dzn-3TJG;
	Tue, 28 Jul 2026 04:48:23 +0000
Date: Tue, 28 Jul 2026 12:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:firmware/scmi] BUILD SUCCESS
 9f7cd6a62aa754ed6b48cbd5d50de40add1bcc86
Message-ID: <202607281207.YyNE42c0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_214828_780174_16C607D9 
X-CRM114-Status: UNSURE (   5.05  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git firmware/scmi
branch HEAD: 9f7cd6a62aa754ed6b48cbd5d50de40add1bcc86  firmware: arm_scmi: Unrequest devices if driver registration fails

elapsed time: 5194m

configs tested: 12
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha    allnoconfig    gcc-16.1.0
alpha   allyesconfig    gcc-16.1.0
arc     allmodconfig    gcc-16.1.0
arc     allyesconfig    gcc-16.1.0
csky    allmodconfig    gcc-16.1.0
i386    allmodconfig    gcc-14
nios2   allmodconfig    gcc-11.5.0
nios2    allnoconfig    gcc-11.5.0
parisc  allmodconfig    gcc-16.1.0
parisc  allyesconfig    gcc-16.1.0
x86_64         kexec    clang-22
x86_64  rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

