Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC5606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqCFNEf7;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfxrwzy5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZSqGuWJBbHfF/m30cj+yySLDnLihqLhP2KpRjJlvDzk=; b=gqCFNEf7jM1Qdg6+tDGHGpeiOD
	Mpym9ZP9ACiaq+Nan+MOF5LW5I88m5zy+YibUmSI0V4WBR5oK4WPPItHLSbPX6QXjskgSFRUFzf4W
	Dz3LX8WWzYC6XfnlnwQeSWHsojgRRnYybGje+ibNHeU8gRuCEhHhUT5mL5gv9rGBIHPvYntmeT570
	IP6ie1qnQ6km+9ka/DWkjez45nr/s7MpuOga4dSoY4+uulnQITIQ9RkG/FlWglIYDc86moKscHQLJ
	QxFnYco6Zwkdym2vhVOh0zN3WXIzpRuKGnWL9GTuiOYFP/jS8fi1y/sDPY36P64p7/yTYdYAzEuF6
	HaS29dfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwXR-00000008wbN-1oTr;
	Thu, 05 Nov 2026 12:25:53 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwXF-00000008wUn-3F6Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793881542; x=1825417542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hULj/pENj1t0ZvVqG5iuX9V9t0+YHM1767U5NdVTqL8=;
  b=kfxrwzy5V7y5TV1PzWdqrxuI+TxSG64UhMazkPQPEtTFcXJTlDEOYPmM
   tm6SqraMNgl4X0TJ5Kmwcu8m1rBhXv/AOzLjQ4PGdrjG9utGE4o1E6Wrh
   mJv2EZuuLOnd7Re7iokMkMDFptMoIJeKgnDEhn2iWwlzU9iogXwwKByqH
   1RgtUL5VwWOuxWW4xQ1ywsWG94Ap9UXugM1BA9D3HUf7G51YjOEtMKior
   y/uP64pjKbl+DR6qSterZnfa+pJWN+Hd4MHJiq+g12bQQGlrJfMG/uMfM
   hqWXxPTQcLvilTPR7kylvNGTAp1FNJGT7Y1niCpJVDHvTfZEw2oVKZnIy
   Q==;
X-CSE-ConnectionGUID: EnQ52EvaQDCplJ20OsGNtg==
X-CSE-MsgGUID: h6xk51PHRGWTuH0VgutGuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2551254"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2551254"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 04:25:41 -0800
X-CSE-ConnectionGUID: oFa3uUGWSeuMY0Gq5/nLlg==
X-CSE-MsgGUID: WKcOzA8qSq+TnJol5dU2yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8760659"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 04:25:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOwX4-00000000mBP-1ah2;
	Thu, 05 Nov 2026 12:25:30 +0000
Date: Thu, 5 Nov 2026 20:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v8 01/15] PCI/TSM: Move core code into its own directory
Message-ID: <202611052018.S2OsLHjD-lkp@intel.com>
References: <20261104161632.3547423-2-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104161632.3547423-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_042545_038933_0C53892E 
X-CRM114-Status: GOOD (  10.95  )
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

Hi Aneesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/PCI-TSM-Move-core-code-into-its-own-directory/20261104-214618
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261104161632.3547423-2-aneesh.kumar%40kernel.org
patch subject: [PATCH v8 01/15] PCI/TSM: Move core code into its own directory
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611052018.S2OsLHjD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 812626a41399a1d464a0d69627ab45c83b8ebfb9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052018.S2OsLHjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052018.S2OsLHjD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/tsm/core.c:31:12: warning: variable 'pci_tsm_devsec_count' set but not used [-Wunused-but-set-global]
      31 | static int pci_tsm_devsec_count;
         |            ^
   1 warning generated.


vim +/pci_tsm_devsec_count +31 drivers/pci/tsm/core.c

3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31  25  
3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31  26  /*
3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31  27   * Count of TSMs registered that support physical link operations vs device
3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31  28   * security state management.
3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31  29   */
3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31  30  static int pci_tsm_link_count;
3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31 @31  static int pci_tsm_devsec_count;
3225f52cde56f4 drivers/pci/tsm.c Dan Williams 2025-10-31  32  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

