Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4573DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 18:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/s4ouuFNoBuI7nWZK//YejGoR/hN/Tl4wiDM5ljkak=; b=RnKqMqxRp6igmXZRzWR2OGzXMv
	kkKZGcR/ANTD3HZGoPlnDNtNdGVIfw4uRbQyxNCYrULR4c3ZdA1F5KMas4UYwgLIt/gfEKjNIHYao
	OgAbqr49cXYvVR6g5kiAKcCZWwSMEDKNtXtXxUo7qb5hgdbTPhKcZBtBfqiKpO5U4vH1JLbnjRMgo
	aYwwO1+bx+RXgNgYHawwQeh+y91XhNMYXF40nGXzol6Jkrz1432v5h+/oVZSnh83F9aBOvApczvYy
	CjXPgBd4KGVCZvqaodeqAfaTMJYlXI4bagEX40ZkRFkptcUU6zeje3vymJ3hpLoI9XLDFc7K+Wpc0
	W6YkUD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywUq-0000000DnCY-0bu8;
	Wed, 17 Sep 2025 18:03:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywUn-0000000DnB4-1j5k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 18:03:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5124B2696;
	Wed, 17 Sep 2025 11:02:57 -0700 (PDT)
Received: from [10.57.63.94] (unknown [10.57.63.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6EC53F673;
	Wed, 17 Sep 2025 11:03:01 -0700 (PDT)
Message-ID: <d73e5026-ccb0-4a19-9742-099a0443f878@arm.com>
Date: Wed, 17 Sep 2025 19:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck> <aMBJNzXpQTMg4Ncs@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aMBJNzXpQTMg4Ncs@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_110309_541711_954DB4BB 
X-CRM114-Status: GOOD (  30.35  )
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

On 2025-09-09 4:35 pm, Stephan Gerhold wrote:
> On Tue, Sep 09, 2025 at 01:57:11PM +0100, Will Deacon wrote:
>> On Thu, Aug 21, 2025 at 10:33:53AM +0200, Stephan Gerhold wrote:
>>> Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
>>> matching groups. This is more than what is defined as maximum by the ARM
>>> SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
>>> Limit the SMR groups to 128") disabled use of the additional groups because
>>> they don't exhibit the same behavior as the architecture supported ones.
>>>
>>> It seems like this is just another quirk of the hypervisor: When running
>>> bare-metal without the hypervisor, the additional groups appear to behave
>>> just like all others. The boot firmware uses some of the additional groups,
>>> so ignoring them in this situation leads to stream match conflicts whenever
>>> we allocate a new SMR group for the same SID.
>>>
>>> The workaround exists primarily because the bypass quirk detection fails
>>> when using a S2CR register from the additional matching groups, so let's
>>> perform the test with the last reliable S2CR (127) and then limit the
>>> number of SMR groups only if we detect that we are running below the
>>> hypervisor (because of the bypass quirk).
>>>
>>> Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>> ---
>>> I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
>>> above 128 (until they are all used). I did not see any issues, so I don't
>>> see any indication that they behave any different from the others.
>>> ---
>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
>>>   1 file changed, 17 insertions(+), 10 deletions(-)
>>
>> Is the existing workaround causing you problems somehow? Limiting the SMR
>> groups to what the architecture allows still seems like the best bet to
>> me unless there's a compelling reason to do something else.
>>
> 
> Yes, the problem is the following (copied from commit message above):
> 
>> The boot firmware uses some of the additional groups, so ignoring them
>> in this situation leads to stream match conflicts whenever we allocate
>> a new SMR group for the same SID.
> 
> This happens e.g. in the following situation on SC8280XP when enabling
> video decoding acceleration bare-metal without the hypervisor:
> 
>   1. The SMMU is already set up by the boot firmware before Linux is
>      started, so some SMRs are already in use during boot. I added some
>      code to dump them:
> 
>       arm-smmu 15000000.iommu: Found SMR0 <0xe0 0x0>
>        ...
>       arm-smmu 15000000.iommu: Found SMR8 <0x800 0x0>
>       <unused>
>       arm-smmu 15000000.iommu: Found SMR170 <0x2a22 0x400>
>       arm-smmu 15000000.iommu: Found SMR171 <0x2a02 0x400>
>        ...
>       arm-smmu 15000000.iommu: Found SMR211 <0x400 0x3>
> 
>   2. We limit the SMRs to 128, so all the ones >= 170 just stay as-is.
>      Only the ones < 128 are considered when allocating SMRs.
> 
>   3. We need to configure the following IOMMU for video acceleration:
> 
> 	video-firmware {
> 		iommus = <&apps_smmu 0x2a02 0x400>;
> 	};
> 
>   4. arm-smmu 15000000.iommu: Picked SMR 14 for SID 0x2a02 mask 0x400
>      ... but SMR170 already uses that SID+mask!
> 
>   5. arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
>      arm-smmu 15000000.iommu: GFSR 0x80000004, GFSYNR0 0x0000000c, GFSYNR1 0x00002a02, GFSYNR2 0x00000000
> 
>      SMCF, bit[2] is set -> Stream match conflict fault
>      caused by SID GFSYNR1 0x00002a02
> 
> With my patch this does not happen anymore. As I wrote, so far I have
> seen no indication that the extra groups behave any different from the
> standard ones defined by the architecture. I don't know why it was done
> this way (rather than e.g. implementing the Extended Stream Matching
> Extension), but we definitely need to do something with the extra SMRs
> to avoid stream match conflicts.

I'm also a little wary of exposing more non-architectural stuff to the 
main driver - could we not keep the existing logic and simply add an 
extra loop at the end here to ensure any "extra" SMRs are disabled?

Thanks,
Robin.

