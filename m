Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213FDE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmD9Dxa9RLIMV9tPQLo9X0DMnGYr50lZNHvgWYy0MW8=; b=DBjIvauFdKErMrCEabT8WKj7/h
	xyJtdridhCni0/cAjBnA3ChgmePpM6D0SIQls4tsuxyemNZ6d9n1tHKCO1qnWSFm1bwfU3Qliharv
	KCGTR/1P7DrMvrm6HjLi+m6tuhlZS9BYwjybsaf4iQw60Dzt6j4RVFYet3ECOp5Rr7A9S7CtyVASD
	ttrMlUI3kcwSjgJXqoyrtA1QGsrlVBUCoZ3bFFUl8sgkTVA+SXEUUGcDjfd21jSb8mRJvXA5P1LXw
	w3gcq81bjOl6kXnXQAsro1D3sHP9X4t5OsYAGijaR4ZmXAQ3qz8WC+GKojRVr/EkEp5VAOSNgyrMU
	V0sAr/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBwk-00000005X7p-336t;
	Tue, 07 Jan 2025 15:56:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBuY-00000005WOQ-0KZ9;
	Tue, 07 Jan 2025 15:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736265268;
	bh=ZColaJchYHQUTdC5l9KMK7U/n6WVO4E0FvLAa+1L3dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BjYz3ER91eASynnII7vjuVazUWx/msHDd8cWnDw6W2GpHsDj4j0kDonsibm+9nWZh
	 HQwp1Ng+Vt+3yUoaZtWChzzKW1Onl7QUZvgcRKLQcJVhsOu1OSutY/r3A+Umw8kTTv
	 1Xjks+cmkmdhd7AojIOEBuoHpEOfDtN6Fd2ClUGyq33nS5y5znS6T38Cl6S72CFx6S
	 hn7EsbmlV5ByIj/r5klIO5Y8Rv5eAr4lU52ZmrFXWJ4iCRp+ntePNbcfJVl07/iydz
	 NV9xXNw/92084VEFe9J86tEs31eHLXbvIdQvg6ZNZOEvf3mSTOLa9L+4QoI9s3pOTv
	 IJEbLjlE+5zuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9081B17E159F;
	Tue,  7 Jan 2025 16:54:27 +0100 (CET)
Message-ID: <ee926982-be21-4292-984b-57e0d777d3f9@collabora.com>
Date: Tue, 7 Jan 2025 16:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: Linus Walleij <linus.walleij@linaro.org>
Cc: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
 <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
 <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
 <CACRpkdarstoQW+ZBi+MWxEff_=h8bPo9+fwy=LW2uhWRuQ6YSQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CACRpkdarstoQW+ZBi+MWxEff_=h8bPo9+fwy=LW2uhWRuQ6YSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_075430_291424_85A069E2 
X-CRM114-Status: GOOD (  17.32  )
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

Il 07/01/25 16:11, Linus Walleij ha scritto:
> On Thu, Dec 19, 2024 at 1:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> 
>> Il 17/12/24 14:45, Linus Walleij ha scritto:
>>> Hi Chang,
>>>
>>> thanks for your patch!
>>>
>>> On Tue, Dec 3, 2024 at 2:13 PM chang hao <ot_chhao.chang@mediatek.com> wrote:
>>>
>>>> From: Chhao Chang <ot_chhao.chang@mediatek.com>
>>>>
>>>> Change 1: change EINT from 1 address to 5 addresses,
>>>> Eint number is stored on each base.
>>>> Change 2: Compatible with 1 address design
>>>>
>>>> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
>>>
>>> This patch looks good to me, as preparation for mt8196,
>>> but can one of the Mediatek experts please
>>> review it? If nothing happens I will just apply it I guess...
>>>
>>
>> Linus, that's something like the fourth time that he pushes variations of this
>> patch which do break all MediaTek SoCs in a way or another, leaving only MT8196
>> hopefully-functional.
> 
> That's unfortunate, and I see there is some annoyance building
> up.
> 
> The maintainers are here to protect the code and the change
> would have anyway just been reverted soon if it breaks stuff.
> 
> How can we get this contribution on a better path?
> 
> Chhao: maybe you can split your idea into smaller changes
> that can be reviewed and tested one by one?
> 

Splitting would be nice, but I'm not sure it's really doable... besides,
there's only one way to get this right: testing on older platforms!

Even just one done manually, like MT8173, would be fine - the others can be
tested in KernelCI as we do have many MTK SoCs in the lab.
Then it's just about following the review process and adding the suggested
changes - nothing in particular.

Besides, I'm sorry for the very (maybe too much!) "strong" reply :-)

Cheers,
Angelo

> Yours,
> Linus Walleij



