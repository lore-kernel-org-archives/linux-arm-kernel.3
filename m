Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F309C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo5wY1cvATyeeavf6eQ0ipBOO0tft+1YBbVluhD/UTE=; b=4JBn9oLwlIpDBPDg5l+XKQYrWC
	weoFad1tOpNMthvICOBjoSAN2im8N8jbF4SZrWgFxd2mwx40qjbOuAKAUytQbKnnwsJy1wGVf46On
	8FRFbkP8auRJurailk34gDs4/TijSs7M8HEpgdK187WTBdnZJAyb4vTNTRzp7Ut6eVrhwxAIiWEsh
	bFAtYj1FcnG7TgVY7sQvGkt6MS20ltdykiEwSfsWjDHbdkiZzP8Iy41hQT30KGsvjk07DA72/Em1E
	oMJ+5W+afQv6mao5seS+u49YJjTSGBzc7nwMX1Kc9CUmab/qgHZYhYRt9TphTAUYcCM5tOS0CHfqh
	D2Qk+YDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6leP-00000003o51-3vsF;
	Mon, 21 Apr 2025 07:33:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lay-00000003nLy-45CE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Apr 2025 07:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wo5wY1cvATyeeavf6eQ0ipBOO0tft+1YBbVluhD/UTE=; b=b7vV3A05+fDllqpKgFw/xvLs2e
	GkBlhHHMmnq8rIL6FFzxKl3DSezVRiCcsbU27pDC7DhBIOHDQy1bz0jOKQCrwNk8feqkMGz8mreQ1
	0goPqFPjrpVL6NUjd/EaEm3rF4P9qbPboDWOxpQaEuJhPGlCjbbcGQqZY30fWFVeMD6yt/GcZvs1w
	l+4jlqTK3RKtZsTjahEyj7R8iWxoIkApm6aQjVqbhheXKaq/6AT3KTNJqWZTMPNqOE8kT+m8SxwkJ
	9T1e2kMiu//aY7SKPsTSTLAQVRTI+jbqKlPpwBTLCfaoXsGrW1NbqUo30N2Qxuu8+DnGOzG2WZpqj
	OS296xqg==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u6lau-0000000B0n2-1xA8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 07:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745220573; x=1776756573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=01/f1NraBtWpGWUC221XvSWIgnjPGGgSGxblojkWilk=;
  b=CjEcuDtvxJxcnBmgjgFZnU8v7wEuo9pT4k1H1XwrdXqEwfUkxPoMcmN2
   mG0v0hzGAQhF9z0ni4Y7+slmL6Ga96kFzNzucHtH1n9I4K/PqnbaBCs+0
   wfjjeXnurhq1OR9TFBx53QZj8hpf3tA72Io7br2gaGUVKckoKur6ZAFc8
   aKKC9o0QbY5JnxVr4Utzx/zaLll6P7SewjvBt/WtB+JSe/9g4v9QCL4bg
   PbRE7/PVu0H/InjWdH27zlj6O9jgXagnSNNDWEIN9KXQ72bCfNlZhofcP
   h2eYf8xbwShmaJ3x0/nisbPFIfQMBxFZe3QBFhmv2L+NlkzM+auVKUneu
   w==;
X-CSE-ConnectionGUID: 4stEt9M0S1+9g5yDqY872w==
X-CSE-MsgGUID: 1Xb2l67ZRCeBzXz0xoBuow==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46458362"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46458362"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 00:29:26 -0700
X-CSE-ConnectionGUID: oPu2/drdQy2zzZf0R09YaA==
X-CSE-MsgGUID: jIHOrVRJS62KkkGTBy1ktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="131950489"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Apr 2025 00:29:23 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6lai-0000Ep-1f;
	Mon, 21 Apr 2025 07:29:20 +0000
Date: Mon, 21 Apr 2025 15:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troymitchell988@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troymitchell988@gmail.com>,
	Yongchao Jia <jyc0019@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
Message-ID: <202504211501.MNwGdl5F-lkp@intel.com>
References: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_082933_066674_C3C806B8 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Troy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d7a0577c9db35c4cc52db90bc415ea248446472]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/i2c-imx-use-guard-to-take-spinlock/20250421-133753
base:   9d7a0577c9db35c4cc52db90bc415ea248446472
patch link:    https://lore.kernel.org/r/20250421-i2c-imx-update-v1-1-1137f1f353d5%40gmail.com
patch subject: [PATCH 1/2] i2c: imx: use guard to take spinlock
config: hexagon-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211501.MNwGdl5F-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211501.MNwGdl5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211501.MNwGdl5F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx.c:1140:17: warning: unused variable 'ret' [-Wunused-variable]
                                   irqreturn_t ret;
                                               ^
   1 warning generated.


vim +/ret +1140 drivers/i2c/busses/i2c-imx.c

aa11e38ce6fe88 Darius Augulis     2009-01-30  1124  
f7414cd6923fd7 Biwen Li           2020-11-11  1125  static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
f7414cd6923fd7 Biwen Li           2020-11-11  1126  {
f7414cd6923fd7 Biwen Li           2020-11-11  1127  	struct imx_i2c_struct *i2c_imx = dev_id;
f7414cd6923fd7 Biwen Li           2020-11-11  1128  	unsigned int ctl, status;
f7414cd6923fd7 Biwen Li           2020-11-11  1129  
d3973a577b8e10 Troy Mitchell      2025-04-21  1130  	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
d3973a577b8e10 Troy Mitchell      2025-04-21  1131  
f7414cd6923fd7 Biwen Li           2020-11-11  1132  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
f7414cd6923fd7 Biwen Li           2020-11-11  1133  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1134  
f7414cd6923fd7 Biwen Li           2020-11-11  1135  	if (status & I2SR_IIF) {
f7414cd6923fd7 Biwen Li           2020-11-11  1136  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
d3973a577b8e10 Troy Mitchell      2025-04-21  1137  
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1138  		if (i2c_imx->slave) {
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1139  			if (!(ctl & I2CR_MSTA)) {
f89bf95632b416 Corey Minyard      2021-11-12 @1140  				irqreturn_t ret;
f89bf95632b416 Corey Minyard      2021-11-12  1141  
d3973a577b8e10 Troy Mitchell      2025-04-21  1142  				return i2c_imx_slave_handle(i2c_imx,
f89bf95632b416 Corey Minyard      2021-11-12  1143  							    status, ctl);
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1144  			}
f89bf95632b416 Corey Minyard      2021-11-12  1145  			i2c_imx_slave_finish_op(i2c_imx);
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1146  		}
d3973a577b8e10 Troy Mitchell      2025-04-21  1147  
f7414cd6923fd7 Biwen Li           2020-11-11  1148  		return i2c_imx_master_isr(i2c_imx, status);
f7414cd6923fd7 Biwen Li           2020-11-11  1149  	}
f7414cd6923fd7 Biwen Li           2020-11-11  1150  
aa11e38ce6fe88 Darius Augulis     2009-01-30  1151  	return IRQ_NONE;
aa11e38ce6fe88 Darius Augulis     2009-01-30  1152  }
aa11e38ce6fe88 Darius Augulis     2009-01-30  1153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

