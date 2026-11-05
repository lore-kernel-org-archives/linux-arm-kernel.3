Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26071606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wBp6t0QK;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P+2tYmMy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rmEfX5MB+z5qNLqON5R/iyjm6saIez2uOt9Qp74A9Mo=; b=wBp6t0QKH7pDPpa8MsNZToSC1+
	mPqbIseoa1s1wOmXsO1MqXFislan8Rf/1IsHJ2rdpSnRxby74E7hZPOeqQF38pwBsm62NNdNPNLY/
	2F5pk6oVUnnhkw4Q2ednUUDUrSGikWMRv4LTYIqgxdR7jQd6kTWyqrCSJjLDHANgt+TTFVmwzxLTB
	wzLn5QkVZX7lo8sSjtN3dhdUwlUArsZKGe05N1EzwsFzpHta5tKBT9vDHqUbfNrhqvGvGE+qUAt1G
	N5xm6Sr6rvj/Q+amnsZj/sRiIxH/suM8ARDUKWO3EQ+WA4TBoRGJuBhwzhc1XCc8jxe07bNalbtEv
	v4F8bj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVP-00000008G67-0Bf2;
	Thu, 05 Nov 2026 09:11:35 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVI-00000008G1m-3WnE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793869889; x=1825405889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cA9g6szely6p7/mFb90LkK3gklsmstrV8QekqHlOipY=;
  b=P+2tYmMyUSf4p5PoC1acENJHQYSEczQP/b7OdiGGPdIxXwKqWDQJ7Ovc
   sqi/kh8L/JU0sSpYYxrfi+qEN2bAeURH07vn3nlzcGfiTIv4K8Pf1s53k
   bV/+qpd7CtgB9CN33Y+FdyO8e2yDhTiuy40Gu2eHlCGUA9Ws+9IaLg8bN
   IJtPpXcA0OFMLpyOsXqK39bIBY4RFJRENWbhoAt5uUvvgkMeDoI4EfPUT
   27hr9IkFbxOEOxND7jcQ4ExLzdsOzv8K5qek9dP9PA4SA9mMGvBVHV1Yv
   P+7rJ/+Ng7y68ApQ+Tqc/ox54hOnPpDr+mwht8g0NcPRCTTvb5wy391YC
   Q==;
X-CSE-ConnectionGUID: QpJdiIujRxW9AkTOXh7mgQ==
X-CSE-MsgGUID: tWlKTQqLSneoFqrx94DEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2533683"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2533683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:11:25 -0800
X-CSE-ConnectionGUID: FZgqFD1XTuezdhmfpzDg0g==
X-CSE-MsgGUID: sBnwJd+kSPi601QzmYFddg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6970208"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2026 01:11:17 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOtV3-00000000lzN-1PRo;
	Thu, 05 Nov 2026 09:11:13 +0000
Date: Thu, 5 Nov 2026 17:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev,
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
Subject: Re: [PATCH v8 11/15] iommufd/viommu: Select vIOMMU operations before
 allocation
Message-ID: <202611051602.nH0L0uqs-lkp@intel.com>
References: <20261104161632.3547423-12-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104161632.3547423-12-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_011129_055630_097BC38D 
X-CRM114-Status: GOOD (  11.49  )
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
patch link:    https://lore.kernel.org/r/20261104161632.3547423-12-aneesh.kumar%40kernel.org
patch subject: [PATCH v8 11/15] iommufd/viommu: Select vIOMMU operations before allocation
config: x86_64-buildonly-randconfig-1001-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051602.nH0L0uqs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051602.nH0L0uqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051602.nH0L0uqs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/amd/iommufd.c:81:40: warning: 'amd_viommu_ops' defined but not used [-Wunused-const-variable=]
      81 | static const struct iommufd_viommu_ops amd_viommu_ops = {
         |                                        ^~~~~~~~~~~~~~


vim +/amd_viommu_ops +81 drivers/iommu/amd/iommufd.c

757d2b1fdf5b7d6 Suravee Suthikulpanit 2026-01-15  76  
757d2b1fdf5b7d6 Suravee Suthikulpanit 2026-01-15  77  /*
757d2b1fdf5b7d6 Suravee Suthikulpanit 2026-01-15  78   * See include/linux/iommufd.h
757d2b1fdf5b7d6 Suravee Suthikulpanit 2026-01-15  79   * struct iommufd_viommu_ops - vIOMMU specific operations
757d2b1fdf5b7d6 Suravee Suthikulpanit 2026-01-15  80   */
757d2b1fdf5b7d6 Suravee Suthikulpanit 2026-01-15 @81  static const struct iommufd_viommu_ops amd_viommu_ops = {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

