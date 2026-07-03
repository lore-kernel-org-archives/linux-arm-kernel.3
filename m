Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6730C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRCG0K0iJ2HVSAtGkvvg+poXlmoOhMdb1cv0OwzHehk=; b=oHZhgkFujUmoQ5wsaeyUA0zztR
	+LtzMgVc88BpmH9RGUhPfetoLKCEnMUnqytUzSPJ0YVdIpPlpuDkaMhW4/k4Lu7jAzNL3lPsQ9Q++
	4zIKFqIpcaBuQCmPv8Hnhu4dq1F0/8xDMXDqSdCx6nfczbOsvS/gpTs6qHssNP12C34c71A46GQ8Q
	q5PP/Z4aHKVr6cyxFwmwMQQmqJc42T5Bv4yd7HClGcXQxq7KBC4kCe+bBLzOZbjr5vXaxPYOGw8pK
	W0B2N65qPO+pc5f3SuFTRj4BRTLKPXj17IKFPMAWqnLEi/Vqi+bkE4b2/MxK3xOhODR1i2OouSkW0
	Xs+Pnx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfj4j-00000007kP1-0Jfd;
	Fri, 03 Jul 2026 18:57:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfj4g-00000007kOQ-1wvK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 18:57:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C8ED22D7;
	Fri,  3 Jul 2026 11:57:11 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E7C3F905;
	Fri,  3 Jul 2026 11:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783105035; bh=EVj/nJjoDMSSbQCOLNFtXva5XAladq3bBJePirYqfas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ApfJI2W6Dx1v89BrkpaA+IivzEXpoA/C6HWy29MyKt+dwodqdvzesqJh0FhCHxrkZ
	 HzjY99MkITrRuWRSNz1vn6CdJhMDyAFV/9nnSr0JjElv9gqUAuElmPfXoVW1wbGZXK
	 lcQbhN305LF4d8wOzD+lptwW/xscZD3DX0+3bzUo=
Message-ID: <6465c885-3a9d-4c0b-ab74-7665e274ae72@arm.com>
Date: Fri, 3 Jul 2026 19:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: will@kernel.org, joro@8bytes.org, jpb@kernel.org,
 catalin.marinas@arm.com, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 stable@vger.kernel.org
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
 <20260703164914.GY7525@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260703164914.GY7525@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_115718_626262_F3C01F65 
X-CRM114-Status: GOOD (  19.69  )
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

On 03/07/2026 5:49 pm, Jason Gunthorpe wrote:
> On Wed, Jul 01, 2026 at 06:45:17PM +0100, Robin Murphy wrote:
> 
>> @@ -211,6 +213,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
>>   	if (system_supports_bbml2_noabort())
>>   		feat_mask |= ARM_SMMU_FEAT_BBML2;
>>   
>> +	if (system_supports_haft())
>> +		feat_mask |= ARM_SMMU_FEAT_HAFT;
> 
> I fear this is going to make SVA stop working on systems it currently
> does work on, so it might be a major regression.
> 
> SMMU HTTU is not a commonly implemented feature.. I think of all the
> NVIDIA ARM chips only one supports it. Given that a quick internal
> check is raising concerns this will be breaking for us. We need to
> check in more detail which cores have HAFT.
> 
> Breaking already deployed SVA would be a major functional regression.
> 
> I think this should start by just enabling SMMU HAFT when CPU HAFT is
> on, when possible. Maybe print a warning on the mismatch instead of
> failing.
> 
> Since we can't break already deployed SVA a full solution would either
> have to somehow turn off CPU HAFT or we ignore the gap in the AF
> updates..

TBH I do not know how bad the implications of 
pmd_young()/pmdp_test_and_clear_young() returning a false-negative are, 
but if we aren't considering mismatched CPUs harmless then surely the 
same must apply for SVA. In the POE/GCS cases all that can really be 
broken is users' expectations, if they've opted in to additional 
security features, but also opted in to SVA wherein those features can't 
protect against DMA. Here, though, it's the kernel mm layer itself 
that's impacted, and I'm not confident to say that that isn't more serious.

This came about as a sudden "oh crap" moment when answering an internal 
query about SMMU features, and it seemed prudent to do _something_ for 
the sake of correctness ASAP. Making HAFT depend on !SVA could only 
easily be done at the config level, which seems arguably even more 
over-reaching, and given that CPUs supporting HAFT aren't common yet - 
at least from Arm it seems to be only the big cores of the latest C1 
generation so far - in a pinch this felt like the least-worst option for 
the short term. If someone has time to look into whether it's possible 
to dynamically switch arch_has_hw_nonleaf_pmd_young (and whatever else) 
post-init, then that's an obvious follow-up, but I can say for sure that 
that someone is not me...

Thanks,
Robin.

