Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B08CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ll6Bf/giB3iOTp7R2Z2b6cqPDuF5BEVBq2f4yaww1LQ=; b=FYpVVdNbgwf22jmeNbxWgCpLWq
	r0ISt8rO0X7gt7NcK0qWcxDyJHEYhxkEbEvKnUpzJEunVbKpSVJSV641Y6aXyxAsyF27EsqwZW2Dh
	qGOtxwfzH6MzycBzDlJ+wllvQHkr7rKAQXUG7vFINNnQjHfJnYruPXgSijO1ymhlTcdSpYIjWPZC0
	xvnp2y6xEbHDk6nyUCI/hoKxTsUuxIwj6DTu7SEN4yyCk9P3EfQM253xHRYh0rGHR0HORx4iguHx/
	IG5+iIUAgk6Rt7GK5XheTmEqCL43Sl1ygT3rVH2KUZnJflurC9LNOjvSDUJ1SEbeYs2L6Tf5LC0N2
	cZELbgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngx-0000000Cza1-2utg;
	Mon, 20 Oct 2025 11:04:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngv-0000000CzZ2-1r7z;
	Mon, 20 Oct 2025 11:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760958278;
	bh=S0gr+beW66g6d7RoCiZR+zG9DA0elSFkbETKy2N04NQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pXHJc2FNtClHFj9eM8P+MyxeRQdr3hjyYE/NHTr5gplDQ6b0FiKkWh5+fuUUQkh3P
	 vxdY1/NaeT9+p2F3MhtS2T9bHSVCDDKn1xekNXcd7dj4hrGGIMWnF5KMnw9eU5rLDj
	 YF4t+XHI6biYGH551ZAOJy6amFub7ICBmQhDdLNSajlQNojcVHxGWvTEawdLIS+tZT
	 6Iv3iigIVPbECkhtd8AHkNijp7q1myT076F/rJA9Vtwby0IcWla2ll8T8TEdhq3h75
	 aDaCIsbsp/5qnbTNJvb1vW5fe/ZY+G82ZRdY3ETCuFL1X91mTu5xt0fa0/hMCrzNV9
	 hgJulVcqYJNcw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A83D117E0C54;
	Mon, 20 Oct 2025 13:04:37 +0200 (CEST)
Message-ID: <6de4477a-5c2e-413f-9aa2-77b7262ebb38@collabora.com>
Date: Mon, 20 Oct 2025 13:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: ufs: mediatek,ufs: add MT8195
 compatible and update clock nodes
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>, "robh@kernel.org"
 <robh@kernel.org>, "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "macpaul@gmail.com" <macpaul@gmail.com>,
 =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 =?UTF-8?B?UmFtYXggTG8gKOe+heaYjumBoCk=?= <Ramax.Lo@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
 <20250722085721.2062657-3-macpaul.lin@mediatek.com>
 <b90956e8-adf9-4411-b6f9-9212fcd14b59@collabora.com>
 <438077d191833bb4f628b2c6da3b86b3ecfb40e6.camel@mediatek.com>
 <cb173df9-4c70-4619-b36d-8e99272551b6@kernel.org>
 <a9bf15e48afd8496ca9b015e7f5b03821863a0b2.camel@mediatek.com>
 <7f285723-ecd7-4df6-8c9b-f2e786ce3602@kernel.org>
 <4b3d2678d2b724fb53ec7272ef8daf52197d4a0e.camel@mediatek.com>
 <4dc420a3-cf89-4f45-84e7-4d0079240681@kernel.org>
 <95d3fe686abcd4a6070c6613392fdb9605bdd73e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <95d3fe686abcd4a6070c6613392fdb9605bdd73e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_040441_647469_AA3D3140 
X-CRM114-Status: GOOD (  24.66  )
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

Il 20/10/25 12:46, Peter Wang (王信友) ha scritto:
> On Mon, 2025-10-20 at 11:56 +0200, Krzysztof Kozlowski wrote:
>>
>> On 20/10/2025 11:44, Peter Wang (王信友) wrote:
>>> On Mon, 2025-10-20 at 10:28 +0200, Krzysztof Kozlowski wrote:
>>>>>
>>>>>
>>>>> Hi Krzysztof Kozlowski,
>>>>>
>>>>> The main reason for my objection was also clearly stated:
>>>>> "removing these DTS settings will make what was originally
>>>>> a simple task more complicated."
>>>>> I’m not sure if you are quoting only the "In addition"
>>>>> part to take it out of context?
>>>>
>>>> It is not out of context. It was the statement on its own.
>>>
>>> Hi Krzysztof Kozlowski,
>>>
>>> However, you haven’t addressed the main reason for my objection.
>>> "removing these DTS settings will make what was originally
>>> a simple task more complicated."
>>
>>
>> You did not object in technical matter at all here:
>> https://lore.kernel.org/all/ce0f9785f8f488010cd81adbbdb5ac07742fc988.camel@mediatek.com/
>>
>> Look at this patch.
>>
>> You said nothing about actual change, except blocking the community
>> maintainer. You did not raise any other concerns so what are you
>> speaking about "other main concerns"?
>>
>> Even if such existed, they did not matter, because YOU WROTE ONLY:
>>
>> "The role of MediaTek UFS maintainer is not suitable to be handed
>> over
>> to someone outside of MediaTek."
>>
>> This is what we discuss here.
>>
>> Do you even read your own comments and where did you place them? Do
>> you
>> understand that we discuss emails, not some unsaid or other threads?
>>
>> Look at this:
>>
>> https://lore.kernel.org/all/ce0f9785f8f488010cd81adbbdb5ac07742fc988.camel@mediatek.com/
>>
>>
>>> But it’s clear that you haven’t carefully considered the main
>>> reason for my objection?
>>
>> Main reason for objection? What?
>>
> 
> Hi Krzysztof Kozlowski,
> 
> I think you misunderstood—these are different patches.
> This one only changes the maintainer. What I was referring to
> is another patch that removes parts of the DTS setting.
> https://lore.kernel.org/all/eb47587159484abca8e6d65dddcf0844822ce99f.camel@mediatek.com/
> 
> 
> I don’t know who AngeloGioacchino is,

Sorry Peter, but a 10 seconds research on your side would have made you aware of
who I am.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/MAINTAINERS?h=v6.6#n2346

...then a 60 seconds research would reveal way more than just that about me,
and also your colleagues know me quite a bit :-)

Besides, you don't really need to know who somebody is to make an upstream review:
this is a community, and a good patch may come from old and recognized contributors
as much as from new ones sending their first patch upstream.

> so isn’t it reasonable for
> me to oppose directly changing the maintainer?
> Or do you think everyone should know who AngeloGioacchino is
> and just accept this change?
> 
> 
> Let’s put it this way: if a strager you don’t know suddenly comes
> to your home and says they’re now the maintainer of your house,
> would you be comfortable with that?
> 
> 
> 
>>
>>
>> You are twisting the problem, like anyone denied you being the
>> maintainer.
>>
>> YOU DENIED OTHER PEOPLE!
>>
>> I finish the discussion here, I am considering your explanations
>> intentionally twisting the point thus I find it still harmful
>> behavior.

Krzysztof, many thanks for taking time to defend the community.

Regards,
Angelo

>>
>> Best regards,
>> Krzysztof
> 
> I think you’re the one twisting my words.
> What I said was that I oppose people OUTSIDE of MediaTek becoming
> maintainers, not that I oppose other people in GENERAL.
> In fact, I also mentioned that other MediaTek maintainers
> would be joining.
> 
> 
> Thanks
> Peter
> 
> 


