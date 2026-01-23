Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB41D72348
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ak2ukuGBc+Ys62uKbyQTY4W4bSjYwRQNwZcxuDSuWU=; b=HdWKZIIyNz9Oi3kdZ6LJOxNMAE
	2uSPzUfJEashA1ug72NNLtieVrllRZ9LiDO9WLKFUvtNTL2auJk31EhWB+DfRl/kInWHjG2VuUTdV
	VbrbHplDx/epiDSqSjttju77oGtMQb1Cok2z/Cq+huK9n2Pog6CtiQlkFTmhca3rZqlnm5JHQLpdZ
	yVpC+48+ONMTfOhmSgmXisGhXuAqHGjIphP7zyp48O7RRLWkziV+t2NixrGFxkUue39YIAZylW25z
	aKuT5CAc/0xzb9vzyfk+91yuMO+5BLRil2Od9KWlSUpoTRshb3fql7ff62neEU/ywe4O0IC1L3sLD
	mOs6ZOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCJy-00000008RkB-3oPj;
	Fri, 23 Jan 2026 08:15:10 +0000
Received: from mail-m21472.qiye.163.com ([117.135.214.72])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCJv-00000008RjJ-0ISM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:15:09 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31b860454;
	Fri, 23 Jan 2026 16:14:55 +0800 (GMT+08:00)
Message-ID: <1c275ed9-70ee-4eba-b3d5-0f0c19a3a2d1@rock-chips.com>
Date: Fri, 23 Jan 2026 16:14:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, oe-kbuild-all@lists.linux.dev,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH 1/3] mmc: dw_mmc-k3: Remove mshc alias support
To: kernel test robot <lkp@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>
References: <1769132482-177365-2-git-send-email-shawn.lin@rock-chips.com>
 <202601231543.IzsYNOzJ-lkp@intel.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <202601231543.IzsYNOzJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9be9ebaeb309cckunmd7e25a7d1ac2f7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpNQ1ZDTEtNGEhJTEIZT0pWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RXAH0D89cH6q4GBkk69sDDStWYj96MI9ROl/xzkurdP1fq3lqI96TU1NMhbcS6teqcUJn7+YeG5v2+7V/bEmEn770Mup6IywksNpKXjV0hGBB4sk2kWxJg5uWp3xQ67LDK30F5xAHbJ/FfbwWPH/gVm4VSQB/xtZtSX/74qCj30=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7ak2ukuGBc+Ys62uKbyQTY4W4bSjYwRQNwZcxuDSuWU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_001507_782011_30E3CDBB 
X-CRM114-Status: GOOD (  17.23  )
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

在 2026/01/23 星期五 15:59, kernel test robot 写道:
> Hi Shawn,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on linus/master ulf-hansson-mmc-mirror/next v6.19-rc6 next-20260122]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/mmc-dw_mmc-k3-Remove-mshc-alias-support/20260123-095950
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/1769132482-177365-2-git-send-email-shawn.lin%40rock-chips.com
> patch subject: [PATCH 1/3] mmc: dw_mmc-k3: Remove mshc alias support
> config: arc-randconfig-002-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231543.IzsYNOzJ-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231543.IzsYNOzJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601231543.IzsYNOzJ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/mmc/host/dw_mmc-k3.c: In function 'dw_mci_hs_set_timing':
>     drivers/mmc/host/dw_mmc-k3.c:220:16: error: 'struct dw_mci' has no member named 'mmc'

I think this is a false-positive warning as it's based on latest
linux-next tree.

>       ctrl_id = host->mmc->index;
>                     ^~
>>> drivers/mmc/host/dw_mmc-k3.c:217:18: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
>       struct k3_priv *priv;
>                       ^~~~

But this one is indeed a valid warning, will fix.

Thanks, lkp.

> 
> 
> vim +/priv +217 drivers/mmc/host/dw_mmc-k3.c
> 
> 0293efddaddfcb Zhangfei Gao        2015-05-14  207
> d53e39b1131c08 Shawn Lin           2026-01-23  208  static int dw_mci_hs_set_timing(struct dw_mci *host, int timing,
> 361c7fe9b02eee liwei               2017-08-11  209  				     int smpl_phase)
> 361c7fe9b02eee liwei               2017-08-11  210  {
> 361c7fe9b02eee liwei               2017-08-11  211  	u32 drv_phase;
> 361c7fe9b02eee liwei               2017-08-11  212  	u32 smpl_dly;
> 361c7fe9b02eee liwei               2017-08-11  213  	u32 use_smpl_dly = 0;
> 361c7fe9b02eee liwei               2017-08-11  214  	u32 enable_shift = 0;
> 361c7fe9b02eee liwei               2017-08-11  215  	u32 reg_value;
> 361c7fe9b02eee liwei               2017-08-11  216  	int ctrl_id;
> 361c7fe9b02eee liwei               2017-08-11 @217  	struct k3_priv *priv;
> 361c7fe9b02eee liwei               2017-08-11  218
> 361c7fe9b02eee liwei               2017-08-11  219  	priv = host->priv;
> d53e39b1131c08 Shawn Lin           2026-01-23 @220  	ctrl_id = host->mmc->index;
> d53e39b1131c08 Shawn Lin           2026-01-23  221
> d53e39b1131c08 Shawn Lin           2026-01-23  222  	if (ctrl_id >= TIMING_MODE)
> d53e39b1131c08 Shawn Lin           2026-01-23  223  		return -EINVAL;
> 361c7fe9b02eee liwei               2017-08-11  224
> 361c7fe9b02eee liwei               2017-08-11  225  	drv_phase = hs_timing_cfg[ctrl_id][timing].drv_phase;
> 361c7fe9b02eee liwei               2017-08-11  226  	smpl_dly   = hs_timing_cfg[ctrl_id][timing].smpl_dly;
> 361c7fe9b02eee liwei               2017-08-11  227  	if (smpl_phase == -1)
> 361c7fe9b02eee liwei               2017-08-11  228  		smpl_phase = (hs_timing_cfg[ctrl_id][timing].smpl_phase_max +
> 361c7fe9b02eee liwei               2017-08-11  229  			     hs_timing_cfg[ctrl_id][timing].smpl_phase_min) / 2;
> 361c7fe9b02eee liwei               2017-08-11  230
> 361c7fe9b02eee liwei               2017-08-11  231  	switch (timing) {
> 361c7fe9b02eee liwei               2017-08-11  232  	case MMC_TIMING_UHS_SDR104:
> 361c7fe9b02eee liwei               2017-08-11  233  		if (smpl_phase >= USE_DLY_MIN_SMPL &&
> 361c7fe9b02eee liwei               2017-08-11  234  				smpl_phase <= USE_DLY_MAX_SMPL)
> 361c7fe9b02eee liwei               2017-08-11  235  			use_smpl_dly = 1;
> df561f6688fef7 Gustavo A. R. Silva 2020-08-23  236  		fallthrough;
> 361c7fe9b02eee liwei               2017-08-11  237  	case MMC_TIMING_UHS_SDR50:
> 361c7fe9b02eee liwei               2017-08-11  238  		if (smpl_phase >= ENABLE_SHIFT_MIN_SMPL &&
> 361c7fe9b02eee liwei               2017-08-11  239  				smpl_phase <= ENABLE_SHIFT_MAX_SMPL)
> 361c7fe9b02eee liwei               2017-08-11  240  			enable_shift = 1;
> 361c7fe9b02eee liwei               2017-08-11  241  		break;
> 361c7fe9b02eee liwei               2017-08-11  242  	}
> 361c7fe9b02eee liwei               2017-08-11  243
> 361c7fe9b02eee liwei               2017-08-11  244  	mci_writel(host, GPIO, 0x0);
> 361c7fe9b02eee liwei               2017-08-11  245  	usleep_range(5, 10);
> 361c7fe9b02eee liwei               2017-08-11  246
> 361c7fe9b02eee liwei               2017-08-11  247  	reg_value = FIELD_PREP(UHS_REG_EXT_SAMPLE_PHASE_MASK, smpl_phase) |
> 361c7fe9b02eee liwei               2017-08-11  248  		    FIELD_PREP(UHS_REG_EXT_SAMPLE_DLY_MASK, smpl_dly) |
> 361c7fe9b02eee liwei               2017-08-11  249  		    FIELD_PREP(UHS_REG_EXT_SAMPLE_DRVPHASE_MASK, drv_phase);
> 361c7fe9b02eee liwei               2017-08-11  250  	mci_writel(host, UHS_REG_EXT, reg_value);
> 361c7fe9b02eee liwei               2017-08-11  251
> 361c7fe9b02eee liwei               2017-08-11  252  	mci_writel(host, ENABLE_SHIFT, enable_shift);
> 361c7fe9b02eee liwei               2017-08-11  253
> 361c7fe9b02eee liwei               2017-08-11  254  	reg_value = FIELD_PREP(GPIO_CLK_DIV_MASK, GENCLK_DIV) |
> 361c7fe9b02eee liwei               2017-08-11  255  			     FIELD_PREP(GPIO_USE_SAMPLE_DLY_MASK, use_smpl_dly);
> 361c7fe9b02eee liwei               2017-08-11  256  	mci_writel(host, GPIO, (unsigned int)reg_value | GPIO_CLK_ENABLE);
> 361c7fe9b02eee liwei               2017-08-11  257
> 361c7fe9b02eee liwei               2017-08-11  258  	/* We should delay 1ms wait for timing setting finished. */
> 361c7fe9b02eee liwei               2017-08-11  259  	usleep_range(1000, 2000);
> d53e39b1131c08 Shawn Lin           2026-01-23  260
> d53e39b1131c08 Shawn Lin           2026-01-23  261  	return 0;
> 361c7fe9b02eee liwei               2017-08-11  262  }
> 361c7fe9b02eee liwei               2017-08-11  263
> 


