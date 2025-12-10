Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63104D3C53C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NV2ozGAC9LfvTf7h7/WLBKa6a8CXHlNumdfKnIU7WK0=; b=0ovOY+m42Qo3CbTn+enFTflN3u
	1IyczVy9wCV3uezWFFzpfBA/JD2edu4APDUjlqwLs0m2brsgMZWPJL31P8m/4zR4IUL+Idrqh2OWr
	IC2Q+hZsWh1VovTehGaJcr2MONzFQjbJ8ssrZi1vyK3vpC/LlrAJUYb8BDeZrzU6Z8VYVQYh8OLLZ
	+pQEEGdxd4BRK/fQ7PJWi8/L5bbPqF3k2w9aQw6IldPqQXSI2ZPXVILaPwRZwfT8C2unAB7cRYYmA
	CPNxummvFrM3DBMFEF7mI+hJvnKbR7K0dLNGP7nyx/G4p+iC4PGycsF5KvQhnTOc4LuL5q7MTp9Dr
	vzeCQoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJU7-0000000FQxl-0FHP;
	Wed, 10 Dec 2025 12:39:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJU5-0000000FQx5-0Lpq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 12:39:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD58C153B;
	Wed, 10 Dec 2025 04:39:48 -0800 (PST)
Received: from [10.57.45.247] (unknown [10.57.45.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1E4D3F73B;
	Wed, 10 Dec 2025 04:39:52 -0800 (PST)
Message-ID: <e7c69e9c-6af4-468a-88ed-fb8829afb92e@arm.com>
Date: Wed, 10 Dec 2025 12:39:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] iommu/arm-smmu-v3: Add device-tree support for
 CMDQV driver
To: Ashish Mhetre <amhetre@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, thierry.reding@gmail.com,
 jonathanh@nvidia.com, vdumpa@nvidia.com, jgg@ziepe.ca,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, joro@8bytes.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, kernel test robot <lkp@intel.com>,
 will@kernel.org
References: <20251205065850.3841834-2-amhetre@nvidia.com>
 <202512090331.QAFgb6vQ-lkp@intel.com>
 <2bf7bb25-9a6b-42d5-b095-978f7bb81f35@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <2bf7bb25-9a6b-42d5-b095-978f7bb81f35@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_043957_175724_7EE0B2AC 
X-CRM114-Status: GOOD (  12.10  )
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

On 2025-12-10 5:19 am, Ashish Mhetre wrote:
[...]
> Hi Robin, Nic,
> We removed ACPI dependency in Kconfig but driver still depends
> on ACPI for these functions. I will be protecting ACPIspecific
> tegra241-cmdqv code under CONFIG_ACPI similar to what is done
> in arm-smmu-v3 driver. Is this the correct thing to do or do you
> have any other suggestions?

Yes, when I commented that "depends on ACPI || OF" was functionally the 
same as just removing "depends on ACPI", I didn't mean to suggest that 
wasn't necessarily a genuine dependency still.

I guess if you can wrap the ACPI-specific functions in a single #ifdef 
block that's reasonable, however I do now wonder whether things couldn't 
be factored out a bit more - if it's a standard DSDT/SSDT namespace 
device, shouldn't there also be a corresponding platform device created 
for it, which we could look up instead of delving directly into the _CRS 
of the ACPI node itself? (not sure off-hand if there's a straightforward 
inverse of ACPI_COMPANION()...)

Thanks,
Robin.

