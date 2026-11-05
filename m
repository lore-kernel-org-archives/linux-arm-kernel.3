Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C2E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d6I60krR;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D34NxG/R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ymerU3qs+IE5SarRlTt1VKtK551vjj0c9kwV9TnzqGE=; b=d6I60krR/jZwXNApE8AtthLb77
	b1le9ThKuOuqTmbRvtVPSw7UHgGP+T0wvkO5lUiwL+x3TgQqG15KsbgZV8m8YhWplP84VrL6fhH5a
	UUav2zfOBL501Fb4NaYl2eCrBTECEn1yTQAYwv3HilKspVQv1KE3KXlYc6WvAP/J677KA0Ej4GztG
	YvocjLKnRduSdP+dCreNhtFk1PuhohSNJEUVexibWV+oS9tc1AfJWJG5ztVcjUaAclkuLD78cn3M0
	jbuaqHrMeRMhKU9vHe6ZIY8qElrxJZCVGqhJBywGIzfi6FX55iLh8S+/V6q7au6zBSTaSxUMAeA8y
	Gtprkl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqyI-00000007wsW-27eR;
	Thu, 05 Nov 2026 06:29:14 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqyF-00000007wsA-1zxO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793860151; x=1825396151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t5hBDD13+lQVTKr4HGQoZraqtI76Sha+S89tCwE0n90=;
  b=D34NxG/RafGTrbmxGvd9dQLjfbm8FmbPljYgA4H203S/p/P7Vv9kWFRQ
   HArN0EswoPkgxQoOUfiqyUmJN8Nv78DpggFNsRwgWi55wyNVvPSsNm+N5
   T8/rC6jNs535YnFZSQp7LL1QkOcMDpyLZz1o85s2t6x1K2XWChlmtj3wb
   xX0sb3KTKRvc5ERfsyxZ+K0IDNEFAv8YXPx1l+ngSy/gM7uYxe2SH/Bjy
   nYLxEC0gkRUO2SXIhufrEYgcBTnXfeVGZmnkc13ET0Mp2eL/kVVAqpsHE
   zN0iOGgiIFOE7qJhpTJJ441xpKpcvClor7zZXYxqAs5j/vcSN0rEXeXeM
   A==;
X-CSE-ConnectionGUID: WbPKnJMVQrC9R6SQkZIzFg==
X-CSE-MsgGUID: 347I/vdfQiyheVx/BCzKyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2630132"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2630132"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:29:09 -0800
X-CSE-ConnectionGUID: 51cbibPgTa+oa4yEGFhgvw==
X-CSE-MsgGUID: ZCdruSxMSvuEUaYY291XpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6763797"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 22:29:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqy2-00000000lnN-303Z;
	Thu, 05 Nov 2026 06:28:58 +0000
Date: Thu, 5 Nov 2026 14:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yureka Lilian <yureka@cyberchaos.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Export per-device APIs
Message-ID: <202611051425.vj4FPfnn-lkp@intel.com>
References: <20261104-apple-pcie-pwren-v2-1-216a4066965f@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-apple-pcie-pwren-v2-1-216a4066965f@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_222911_558093_2A0D3561 
X-CRM114-Status: GOOD (  11.20  )
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

Hi Yureka,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Yureka-Lilian/PCI-pwrctrl-Export-per-device-APIs/20261104-124029
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261104-apple-pcie-pwren-v2-1-216a4066965f%40cyberchaos.dev
patch subject: [PATCH v2 1/3] PCI/pwrctrl: Export per-device APIs
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261105/202611051425.vj4FPfnn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 812626a41399a1d464a0d69627ab45c83b8ebfb9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051425.vj4FPfnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051425.vj4FPfnn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/pwrctrl/core.c:203 function parameter 'np' not described in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:203 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 function parameter 'np' not described in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'np' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'parent' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 Excess function parameter 'device_node' description in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 function parameter 'np' not described in 'pci_pwrctrl_destroy_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 Excess function parameter 'device_node' description in 'pci_pwrctrl_destroy_device'
>> Warning: drivers/pci/pwrctrl/core.c:203 function parameter 'np' not described in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:203 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 function parameter 'np' not described in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'np' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'parent' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 Excess function parameter 'device_node' description in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 function parameter 'np' not described in 'pci_pwrctrl_destroy_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 Excess function parameter 'device_node' description in 'pci_pwrctrl_destroy_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

