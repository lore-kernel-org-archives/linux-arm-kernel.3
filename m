Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A35BE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLGKU/37ggRrUUV1Eg8bQB07ajlbxfs92tDC/kEoU7g=; b=odRYiAFixFNii1j+bqlXXgQruS
	6ugAPKzqFLxCwUl/JylKHchxVagHoytmPXAi26pcKuQU7OtME9TdMa1DLM95tG1UvfcNVwOTYeZm5
	lNy+wvxBPckDO0WDYx6B5DMlkRGV7SL6wtgt2JFJ/kIAgmAEiNnNdTnevMOah68eLD3Y0WAjob/K3
	ds1JxyOr7GA+IND0ACBzLOCq+97XkfupHHC1UgQL7Jz63ExAnLWcyZBBi9IpNbnUI7y6fR6vekpg6
	bv4sU4AePQmuxoXfIeIaY0drRMGh3+Y2FUKcTADzBrd2/3u4giSyHgBRwEJk9+WcGT1HxmnvG2gB1
	3nhD51Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNURi-0000000D2oE-46Ui;
	Tue, 17 Dec 2024 10:04:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU6i-0000000CyDL-2Fbt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 192B4A406C3;
	Tue, 17 Dec 2024 09:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561D3C4CED3;
	Tue, 17 Dec 2024 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734428591;
	bh=CACHX5R/J6miRCn5G4uzmvEf0fWXrDe/7BHXzOLDGpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lupp/tXPLJdZQBM6BTXKujksjWAXt4/Hc30snE7y5dZDfxKq6wcyhaO9Ghy6BuQPC
	 XJIOB1ELTzqyKABo4ZiVYof+gBTPNoH2VMggtXmgrncmgR5/eV0XeXqaDH6zvoy6kU
	 0VoTtNWTDylLEtzcklg4YVSysct2XWMPpUi7SWwGHPuHft/nRmN7GBBmLdXGwUHLHS
	 pMo07ALz6EkZ4epiI7BJZzpLrbAd9ZYGMaxmwagUIAIQFF1r5vx5Lx2K4P9s2pjCLp
	 kzD+wOY84KOVCPli2FV8605XuiI8hvqaXB2iDB3Xjec4/E1px4UJOnel9U4g0w3NE6
	 hS6FJucAD0/Jg==
Message-ID: <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
Date: Tue, 17 Dec 2024 10:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
 <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
 <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
 <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
 <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
 <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
 <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
 <17fbfcdd-8b79-4907-a4c8-798da0ef0526@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <17fbfcdd-8b79-4907-a4c8-798da0ef0526@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_014312_709985_6CF2EC59 
X-CRM114-Status: GOOD (  13.03  )
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

On 17/12/2024 10:31, Ivaylo Ivanov wrote:
> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>        - items:
>>>>>>>            - enum:
>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>          - clock-names
>>>>>>>  
>>>>>>>      else:
>>>>>>> -      properties:
>>>>>>> -        clocks:
>>>>>>> -          maxItems: 1
>>>>>>> +      if:
>>>>>>> +        properties:
>>>>>>> +          compatible:
>>>>>>> +            contains:
>>>>>>> +              enum:
>>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>>> +
>>>>>>> +      then:
>>>>>>> +        properties:
>>>>>>> +          clocks:
>>>>>> Missing minItems
>>>>>>
>>>>>>> +            maxItems: 2
>>>>>>> +
>>>>>>> +          clock-names:
>>>>>> Ditto
>>>>>>
>>>>>>> +            maxItems: 2
>>>>>>> +
>>>>>>> +        required:
>>>>>>> +          - clock-names
>>>>>> I don't understand why do you need second, same branch in if, basically
>>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>>> On Exynos8895? Where? With the same compatible?
>>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>>> they need a different compatible though? It's functionally the same i2c design
>>> as the one implemented in USIv1 blocks.
>> If one block is part of USI and other not, they might not be the same
>> I2C blocks, even if interface is similar. If they were the same or even
>> functionally the same, they would have the same clock inputs. However
> 
> I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
> something like that?
> 
>> user manual also suggests that there is only one clock, not two (for
>> both cases), so they could be functionally equivalent but then number of
>> clocks looks incorrect.
> 
> That'd be weird. Both according to downstream and upstream clk driver,
> for the USI-implemented i2cs we have a pclk and an sclk_usi.
Something is not precise here, as usually with Samsung clock topology.

First, the non-USI instances have the IPCLK as well, e.g. things like
PERIC1_UID_HSI2C_CAM1_IPCLKPORT_iPCLK

USI have BLK_PERIC0_UID_USI03_IPCLKPORT_i_SCLK_USI, but that's USI
clock, not HSI2C in USI. Datasheet mentions this is UART and SPI special
clock, but not I2C. The PCLK is used for HSI2C iPCLK.


Best regards,
Krzysztof

