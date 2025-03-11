Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75B4C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FF/+ThLVlH8fTF402usj8KxjS4jueGgdyZDKQL2Jvak=; b=OZY1X3rd2dK6dokvDCloY1qSj9
	jrJ2TJbxpMKMQ4QA+TIu4DGge5dsqWLtgqA1sHQO+jFzAze3dFLxSo8ZlKbw1AL/uu0CkOsC9wtuz
	eXwBwpscRucvy6trpdSQYWGIF+iyY8WRWBrdOnJd3/vX8IstV7Z2Y9LMXBspGKyt4ahNtmbT5kqxA
	gTv026+dBiH4oXInbKoXdpJCCAwCotrvaTXF0gqkVYXko94pRAmR+STgnA6b4J0bcwTg4I1L2d2BU
	NPnn4LiyEd47Tpp5gelpx+sBCHbeq5DohbmDcstpe+YmSgVxSBJ5DU8u9JRt1nuRTXVAvEzOP4WVz
	+Atc1uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0oS-000000061Bx-26MY;
	Tue, 11 Mar 2025 14:42:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0jy-000000060Js-3WhP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:37:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA4FF152B;
	Tue, 11 Mar 2025 07:38:04 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD4E23F694;
	Tue, 11 Mar 2025 07:37:50 -0700 (PDT)
Message-ID: <58c5e76a-e320-4296-8292-1ddf3f7ba56d@arm.com>
Date: Tue, 11 Mar 2025 14:37:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
To: Jason Gunthorpe <jgg@ziepe.ca>, Ryan Roberts <ryan.roberts@arm.com>
Cc: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "maz@kernel.org"
 <maz@kernel.org>, "david@redhat.com" <david@redhat.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "mshavit@google.com" <mshavit@google.com>,
 "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <20250228193221.GM5011@ziepe.ca>
 <b23aa37f8e864dea82a6143bece912d6@huawei.com>
 <20250303103102.GC13345@e133081.arm.com> <20250303165255.GS5011@ziepe.ca>
 <20250303190330.GA426248@e133081.arm.com> <20250304142634.GC5011@ziepe.ca>
 <67fbe3f4-4fb6-4753-b34c-320b7897fd16@arm.com>
 <20250304161943.GD5011@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250304161943.GD5011@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_073754_918329_927B2C58 
X-CRM114-Status: GOOD (  14.88  )
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

On 04/03/2025 4:19 pm, Jason Gunthorpe wrote:
> On Tue, Mar 04, 2025 at 04:02:20PM +0000, Ryan Roberts wrote:
>> On 04/03/2025 14:26, Jason Gunthorpe wrote:
>>> On Mon, Mar 03, 2025 at 07:03:42PM +0000, Mikołaj Lenczewski wrote:
>>>
>>>> For example, if we use BBML2 for kernel mappings, does that require us
>>>> to repaint all kernel mappings when disabling BBML2 on smmu attach? I
>>>> am not sure, but definitely something to be worked out.
>>>
>>> No, it would be a per-mm_struct basis only if we did something like
>>> that
>>>
>>> When the SMMU driver puts a SVA on top of the mm_struct it would
>>> disable BBML2 usage only for that mm_struct and it's contained VMAs.
>>
>> I guess we would need to figure out some synchonization mechanism if disabling
>> BBML2 dynaically per-mm. If there was already a BBML2 operation in flight would
>> want to wait for it to end. But that's a problem to solve if/when it's shown to
>> be needed, I think.
> 
> I have a feeling we can piggyback on the mmu notifiers to achieve this
> as all the changes to the PTEs should be bracketed by notifier
> callbacks..
> 
> Let's hope it isn't needed.

Yup, as mentioned previously, this is largely theoretical and at worst 
only a risk of affecting 3rd-party SMMU implementations. Arm's 
implementations from MMU-700 onwards do support BBML2; MMU-600 *might* 
actually be OK as well, but it predates the definition of the feature, 
and there are more practical reasons not to integrate a decade-old SMMU 
design with brand new CPUs anyway.

Thanks,
Robin.

