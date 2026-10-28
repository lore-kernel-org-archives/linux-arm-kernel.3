Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cvaDFC9R;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QwBg/l4G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uoyhanJreUhzLPDA+ljmTZwIPetuIE1Ivz/9P3UXD3E=; b=cvaDFC9RS6Xp9MUo+HeTX6bPHo
	hF3KQj0yBTcTnvBzGQiwjBTftCElDM5P2qnL09tQmZu/Y+Kd3saBDPPsRtK53vQNErUB6PR6cNxV9
	m6ZeunKTBttJtz2B2zy/yOe6YMhQO2cCONRUZQh0m0xF8w0TixRPLHF2Kv8cw2YtJzk0EkpphHGCb
	iiY+sZm+yRy7l88dXjZMnVfM0FZXMDYHvLTwLgFSQn5c+dAUOwEFLmfG3wZNrp0t6ROiSNZ5JlbjS
	QTm3cVPg2idYXL7VicV4kz34HfSd6JPa++sZznaQw1hAKNSSk3yVx1oBcqF0b3IFxS1RjmPu/jG0K
	CqSco0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Iq-00000006oJq-3S0Y;
	Wed, 28 Oct 2026 10:54:44 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Io-00000006oJP-1d4w;
	Wed, 28 Oct 2026 10:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793184883; x=1824720883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3aNUzcd8LQRCPT46+lVga/502IGAQyJemLKQGD1rOQ=;
  b=QwBg/l4Gnew8SYmVHuWxhEpZzdd6xcD7ityWbTv/0a9ipuUAsmVzFS/k
   qOe5bLHKXdAbwMq7lW12p9ma/kehFyqrKhTyBqF7yvqwXdi2e0So4vCIZ
   eGRLSQ/G+pjw+v5mm0oK9EQ2/5UmU4zNOePT0m906qNpIqDAUdIJ8BSKd
   sL9n/3Zl+vWLpQIBJxEQU2zIQLOy5LWO0OcJd0d0WP7xm4xzu9mc8qmsX
   Z04zxzjFyMFUsbAcp/xKyFaj/glUtPUvQdQbbTQGRHMOAePSg7N7+gHWy
   R9QPNPTcUVx+AfKYpsytyTpi33pWMBRpc1D8eThBG1R0Ax8QFVZqcSrb2
   Q==;
X-CSE-ConnectionGUID: iICkMFOHRGmoWCOjCq7GWA==
X-CSE-MsgGUID: yHsO9ZiaTa6GVusCNbr7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1891177"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1891177"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:54:41 -0700
X-CSE-ConnectionGUID: gSq73B0+TAqXDZb1qQLHYg==
X-CSE-MsgGUID: h2GJqdhjSLmk9ONPpyHirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5153537"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2026 03:54:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM1Ig-00000000Ybs-3trJ;
	Wed, 28 Oct 2026 10:54:34 +0000
Date: Wed, 28 Oct 2026 18:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
Message-ID: <202610281810.Or8lhrj7-lkp@intel.com>
References: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_035442_463776_3BA05EDB 
X-CRM114-Status: GOOD (  10.58  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614]

url:    https://github.com/intel-lab-lkp/linux/commits/christian-koever-draxl-student-uibk-ac-at/dt-bindings-firmware-amlogic-meson-gxbb-sm-add-amlogic-meson-s4-sm/20261025-202143
base:   7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
patch link:    https://lore.kernel.org/r/20261025192144.208954-3-christian.koever-draxl%40student.uibk.ac.at
patch subject: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
config: arm64-randconfig-1000-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281810.Or8lhrj7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281810.Or8lhrj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281810.Or8lhrj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/meson/meson_sm.c: In function 'meson_sm_power_off_prepare':
>> drivers/firmware/meson/meson_sm.c:318:6: error: implicit declaration of function 'freeze_secondary_cpus'; did you mean 'thaw_secondary_cpus'? [-Werror=implicit-function-declaration]
     if (freeze_secondary_cpus(0))
         ^~~~~~~~~~~~~~~~~~~~~
         thaw_secondary_cpus
   cc1: some warnings being treated as errors


vim +318 drivers/firmware/meson/meson_sm.c

   308	
   309	/*
   310	 * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
   311	 * power key it jumps back to the kernel instead of booting, which hangs the
   312	 * board. Setting the shutdown flag first makes it cold-boot instead, and the
   313	 * secondary CPUs must have been taken down through PSCI CPU_OFF beforehand,
   314	 * otherwise the wake-up path hangs as well.
   315	 */
   316	static int meson_sm_power_off_prepare(struct sys_off_data *data)
   317	{
 > 318		if (freeze_secondary_cpus(0))
   319			pr_warn("meson-sm: failed to stop secondary CPUs\n");
   320	
   321		return NOTIFY_DONE;
   322	}
   323	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

