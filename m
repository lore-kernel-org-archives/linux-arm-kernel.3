Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC7CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ocnemcpdEN4PRTO0yvsfsAO3DPmbiIhYBoZ2jyFyBk=; b=sKAP6DSP3En9/0uy2rgmMFPxzl
	/Kal8afBqDdcjbN3mz0H6yBJ2BIVHWUtplxaV8jMzGU2NS2wDBB7+i/h8oEeSCI/z87+G0kLfU5kx
	1vjt9J4yDN9zmfOm2NgRpdl1y6begwcjUxcbfcZUP17/sxym1fkQ0HjN2tUJryZES3qsxmxGgJR1j
	53hk3LCrHKgIP8lpnxxTOx5l6QLkIdEi7yXqa6SAAUrVIzohb6l4Nt8SwGbbqR6BMTmG465ViePFi
	cKj0EXEAP0R0qQ+6ZBGzo3vUeAs+j9hPMrrgoY8qEyJD6ZK37T8wM1xdn3d3umkWvemg9Fhu+gEnh
	NMpCg4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3a2j-00000005LbD-2pj8;
	Tue, 30 Sep 2025 13:05:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3a2g-00000005Lar-49Sj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 13:05:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F57339;
	Tue, 30 Sep 2025 06:05:06 -0700 (PDT)
Received: from [10.1.28.41] (Suzukis-MBP.cambridge.arm.com [10.1.28.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68B9D3F59E;
	Tue, 30 Sep 2025 06:05:12 -0700 (PDT)
Message-ID: <94832766-e408-4485-8397-e48bc23f615c@arm.com>
Date: Tue, 30 Sep 2025 14:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, "will@kernel.org"
 <will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
 <20250930002604.346306-2-bwicaksono@nvidia.com>
 <e21159ef-d438-4944-adb3-eb8e7c801d9e@arm.com>
 <SJ0PR12MB5676DD9C94CB7155D3897DEBA01AA@SJ0PR12MB5676.namprd12.prod.outlook.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <SJ0PR12MB5676DD9C94CB7155D3897DEBA01AA@SJ0PR12MB5676.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_060519_078565_31509259 
X-CRM114-Status: GOOD (  18.65  )
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

On 30/09/2025 14:00, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Sent: Tuesday, September 30, 2025 3:38 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>> robin.murphy@arm.com; ilkka@os.amperecomputing.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
>> <sdonthineni@nvidia.com>
>> Subject: Re: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 30/09/2025 01:26, Besar Wicaksono wrote:
>> > Add interface to get ACPI device associated with the
>> > PMU. This ACPI device may contain additional properties
>> > not covered by the standard properties.
>> >
>> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>>
>> Repeat: Where is the user ?
> 
> I thought you were okay if the use case is on future (different) series.
> 
> So, this is a heads up on what I will have in nvidia_cspmu when adding the
> new PMU support. Do you prefer it to be part of this series?

No, I recommended the opposite. Apologies, if that wasn't clear.
Add a helper only when there is a user.

Suzuki


> 
> +static u32 nv_cspmu_get_inst_id(const struct arm_cspmu *cspmu)
> 
> +{
> 
> +     u32 inst_id;
> 
> +     struct fwnode_handle *fwnode;
> 
> +     struct acpi_device *adev;
> 
> +
> 
> +     inst_id = 0;
> 
> +
> 
> +     adev = arm_cspmu_acpi_dev_get(cspmu);
> 
> +     if (!adev)
> 
> +           return 0;
> 
> +
> 
> +     fwnode = acpi_fwnode_handle(adev);
> 
> +     if (fwnode && fwnode_property_read_u32(fwnode, "instance_id", 
> &inst_id))
> 
> +           kstrtou32(acpi_device_uid(adev), 0, &inst_id);
> 
> +
> 
> +     acpi_dev_put(adev);
> 
> +     return inst_id;
> 
> +}
> 
> Thanks,
> Besar
> 
> 


