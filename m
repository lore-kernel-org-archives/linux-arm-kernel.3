Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB662CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX+oMa+jHbP0Hp1JweGeU/vRyr5J+0eXnw+uKsbEDeg=; b=nBoS0a6JKYduYxhtF1xbqNtuUI
	4Wo4X/wDlsi6zsQWmcLKNzsP6fn4gmnBYDHIrIHsf3vyHV5xa6NGvhBsAX/0dWwyq16nP6ybVR5XT
	4KW3uc3/qWcCd/03W/S0pJJ69+SzlEUb6wcdGk2tFtdj01DKwcC9vxVmhCzmOunpET91Hk13lTV/k
	TzOyGn/F8op9HwBD7rdo7btjqhYJIaaC/0w/uulq7x6W3YMTpXS+kVCGAVJnl8kxsZJvll7xVejIN
	DcaEb1UudOql/CDfNA/F89mRbZ7EEUKzJEqVPR0TnWkdaUHAVjHyBIQKygGmswfDr/GLqabKf1WQZ
	0x3ALu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mOB-00000005ZPo-1kS7;
	Thu, 09 Oct 2025 08:52:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mOA-00000005ZPD-0BXL;
	Thu, 09 Oct 2025 08:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LX+oMa+jHbP0Hp1JweGeU/vRyr5J+0eXnw+uKsbEDeg=; b=j06+/3mg42tqu7JbMt6L0CWofx
	9FZVgHx/AI4LnmClu8wCF9PGMVy6u9TQFUsbKPx7UFC899oK5+KN5S3YY60nJTMQjNgn1UMxiqojD
	8CrX4PObFPC+HitxOPACnHHBPjHwMGksNMpbvmPtZ9aubKXYynXdhPpMAk89XZlz52vDIoww3Wh06
	k1mTYk3EG+VrBWF3edX95z7ylLhHVUvzwjKIU7b17TgCoVEhUoK97jC8D/KKtaGoAqUqd6Befo23P
	7N6CpkHgxM3OH/Vk6WshxPP+6dtwiEftLhzxef1qDVNwHFrOfRqGvD01VSaXIo7Ga4GPNwYqdsaA2
	m/H/P5GQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mO6-00000001JtD-1zf4;
	Thu, 09 Oct 2025 08:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759999951;
	bh=OhNNkTtBr/D0etqH3D/6q1k1s4C6V2iYC7cl0FYmwQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=da3wSNsSLCyPM4QkYgbbRZPHDm40+Cl9QKJMzSMTuk/2M+bWbHnic86mkZ8n3ZO37
	 u5AIEm51O/ImGRvo18U9fGjRSEExt11oLpFeNIGwNrQRZi8vjfPtxvIVlKkmr29eBf
	 p0X+XooO7gBBm1rhNVj68q9NjzB84+IS/QXlXGmVJFwMaxjtuBZp+cuAaeEnS9tAYa
	 vKrx3MZnWudNyzjKKHzHmjF/nNAmbwM8eD9OWIVTd+zLlmuYXSBngAkf8QWqrqCqyd
	 TfPVv+DTB3Je9njP+MLTjOp3ssRfRtKJMP2fo560oAnB73En/tTy9ikPPJOKvxhPYy
	 AfZrfEi/mESyg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48B7217E038B;
	Thu,  9 Oct 2025 10:52:31 +0200 (CEST)
Message-ID: <ad744447-a871-43b8-aac1-128d4cfb8c47@collabora.com>
Date: Thu, 9 Oct 2025 10:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass
 device
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
 <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
 <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
 <CAGXv+5FTg3VXpbav5c2Gx2vRgaC=jYURRp0b5tQGw+ScACRSew@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FTg3VXpbav5c2Gx2vRgaC=jYURRp0b5tQGw+ScACRSew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_095238_877964_9D3BD232 
X-CRM114-Status: GOOD (  19.71  )
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

Il 09/10/25 10:18, Chen-Yu Tsai ha scritto:
> On Thu, Oct 9, 2025 at 4:09 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 08/10/25 18:05, Nicolas Frattaroli ha scritto:
>>> As it stands, mtk_clk_register_plls takes a struct device_node pointer
>>> as its first argument. This is a tragic happenstance, as it's trivial to
>>> get the device_node from a struct device, but the opposite not so much.
>>> The struct device is a much more useful thing to have passed down.
>>>
>>> Refactor mtk_clk_register_plls to take a struct device pointer instead
>>> of a struct device_node pointer, and fix up all users of this function.
>>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>> ---
>>>    drivers/clk/mediatek/clk-mt2701.c            | 2 +-
>>>    drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 +-
>>>    drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 4 ++--
>>>    drivers/clk/mediatek/clk-mt6765.c            | 2 +-
>>>    drivers/clk/mediatek/clk-mt6779.c            | 2 +-
>>>    drivers/clk/mediatek/clk-mt6797.c            | 2 +-
>>>    drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 +-
>>>    drivers/clk/mediatek/clk-mt7629.c            | 2 +-
>>>    drivers/clk/mediatek/clk-mt7981-apmixed.c    | 2 +-
>>>    drivers/clk/mediatek/clk-mt7986-apmixed.c    | 2 +-
>>>    drivers/clk/mediatek/clk-mt7988-apmixed.c    | 2 +-
>>>    drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 3 ++-
>>>    drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
>>>    drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 2 +-
>>>    drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 2 +-
>>>    drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 3 ++-
>>>    drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 3 ++-
>>>    drivers/clk/mediatek/clk-mt8196-mcu.c        | 2 +-
>>>    drivers/clk/mediatek/clk-mt8196-mfg.c        | 2 +-
>>>    drivers/clk/mediatek/clk-mt8196-vlpckgen.c   | 2 +-
>>>    drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 2 +-
>>>    drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 2 +-
>>>    drivers/clk/mediatek/clk-pll.c               | 7 ++++---
>>>    drivers/clk/mediatek/clk-pll.h               | 6 +++---
>>>    24 files changed, 33 insertions(+), 29 deletions(-)
>>>
>>
>> ..snip..
>>
>>> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
>>> index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3b04e9ab24c2526471da 100644
>>> --- a/drivers/clk/mediatek/clk-pll.h
>>> +++ b/drivers/clk/mediatek/clk-pll.h
>>> @@ -78,9 +78,9 @@ struct mtk_clk_pll {
>>>        const struct mtk_pll_data *data;
>>>    };
>>>
>>
>> There's a forward declaration of struct device_node in this header: with this
>> change, that becomes unused.
>>
>> Please change that to a forward declaration of struct device instead.
>>
>> While at it, I'd appreciate if you could either:
>>    A. Remove the forward declaration for `struct clk_hw_onecell_data` and for
>>       `struct clk_ops` (as both come from clk-provider.h - which this already
>>        includes);
>>      ...or...
>>    B. Remove the inclusion of clk-provider.h and keep the forward declarations.
> 
> Prefer (B) since no APIs from clk-provider.h are referenced in the header.
> It is up to the implementation to directly include any and all headers it
> needs.
> 

Me too. Also because other drivers are doing that.
I didn't have strong opinions about this anyway, so I didn't want to influence the
decision too much - but at this point I just said it so I could've said it before
anyway :-P

Angelo

> ChenYu
> 
>> After which:
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>> -int mtk_clk_register_plls(struct device_node *node,
>>> -                       const struct mtk_pll_data *plls, int num_plls,
>>> -                       struct clk_hw_onecell_data *clk_data);
>>> +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_data *plls,
>>> +                       int num_plls, struct clk_hw_onecell_data *clk_data);
>>> +
>>>    void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
>>>                             struct clk_hw_onecell_data *clk_data);
>>>
>>>
>>
>>


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

