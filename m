Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E75FC44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8bC6/soCcOaGerR3q8mGs6A05523BolZ9jPQDcOpUk=; b=KVPPsJlA0Xubjz6P6t8/A7pcQf
	2c9snl9yxEGJSqTKxwJY1SHxnFhJvKWDt5cH6NPfir9FMjde92vmJKOCEsEjanjaAhuuwCcoZ4Jzo
	rmsPqKtFSY91lCyYSBFRij65pWguBhWRemuFZHD2xbZJmThyek0lV24pKvL1DgBN7BSrQhQ6OGnNi
	7w04RGhsWXuNsg3hexAm7c+5t1XEKL/NWQsnk31FeJ4wviSFMgecuvjyio+74cyIL5wNuncJx0MV3
	2mNFE+t42W7osMSBeBXGojX3udyu9lRVLHlemCvaEZb9GYfHBkNTGbGbqadNUAKKz7fy5Qut6QJur
	edfke3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaFF-0000000COmP-3oKX;
	Wed, 22 Jul 2026 16:56:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaFD-0000000COm4-2eTU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:56:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51F4D1595;
	Wed, 22 Jul 2026 09:56:23 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83C1F3F59E;
	Wed, 22 Jul 2026 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784739387; bh=pYVmR2L8HCGfHM5Pot89Q8QGJU4mVcZDQ+zR6U0/MXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RhNFo5DNMetW02ZuI3Jel22P1Iz8VPaf0EsWcOfcCePIHqvt+zIfFF+MwrwsKPW6+
	 +LeTu0gLcyKqBdVcWzMI1wb0yENrCONvh4g4akizvXP3r1XzERYjCA1vYljLXCglcN
	 woeSQMAEx1cQvtW/4V2ZfsWvDQQPd411/WBtMaGU=
Message-ID: <acd85a2a-af1f-4ebf-8370-773338d4fd15@arm.com>
Date: Wed, 22 Jul 2026 17:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, jpb@kernel.org, catalin.marinas@arm.com,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, stable@vger.kernel.org
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
 <amDEmlcyC3Tfmkel@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <amDEmlcyC3Tfmkel@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_095631_809236_0D92F7B1 
X-CRM114-Status: GOOD (  17.71  )
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

On 22/07/2026 2:24 pm, Will Deacon wrote:
> On Wed, Jul 01, 2026 at 06:45:17PM +0100, Robin Murphy wrote:
>> Since table access flags cannot be software-managed, if process
>> pagetables are using HAFT then SVA must require the SMMU to support and
>> enable it too, otherwise page aging is liable to get out of whack.
>>
>> Cc: <stable@vger.kernel.org>
>> Fixes: 62df5870ebf7 ("arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG")
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++++
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 6 ++++++
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 3 +++
>>   3 files changed, 14 insertions(+)
> 
> This looks ok to *me*, but Sashiko raises two interesting points:
> 
> https://sashiko.dev/#/patchset/878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com
> 
> 1. This may break hitless updates when transitioning to a faulting entry.

What does that even mean? We might block traffic in the process of 
_explicitly blocking traffic_!? Whoop-de-do, surely?

But either way, HAFT has bog all to do with EPD0, and it must be cleared 
if HA is cleared, otherwise the CD becomes illegal.

> 2. IORT has HTTU overrides for HA/HD. Does it (will it?) have anything
>     for HAFT? At the moment, it looks like you'll trigger a warning
>     message.

Oh, seems I did miss that fiddly fw_features line, so I guess it has 
half a point that the warning can wonky if both IDR0 and IORT do 
(correctly) report HAFT. Pretty sure we're already a bit broken if IORT 
ever did try to override HTTU _upwards_, though.

> Given Jason's comments, it's probably worth sending the idreg override
> patch as well...

Fair enough, I'm blessed with a moment of calm just now so I should be 
able to find time to have a crack at that tomorrow...

Cheers,
Robin.

