Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F97DD15DA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGdAZI+GRGf1fPNZPQXupwtwaX7xawwU1g5K8LoDX7o=; b=kQ5S6x184gTeKZ3NcWQXnrqgqc
	g8s5okdTw4nN2uekUmauUtXex55MzAU0Xs5I73HcbGahjtU0rOnuUuR7FzX58coW4oEQjWvEFVuo+
	Bme2z38IT5yHfVGI9dEHrGmxK2GEfVXkdh0fhKCQzhA5mD8TPCi7GQxk9gM0V8BDFmIVeVFOTfMKN
	a4YBNkrvm4oNnTw+CCvT1AgQwdRiH3De8coiYy2L9VGGV/oSCbKH++mwdNGSu9jg2LeR3Utbm1b6S
	A2aNeVnllZok0+kPIIXwFX6imKEKzzYkH5WIXLTD8Sb0uL9I7pj5XCYD7rYUn1fk6+iKxpdO4I+xF
	550GXNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQp70-00000006icI-2ouq;
	Wed, 03 Dec 2025 15:49:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQp6y-00000006ibL-0bm2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 15:49:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35F2A339;
	Wed,  3 Dec 2025 07:49:37 -0800 (PST)
Received: from [10.57.45.67] (unknown [10.57.45.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35FC3F59E;
	Wed,  3 Dec 2025 07:49:39 -0800 (PST)
Message-ID: <a917aded-4404-4b63-8d2c-96aa8b84f81f@arm.com>
Date: Wed, 3 Dec 2025 15:49:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] iommu/arm-smmu-v3: Add device-tree support for
 CMDQV driver
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, nicolinc@nvidia.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
 jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 joro@8bytes.org, robh@kernel.org, kernel test robot <lkp@intel.com>
References: <20251201163219.3237266-2-amhetre@nvidia.com>
 <202512031601.IpliwbHW-lkp@intel.com>
 <47684b91-7c0f-4260-abfd-2795fdaa2b31@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <47684b91-7c0f-4260-abfd-2795fdaa2b31@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_074948_313519_AF9C72AA 
X-CRM114-Status: GOOD (  20.69  )
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

On 2025-12-03 11:04 am, Ashish Mhetre wrote:
> 
> On 12/3/2025 2:05 PM, kernel test robot wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Ashish,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on next-20251201]
>> [also build test ERROR on v6.18]
>> [cannot apply to robh/for-next linus/master v6.18 v6.18-rc7 v6.18-rc6]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Ashish-Mhetre/ 
>> iommu-arm-smmu-v3-Add-device-tree-support-for-CMDQV- 
>> driver/20251202-003517
>> base:   next-20251201
>> patch link:    https://lore.kernel.org/r/20251201163219.3237266-2- 
>> amhetre%40nvidia.com
>> patch subject: [PATCH V3 1/3] iommu/arm-smmu-v3: Add device-tree 
>> support for CMDQV driver
>> config: arm64-allmodconfig (https://download.01.org/0day-ci/ 
>> archive/20251203/202512031601.IpliwbHW-lkp@intel.com/config)
>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project 
>> cd708029e0b2869e80abe31ddb175f7c35361f90)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/ 
>> archive/20251203/202512031601.IpliwbHW-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202512031601.IpliwbHW- 
>> lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: duplicate symbol: init_module
>>     >>> defined at arm-smmu-v3.c
>>     >>>            drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.o: 
>> (init_module)
>>     >>> defined at tegra241-cmdqv.c
>>     >>>            drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.o: 
>> (.init.text+0x4)
>> -- 
>>>> ld.lld: error: duplicate symbol: cleanup_module
>>     >>> defined at arm-smmu-v3.c
>>     >>>            drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.o: 
>> (cleanup_module)
>>     >>> defined at tegra241-cmdqv.c
>>     >>>            drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.o: 
>> (.exit.text+0x4)
> 
> Hi Nic, Robin,
> 
> How do you suggest fixing this? Is it fine to compile tegra241-cmdqv as 
> separate module
> and export tegra241_cmdqv_probe() to fix this warning?

As Jon just pointed out, the issue is using module_platform_driver(), 
which is unnecessary anyway since this is not a driver; nor is it even a 
module, it's just some extra code that can be included in the 
arm_smmu_v3 driver, and will be integral to the arm_smmu_v3.ko module if 
built as a such.

You could sanity-check the compatible of the phandle target in 
tegra_cmdqv_dt_probe() if you feel like you should do more than just 
blindly trust the DT, but either way trying to register a dummy platform 
driver that won't bind to anything is pointless.

> I am using GCC compiler and was not able to reproduce this with W=1 build.

This will be happening with CONFIG_ARM_SMMU_V3=m.

Thanks,
Robin.

> 
> Thanks,
> Ashish Mhetre
> 
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki


