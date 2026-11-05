Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D136606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycE5Ksb7;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOdSGVJq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zngDh/hn+d+IfbRxuQD9941zh0dh76DUZmGv37oN1yw=; b=ycE5Ksb7kqzmEeOo4aj+iljeSM
	rGAGEeGNB81kokwdssz8ROgeXLlIK6DvfFk9EMV36sOLtGC+2cpRFYoE/gFchE3rZPSfof3UBUf1Z
	PhkB9BnLtlO3GLCgqzJR+BgliYLD3KcNL3+FF73GVeh4vDpNmax4eCLMRP4DWPR0LvKNUhMUyRbY8
	wRrKvG0Xr4l9FIn2hGWf9kM380ih+UZhUpMAJ4c8NbXMGEniVvJh2YMASF+EjyF5YDfgABGjKCCgw
	JdfTkLd1sICimGwzkmN1oba5cUui7qkkuHe2zchQ7HxdKBmh5YXMpDsjh4WaSRicHK/pCp8Kyl6tB
	EbybxSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOynG-00000009Khw-3AyW;
	Thu, 05 Nov 2026 14:50:22 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOynD-00000009Kgt-1n6r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793890219; x=1825426219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pR76mBghhXMOKm2t2fE0Nbyxh5lA9YdTCI2eN6g0oNY=;
  b=dOdSGVJqhH9neMIxJFy3/Uw2TQ9x8/A46vyTZgJC81nzyBoSBspG2x6f
   z5DBXgKMEH5rJJgvYDTM0gmuPMbz0xpfeKJUOG2Kd9M8CcsPdVOGYKbvU
   gh3v/i/PkVQY7QHQ/2yS0yBraFKmD4MJ56OeGA9O/l/6px0h5uD6Pm1N4
   GTXdAEkK3pveM0EkP/yiLKeJ2trxzSTMzl1o3UnxyZP54scFkXD9wK7XQ
   PdFEdn5HavvpfMCpgCyD9y3ZGy7oayL8/GxXomQwoBGIZo3J6+ZJ2rpYO
   OQh0FWvTRUWqcuAeWPN2RGA6BG7+N5jHPvCMGjgc4aeAgwMAmLcBcuGGs
   Q==;
X-CSE-ConnectionGUID: FRLSssrrSTOx9JU19DDCYg==
X-CSE-MsgGUID: pK3ScSGlS6WqDVlG/WpMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2551308"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2551308"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:50:19 -0800
X-CSE-ConnectionGUID: /dk8MTNSRPGYLMVUiJXO/Q==
X-CSE-MsgGUID: pVjBF9RvTTCjveglukFKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7151193"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2026 06:50:13 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOyn4-00000000mLb-00W9;
	Thu, 05 Nov 2026 14:50:10 +0000
Date: Thu, 5 Nov 2026 22:49:53 +0800
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
Subject: Re: [PATCH v8 11/15] iommufd/viommu: Select vIOMMU operations before
 allocation
Message-ID: <202611052227.TxHIjde3-lkp@intel.com>
References: <20261104161632.3547423-12-aneesh.kumar@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104161632.3547423-12-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_065019_549985_29764DA7 
X-CRM114-Status: GOOD (  11.04  )
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
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611052227.TxHIjde3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052227.TxHIjde3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052227.TxHIjde3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/amd/iommufd.c:81:40: warning: unused variable 'amd_viommu_ops' [-Wunused-const-variable]
      81 | static const struct iommufd_viommu_ops amd_viommu_ops = {
         |                                        ^~~~~~~~~~~~~~
   1 warning generated.


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

