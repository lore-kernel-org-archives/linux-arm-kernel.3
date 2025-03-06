Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C2C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6EP+Y6+a/PS+jPdVIF9Pf1+jm7iiLkPpuNEKDvE7pE=; b=4B6IROtwPrvHM/7HUjNSKsw3wS
	+qTfrlWISYEaJ/1Fe/IjTKtxN/GVa1tIlIDSqXtlBsCPrRJKwXUR3R1VIErLSzo5YblwvLgORlJS1
	lZDVAsqx54KUV1QKvfGOsks3mMC1s8G4+Y0wnUZ7Au2yX4e/I4NsrAPAEojoJOeE5iYUlLI3Mw9pU
	EtrZ9JkbsWCI2QLhiNG4wHyEf/alaxMYtj4t06tIsdvNRF2OHVSbS6mBdkhHOWBpD+eEGdIAxNnx5
	DZejFrhDiQI0BVP3brBlMn496hNQlFsG+n3bZfDfkLNnd6ZvAQbeHAyjaS9aGFN5dHO5/8DMmLuK6
	73lXyIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIHK-0000000CBbP-2EOy;
	Thu, 06 Mar 2025 20:57:14 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIAg-0000000CA4q-10gK;
	Thu, 06 Mar 2025 20:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741294222; x=1772830222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cvf/ipSb+K3a68VNt2N4RXjMJlyp30yAxRniCB2UBM8=;
  b=EDOq3SMP3IXlw3P9P8kIevr6kjQeouQKtq7mLfDW122xFzgzL2NBoKcj
   Nvxhhha69exEETRSPqRZnkEJ9bbGQoWBg3wz1DXLBEPRMXlruB+Ud25W3
   BdifYSOzo4nLOccQmpuNC/i3+2AP1gO7mxOG6IU3vwJafTWlSgmXn1ivE
   NAjWojETHi8bWL6emRUquPiJEOauqjCNrITBf48pvRPUPC6MyepwuceVa
   +SWyXvxLAan2ymzCroV4DcyHsEX3JV93lAmwJWmcsM2x0krDTMNfnuEaX
   iI+StqYsagb2MQrT6K825U+KgqnnCx+69oRvwbdac6d2PcVUOD4NgYthS
   Q==;
X-CSE-ConnectionGUID: zfBb+dWEQcaEqGsvJANQBg==
X-CSE-MsgGUID: IGWLSihqSemBISKOdxALeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41502046"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="41502046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 12:50:20 -0800
X-CSE-ConnectionGUID: ZCMNw3ZDQFC0f7jhlngx6A==
X-CSE-MsgGUID: qh4lq5bpSq+Xez7Ou7jcRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119052143"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2025 12:50:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqIAQ-000NbS-31;
	Thu, 06 Mar 2025 20:50:06 +0000
Date: Fri, 7 Mar 2025 04:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Andrew Perepech <andrew.perepech@mediatek.com>
Subject: Re: [PATCH v3 04/20] ASoC: mediatek: mt6359-accdet: Add compatible
 property
Message-ID: <202503070421.25fbw6zg-lkp@intel.com>
References: <20250304-mt6359-accdet-dts-v3-4-5b0eafc29f5b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304-mt6359-accdet-dts-v3-4-5b0eafc29f5b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_125022_294326_03CFA3CD 
X-CRM114-Status: GOOD (  10.65  )
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

Hi Nícolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 20d5c66e1810e6e8805ec0d01373afb2dba9f51a]

url:    https://github.com/intel-lab-lkp/linux/commits/N-colas-F-R-A-Prado/ASoC-dt-bindings-Add-document-for-mt6359-accdet/20250304-233834
base:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
patch link:    https://lore.kernel.org/r/20250304-mt6359-accdet-dts-v3-4-5b0eafc29f5b%40collabora.com
patch subject: [PATCH v3 04/20] ASoC: mediatek: mt6359-accdet: Add compatible property
config: s390-randconfig-r133-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070421.25fbw6zg-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250307/202503070421.25fbw6zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070421.25fbw6zg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/mt6359-accdet.c:1050:27: sparse: sparse: symbol 'accdet_of_match' was not declared. Should it be static?

vim +/accdet_of_match +1050 sound/soc/codecs/mt6359-accdet.c

  1049	
> 1050	const struct of_device_id accdet_of_match[] = {
  1051		{ .compatible = "mediatek,mt6359-accdet", },
  1052		{ /* sentinel */ },
  1053	};
  1054	MODULE_DEVICE_TABLE(of, accdet_of_match);
  1055	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

