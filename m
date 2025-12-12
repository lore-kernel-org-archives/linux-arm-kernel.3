Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5402D59D93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/mQRxPxMx2GJpo5sth4Mucc/E7AGpxjflPtMwOLMlY=; b=R6a0Kev/4lem72jdeWBzLHyIHw
	QWWnIkOqhlAR//ECR1wYpIVCPU+De7m7u7sS6rdfaa/9zoTgqFgliEwqk1/sv/QaHhKsQi5cAdVzF
	aho2mokX1Pc4ewlBB6bzU+2vmINXAFoqWAqUYPDz8jixdU32RKLOT2p1WpgDLhhAbF7epDRge84NB
	oA4WVUbXktk6R2QtVNuQbVozkueOyTqEo/oCQuI5yV6XDNC3JOSboamiGg/ee4TAgqHA/MIQO3a6L
	/nOC8dyIqej+8djTxziyWuif85hgcS7x1TUxAfcNcqL61RwIVxAH2C53+2/oRoUUuz/TCV3Kb4KLj
	uvFst2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9sU-000000014Cd-1Eva;
	Fri, 12 Dec 2025 20:36:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9sR-000000014C9-23cO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:36:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3014B1063;
	Fri, 12 Dec 2025 12:36:27 -0800 (PST)
Received: from [10.1.196.95] (e121345-lin.cambridge.arm.com [10.1.196.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA0FD3F740;
	Fri, 12 Dec 2025 12:36:31 -0800 (PST)
Message-ID: <104441bd-1284-4147-873a-f94c91788609@arm.com>
Date: Fri, 12 Dec 2025 20:36:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/4] iommu/tegra241-cmdqv: Decouple driver from ACPI
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, joro@8bytes.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
 jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251212060803.1712637-1-amhetre@nvidia.com>
 <20251212060803.1712637-2-amhetre@nvidia.com>
 <54fce1f8-7675-4351-b292-0009b2e8c599@arm.com> <aTxxBdcY4hODXcdu@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aTxxBdcY4hODXcdu@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_123635_600198_91327570 
X-CRM114-Status: GOOD (  13.51  )
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

On 12/12/2025 7:46 pm, Nicolin Chen wrote:
> On Fri, Dec 12, 2025 at 12:01:41PM +0000, Robin Murphy wrote:
>>> @@ -4542,7 +4542,7 @@ static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
>>>    	adev = acpi_dev_get_first_match_dev("NVDA200C", uid, -1);
>>>    	if (adev) {
>>>    		/* Tegra241 CMDQV driver is responsible for put_device() */
>>
>> Don't we need to bring the put_device(adev) out to this level, since
>> impl_dev is now something else that AFAICS we are *not* taking a new
>> reference on (and thus should not be putting either)?
> 
> Ah, right! We are using the platform device now.
> 
>>> -		smmu->impl_dev = &adev->dev;
>>> +		smmu->impl_dev = acpi_get_first_physical_node(adev);
>>>    		smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
>>>    		dev_info(smmu->dev, "found companion CMDQV device: %s\n",
>>>    			 dev_name(smmu->impl_dev));
> 
> I think we should squash this:

Ack, it occurred to me shortly after sending that in fact it's good to 
still hold our own reference on impl_dev itself, as we're not relying on 
a bound driver to hold one for us.

Cheers,
Robin.

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 0c98be3135c63..88625e3c27a65 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5280,10 +5280,11 @@ static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
>   	adev = acpi_dev_get_first_match_dev("NVDA200C", uid, -1);
>   	if (adev) {
>   		/* Tegra241 CMDQV driver is responsible for put_device() */
> -		smmu->impl_dev = acpi_get_first_physical_node(adev);
> +		smmu->impl_dev = get_device(acpi_get_first_physical_node(adev));
>   		smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
>   		dev_info(smmu->dev, "found companion CMDQV device: %s\n",
>   			 dev_name(smmu->impl_dev));
> +		acpi_dev_put(adev);
>   	}
>   	kfree(uid);
>   }
> 
> Thanks
> Nicolin


