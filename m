Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EC0CFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5o2pxmfMGaz7ANUAFnlvl5E1LWTsFS1uKqaGykE9SLk=; b=FH1kTJh/yV8FSfKSD2G3mvdw3c
	MDKkT2ZHWiZFELK7Y9EYMkhkUIeDv+ICDBH0A0So0ifQFiH4zb80TauKCGxUEu+8+dH6nSMbB8lSt
	8RkSssKtXLhacMEnCH6wB3yTn2HZrwH38zhiyHpm8hHYXY2Q2H/Pe2y/ZKci6g3MV0K7zDrKL33ro
	VYO2IAtu0kr6sXJB06kwisMYhwBjm0m32e+VGdHIaE5sPQKVxTNf8pnmpeIPquCs7G5tzBTEKMVmE
	ccJ8ODTt4e5bE2EmgRTIHV253P/DRpV8XqsyBiEOZHo6RaQ201JCrq84Pj1GN0l19zT9bG0VNi434
	5/B83Q7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa7c-0000000C5In-2kBj;
	Mon, 24 Nov 2025 17:13:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa7a-0000000C5HY-0M1O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:13:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A5B01477;
	Mon, 24 Nov 2025 09:12:53 -0800 (PST)
Received: from [10.1.200.38] (e119884-lin.cambridge.arm.com [10.1.200.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F162C3F73B;
	Mon, 24 Nov 2025 09:12:59 -0800 (PST)
Message-ID: <b6b19b93-2579-4e9f-90dd-12aec22ab627@arm.com>
Date: Mon, 24 Nov 2025 17:12:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: morello: Add CMN PMU
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com,
 sudeep.holla@arm.com, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
References: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
 <f06636ed-c96f-4504-9706-9274cfd0c15b@arm.com>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <f06636ed-c96f-4504-9706-9274cfd0c15b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_091302_165919_471A8348 
X-CRM114-Status: GOOD (  13.84  )
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

Hi Robin,

On 24/11/2025 16:35, Robin Murphy wrote:
> [ Trying to catch up with loose ends... ]
> 
> On 2025-05-27 1:55 pm, Robin Murphy wrote:
>> Although CMN-Skeena is mildly modified for the Morello hardware
>> architecture, it still identifies itself as CMN-600 r3p1. Since
>> there are also no documented changes to its PMU functionality,
>> we can make the PMU accessible via the standard CMN-600 binding.
>> In general, PMU registers are non-functional on CMN Fast Models,
>> so this is only meaningful for the real SDP hardware.
> 
> Vincenzo, Sudeep, any opinion on this? I believe it was considered useful by at
> least the one person who asked me about it :)
> 

Sorry, I missed your patch. Just acked it.

> Thanks,
> Robin.
> 
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   arch/arm64/boot/dts/arm/morello-sdp.dts | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/arm/morello-sdp.dts b/arch/arm64/boot/dts/
>> arm/morello-sdp.dts
>> index cee49dee7571..42c85f450fa9 100644
>> --- a/arch/arm64/boot/dts/arm/morello-sdp.dts
>> +++ b/arch/arm64/boot/dts/arm/morello-sdp.dts
>> @@ -108,6 +108,13 @@ smmu_pcie: iommu@4f400000 {
>>           dma-coherent;
>>       };
>>   +    pmu@50000000 {
>> +        compatible = "arm,cmn-600";
>> +        reg = <0x0 0x50000000 0x0 0x4000000>;
>> +        interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
>> +        arm,root-node = <0x804000>;
>> +    };
>> +
>>       pcie_ctlr: pcie@28c0000000 {
>>           device_type = "pci";
>>           compatible = "pci-host-ecam-generic";
> 

-- 
Regards,
Vincenzo


