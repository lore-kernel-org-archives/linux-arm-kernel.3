Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5C1606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 05:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4zmi5RG;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUgD4eHz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbQx3F5DeqIg01v5J1HMAoVNtPC3XJeQSCQTqpj8efU=; b=Z4zmi5RGmxIVvLHSaG7rTVBgD0
	5oklHuEfSYu71rDoEpv8OzLyeNPypSQPg8sshOY3/U05/AEAdPAS8WMYq2gLSzLdjdcnsuV78TXkW
	DleRhXlFANdeOxqJptkzpcwETlkjqDYaE/ADiJM6zjLtecm+8PvBJ+3kieZW8cjnGGUDTWJnIHd/e
	ryP4pH74hai0LEI5W1shbqmcRHrNMRjeLPz9WexQaMLyQWralLUfdoE1rJvRFu/2K6+nr360FNcJZ
	VDIow9RizqUScfT+LjTO4AY9UlSvfe7n3aiV8zG1ZclyAd0nY3dg9Z8hwTG/+AsNrOYP2kVi9hD2K
	R+FLrR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2Xv-00000008swG-3njo;
	Tue, 20 Oct 2026 05:37:59 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2Xt-00000008svY-1y8I;
	Tue, 20 Oct 2026 05:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792474678; x=1824010678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CgbzEe28G1zTrLdrNfJYfgWctwC1jg4tju9+nzpN6Co=;
  b=RUgD4eHzpPUBnKZVvbHMKd1EjVoOsXRWo6EQDyyqUB0lu9O/9vJu4qCU
   mMteyl3wn7+JrFaj5kwOUJZ2mE1sR3dXQ56UubBuxDKTvZGd7Amn61jna
   6CY4EUNUBvZHMJK+itmyRzXLD8ElYjfS58eUa/UzcAYcxDUu48Chn35wZ
   vHppLPPXUG1U9YlokzMZlDofYpmzn66Ma+5B/2+1bTpTFfbJlilbQW6f0
   JwfZoBcnwM0GaGTVGZXvHjb+5m3hl6caf4Sw/9F/RwrwR8qHbh3fFAEdb
   szrftpmu8eOhW2J0bZtMpi0RtslsaOjgDX9KyZ7WDdq/raCxZr1dXehXI
   A==;
X-CSE-ConnectionGUID: Idbtw06lTnWfvwZjw53nEw==
X-CSE-MsgGUID: A1xnM17uSSaZWweY1N8hQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1059048"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1059048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 22:37:57 -0700
X-CSE-ConnectionGUID: LV6bCR60Sxa6Yc/YIXoDCg==
X-CSE-MsgGUID: WFK0iYt7RvyviF8oI28nAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2691338"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2026 22:37:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ2Xh-00000000Mxi-3lzb;
	Tue, 20 Oct 2026 05:37:45 +0000
Date: Tue, 20 Oct 2026 13:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 11/14] drm/bridge: analogix_dp: Use
 bridge->next_bridge instead of plat_data field
Message-ID: <202610201323.RdqouIbq-lkp@intel.com>
References: <20261019085836.3065008-12-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019085836.3065008-12-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_223757_521928_4685824C 
X-CRM114-Status: GOOD (  11.46  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to daeinki-drm-exynos/exynos-drm-next linus/master v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Return-bitmask-from-analogix_dp_get_irq_type/20261019-165823
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261019085836.3065008-12-damon.ding%40rock-chips.com
patch subject: [PATCH v4 11/14] drm/bridge: analogix_dp: Use bridge->next_bridge instead of plat_data field
config: parisc-randconfig-1001-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201323.RdqouIbq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201323.RdqouIbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201323.RdqouIbq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/bridge/analogix/analogix_dp.ko: symbol 'devm_drm_of_display_mode_bridge' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

