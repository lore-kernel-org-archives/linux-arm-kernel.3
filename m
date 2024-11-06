Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0D2D44D55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZVcBoQ6lm040OAZw+4Mt8FOdcWP0sToZEiJCYG23Sg=; b=w5TY+spcXLUbngwDAcukIijjJ3
	1KxBGH6YuKFVJeUb96L1a1UaJHd3IxQwFtk9wLFZ10z0Ka6IPyUWjzLpTtzJT52HTXvPSCOMCmCpp
	hVBMJWHYeE95mLezr4omR0loTCl4utCBBwUMipWEPPAE6SJDIe0qm2w0MEhsrUZSVTVfjvD5jwTSN
	kw2kkroLz8zUfA+c2KJL6Atbq8ea4g/KytBYOwcGHla0yft7kO8fAnUI6LzqSZzJV3yANjjzB8UhL
	FrbYANG9/GeLjDdD9Vy3vqGgfx2E2lhtJCuD2TeN4LSXYTbbWug7tQiC4iKbxWiLia+SdJDsgdgG0
	bPBZLPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ejO-000000034xt-31Q3;
	Wed, 06 Nov 2024 12:01:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eF1-00000002ve1-1E7C;
	Wed, 06 Nov 2024 11:30:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a99cc265e0aso1035505866b.3;
        Wed, 06 Nov 2024 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730892625; x=1731497425; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZVcBoQ6lm040OAZw+4Mt8FOdcWP0sToZEiJCYG23Sg=;
        b=CvTBZC5WPXWjowKwwISidbs/vTxkmqC8l8OX/lqHAPLwyAjN/GHYmYFFT+dU0jeSkB
         lDP4AAp+o6/OrA/pIdWkXU+8KnlBkynkE4qh21lf/1vJndzvEb0BOzaHlov6t+S1Lsl1
         1vzp6xG291PTVBKUtigeTxtuvOU/+ZNM3erz4Rm3tP3ADVv76v3pcQCQidT6gvTWPMg+
         7ZsCdGjT5jCwKjN6+400vkx52xfYXSqLSOhv+CHsq1QnZecGWfPTDqIrA6zzULfUKWYw
         +yF4EWYZNLKTa0jZTvCZcSa71m8DZsSF1yE0p5l91bbdmkgV9pc1pssFW20Pbu1nP0pp
         61XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892625; x=1731497425;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZVcBoQ6lm040OAZw+4Mt8FOdcWP0sToZEiJCYG23Sg=;
        b=M7iwma8/BfR8wIVyW7P/kGxJ/hGG954b9aLpX0MdhtIF1QM6m3YcH6TiyiwSC/xOLa
         gOFWakb5nEG5h4aJfaDkLOBOrKtHTOMs3/yJ8mQmMCj0ObvXuCi9zbQKLs8/eJuCSg7i
         WJ3G29KPGSYox6THC08j25/SoI9XarBfhCp+wI12zpxZochUcrWaZUfEbCcGL9z060Si
         5IAchkpQ2JlyCjiOMo/DCduMsCoYK9YDogDA3JbGrMPMszTMxm34BgjwDCDF10wLU+bk
         /EJoU7GiKuohieB2yDx1PemfoguSmFlFjv5ehcZAB64I65XBlXrPqE1UwXt4zAwvsFVs
         pECA==
X-Forwarded-Encrypted: i=1; AJvYcCUBeICsECGvlgfht7Cty+sSmk/dwHkaNBPnM1iIXPpnkfui6ufpNtm6WQx3Ljs/+wLiXzUyGyDa2B1OTbiJwTXr@lists.infradead.org, AJvYcCWOgz9DbA0dJkGYALK6Wm4AWihVkQKkkG6qfsM5RxxJ1VnhRcuxLKNZu2nbn8MdfJ9lQa2k7V4SReo0P5O8CJM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Q34moHwIa/CrSKyBO3Cb+ZM6aHMLJKTj4jomX0o1ByzaxaxK
	2Eg/ElJPSKse+yFcRZ6cg9MBBk6/Q72b2wfKeno7jufrUyjQR0n9
X-Google-Smtp-Source: AGHT+IHvU2Uae5i8h8nwHHV11pWuGal0zqGEf/SFEAtEDcUc0PhneUzPN4JW2VIwF8CisEQvdATb6A==
X-Received: by 2002:a17:907:7f07:b0:a9a:17f5:79a8 with SMTP id a640c23a62f3a-a9de5d6fad3mr3949625966b.13.1730892624183;
        Wed, 06 Nov 2024 03:30:24 -0800 (PST)
Received: from [10.30.1.160] ([95.183.227.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181335dsm261338866b.176.2024.11.06.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 03:30:23 -0800 (PST)
Date: Wed, 06 Nov 2024 14:30:13 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 3/6] soc: mediatek: pwrap: Add support for MT6735 and
 MT6328 SoC/PMIC pair
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, jason-ch chen
	<Jason-ch.Chen@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Flora Fu
	<flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Message-Id: <DA1JMS.JREL9T5RHOOO2@gmail.com>
In-Reply-To: <1501dac5-ec1a-4a06-be8c-c222017e0a62@collabora.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
	<20241018081050.23592-4-y.oudjana@protonmail.com>
	<b24d984f-c944-4faf-bce9-96052abb085b@collabora.com>
	<HSNPLS.P9M4WFJGIA0V2@gmail.com>
	<1501dac5-ec1a-4a06-be8c-c222017e0a62@collabora.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_033027_404062_DA6AE29F 
X-CRM114-Status: GOOD (  31.58  )
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


On Tue, Oct 22 2024 at 11:44:46 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 21/10/24 16:48, Yassine Oudjana ha scritto:
>> 
>> On Mon, Oct 21 2024 at 15:25:00 +02:00:00, AngeloGioacchino Del 
>> Regno <angelogioacchino.delregno@collabora.com> wrote:
>>> Il 18/10/24 10:10, Yassine Oudjana ha scritto:
>>>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> 
>>>> Add register definitions and configuration for the MT6735 SoC and 
>>>> the
>>>> MT6328 PMIC which are commonly paired and communicate through the 
>>>> PMIC
>>>> wrapper.
>>>> 
>>>> Note that the PMIC wrapper on MT6735M has a slightly different 
>>>> register
>>>> map and is therefore NOT compatible with MT6735.
>>>> 
>>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> ---
>>>>   drivers/soc/mediatek/mtk-pmic-wrap.c | 251 
>>>> ++++++++++++++++++++++++++-
>>>>   1 file changed, 248 insertions(+), 3 deletions(-)
>>>> 
>>>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c 
>>>> b/drivers/soc/mediatek/mtk- pmic-wrap.c
>>>> index 9fdc0ef792026..b9e8dd2a5999d 100644
>>>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>>>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
>>>> @@ -3,6 +3,7 @@
>>>>    * Copyright (c) 2014 MediaTek Inc.
>>>>    * Author: Flora Fu, MediaTek
>>>>    */
>>>> +
>>>>   #include <linux/clk.h>
>>>>   #include <linux/interrupt.h>
>>>>   #include <linux/io.h>
>>>> @@ -100,7 +101,7 @@ enum dew_regs {
>>>>       PWRAP_DEW_CIPHER_MODE,
>>>>       PWRAP_DEW_CIPHER_SWRST,
>>>>   -    /* MT6323 only regs */
>>>> +    /* MT6323 and MT6328 only regs */
>>>>       PWRAP_DEW_CIPHER_EN,
>>>>       PWRAP_DEW_RDDMY_NO,
>>>>   @@ -121,8 +122,10 @@ enum dew_regs {
>>>>       PWRAP_RG_SPI_CON13,
>>>>       PWRAP_SPISLV_KEY,
>>>>   -    /* MT6359 only regs */
>>>> +    /* MT6359 and MT6328 only regs */
>>>>       PWRAP_DEW_CRC_SWRST,
>>>> +
>>>> +    /* MT6359 only regs */
>>>>       PWRAP_DEW_RG_EN_RECORD,
>>>>       PWRAP_DEW_RECORD_CMD0,
>>>>       PWRAP_DEW_RECORD_CMD1,
>>>> @@ -171,6 +174,23 @@ static const u32 mt6323_regs[] = {
>>>>       [PWRAP_DEW_RDDMY_NO] =        0x01a4,
>>>>   };
>>>>   +static const u32 mt6328_regs[] = {
>>>> +    [PWRAP_DEW_DIO_EN] =        0x02d4,
>>>> +    [PWRAP_DEW_READ_TEST] =        0x02d6,
>>>> +    [PWRAP_DEW_WRITE_TEST] =    0x02d8,
>>>> +    [PWRAP_DEW_CRC_SWRST] =        0x02da,
>>>> +    [PWRAP_DEW_CRC_EN] =        0x02dc,
>>>> +    [PWRAP_DEW_CRC_VAL] =        0x02de,
>>>> +    [PWRAP_DEW_MON_GRP_SEL] =    0x02e0,
>>>> +    [PWRAP_DEW_CIPHER_KEY_SEL] =    0x02e2,
>>>> +    [PWRAP_DEW_CIPHER_IV_SEL] =    0x02e4,
>>>> +    [PWRAP_DEW_CIPHER_EN] =        0x02e6,
>>>> +    [PWRAP_DEW_CIPHER_RDY] =    0x02e8,
>>>> +    [PWRAP_DEW_CIPHER_MODE] =    0x02ea,
>>>> +    [PWRAP_DEW_CIPHER_SWRST] =    0x02ec,
>>>> +    [PWRAP_DEW_RDDMY_NO] =        0x02ee,
>>>> +};
>>>> +
>>>>   static const u32 mt6331_regs[] = {
>>>>       [PWRAP_DEW_DIO_EN] =        0x018c,
>>>>       [PWRAP_DEW_READ_TEST] =        0x018e,
>>>> @@ -394,7 +414,7 @@ enum pwrap_regs {
>>>>       PWRAP_ADC_RDATA_ADDR1,
>>>>       PWRAP_ADC_RDATA_ADDR2,
>>>>   -    /* MT7622 only regs */
>>>> +    /* MT7622 and MT6735 only regs */
>>>>       PWRAP_STA,
>>>>       PWRAP_CLR,
>>>>       PWRAP_DVFS_ADR8,
>>>> @@ -417,6 +437,8 @@ enum pwrap_regs {
>>>>       PWRAP_ADC_RDATA_ADDR,
>>>>       PWRAP_GPS_STA,
>>>>       PWRAP_SW_RST,
>>>> +
>>>> +    /* MT7622 only regs */
>>>>       PWRAP_DVFS_STEP_CTRL0,
>>>>       PWRAP_DVFS_STEP_CTRL1,
>>>>       PWRAP_DVFS_STEP_CTRL2,
>>>> @@ -481,6 +503,50 @@ enum pwrap_regs {
>>>>       /* MT8516 only regs */
>>>>       PWRAP_OP_TYPE,
>>>>       PWRAP_MSB_FIRST,
>>>> +
>>>> +    /* MT6735 only regs */
>>>> +    PWRAP_WACS3_EN,
>>>> +    PWRAP_INIT_DONE3,
>>>> +    PWRAP_WACS3_CMD,
>>>> +    PWRAP_WACS3_RDATA,
>>>> +    PWRAP_WACS3_VLDCLR,
>>> 
>>> Are you sure that you need the PWRAP_MD_ADC_xxxx registers in here?
>>> 
>>> Since MD is relatively big on its own, I'm not sure how to proceed 
>>> here.. it may
>>> make sense to split the MD part to a different array, or it may 
>>> not... I do need
>>> to understand what's going on.
>>> 
>>> Can you please point me at some reference code to look at, so that 
>>> I can understand
>>> the situation a bit?
>>> 
>>> Besides, I'm noticing that the "MD_ADC_RDATA_ADDR_R(x)" are 
>>> sequential registers
>>> and that's on more than just MT6735: instead of having 32 more 
>>> entries, it might
>>> make more sense to set only the first and declare the number (or 
>>> size) of regs...
>>> 
>>> Something like:
>>> 
>>> enum pwrap_regs {
>>>     .....
>>>     PWRAP_MD_ADC_RDATA_ADDR_LATEST,
>>>     PWRAP_MD_ADC_RDATA_ADDR_WP,
>>>     PWRAP_MD_ADC_RDATA_ADDR_R0,
>>>     PWRAP_MD_ADC_STA0,
>>>     PWRAP_MD_ADC_STA1,
>>>     PWRAP_MD_ADC_STA2
>>> };
>>> 
>>> static const struct pmic_wrapper_type pwrap_mt6735 = {
>>>     .regs = mt6735_regs,
>>>     .num_md_addr = 32,
>>>     [other stuff]
>>> };
>>> 
>>> ...but again, please, if you can point me at an implementation that 
>>> actually
>>> uses the R(x) registers, that'd be better ... so that we can choose 
>>> the best
>>> option to add those in there.
>>> 
>>> Everything else is great: good job :-)
>>> 
>>> Cheers,
>>> Angelo
>> 
>> I just defined all the registers I could find. We aren't using them 
>> for anything yet so it's also fine to keep them out for now.
>> 
>> It seems that in the downstream kernel they are only initialized 
>> once and never accessed again. This is the only place I could find 
>> where they are accessed:
>> https://gitlab.com/Tooniis/linux-samsung-grandpplte/-/blob/master/drivers/misc/ 
>> mediatek/pmic_wrap/mt6735/pwrap_hal.c#L1254-1290
>> 
>> 
> 
> Thanks for pointing me at that reference.
> 
> Yeah, looks like they're getting statically initialized to some 
> value, and then
> nothing else... I wonder if the values that they're writing are just 
> the register
> defaults, or if they're actually overriding anything for real...
> 
> ...that's because, in case those are the defaults, we may get them 
> set by just
> resetting the MD, catching two birds with one stone.
> That'd be easy to check, anyway, as you can just read them out and 
> see if the
> values are these...

The values aren't defaults. The registers all default to 0 and these 
values are PMIC registers.

Anyway, I'll just remove the registers since I won't need them any time 
soon.




