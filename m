Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251D4C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeB0zLNB06bvredUp/nZl4cUNzCFU4toABqQLlWXyzE=; b=HLjtD4Zu85VKJdUak8I7iUQJd6
	ucveT9A4PRARQHjoegI6ML4yC0IGyds5R+kMOpb/1dGLFP3pUDtwX7dhv1RpRpsR5xKAoZwXvhNpb
	Wq2WcNqRvJ2h/QqsLENN9PfBbYEns92JSf+NRZGv+T5fW9TO2iGxoIdnYY8voSs+YSE5lWGMbovHv
	bvCUMSZHuf3K6ZqUQymGo4kp+ihSa9A1iyo/g7XSVISInAWBf0UHKfPrm0MyNvMXeiZrOihm70GmB
	CYzcGLwMhO0JkmZol7ctDR6KeiYzSoLlmDcvXcK21rYpLlaTWpiD5Vc65HrRgNTwKyA2KK3cimrf8
	/BhcQlgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBAi-0000000Fiqu-1F5w;
	Thu, 05 Jun 2025 14:02:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAn9-0000000Ffhb-0Rh6;
	Thu, 05 Jun 2025 13:38:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E160168F;
	Thu,  5 Jun 2025 06:37:40 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A603F5A1;
	Thu,  5 Jun 2025 06:37:56 -0700 (PDT)
Message-ID: <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
Date: Thu, 5 Jun 2025 14:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
 <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_063759_198310_ACB0790A 
X-CRM114-Status: GOOD (  14.20  )
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

On 05/06/2025 8:41 am, Tomeu Vizoso wrote:
[...]
>> In fact this is precisely the usage model I would suggest for this sort
>> of thing, and IIRC I had a similar conversation with the Ethos driver
>> folks a few years back. Running your own IOMMU domain is no biggie, see
>> several other DRM drivers (including rockchip). As long as you have a
>> separate struct device per NPU core then indeed it should be perfectly
>> straightforward to maintain distinct IOMMU domains per job, and
>> attach/detach them as part of scheduling the jobs on and off the cores.
>> Looks like rockchip-iommu supports cross-instance attach, so if
>> necessary you should already be OK to have multiple cores working on the
>> same job at once, without needing extra work at the IOMMU end.
> 
> Ok, so if I understood it correctly, the plan would be for each DRM
> client to have one IOMMU domain per each core (each core has its own
> IOMMU), and map all its buffers in all these domains.
> 
> Then when a job is about to be scheduled on a given core, make sure
> that the IOMMU for that core uses the domain for the client that
> submitted the job.
> 
> Did I get that right?

It should only need a single IOMMU domain per DRM client, so no faffing 
about replicating mappings. iommu_paging_domain_alloc() does need *an* 
appropriate target device so it can identify the right IOMMU driver, but 
that in itself doesn't preclude attaching other devices to the resulting 
domain as well as (or even instead of) the nominal one. In general, not 
all IOMMU drivers support cross-instance attach so it may fail with 
-EINVAL, and *that*'s when you might need to fall back to allocating 
multiple per-instance domains - but as I say since this is a 
Rockchip-specific driver where the IOMMU *is* intended to support this 
already, you don't need to bother.

Thanks,
Robin.

