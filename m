Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F9D6DDC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxy8lRymo3BYrM8MI3ZHa5xny/Psidz3PzveGAuRUA4=; b=JtO2eATF2uDkkzxTPTN4PYQgUj
	NZFr28m1q9I/gaBNrI+n/N2bd/Z20aFiZHAQYM1issKZFGAQv5lE1xwEknAI4cVbTbiFFroUum2aW
	fUVDwTiLMC2M0VyCe4EtnCdw84MhUZ3RW0IQmUeDOa5n5ghMdQT3Uw+JduF/1I4Ols9ngiR9S9zb6
	5b+Wi9/NsEPan1OQCEItK3gyVbSc2h6H6Z4Ss83YHQaLY1RT+EiXORCBELDjet/BFrmH4XMHAriFO
	z2DytkrS6s5HAv5eLXPTR7tee3MDq52HAZOv0UYFvr1H23LRjT9dy0VgdegUJchdFZIZ/T7loohAG
	VMc7DsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvTZ-00000008Y7H-47Qy;
	Mon, 18 Nov 2024 06:43:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvSa-00000008Xze-0A2o;
	Mon, 18 Nov 2024 06:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912125;
	bh=hkBROPeoD5rMUjYCyIB1phZYBgfbk1CSvz/OhAqXRo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TfdfMtp9anoHDX6J3bUXMT30uvCBfHLSu9NG3H/4PNxVWQwjI+sXiM/HoYdrzXDie
	 49zHY7tDKadHkJ301mviS1XcRxolEa4M99bH42sKqy3wHD1PMbcx2bH4jlkdH5kq60
	 9wPZ703y/xuBqhcSCVQnmIc+/kp33VnCeluqCFvpackG/sJgMpZTAZQenyyJ4aRAqa
	 WmndLisx9HiH7CGK4UeWHLWBnGP53JuAl72FldAXs1Ot8ae8wMD6snAyG0ihC3hw6+
	 tYqJSyZqs45EDB8p1XR2t/cr5/ruo99NIsi1J2fDWsalMqg0gEWR3JYhJZlL9uIh/i
	 nwExZU78o2gtQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF43517E1221;
	Mon, 18 Nov 2024 07:42:04 +0100 (CET)
Message-ID: <fd1c76ba-e288-4cc9-abcc-522b5ea6b0b9@collabora.com>
Date: Mon, 18 Nov 2024 07:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: Fei Shao <fshao@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241105093222.4055774-1-fshao@chromium.org>
 <20241105093222.4055774-3-fshao@chromium.org>
 <b66dbf9e-b35b-482c-9eb7-112ef1f398d6@collabora.com>
 <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
 <59f4bcc1-c752-4f2f-8e55-349cc2432b8a@collabora.com>
 <CAC=S1nhhfwHU5K5ZyUhZBhvz38LOZGLnGN-Rc1ZAup_VTfkpvA@mail.gmail.com>
 <CAC=S1nj5PVJ=zwZiBLoOCHzsspaRw9ddAH_dXfPayD=LyW5wNA@mail.gmail.com>
 <545b6db8-c7d7-4a28-a040-12088f9002df@collabora.com>
 <CAC=S1nhX88aaQ6dusab1qM2_noaSjTMdhJ9t5o4L_Nri9dWPVw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1nhX88aaQ6dusab1qM2_noaSjTMdhJ9t5o4L_Nri9dWPVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224208_537233_1DAFFE88 
X-CRM114-Status: GOOD (  33.98  )
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

Il 18/11/24 06:26, Fei Shao ha scritto:
> On Thu, Nov 14, 2024 at 6:09 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 11/11/24 08:10, Fei Shao ha scritto:
>>> On Fri, Nov 8, 2024 at 12:11 PM Fei Shao <fshao@chromium.org> wrote:
>>>>
>>>> On Thu, Nov 7, 2024 at 6:37 PM AngeloGioacchino Del Regno
>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>
>>>>> Il 07/11/24 07:58, Fei Shao ha scritto:
>>>>>> On Wed, Nov 6, 2024 at 9:19 PM AngeloGioacchino Del Regno
>>>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>>>
>>>>>>> Il 05/11/24 10:30, Fei Shao ha scritto:
>>>>>>>> Introduce MT8188-based Chromebook Ciri, also known commercially as
>>>>>>>> Lenovo Chromebook Duet (11", 9).
>>>>>>>>
>>>>>>>> Ciri is a detachable device based on the Geralt design, where Geralt is
>>>>>>>> the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
>>>>>>>> different combinations of second-source components, including:
>>>>>>>> - audio codecs (RT5682S and ES8326)
>>>>>>>> - speaker amps (TAS2563 and MAX98390)
>>>>>>>> - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)
>>>>>>>>
>>>>>>>> Signed-off-by: Fei Shao <fshao@chromium.org>
>>>>>>>> ---
>>> [...]
>>>>>>>> +&pmic {
>>>>>>>> +     interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&scp {
>>>>>>>
>>>>>>> Is this SCP-dual or SCP?
>>>>>>> I see SCP, but I also see a SCP-Dual memory region... what's going on here?
>>>>>>>
>>>>>>> Of course, the SCP-Dual won't work if you don't override the compatible string...
>>>>>>
>>>>>> To clarify, the second SCP core is used for MIPI camera in downstream,
>>>>>> and I deliberately only describe the first SCP core here since the MTK
>>>>>> camera ISP driver isn't in upstream at the moment.
>>>>>> I had a fixup patch for removing the scp-dual reserved memory region,
>>>>>> but likely it was missing during the rebase... let me check again if
>>>>>> it can be removed, just in case there's firmware protecting the region
>>>>>> and the kernel shouldn't access it.
>>>>>>
>>>>>
>>>>> Hmm... but the second SCP core can still be brought up, even if the MIPI Camera
>>>>> driver is not upstreamed yet, right?
>>>>
>>>> Well, that's true... and it should pave the way for validating the
>>>> driver with the upstreamed DT whenever that becomes available.
>>>>
>>>>>
>>>>> That shouldn't cause lockups and/or other kinds of bad behavior, and should
>>>>> bring up a core and just never use it, without any particular issues.
>>>>>
>>>>> If we can enable the secondary core, let's just go for it.. as that will help
>>>>> specifying the exact memory layout of this board (and failing to do that may
>>>>> create some other issues, that's why I'm proposing to enable that even if it
>>>>> is not really used in this case).
>>>>>
>>>>> What do you think? :-)
>>>>>
>>>>
>>>> Sure, that sounds good to me, too.
>>>> I started only with the essential DT bits to ensure the device can
>>>> boot, which it does, so I guess it's time to bring that back. I'll
>>>> incorporate that in v3.
>>>> I plan to fix up the single SCP core node to SCP-dual directly, so
>>>> please let me know if you prefer seeing that as an individual patch on
>>>> top (either option works for me).
>>>>
>>>
>>> In fact, I noticed that it seems to require modifying mt8188.dtsi (and
>>> potentially mt8390-genio-700-evk.dts) to support the second SCP core,
>>> but I want to avoid doing so in this series if possible to keep this
>>> as a pure new .dts introduction (if that makes sense).
>>>
>>> I can think of 3 options here:
>>> 1. I resend this series *with* the single SCP core enabled in
>>> -geralt.dtsi. And then I send a follow-up series to introduce the
>>> second SCP core and update the affected .dts{,i}.
>>> 2. I resend this series *without* any SCP cores in -geralt.dtsi. And
>>> then I send a follow-up series to introduce both of the SCP cores at
>>> once, and update the affected .dts{,i}.
>>> 3. I delete the parent (mt8188) scp declaration and re-describe the
>>> dual-core SCP structure in -geralt.dtsi. This avoids touching
>>> mt8188.dtsi and mt8390-genio-700-evk but leaves the dual-core SCP
>>> stuff exclusively to geralt/ciri. I don't know if MT8390 wants to
>>> utilize the second SCP core or not.
>>>
>>> I guess (3) is less likely what we want down the line, but that's just
>>> for reference. Any preference/suggestion?
>>>
>>
>> I want to verify with MediaTek whether the Genio 700 EVK can make use of the
>> dual-core SCP first, as it is highly possible that it indeed can and, if that
>> is the case, counting that any product development would be anyway based on
>> the EVK.... we will probably never see single-core SCP in MT8188 devicetrees
>> ever again.
>>
>> Please send the Geralt/Ciri devicetrees without SCP support for now, so that
>> we can get the vast majority of the code upstream - which anyway is likely
>> 95% of what you have right now... then I will either notify you for how to
>> proceed with the SCP (especially if I come to a conclusion before you send
>> the new series), or I will just send the SCP DT series on my own.
> 
> Noted. This is currently on the back burner as I have other tasks at
> hand, but I'll get back to it ASAP (hopefully later this week).
> 

There's no rush. It's too late for 6.13 anyway, so take your time :-)


> Thanks,
> Fei
> 
>>
>> Cheers,
>> Angelo
>>




