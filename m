Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3D3EEF310
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnaIxSC2LS6If8I6sOgV+y/KifrTrn+6WKumtOU0JzM=; b=JkCjS1FhvJ81dOT37FXByXFFug
	L+xGhQaeRHglgM0u0aWEcq7RGjBYvu5p6KYF9FfBIDW5Sxvm/wE/a7bygvki1IB6AD3sgZdE6hWCQ
	EnsP805P2dAicy4roRC/fvC87EzaGkyrACRaQRK2I+i7plBJqETHxUSDXWY2Puy+PwRrBPycM3KYz
	TFbqGXQqPI0yEHSmvpkDfM9f9YUSuBeOLcdxA0sCGza6h108BLf5OAHqzzkTRWYupxt15992VvAhq
	oRvrwjS6mWOKYSwAqepxeFeNa1Xrux2WMH9vFX2PYwaPKEM95lLQ+di/UJQrx4FFCJ6qQf7/yX17H
	xwnmzGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2sk-0000000149e-4Bf8;
	Thu, 05 Mar 2026 07:12:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2sj-0000000149K-17Rk;
	Thu, 05 Mar 2026 07:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UnaIxSC2LS6If8I6sOgV+y/KifrTrn+6WKumtOU0JzM=; b=ihR8wa0DAhhgu3sbspEvqXve/r
	vPtflKpTlaWjrJ6/bpxtjrMDElVYLwuPclHQYxFGB+kGCcHZrue1y/08/KQ7/5hA8qFNR6NdIWZVf
	hi/9Wb5+E1bADcb5jM4lt8DFfSee0/WobvMiq2xlkFY9zOncKJbM1svEAjvRNaPpflDgVERfH+ykn
	JpfqMpxkDwMsRGlosY/hzrxdhJH7yj0jI1SgjK0uQYkrIXydteR389yFEAMSS8PImAVn5CvBLxHbO
	ugENIS/eYw0OPudphjTiKLBaBO7xy5jlGwGxZbNwCXbFKWikaoYEMiw1LUlZTAYnz6pUX9WVoPhKn
	524BwDsA==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2se-000000066VY-1hCp;
	Thu, 05 Mar 2026 07:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772694741; x=1804230741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ckd6RCQ6IONLsgaMWgrBIGYHcBsTJjJ9DdtVhSQ9KCA=;
  b=MV66crMYNAbzhWpyY4agNPQvugBLcfQSfv4HLFOmgItzV5qggdAf1syC
   05YIf0+gZLzEiNxD9gkIW2jCaYwOpVXRhAjURJOyJ07WZFScvnP953b5Y
   K2XRiyb77b4cWbn5oLhJr9TVQ1N245Hdj6lffE6kKWi4zSvLuzcvmT/it
   0D676DHpm6PlYn5MAX2VzjX9rNqqbTtccLszkf1oi1/khbaskVSYPq3Eq
   w8AozpV/bLtvDXoGBbYPDUhiTJ9ijJUT8xp/eonDdXP4Kn6ubPKlxnFf7
   NH3FX1lWY1XZtRfeo0/98x1kHk0pam3CDfjYBqm/ovU/r1VCbTvy8Z4rn
   Q==;
X-CSE-ConnectionGUID: KtDjlzN3QMC/+g8XpZtIZw==
X-CSE-MsgGUID: rq0q+zddSrWir/enz5A3iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73472873"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73472873"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:12:15 -0800
X-CSE-ConnectionGUID: 20c1cHnATj2V3cSCBoXeAg==
X-CSE-MsgGUID: TSBDjWCGSiSURjZallYWzg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 23:12:08 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy2sP-0000000007i-0QK2;
	Thu, 05 Mar 2026 07:12:05 +0000
Date: Thu, 5 Mar 2026 15:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: Re: [PATCH net-next v3 2/3] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
Message-ID: <202603051555.5m64TOiy-lkp@intel.com>
References: <20260303061711.895-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303061711.895-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_071221_060118_DE194459 
X-CRM114-Status: GOOD (  11.11  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/lizhi2-eswincomputing-com/dt-bindings-ethernet-eswin-add-clock-sampling-control/20260303-142311
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260303061711.895-1-lizhi2%40eswincomputing.com
patch subject: [PATCH net-next v3 2/3] net: stmmac: eic7700: enable clocks before syscon access and correct RX sampling timing
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051555.5m64TOiy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051555.5m64TOiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051555.5m64TOiy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c: In function 'eic7700_dwmac_probe':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:290:33: error: assignment to 'void (*)(void *, phy_interface_t,  int,  unsigned int)' from incompatible pointer type 'void (*)(void *, int,  unsigned int)' [-Wincompatible-pointer-types]
     290 |         plat_dat->fix_mac_speed = eic7700_dwmac_fix_speed;
         |                                 ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:129:13: note: 'eic7700_dwmac_fix_speed' declared here
     129 | static void eic7700_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +290 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

   149	
   150	static int eic7700_dwmac_probe(struct platform_device *pdev)
   151	{
   152		const struct eic7700_dwmac_data *data;
   153		struct plat_stmmacenet_data *plat_dat;
   154		struct stmmac_resources stmmac_res;
   155		struct eic7700_qos_priv *dwc_priv;
   156		u32 delay_ps, val;
   157		int i, ret;
   158	
   159		ret = stmmac_get_platform_resources(pdev, &stmmac_res);
   160		if (ret)
   161			return dev_err_probe(&pdev->dev, ret,
   162					"failed to get resources\n");
   163	
   164		plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
   165		if (IS_ERR(plat_dat))
   166			return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
   167					"dt configuration failed\n");
   168	
   169		dwc_priv = devm_kzalloc(&pdev->dev, sizeof(*dwc_priv), GFP_KERNEL);
   170		if (!dwc_priv)
   171			return -ENOMEM;
   172	
   173		dwc_priv->dev = &pdev->dev;
   174	
   175		data = device_get_match_data(&pdev->dev);
   176		if (!data)
   177			return dev_err_probe(&pdev->dev,
   178					     -EINVAL, "no match data found\n");
   179	
   180		dwc_priv->eth_rx_clk_inv = data->rgmii_rx_clk_invert;
   181	
   182		/* Read rx-internal-delay-ps and update rx_clk delay */
   183		if (!of_property_read_u32(pdev->dev.of_node,
   184					  "rx-internal-delay-ps", &delay_ps)) {
   185			if (delay_ps % EIC7700_DELAY_STEP_PS)
   186				return dev_err_probe(&pdev->dev, -EINVAL,
   187					"rx delay must be multiple of %dps\n",
   188					EIC7700_DELAY_STEP_PS);
   189	
   190			if (delay_ps > EIC7700_MAX_DELAY_PS)
   191				return dev_err_probe(&pdev->dev, -EINVAL,
   192					"rx delay out of range\n");
   193	
   194			val = delay_ps / EIC7700_DELAY_STEP_PS;
   195	
   196			dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
   197			dwc_priv->eth_clk_dly_param |=
   198					 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
   199		}
   200	
   201		/* Read tx-internal-delay-ps and update tx_clk delay */
   202		if (!of_property_read_u32(pdev->dev.of_node,
   203					  "tx-internal-delay-ps", &delay_ps)) {
   204			if (delay_ps % EIC7700_DELAY_STEP_PS)
   205				return dev_err_probe(&pdev->dev, -EINVAL,
   206					"tx delay must be multiple of %dps\n",
   207					EIC7700_DELAY_STEP_PS);
   208	
   209			if (delay_ps > EIC7700_MAX_DELAY_PS)
   210				return dev_err_probe(&pdev->dev, -EINVAL,
   211					"tx delay out of range\n");
   212	
   213			val = delay_ps / EIC7700_DELAY_STEP_PS;
   214	
   215			dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
   216			dwc_priv->eth_clk_dly_param |=
   217					 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
   218		}
   219	
   220		dwc_priv->eic7700_hsp_regmap =
   221				syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
   222								"eswin,hsp-sp-csr");
   223		if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
   224			return dev_err_probe(&pdev->dev,
   225					PTR_ERR(dwc_priv->eic7700_hsp_regmap),
   226					"Failed to get hsp-sp-csr regmap\n");
   227	
   228		ret = of_property_read_u32_index(pdev->dev.of_node,
   229						 "eswin,hsp-sp-csr",
   230						 1, &dwc_priv->eth_phy_ctrl_offset);
   231		if (ret)
   232			return dev_err_probe(&pdev->dev, ret,
   233					     "can't get eth_phy_ctrl_offset\n");
   234	
   235		ret = of_property_read_u32_index(pdev->dev.of_node,
   236						 "eswin,hsp-sp-csr",
   237						 2, &dwc_priv->eth_axi_lp_ctrl_offset);
   238		if (ret)
   239			return dev_err_probe(&pdev->dev, ret,
   240					     "can't get eth_axi_lp_ctrl_offset\n");
   241	
   242		ret = of_property_read_u32_index(pdev->dev.of_node,
   243						 "eswin,hsp-sp-csr",
   244						 3, &dwc_priv->eth_txd_offset);
   245		if (ret)
   246			return dev_err_probe(&pdev->dev, ret,
   247					     "can't get eth_txd_offset\n");
   248	
   249		ret = of_property_read_u32_index(pdev->dev.of_node,
   250						 "eswin,hsp-sp-csr",
   251						 4, &dwc_priv->eth_clk_offset);
   252		if (ret)
   253			return dev_err_probe(&pdev->dev, ret,
   254					     "can't get eth_clk_offset\n");
   255	
   256		ret = of_property_read_u32_index(pdev->dev.of_node,
   257						 "eswin,hsp-sp-csr",
   258						 5, &dwc_priv->eth_rxd_offset);
   259		if (ret)
   260			return dev_err_probe(&pdev->dev, ret,
   261					     "can't get eth_rxd_offset\n");
   262	
   263		plat_dat->num_clks = ARRAY_SIZE(eic7700_clk_names);
   264		plat_dat->clks = devm_kcalloc(&pdev->dev,
   265					      plat_dat->num_clks,
   266					      sizeof(*plat_dat->clks),
   267					      GFP_KERNEL);
   268		if (!plat_dat->clks)
   269			return -ENOMEM;
   270	
   271		for (i = 0; i < ARRAY_SIZE(eic7700_clk_names); i++)
   272			plat_dat->clks[i].id = eic7700_clk_names[i];
   273	
   274		ret = devm_clk_bulk_get_optional(&pdev->dev,
   275						 plat_dat->num_clks,
   276						 plat_dat->clks);
   277		if (ret)
   278			return dev_err_probe(&pdev->dev, ret,
   279					     "Failed to get clocks\n");
   280	
   281		plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
   282		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
   283		plat_dat->clks_config = eic7700_clks_config;
   284		plat_dat->bsp_priv = dwc_priv;
   285		dwc_priv->plat_dat = plat_dat;
   286		plat_dat->init = eic7700_dwmac_init;
   287		plat_dat->exit = eic7700_dwmac_exit;
   288		plat_dat->suspend = eic7700_dwmac_suspend;
   289		plat_dat->resume = eic7700_dwmac_resume;
 > 290		plat_dat->fix_mac_speed = eic7700_dwmac_fix_speed;
   291	
   292		return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

