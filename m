Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CD11077609
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G+0hc/VQL0gHqw5qxzFpOxuCLuK6qRVVjosnlUP3J8=; b=F2KW8wuZQ3xHVEkESdugLpbTrV
	JsLlAKHszdPWvzCgI5Uv6OJAHdjYpI8tJr+6vvIQG+Lt5ko30N2NJkiPYnfcl67ES/XunUuVkaHdl
	hZpA5wxJMY61hX+1cR8+leY100BV2zqmEDTxH9t487YKicre1f2HB2/F6fWuie+C//UBRq8vIn8ZH
	GEv5pxanhR3e7LKTjEQbysVgbJbvjvqKIYP1jgOxGUB5zX8nISw+JSo/jAhakWSl1JMHN6bW3T+A9
	FN27uyZuuQyNoQ4hy//8O+3cE01vu7NDlEkhEmDBHlt/k7HU3AX1h/6oOmEaXTK0dOt1djxoP5Hvu
	RDlPHfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wAG-00000009CWy-3KCa;
	Wed, 18 Mar 2026 19:02:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wAF-00000009CWW-1ny6;
	Wed, 18 Mar 2026 19:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1G+0hc/VQL0gHqw5qxzFpOxuCLuK6qRVVjosnlUP3J8=; b=DzlJ2/IDUIhFTnBN27PVjvGNrL
	qLfghHevTo6FiLMF14q8bx3KvDHN8tcB4SfEf4KYGf1hneAbw391SDK12FYSZyeAhrWLHpiR20Y0Q
	tyb1Dh3OBgRZLUYL8iAM5cqShXTtkXseO8p0SSm8JqiBQQVmoCgq7XXuw8kS5XU3bPjDwHVgtFTZK
	L7ws/9sFEMlwgBoyl61lhswmzqUr2tUZ8EQhOpEJYQWjZIQy3m6bgoGNLig1HzOABGH1sYDejEP2Q
	gKAVCMLG+KRb1qTOqgYJLVcVKgEM/OYGyelHGq2Wmte5lD9IbWR8Nc6U+M0URsdRGOZyBztFObdAg
	7M5D5c3w==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wAB-0000000C5qS-2O0p;
	Wed, 18 Mar 2026 19:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773860560; x=1805396560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XIwaunvaQN5MSz2DPfNECpeDO+PYa3DzRiYLu9KKQpA=;
  b=XhhJqitLfPJ9k6nFJLynhw4G+TU+KFA/0e1hOatBl8N5+gGQ54Gb1IcZ
   6zSXsnGDjfriLcQbLEW/hNN+r+z4oWSFI+sTFGltoavknf5vSmCZLcfv0
   3/EClrYIvC2fmfRt81WJ6Rl8QBx9woE+PTd4bHF5+xU9+asZjDMwI3Wci
   OgjnHGinfG5FqiuztKvHVnIey80+PRyYR8DJ4AXLZG8DcGP+tAhn10nom
   7sEKtsXPdezikdUKXOqkKGKTTk1pOhhE45k94UUp09sgR+TMmEhWT7L9B
   S+ved3Ov3FwbkSxUcSbRfAukaKvTkDGtxpSi1irCGTtolMbMI2CCvK9lM
   A==;
X-CSE-ConnectionGUID: 5fAptQjrRCmYJ3ignOADFw==
X-CSE-MsgGUID: PCSONI4MTHWLk1PP4QmBZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74839287"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74839287"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 12:02:34 -0700
X-CSE-ConnectionGUID: r+qX+cIKSd+zOG1mKDXMNQ==
X-CSE-MsgGUID: rqrMMi0WQPux3KNMprNQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247147805"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 12:02:31 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2wA0-000000003Hh-2Dvy;
	Wed, 18 Mar 2026 19:02:28 +0000
Date: Thu, 19 Mar 2026 03:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v3 11/17] spi: st: Use helper function
 devm_clk_get_enabled()
Message-ID: <202603190255.yJJehgKm-lkp@intel.com>
References: <96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_190240_004477_CDCE487A 
X-CRM114-Status: GOOD (  10.93  )
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

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260318]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/master clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 11/17] spi: st: Use helper function devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190255.yJJehgKm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190255.yJJehgKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190255.yJJehgKm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-st-ssc4.c: In function 'spi_st_remove':
>> drivers/spi/spi-st-ssc4.c:366:24: warning: unused variable 'spi_st' [-Wunused-variable]
     366 |         struct spi_st *spi_st = spi_controller_get_devdata(host);
         |                        ^~~~~~


vim +/spi_st +366 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones        2014-12-09  362  
2dd42da0b479ff Uwe Kleine-König 2023-03-03  363  static void spi_st_remove(struct platform_device *pdev)
9e862375c5420a Lee Jones        2014-12-09  364  {
e6b7e64cb11966 Yang Yingliang   2023-11-28  365  	struct spi_controller *host = platform_get_drvdata(pdev);
e6b7e64cb11966 Yang Yingliang   2023-11-28 @366  	struct spi_st *spi_st = spi_controller_get_devdata(host);
9e862375c5420a Lee Jones        2014-12-09  367  
cd050abeba2a95 Chuhong Yuan     2019-11-18  368  	pm_runtime_disable(&pdev->dev);
cd050abeba2a95 Chuhong Yuan     2019-11-18  369  
9e862375c5420a Lee Jones        2014-12-09  370  	pinctrl_pm_select_sleep_state(&pdev->dev);
9e862375c5420a Lee Jones        2014-12-09  371  }
9e862375c5420a Lee Jones        2014-12-09  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

