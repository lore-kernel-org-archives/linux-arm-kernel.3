Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1034FC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 21:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EI8heksE/6lvHBAkzJJjA1YVVWHxndKTDANHdFyGOyM=; b=Y5bi0tmfCEuqPUQ0H29nj0ppz0
	wU81jmdo3Bb9kVmNhkWkp6+6iScH5t4PlZb6n+ExEAuqrft/8+vW7wKehh/ddhZ7bD1KDxN4Tn9jQ
	IBI/2/9wPVFDK7gcy9sBVQnb/Id83cn+w670CGxxp8w+jSCi3Hx7wZR6QOjR8ylO8DJYvyB0ktlCZ
	daz43l8vpEzxwf3pKAP1TapTc5f3FYOb7/BJ0d8FrG0n1B/zqcYQBgxqu2LgxSGYB94TK8gnojEQT
	jxAw20BMRlxwWyEP7EylXWMltArNeHnYwtYCu8KD5Xg5XUSQbu62b4JMJwY6AT6rb4orHObRSRllK
	YMBFygvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHr8A-0000000GsB6-2dav;
	Wed, 21 May 2025 21:37:42 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHr5z-0000000GrwF-3Bgx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 21:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747863328; x=1779399328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JY3+EDGgRxvxsrUQbrwFOjb3pPNzoNfUgnXnt2viI8E=;
  b=Ym+Fr2gfGIfMJT/Mpv2OJFqDV1dPEatL+iNy23WZPzbMdhCXI23wcnG1
   f5oHwWKFRfPqzQB/kJF2TNUuwFGL+57DcOnxL06L7mZ247gDyZCzYq7FA
   IdP2kJ1JdFJzeKIj9Gpg0fQDVo1WgwLHGWzh1lm38lG4PW06uEku2O1OA
   3L4CL7lyVA6+EJmY2Ya5ZzylwsDHL6TPS4pWlSfZ/UFkiKkN5UzVnuAgB
   TflJStKR5BuEydNmIWxFMLgWjGSy9YJK5MUaH3KKxowcrHn7KZNEJ++AO
   0TPZTkxRA+MrtX1S71+z4meqNutgYy0kiyo6OzHh76bt0aHYm9D47nJoz
   A==;
X-CSE-ConnectionGUID: kBBC6ymcTSy1ncj30WrNiQ==
X-CSE-MsgGUID: K2Kp7AgITDmv7+7Y3VCMQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61208560"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="61208560"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:35:21 -0700
X-CSE-ConnectionGUID: 3aiUfBnrQaSQSzx9A/Y0FQ==
X-CSE-MsgGUID: yUBaWO8+THO92MV2mqshbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145393226"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2025 14:35:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHr5n-000Oee-2g;
	Wed, 21 May 2025 21:35:15 +0000
Date: Thu, 22 May 2025 05:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
Message-ID: <202505220509.cwmpJvcz-lkp@intel.com>
References: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_143527_814480_16C2D4DF 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 09fac5c576bbff764dddf2baca0038b359376fd8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/dt-bindings-pinctrl-stm32-Introduce-HDP/20250520-230751
base:   09fac5c576bbff764dddf2baca0038b359376fd8
patch link:    https://lore.kernel.org/r/20250520-hdp-upstream-v2-2-53f6b8b5ffc8%40foss.st.com
patch subject: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
config: arc-randconfig-r121-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220509.cwmpJvcz-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505220509.cwmpJvcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220509.cwmpJvcz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/stm32/pinctrl-stm32-hdp.c:720:1: sparse: sparse: symbol 'stm32_hdp_pm_ops' was not declared. Should it be static?

vim +/stm32_hdp_pm_ops +720 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c

   719	
 > 720	DEFINE_SIMPLE_DEV_PM_OPS(stm32_hdp_pm_ops, stm32_hdp_suspend, stm32_hdp_resume);
   721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

