Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA1C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdsl4bpELxCRtMtIc9HvcO+dwLaPIuN+jYg6XNor2QI=; b=gMfy73JVUu3Rp0vqAqXGkVOml/
	ZvNFN4h/YOyD1iRFmNhWMaYfwm1Hc3Sloy6wlovMyMd+2xDb7g3OFeE3O1y8fUvh1OqX2J+LYnwa5
	p0p48xNoWkONPbpb0vVLcGIOmEt+sEbxBzz3b77CGzyUTMAxsWBovsTKHNe3QBZ1TCxQvEPQ4SxP8
	3KjegKIEKBqvXSMMuhuRsf1aFyR5um1nInkIWYmSAf0k3qhkQkhHlKp474hvaRzkaPKH0JxakBUUF
	U/FxunrwSQHd/R0zFTB+YdiohPEmceItZ3daDb4bAMuJVO2kzjex6g97BCqwY70YmnIi3DthWMhsk
	8wpPHiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5wk-0000000EmIT-30ub;
	Sun, 09 Feb 2025 11:57:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5vM-0000000EmAR-3HzR;
	Sun, 09 Feb 2025 11:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B139BA401C9;
	Sun,  9 Feb 2025 11:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBB8C4CEDD;
	Sun,  9 Feb 2025 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739102191;
	bh=Lz2w10qZ/7qf0GBvDV0ucsndxbEDejIrSm5OdLohrlc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FDUUplSm71iSeiNoCP8kgKWfH/FV7hnL/Pb6Ql0ehJB7KzeA4JJiYvqfe+AbgZyRO
	 p1NSbOUnNhOyiI81Qel+HotJUgFLt99w4fXpRJv+Fr4PO1AKn5ZdwfXVGWg5IIh/eS
	 jVUXvVzqiQdO1T/qSpllafTpUzMny3do/xNGzlFwlBsDOthdimAXo6YI8f48wODIdL
	 UgGufOquMx/cMto6ke6VChFxg1TQhJXUsdGPoW+iyxblOcl3HoGZkw2Cao6YYpE5/A
	 0oppnFn6xYT4HbhZ3HVjkmb1wqK3zBtlAzcbSBrxVVb8DHKghT7nXEaBVm/5kC829x
	 fVAfOPTKwQVgw==
Message-ID: <922691a1-10d0-4ff1-a174-a456235e6487@kernel.org>
Date: Sun, 9 Feb 2025 12:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to Mali
 Valhall CSF binding
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Florent Tomasin <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
 <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
 <4b9deab1-e330-4c93-8260-75276c2bc9ff@arm.com>
 <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
 <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_035632_955843_ED7A0908 
X-CRM114-Status: GOOD (  25.34  )
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

On 06/02/2025 22:21, Nicolas Dufresne wrote:
> Le mercredi 05 février 2025 à 10:13 +0100, Krzysztof Kozlowski a écrit :
>> On 03/02/2025 16:31, Florent Tomasin wrote:
>>> Hi Krzysztof
>>>
>>> On 30/01/2025 13:25, Krzysztof Kozlowski wrote:
>>>> On 30/01/2025 14:08, Florent Tomasin wrote:
>>>>> Allow mali-valhall-csf driver to retrieve a protected
>>>>> heap at probe time by passing the name of the heap
>>>>> as attribute to the device tree GPU node.
>>>>
>>>> Please wrap commit message according to Linux coding style / submission
>>>> process (neither too early nor over the limit):
>>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>> Apologies, I think I made quite few other mistakes in the style of the
>>> patches I sent. I will work on improving this aspect, appreciated
>>>
>>>> Why this cannot be passed by phandle, just like all reserved regions?
>>>>
>>>> From where do you take these protected heaps? Firmware? This would
>>>> explain why no relation is here (no probe ordering, no device links,
>>>> nothing connecting separate devices).
>>>
>>> The protected heap is generaly obtained from a firmware (TEE) and could
>>> sometimes be a carved-out memory with restricted access.
>>
>> Which is a reserved memory, isn't it?
>>
>>>
>>> The Panthor CSF kernel driver does not own or manage the protected heap
>>> and is instead a consumer of it (assuming the heap is made available by
>>> the system integrator).
>>>
>>> I initially used a phandle, but then I realised it would introduce a new
>>> API to share the heap across kernel driver. In addition I found this
>>> patch series:
>>> -
>>> https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t
>>>
>>> which introduces a DMA Heap API to the rest of the kernel to find a
>>> heap by name:
>>> - dma_heap_find()
>>>
>>> I then decided to follow that approach to help isolate the heap
>>> management from the GPU driver code. In the Panthor driver, if the
>>> heap is not found at probe time, the driver will defer the probe until
>>> the exporter made it available.
>>
>>
>> I don't talk here really about the driver but even above mediatek
>> patchset uses reserved memory bindings.
>>
>> You explained some things about driver yet you did not answer the
>> question. This looks like reserved memory. If it does not, bring
>> arguments why this binding cannot be a reserved memory, why hardware is
>> not a carve out memory.
> 
> I think the point is that from the Mali GPU view, the memory does not need to be
> within the range the Linux Kernel actually see, even though current integration


Do I get it right:
Memory can be outside of kernel address range but you put it to the
bindings as reserved memory? If yes, then I still do not understand why
DT should keep that information. Basically, you can choose whatever
memory is there, because it anyway won't interfere with Linux, right?
Linux does not have any reasonable way to access it.

It might interfere with firmware or other processors, but then it's the
job of firmware which has discoverable interfaces for this.

The binding says it is about protected heap name, but it explains
nothing what is that protected heap. You pass it to some firmware as
string? Does not look like, rather looks like Linux thingy, but this
again is neither explained in commit msg nor actually correct: Linux
thingies do not belong to DT.

> have that. From Mali GPU driver stand point (or codec drivers and what's not),
> the memory range is not useful to allocate protected/restricted memory. On top
> of which, its not reserved specifically for the Mali GPU.
> 
> What's your practical suggestion here ? Introduce dma_heap_find_by_region() ?

I did not comment about driver and I do not judge how you access
whatever you need to access. This is discussion purely about binding
thus about hardware.


Best regards,
Krzysztof

