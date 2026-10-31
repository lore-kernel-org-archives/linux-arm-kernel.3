Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lzLXhXEP;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JihZ0ji1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UlBttvbTfPH6bD8qwAPRvEvBrmgF2s7FgvULNFDejzM=; b=lzLXhXEP1IJQNzbpiNAoPysWVV
	s2poYIDYGx5vc7QNmUJUswUmQ+MD8Bxm8FbqgOJzHIXjKPEqpAQwWF0hz3RDUk6QpVf+DlIxeCZSN
	lZchdx0WjGbS3awud3F4pjMzaUOGOYF4II69PwHmRA9gXven7LzRawUo7EPZvAOlACGJ9hWWmUGEL
	Dtu8Tg47VeDFPCgUy+GsNYBENViJt0UzGh/Zt1dq3s0+7aZ9KY/9s4bUYRqWd5HF1ypRI1taBCmIM
	xrVisNKc/wnXJfM1KnrSQFQTp2i7IxpxSzI15ZlPsoKvU0M0is5k9dAoDg7iS1/vjG7qG44cMpddw
	9EsA1QZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyTA-0000000Cr27-0yp9;
	Sat, 31 Oct 2026 02:05:20 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyT7-0000000Cr1U-2EaF;
	Sat, 31 Oct 2026 02:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793412318; x=1824948318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFP0baAiFvMl7x0GJSmUU/DikfJl7LDgkFNhT+TL2Hc=;
  b=JihZ0ji1Oa2FEpQib77UNpOFcgowPdG9aHa9OTIuZeRexSpQOmqfNR+v
   hVraazopQiuAHFnYZ9iDnZS9NTCs6ZMtL9SuCrUm89Yx46zNfN0/reA7F
   +lTHI97ZuI1TT7+vmpkMhQhCx3db86r9H4cWizXXzYp/YBRQodIzNwg6g
   KuET09cPYAB9/RyJD+4Uma15GLO7NDv9i6Xeu2HhTDLivqiaupsiXbqk3
   VFffn7BSwByUoeSNbXCYEYhq4FFwNCoXhywP54/qC/EQwzaEWRFJxJkAq
   Q07DHcCVP8oZ6juLVx68gGmOy2x1HcPURNuvWQuN5f4EkQIwg5iUQYItP
   w==;
X-CSE-ConnectionGUID: GwmZErnnTC+NlNM+AM9clQ==
X-CSE-MsgGUID: qurwsl5MTGq08FAtWCnHFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2210048"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2210048"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:05:16 -0700
X-CSE-ConnectionGUID: rpu8b9TrR9KayjHTgqdWLw==
X-CSE-MsgGUID: gFTzgCr4SSm7mo8/J3eY3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5540397"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2026 19:05:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMySw-00000000cRg-0s3X;
	Sat, 31 Oct 2026 02:05:06 +0000
Date: Sat, 31 Oct 2026 10:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Icneowy Zheng <uwu@icenowy.me>,
	Han Gao <gaohan@iscas.ac.cn>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 3/3] drm/bridge: add TH1520 DesignWare MIPI DSI host
 controller
Message-ID: <202610311004.6oZFiXBi-lkp@intel.com>
References: <20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_190517_620185_50BCC335 
X-CRM114-Status: GOOD (  13.37  )
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

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c03c1a14507dfaf8b856c2608f9ac216021fc222]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-display-bridge-document-TH1520-MIPI-DSI-controller/20261030-154749
base:   c03c1a14507dfaf8b856c2608f9ac216021fc222
patch link:    https://lore.kernel.org/r/20261030-th1520-dw-mipi-dsi-v1-3-753f34fd304f%40iscas.ac.cn
patch subject: [PATCH 3/3] drm/bridge: add TH1520 DesignWare MIPI DSI host controller
config: arm64-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311004.6oZFiXBi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311004.6oZFiXBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311004.6oZFiXBi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c:445:22: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     445 |                 dev_err_probe(dev, ret, "Unable to get DSI registers\n");
         |                                    ^~~
   drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c:428:12: note: initialize the variable 'ret' to silence this warning
     428 |         int i, ret;
         |                   ^
         |                    = 0
   1 warning generated.


vim +/ret +445 drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c

   420	
   421	static int th1520_dw_mipi_dsi_probe(struct platform_device *pdev)
   422	{
   423		const struct dsi_chip_data *cdata;
   424		struct device *dev = &pdev->dev;
   425		struct th1520_dw_mipi_dsi *dsi;
   426		struct resource *res;
   427		void __iomem *base;
   428		int i, ret;
   429	
   430		dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
   431		if (!dsi)
   432			return -ENOMEM;
   433	
   434		dsi->dev = dev;
   435	
   436		dsi->syscon = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
   437		if (IS_ERR(dsi->syscon)) {
   438			ret = PTR_ERR(dsi->syscon);
   439			dev_err_probe(dev, ret, "Unable to get system controller regmap\n");
   440			return ret;
   441		}
   442	
   443		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   444		if (IS_ERR(base)) {
 > 445			dev_err_probe(dev, ret, "Unable to get DSI registers\n");
   446			return PTR_ERR(base);
   447		}
   448	
   449		cdata = of_device_get_match_data(dev);
   450		i = 0;
   451		while (cdata[i].reg) {
   452			if (cdata[i].reg == res->start) {
   453				dsi->cdata = &cdata[i];
   454				break;
   455			}
   456	
   457			i++;
   458		}
   459	
   460		if (!dsi->cdata) {
   461			dev_err(dev, "Failed to find chip data for this controller\n");
   462			return -EINVAL;
   463		}
   464	
   465		dsi->clk_ref = devm_clk_get_enabled(dev, "ref");
   466		if (IS_ERR(dsi->clk_ref)) {
   467			ret = PTR_ERR(dsi->clk_ref);
   468			dev_err_probe(dev, ret, "Unable to get PHY reference clock\n");
   469			return ret;
   470		}
   471	
   472		dsi->clk_cfg = devm_clk_get_enabled(dev, "phy_cfg");
   473		if (IS_ERR(dsi->clk_cfg)) {
   474			ret = PTR_ERR(dsi->clk_cfg);
   475			dev_err_probe(dev, ret, "Unable to get PHY configuration clock\n");
   476			return ret;
   477		}
   478	
   479		dsi->clk_pix = devm_clk_get(dev, "pixel");
   480		if (IS_ERR(dsi->clk_pix)) {
   481			ret = PTR_ERR(dsi->clk_pix);
   482			dev_err_probe(dev, ret, "Unable to get PHY pixel clock\n");
   483			return ret;
   484		}
   485	
   486		dsi->pdata.base = base;
   487		dsi->pdata.priv_data = dsi;
   488		dsi->pdata.max_data_lanes = 4;
   489		dsi->pdata.phy_ops = &th1520_dw_mipi_dsi_phy_ops;
   490		dsi->pdata.mode_valid = dsi_mode_valid;
   491	
   492		platform_set_drvdata(pdev, dsi);
   493	
   494		dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
   495		if (IS_ERR(dsi->dmd)) {
   496			ret = PTR_ERR(dsi->dmd);
   497			dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
   498			return ret;
   499		}
   500	
   501		return 0;
   502	}
   503	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

