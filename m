Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DA4C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDe7FeaszHBgc9lAIq4+yTKV2a7k2KTmDIkZ75QG+zs=; b=y9G9s+S2Su7Kt6QiIfNeKSZP16
	YEU3fRMmSqNAMy74b1VZWvGXd5SJ/zPmzn4yGnHOBi4NhXxvJXydI4xvFxUWpOf2FLL6puwAuOdu4
	hacq1ikJF8V8pNCSBc3bAUDzVTzx5DOyjxy6WLzlTdxm+SXefBFAre3D/onHbw9eWzxiClF7j7Xvm
	RYVWfGE6zzGzvLz55KN1cHYQMMO9W2OxZ2zRgNNXzMD/wu3yxsCXrCCmW4pQ6p5a/TWgJZ9u6O+H/
	+x4k+eZeOf+xspAwJStiseoexBBcjh/FwDP14OSqhnVBXNnYgQkyVs5tj2017tgAlk2fDyceKGUU6
	3kUpzg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTj6M-00000003Ecf-0fAs;
	Mon, 23 Jun 2025 15:28:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfvd-00000002by2-0CiH;
	Mon, 23 Jun 2025 12:05:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEC8C113E;
	Mon, 23 Jun 2025 05:05:17 -0700 (PDT)
Received: from [10.57.29.116] (unknown [10.57.29.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 374713F58B;
	Mon, 23 Jun 2025 05:05:33 -0700 (PDT)
Message-ID: <61011213-8916-4634-997a-f9c5fd06460a@arm.com>
Date: Mon, 23 Jun 2025 13:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
To: Lucas Stach <l.stach@pengutronix.de>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
 will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heiko@sntech.de, nicolas.dufresne@collabora.com, jgg@ziepe.ca
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <43276c9a-5434-467c-abb2-dd2806ab81d0@arm.com>
 <c7dd8ac53170cafab5489f98d3da13f65cd67a1a.camel@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <c7dd8ac53170cafab5489f98d3da13f65cd67a1a.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050537_179974_D8E0BCF4 
X-CRM114-Status: GOOD (  21.62  )
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

On 2025-06-20 9:45 pm, Lucas Stach wrote:
> Am Freitag, dem 20.06.2025 um 20:37 +0100 schrieb Robin Murphy:
>> On 19/06/2025 2:12 pm, Benjamin Gaignard wrote:
>>> The Verisilicon IOMMU hardware block can be found in combination
>>> with Verisilicon hardware video codecs (encoders or decoders) on
>>> different SoCs.
>>> Enable it will allow us to use non contiguous memory allocators
>>> for Verisilicon video codecs.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>
> [...]
>> I'm especially curious what this "pta" really is - is the comment above
>> just wrong, and you've actually got a 3-level pagetable supporting
>> somewhere between 33 and 42 bits of VA? If not, then the additional
>> level of indirection would very much seem to imply some kind of
>> mechanism for accommodating multiple pagetables at once, and in that
>> case, is it like a PASID table where the client device gets to choose
>> which entry to use, or a StreamID table to disambiguate multiple client
>> devices? (Where in the latter case it should most likely belong to the
>> IOMMU rather than the domain, and you probably want nonzero #iommu-cells
>> in the DT binding for the client IDs).
>>
> PTA is short for page table array and it's another level of indirection
> to select the page tables to be used for the specific translation. On
> the Vivante GPU, where this MMU IP originated, the GPU can select the
> index into this array to be used for a specific command stream to
> implement GPU client isolation, so it's much like a PASID table.

Thanks for the clarification!

(Although, similarly to panfrost, does this mean we should at least 
break out an io-pgtable implementation to share between the two drivers 
rather than duplicate code between here and etnaviv_iommu?)

> I have no idea if and how the integration with the video codecs can
> select the PTA index.

Yeah, that's really the thing - it may smell like a PASID table for the 
GPU use-case, but AFAICS that still wouldn't necessarily rule it out 
from turning up in some codec block with, say, all the decode 
functionality hard-wired to index 0 and encode to index 1, then all of a 
sudden we start needing different driver behaviour and potentially a 
different DT binding. I guess the door is still open to support 
"#iommu-cells = 1" to specify explicit PTA indices without breaking the 
implicit "#iommu-cells = 0" behaviour, so I don't think we're painting 
ourselves into a corner at this point, it's more just something to be 
wary of for the future.

Thanks,
Robin.

