Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8C6CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dRX/Dq/tvmvSBjrG81RvC5n4dT7aVwhE5qaAjLShcg=; b=GevA5nFxqTt2RLtOncTvz2699L
	hubO7zCK5o6nu4iw7OnsO1T8jIidsAkntvv6nv3c+dJ/DL8Isw1E8R1rlMixaD75Hgt6mb4xWIgYa
	P1UFyc5d53H4d7/j+CWIV85bsioNORqbFHZPDU+CrO53j/r8+fR6Q9yTDnll5dntjzoF3glmavPyS
	/PRHxq7w3B0onJ8MHfhtBHbH7dwkeAy4ofQOD5aR4BbxAnYBxQxTzBXb5ciKu/ZPAXa3HErN108C8
	ba+royFrDLYza1Ei4rBZMaobKku7fMkPWt5Q/SmU6CpvmICCxynhGe2G4BPZwr97y65FpxXFPyyf1
	voSzJ0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97w6-00000002pka-1yss;
	Wed, 15 Oct 2025 20:17:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97w5-00000002pkE-17ki;
	Wed, 15 Oct 2025 20:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5dRX/Dq/tvmvSBjrG81RvC5n4dT7aVwhE5qaAjLShcg=; b=kKegNSrnbfzdQ2eFD0YPQ+TUoB
	l8BuYXriQ6+hOhSBM+49z97xzBd41ADBZPY9F4hSBhE88sKeGRXdSvYvheqVACAVM4IOn7wjrqULC
	ZbtGxLW23OQj4XpGA234wOtOxNccByX4ExsVDIAXSnYD5YxTTkeLd6VSIJ8zq/Vc/VIJGyU93i5Xk
	66PcLs1zjcFrdOQ1BHM6JG2TL9I5yUrsTsaJo6YeCp5EOr3OH7fzjxsOkVAofxtSVCtUz/0/ADIuy
	ya5miPoEg7E5j9cNavp4dsNuzMIwd1W6ePBChrLX0Dmu6PyufXsq7BhmC8cqvpNIkuuVV6eo2SpZZ
	m1aNA57A==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97vt-00000006E1s-3UEf;
	Wed, 15 Oct 2025 20:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760559434; x=1792095434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0v6EnKffs2NEkIH+eVz0aqecvPBLBrK+UWbvYlBHsO4=;
  b=j1Wq6ptCTHkolf9iTYmwMjbdF8zgeP4y6dN7se5cFvqgK4T7kingx/N3
   VD0x2QYmLnpRCNJWTGw2npgARyWpnYeF2AkLg174E3ZNp3QZru81YFYew
   Olutee96QKiTp5OCUnRmQqHExnbMi39M5u9LiErSCgpIPDF8gSQd+yjcg
   8dBUMVfMqELSPG1mRzZj3ppQr/55M+vZHBoVjebOdfa1qKpMyFK/Y3HEg
   uW/JAxKmeB2qpE44U5EJ88rq/p0zlUgAzBzMQ5msjwz/q0iPkuCwo26So
   7b4zrYIXaUGE6pqzDA+yDVnNvbyMhVV7MCwIu1GnnBk1t8Z8YIqDu+b+k
   w==;
X-CSE-ConnectionGUID: lERXDg74S4+2BlbCxQ5qZQ==
X-CSE-MsgGUID: HvuiOrx8QlCqKf8lYxgODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66396430"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="66396430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 13:17:05 -0700
X-CSE-ConnectionGUID: RPhexlMERmWcmPSSBcmGhw==
X-CSE-MsgGUID: 6M4kJJQaRH+ciw5Js1Ynag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="219416290"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2025 13:16:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v97vQ-0004CH-29;
	Wed, 15 Oct 2025 20:16:49 +0000
Date: Thu, 16 Oct 2025 04:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
Message-ID: <202510160419.8PPrVXUl-lkp@intel.com>
References: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_211720_172002_3273D78B 
X-CRM114-Status: GOOD (  13.80  )
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

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40a3abb0f3e5229996c8ef0498fc8d8a0c2bd64f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Frattaroli/dt-bindings-gpu-mali-valhall-csf-add-mediatek-mt8196-mali-variant/20251015-165256
base:   40a3abb0f3e5229996c8ef0498fc8d8a0c2bd64f
patch link:    https://lore.kernel.org/r/20251015-mt8196-gpufreq-v7-5-0a6435da2080%40collabora.com
patch subject: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
config: arm64-randconfig-002-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160419.8PPrVXUl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160419.8PPrVXUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160419.8PPrVXUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:8:
   In function '__free_device_node',
       inlined from 'mtk_mfg_probe' at drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:877:22:
>> include/linux/of.h:138:51: warning: 'shmem' is used uninitialized [-Wuninitialized]
     138 | DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
         |                                                   ^
   include/linux/cleanup.h:211:78: note: in definition of macro 'DEFINE_FREE'
     211 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c: In function 'mtk_mfg_probe':
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:877:29: note: 'shmem' was declared here
     877 |         struct device_node *shmem __free(device_node);
         |                             ^~~~~


vim +/shmem +138 include/linux/of.h

0829f6d1f69e4f Pantelis Antoniou 2013-12-13  126  
0f22dd395fc473 Grant Likely      2012-02-15  127  #ifdef CONFIG_OF_DYNAMIC
0f22dd395fc473 Grant Likely      2012-02-15  128  extern struct device_node *of_node_get(struct device_node *node);
0f22dd395fc473 Grant Likely      2012-02-15  129  extern void of_node_put(struct device_node *node);
0f22dd395fc473 Grant Likely      2012-02-15  130  #else /* CONFIG_OF_DYNAMIC */
3ecdd0515287af Rob Herring       2011-12-13  131  /* Dummy ref counting routines - to be implemented later */
3ecdd0515287af Rob Herring       2011-12-13  132  static inline struct device_node *of_node_get(struct device_node *node)
3ecdd0515287af Rob Herring       2011-12-13  133  {
3ecdd0515287af Rob Herring       2011-12-13  134  	return node;
3ecdd0515287af Rob Herring       2011-12-13  135  }
0f22dd395fc473 Grant Likely      2012-02-15  136  static inline void of_node_put(struct device_node *node) { }
0f22dd395fc473 Grant Likely      2012-02-15  137  #endif /* !CONFIG_OF_DYNAMIC */
9448e55d032d99 Jonathan Cameron  2024-02-25 @138  DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
3ecdd0515287af Rob Herring       2011-12-13  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

