Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DF4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzbkvkrBP9cwmFXRob+AcrT2UZB7yjxkVCUuh7fKz7U=; b=XFowxFm6+QuInHBc0Tpyi9XxBt
	gvFZyYk7ev4WJBx8nZgQTXZ90LjfOqkpYdHnEcCBkH0pSaa+Z90O5wpNK5Tpu67r7wk659vO/17aR
	gIV0cgd1JWdEIZPW/YYXT5L3sDlMdbbmCE6wGDWNZ7pteSj0Jg6QONbAVxint8cCIkayQ1GFXrM9A
	jp+8xo5GnJMx9ZPxzkdPnXkyPrShM9RY9TNPlUpuemxcx25zYYKNPMX49lIAEYUg/XVcJ9AlNrrdS
	SCCKuoxNSojGBbS8TdJ41auteZodLOIVkxCpdKScy9ZpuCXby7WOQ4pOQNNzo/vMdixvPxX5sKa16
	mfi9sDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9U8-00000004ybU-03uZ;
	Tue, 07 Jan 2025 13:19:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Nb-00000004x2S-0VBS;
	Tue, 07 Jan 2025 13:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736255537;
	bh=/yaQvBxN92WBph6vXqky+w7V6dYWSvkNwdgX/ZOAW9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hq/irzVoEOQUNndEXpvhYpZJZ+dRSDryELIilqoMSAyskCJ+Z+RZvXikChS/Wc5t1
	 te++ypatMZc9BExcx6+IIb6w7ZYmhBUfhJal+FI0eBi3asIj4yYi1C/MeGQBWtRUh8
	 lgERLUBkqex86n/ywFni0doKfpGvGjXKy0BbxNglOU+XCuvu5+oREGMsKoSs8X+Hbt
	 ZQ0fFTRLKofTI67/KUTiSXw1RpI1egfMqLm9emXD1qn/hJqi0xuvilCLW3PPzUx0l1
	 /FWNBzkWxYQ8DBA2CCxPeNDSNglC7kigB9zrMQ9Bpl/hCI8ickvr1vcPyzwmpzTX/L
	 A5K2uNGV74vwA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28EA517E1574;
	Tue,  7 Jan 2025 14:12:17 +0100 (CET)
Message-ID: <eda10efe-a301-45d3-9bf6-088275db7af5@collabora.com>
Date: Tue, 7 Jan 2025 14:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing
 for MT8188
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20241223100648.2166754-1-wenst@chromium.org>
 <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
 <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com>
 <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com>
 <CAGXv+5FoOM=ZUCWigdCaPbc4FCBtLVX2xnUJnVnVsBH=7yoZ=Q@mail.gmail.com>
 <efb88dd0-3b66-49fe-b279-e66c4574cf9d@collabora.com>
 <CAGXv+5HWcYrCzWJD4e=WP1WVNfqG5Y2_z+_oetWZq2ZKjXP75g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5HWcYrCzWJD4e=WP1WVNfqG5Y2_z+_oetWZq2ZKjXP75g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051219_298942_F00DC8F7 
X-CRM114-Status: GOOD (  24.68  )
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

Il 23/12/24 17:15, Chen-Yu Tsai ha scritto:
> On Tue, Dec 24, 2024 at 12:08 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 23/12/24 16:57, Chen-Yu Tsai ha scritto:
>>> On Mon, Dec 23, 2024 at 7:43 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 23/12/24 12:24, Chen-Yu Tsai ha scritto:
>>>>> On Mon, Dec 23, 2024 at 7:11 PM AngeloGioacchino Del Regno
>>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>>
>>>>>> Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
>>>>>>> Like the MT8186, the MT8188 stores GPU speed binning data in its efuse.
>>>>>>> The data needs post-processing into a format that the OPP framework can
>>>>>>> use.
>>>>>>>
>>>>>>> Add a compatible match for MT8188 efuse with post-processing enabled.
>>>>>>>
>>>>>>
>>>>>> Let's just change the MT8188 compatible list to
>>>>>>
>>>>>> compatible = "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
>>>>>
>>>>> That would be "mediatek,mt8188-efuse", "mediatek,mt8186-efuse", "mediatek,efuse"
>>>>> then?
>>>>>
>>>>
>>>> No, we're dropping the generic "mediatek,efuse".
>>>
>>> That means we also drop it for MT8186?
>>>
>>> Thinking about it more, I think it's stretching things a bit. The hardware
>>> is clearly backwards compatible, or we wouldn't even be reading values
>>> out correctly. The only difference now with MT8186 and MT8188 is that
>>> they have a speed-bin field with a value that we want passed to the OPP
>>> framework, and the interpretation of that value is not really part of
>>> the efuse's hardware. We chose to do the conversion in the efuse driver,
>>> but we could also have done it in the GPU driver.
>>>
>>> What I'm saying is that we should not need to change the compatible strings
>>> to make this work.
>>>
>>
>> No we don't forcefully have to drop it from MT8186, and doing so would be kind
>> of hard and actually producing unnecessary breakages with (very) old kernels.
>>
>> Just add a `deprecated: true` to the binding that wants `mediatek,efuse` and
>> start with MT8188, where 8188 is in enum and 8186 is const.
>>
>> We can do MT8188 because that'll still work even with old kernels (since MT8186
>> is there since before MT8188 was introduced), and it's something to enable a new
>> feature.
>> This means that there's not going to be any breakage with new DT and old kernel.
>>
>> I want the mediatek,efuse binding to be like the majority of the others across
>> the kernel, so, no generic compatible.
> 
> In that case shouldn't the fallback be the oldest SoC in the list?
> Maybe MT8173, which is currently marked as deprecated, so we undeprecate it?
> 
> Certainly not the MT8186.
> 

MT8173 doesn't have the post processing enabled.... if you can test that the code
actually works for MT8173 as well, giving meaningful results, then we can just use
the MT8173 compatible :-)


>> Cheers,
>> Angelo
>>
>>>
>>> ChenYu
>>>
>>>> Cheers!
>>>>
>>>>> Fine by me. :D
>>>>>
>>>>> ChenYu
>>>>>
>>>>>> instead :-)
>>>>>>
>>>>>> Cheers,
>>>>>> Angelo
>>>>>>
>>>>>>> Cc: <stable@vger.kernel.org>
>>>>>>> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
>>>>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>>>> ---
>>>>>>>
>>>>>>> I'm not exactly sure about pointing to the dt bindings commit for the
>>>>>>> fixes tag.
>>>>>>> ---
>>>>>>>      drivers/nvmem/mtk-efuse.c | 1 +
>>>>>>>      1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
>>>>>>> index af953e1d9230..e8409e1e7fac 100644
>>>>>>> --- a/drivers/nvmem/mtk-efuse.c
>>>>>>> +++ b/drivers/nvmem/mtk-efuse.c
>>>>>>> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>>>>>>>      static const struct of_device_id mtk_efuse_of_match[] = {
>>>>>>>          { .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
>>>>>>>          { .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
>>>>>>> +     { .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },
>>>>>>>          { .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
>>>>>>>          {/* sentinel */},
>>>>>>>      };
>>>>>>
>>>>



