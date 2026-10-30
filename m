Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F73606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4AAtHlSw;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=deYWnbs+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F70gIwgZ1AIc0esVPNFxexisouK3InPKKs0HU/1v7Rg=; b=4AAtHlSwCeJnHZg5grkxG1fVTL
	HW0IM2sTx8CgI+1z+Xn5GOSNRQ6QOwWC5aqsY/b8XvB2llH7I8nWLy66HstLsf0yjUWjdDZrTFv81
	wlprhPYSplGPa5J+FB4jdTPnjbhoHITccCsEk+pZN+PioeYo687eVB1QAbA9bXqe/ngnOg97ag64J
	aBvCQXq0j8bzqL0ZklI7sXlchYuWMvWFBL33ulANfuH2B5nnGToWGz61/grYjWUds1mE4SNW0IJvv
	XL2EbcSGP8ZcSf8n0L+EBv1qh2bXBHNoLK0Yq/axo1nUacvxJRO88SGDDh0VYKnAd9/KeJA1BzFH2
	YcCrZqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuUI-0000000Cdst-3bP6;
	Fri, 30 Oct 2026 21:50:14 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuUE-0000000CdsD-3FZm;
	Fri, 30 Oct 2026 21:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793397011; x=1824933011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKLx77do1ym/bkZyNKLZrHNEuYscbJOKYkmhw++EjI0=;
  b=deYWnbs+mug5VkO44wtpiGBBgnGzp9nOkLpYzDDFSlLxpDiBho5P2byV
   hUl0tPyfu7CdXXO4/ynLvzTT5Y9vO6FFR49H7qR6MUqVe9ZrhEtsEjJY3
   q557znVe9cuRxnTNBquzZhMP1WiOq0w1dr+ojknMhqcLYammVx1N2VJsx
   suueJlGah3wcZPAE8kc+7FlJeLP8vlFYoBhf+HMQ/izEYNOBXZGyYvjZm
   wq9coYBD5U3C2WYDswG+AW2UTY0GpYsievLVWVhVAVD4tD5VPLbfWgq3N
   QFdKlBOtDk0Yq5nr48TciY7oscU6LrhR1wLlYKjCjCJo5zqgM3p7IAZ/S
   w==;
X-CSE-ConnectionGUID: O5IwEJ36TTC0oO1DAXLOJg==
X-CSE-MsgGUID: XX0vwnlkR1OvSa5VEbOg9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2174848"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2174848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:50:09 -0700
X-CSE-ConnectionGUID: rE/zM/d2SOaEvZMTDbuwHA==
X-CSE-MsgGUID: mb1n3kecRtCvzzoLquf+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5618458"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2026 14:50:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMuU6-00000000cH0-0Klx;
	Fri, 30 Oct 2026 21:50:02 +0000
Date: Sat, 31 Oct 2026 05:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: vop2: Use
 drm_format_info_min_pitch() for plane offsets
Message-ID: <202610310517.O99iZZoW-lkp@intel.com>
References: <20261029081429.862-2-kernel@airkyi.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029081429.862-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_145010_873285_AEFB4CEE 
X-CRM114-Status: GOOD (  10.46  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on rockchip/for-next linus/master v7.3 next-20261029]
[cannot apply to linux-review/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261022-151735]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261029-161427
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261029081429.862-2-kernel%40airkyi.com
patch subject: [PATCH v2 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261031/202610310517.O99iZZoW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310517.O99iZZoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310517.O99iZZoW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/rockchip/rockchipdrm.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

