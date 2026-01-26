Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C434D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tLfXPKnwNiVXLDcF0lZkfd3NVWmdV9D6ZlOK9vl208=; b=JyxFvtFsAWGrhcuX4ssULw8cCy
	RmJabpJ6dG6IpnUSGEh8XiZVzHfKrLZhbazYTtCJLBEzQAN7NBLu2qfAHKmr4HUP8cpxqq5iQg7oK
	XdQETv+DJEPfpiD/4rMU4uoAhY+hlgzjwwsLZyBMKI86wsFMYsQ1jMaru4uVYNrGnl1TiRKJXIbEX
	Uy4tS1Nmb7QzPOhGhD+BDGEGG4pYeVZM3Xh1H6W+wTELlzCTCw/VVOfIXdFMYfQEyCj8FN2BHf2uz
	0AK3Gtldy6VJ+WUiPJRdF5rp6/+kUjY8i1eMLNLKKpxw4BAkN4QXme+9pqt7VxADQX1kYm+DKnlAU
	Gfw3xo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkReH-0000000D6JE-239Z;
	Mon, 26 Jan 2026 18:49:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkReE-0000000D6It-1seE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:49:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62AD3339;
	Mon, 26 Jan 2026 10:49:05 -0800 (PST)
Received: from [10.57.51.176] (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9EA63F73F;
	Mon, 26 Jan 2026 10:49:09 -0800 (PST)
Message-ID: <0a60797a-fbb9-4a83-adc6-ad62baf5915b@arm.com>
Date: Mon, 26 Jan 2026 18:49:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
To: Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, bhelgaas@google.com, joro@8bytes.org,
 praan@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com,
 miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <09cb6be1f8f7472a2f1ccab72154cc6e22cf570b.1768624181.git.nicolinc@nvidia.com>
 <aXdgljWHHPVMTmya@willie-the-truck> <20260126172020.GP1134360@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260126172020.GP1134360@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_104914_556202_288678C0 
X-CRM114-Status: GOOD (  18.45  )
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

On 2026-01-26 5:20 pm, Jason Gunthorpe wrote:
> On Mon, Jan 26, 2026 at 12:39:50PM +0000, Will Deacon wrote:
>>> +	ret = arm_smmu_alloc_cd_tables(master);
>>> +	if (ret)
>>> +		return ret;
>>
>> Were do you allocate the second level entry for ssid 0 if we're using
>> 2-level cd tables?
> 
> I don't think we need to. The entire design here has a non-valid CD entry
> for SSID 0.
> 
> The spec is really weird here, on one hand it explicitly says that with
> S1DSS the CD entry is ignored.
> 
> On the other hand, you are also required to have a CD table pointer of
> at least size one for some reason.

Because it is not possible to enable 0 SubStreams, since that wouldn't 
make any sense, hence S1CDMax also acts as the "enable SubStreams" 
control (assuming SSIDSIZE > 0 and it does anything at all - note that 
strictly we cannot assume this bypass trick is *always* possible, since 
an SMMU is permitted to support ATS without supporting SubStreams).

> So, I think a CD table pointer to a fully invalid L1 table of at least
> size 1 should be OK?
> 
> Or stated another way, why would ie be OK to have a 1 level table with
> an non-valid CD table entry for SSID0 but not OK to have a 2 level
> table that returns non-valid at the first walk?

S1ContextPtr itself is reachable since S1 is enabled, so it cannot point 
to nonsense. But the S1DSS==Bypass behaviour does state:

"Note: Such a transaction does not fetch a CD, and therefore does not 
report F_CD_FETCH, C_BAD_CD or a stage 2 Translation-related fault with 
CLASS == CD."

So if we're not intending to actually allow traffic on the SubStream(s), 
then it should be fine to use either a 1-level table of invalid CDs, or 
a 2-level format with an empty L1CD table to gracefully terminate any 
config prefetches.

Thanks,
Robin.

