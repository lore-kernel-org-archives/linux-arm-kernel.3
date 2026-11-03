Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A7606D835
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j+rzvmQh;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIF4YyTT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U2kSEVRi2hxXG2GFOz4rcCNrV0dltOZ+Pl3QkTNM8Pc=; b=j+rzvmQhCARz0xwDmP/IYCqJpR
	8sqtGhsUbhk3brsimsyixYSHEsiav0HwrQD/u5Q79FLH17Yso45En0Ay0KoQ9IxmPSyUR0oDdJkz3
	UK0oj4GbLFKSk1HhF9ZJTmLrIfdorDnEnbcOPx5P3HoQZtz/4axYHXek38wCKdAq9zsbHat5r9tAW
	iNWbNZaktTtM94hQdKQqVOA39Q2bcz8jsOoSZd31wwm1EdZwMdBfpEmdfwMat+hX3rkdmh19S8XZM
	yw6QMksBdCq6l3z6LoLWCI5gE9o5NXSwbIDDGZkM8T+hZhXr9PXvsN4mhPOQmwU4xMxj/NGXMDziZ
	FDN6miIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF5r-00000002fht-3sfD;
	Tue, 03 Nov 2026 14:02:31 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF5p-00000002fgv-0Qdf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793714550; x=1825250550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=21/dBFytCw06WfTSnztehqTIWH3fJ3UemgDQsPHVjOg=;
  b=dIF4YyTTboUQu6daqPnfWosES/Wzgd0ka1i2WrKovstKerg+u4FtzG4W
   ttQS8E85prPFCELWsKszsgi09I5X3USCSH0r4zMDZSHXynHAQZEFwibTy
   EpHSa8vFjcnNJKR1I/Soj2WxKNs6XilV1IIWKgxlNIfcgHLFpac7mnggK
   TR+eTILL25+7ql4HtU9DCZzYKL7YAzD15JC/ya1qxfLYgbsi/8d0biyRR
   iz/l4jYyi826GrAiGW0zCimDhckuksSKdXGcQlUJN//d+Y9BiWkgUaQgV
   zaIafSor9ZznlTRH8+w/7F4J/B65TDKNZpffhxYETYir1R88hxnywispV
   A==;
X-CSE-ConnectionGUID: mGIKeOtjR7usZiwFdTDEYg==
X-CSE-MsgGUID: AX1D8ZTLQKqdxTI8nDxLrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2329162"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2329162"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 06:02:29 -0800
X-CSE-ConnectionGUID: Y42j3A5eTQ6QKttsrzyCkA==
X-CSE-MsgGUID: 5M+a3Yp+QLeE0Ajy1Oi1EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6755557"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Nov 2026 06:02:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOF5g-00000000ioO-0URQ;
	Tue, 03 Nov 2026 14:02:20 +0000
Date: Tue, 3 Nov 2026 22:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 6/7] dmaengine: fsl-edma: support per-channel DT child
 nodes
Message-ID: <202611032138.hVbEmkem-lkp@intel.com>
References: <20261102-edma-iommu-v3-v3-6-9d0e62a954eb@Example.Com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-edma-iommu-v3-v3-6-9d0e62a954eb@Example.Com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_060229_725786_19F5D140 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/dmaengine-fsl-edma-unregister-channels-before-vchan-cleanup/20261102-144955
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261102-edma-iommu-v3-v3-6-9d0e62a954eb%40Example.Com
patch subject: [PATCH v3 6/7] dmaengine: fsl-edma: support per-channel DT child nodes
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20261103/202611032138.hVbEmkem-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611032138.hVbEmkem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611032138.hVbEmkem-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/dma/fsl-edma-main.o: in function `fsl_edma_child_to_chan_id.isra.0':
>> fsl-edma-main.c:(.text+0xa99): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

