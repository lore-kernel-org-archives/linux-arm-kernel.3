Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE02BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npCtGtX6VlzH4Sr/CFPbnBUoij31KSB3lerJM1toieI=; b=Q/G6lkwxZJ7q/kxFkcU7VOKECL
	eL7F8sL5Z96cEGPIJctkClUH1wATyrIYByXuUUBNGae5k/mq1xRqVHDpwoyuP3yN3cPpZBIr5a8XX
	IutRetUCczSdUymsLT2MxcTuqWAiQ/X8uSdqpM0rvd7Hqpfa6MGGT0RFtjf3oCn1cqCksxajqcHnP
	9g1uxdBtcgoh0e1YKRdbpoATzHJMhQgjit6Gr+kLZpyPua+aV1OsPI6xCfQIYXd1tJp4BvGoWJKH7
	WYm0KkisHV6B2ikGBEiuDdVaFqG5MGUnDkPlFHn/xlW/rSSgWjAb3FrLmhBQyCEyuxyOCZU5ghWfN
	+B7F5Ebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok6q-00000005j57-42R8;
	Tue, 28 Jul 2026 15:52:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok6o-00000005j4U-0knf;
	Tue, 28 Jul 2026 15:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785253963;
	bh=9Bh8kCV0LkjDu3jkPYXajb/gwkn1SmkxH4gYN3gqdow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YvC3RqYI6S9fV2an63aV126TfIWw4t3u/1YlLn+E1H7ZmN9S3IwIPj9NsYBNS5gSy
	 te8fjil7xkJ41zzlUh7xCvDJnlk1l5xDp+P+8vhC6Y/VkDQUUq8oRXrEXflAS4vl4b
	 2sgie/qfU91LSSCHcDoJx3RjNoCshpOb6sBRxlxF0ZxMXGAO3AP8YfjtdyjQP8bomL
	 KtlTZu8OAR0cc97WqH7o7lA1oyv562Q4Ep6tTXRpgqZJnuXZ28qSPf+uZvaC06YBO6
	 yXsvSgPW+/jhdsTopZIHEr11EQenBU3pAooPqhr2ykiFTmmctnKie7l/XGZmXyah7T
	 Khl0fJjLinsQw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E49DF17E028D;
	Tue, 28 Jul 2026 17:52:42 +0200 (CEST)
Message-ID: <79379dbb-5e15-4e30-ab1d-136a40e77af0@collabora.com>
Date: Tue, 28 Jul 2026 17:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA
 support
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
 <20260728-6572-gce-v1-2-750bba32689e@protonmail.com>
 <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com>
 <W3cNtJeiPe6gmMpfpNJOxa6NQtOyatXIFz6FyCh7pC8jkE90WX_1g3AgQwXadoba0BdHE3com-6cCkym5VCN5d-3sobraI8O4-TGwkqnWBA=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <W3cNtJeiPe6gmMpfpNJOxa6NQtOyatXIFz6FyCh7pC8jkE90WX_1g3AgQwXadoba0BdHE3com-6cCkym5VCN5d-3sobraI8O4-TGwkqnWBA=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085246_398005_52AE5F5F 
X-CRM114-Status: GOOD (  20.96  )
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

On 7/28/26 17:47, Roman Vivchar wrote:
> Hi Angelo,
> 
> On Tuesday, July 28th, 2026 at 6:08 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 7/28/26 11:42, Roman Vivchar via B4 Relay wrote:
>>> From: Roman Vivchar <rva333@protonmail.com>
>>>
>>> Some SoCs, such as mt6572, have different WRITE and POLL instruction
>>> encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs have
>>> 22-bit offset and 2-bit subsystem ID.
>>
>> What about poll_addr, mask, write_s, write_s_mask and others?
> 
> These don't seem to exist in all 65xx except 6595. TL;DR - old GCEs are
> essentially dumb compared to newer ones. They have only basics like MASK (0x2),
> WRITE (0x4), POLL (0x8), JUMP (0x10), WFE (0x20) and EOC (0x40). All logical
> operations as well as GPR/SPR don't seem to exist.
> 
> cmdq_pkt_poll_addr, write_s, write_s_mask are not used by the DRM subsystem.
> mask is the same across all GCEs because it takes only u32 mask without
> address.
> 
>> Not sure that this will actually work reliably (though I'm sure you're not
>> creating any regression).
> 
> I have tested this change (on top of out-of-tree mt6572 DRM) with some
> dd if=/dev/urandom of=/dev/null spam + modetest, as well as igt. Seems to
> work without issues...
> 
> Best regards,
> Roman

Alright then - look, I'd really want to pick this one up, but it's a bit late
in the cycle and I don't really have much time left for testing.

I'm sure that this is fine, but please understand me - I can't take this now,
also because I'm going on holiday very soon and can't be here to take care of
sudden breakages.

I wonder if you could resend it in the next cycle, preferrably at the beginning?

Meanwhile, I'll get this series on the Collabora trees so that it gets cycled by
the CI a bit (though, it's not enough, because that needs to be tested manually).

Cheers,
Angelo

