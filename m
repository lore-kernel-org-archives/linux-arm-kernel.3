Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC03CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WKaXiDZyUAM48sP8bDjyauwQtKH/VLVZk3l/cZMbDQ=; b=kvrwdOZSu1cDqS071ng2dQ7Au9
	JuU+Hxph3e4Iq/sLIsuD6JP1UXMfJ+qt9GyyC4CZn/ILA+3Hu35DIo+QZ8izZGU1E/dBKsdADQCLI
	L16KEXzONy0m5IiTqiRfA76dvIsekAf6cLlfxqTOXsC+b7sjLwe5Qvk+nWcrQauJ0Iz2UtK0eg66u
	5sh/MNCS7DMt0EYrXVRYmjws75KCw4bwPocmgGIBNBLCyWoOxiZmk0/xu4kh7m9igJboadzVCw8uY
	aEiivw/0U50bb+++6NrGDtVxmCQWX6sXK/u6Fn8I1bgCSqWoMNLkKkdKxl0PSthMneNc1bew0q6tP
	Xs75UujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYFo-00000002XVv-1kTY;
	Fri, 19 Sep 2025 10:22:12 +0000
Received: from bg1.exmail.qq.com ([114.132.67.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYFm-00000002XV2-1MGu;
	Fri, 19 Sep 2025 10:22:11 +0000
X-QQ-mid: zesmtpip2t1758277275ta8f180fc
X-QQ-Originating-IP: FaZuIGI3lqEvBtl92gk0ndR9LDofYDIzCT5EB3kaeoo=
Received: from [IPV6:240f:10b:7440:1:ce36:128f ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Sep 2025 18:21:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16849280493774206844
Message-ID: <E2F727E460ACE497+3eb0af61-5175-47f1-a2f2-4bae7471b916@radxa.com>
Date: Fri, 19 Sep 2025 19:21:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa
 ZERO3
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ed W <lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <2325560.3ZeAukHxDK@diego>
 <0DB47BC84E90B0E6+694b1274-4826-4ec1-9aa2-ca8aa790f61a@radxa.com>
 <1971910.g5d078U9FE@diego>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <1971910.g5d078U9FE@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NojR6Ao/DkEDOzfxtENjUyQURpJdQNHOroe4VshccZ3SVgNOr8liZPYK
	HX6UFTrhAyrNgkQ9TeeaTcAUvqsNCWEGKUuz2FIBYzAmT9hJ3ueXpVcGzUp3WUu+rbG3Xnt
	Xn76txT/HTFG6xlVroukdIAMduzlneXbQT0Os6d03CJjkH9arDHxTTnCY4ZEo6qjIW1kPwO
	qP6xx6DOeQP4Y1tjMiOBfEfuRjomVXcJ4469GuwLKGFincYKIT5bL5qXydMc+U1SJGGmOUc
	N+BwkdzODiL2QI3/jy48fAjE15gSIFZX/i47+HgqbcvpyLk4yR+7jkmVQ7TahyofEgE8sAk
	MYYcZtl1iyH7fX1BMukcCDA6E2zTMj9CZP+7CpuRC9S0tBNxOk/mbhqJT1holqLXuN0Pin6
	zyR99PMN/UVP09hjU4qakG/kzO6Q3dpgX0rmATtXX6a1CAIZldwr8ogOtC6RPlbUL3TmpZn
	PCFVK9F/YV0dQ/XTyGjoXYHAby0xlneX/GVE1ySBlDe32YOlfCEj+w5d1Q3k04Is8rTUxb+
	3iCa7aC6qNFBJjw5Z1H20oQLc7bxUuCO5zLEB3bJGBgNuVsAWy8as2/tFIhOAFuh8jbqsy9
	G9gl2hFJL/K1RY8H9nTeJPo4UB0Ctmzw6M4ncVM1l6Gp79TW6LP4FRJmGaKCw+rGI+cQK65
	HENUPwf6MrFguRuJQKqPtK3Wc6xG2kjBf0+5A169jEXWMvk3cPl9xUjk9n0FoX9HQcu69Cm
	sb7uawSBubOJwinUII9bkIvfk1g2vRZ1YdzWBBrwPKngquDxcvl5Nb/imPAwur46I4Q9LLR
	zgJm/oDdSrZyBdKxuNJ1upm4DkUi5oq/TpVJ6ikZVvuah/3bavC/HAJkroBDftNfFpk+vJL
	axrp+7L2vU7pK7gRNdTCBIVRu6ZpkhkiQQhdcegZJxJ0b4alY/NBrPLJc5HJorCY7BoMFl8
	9Cg/XVXNE+vFpK/ujEH7Vk77q18MPRf8rWjjgVNdp/gsoFvSIqbePgM1M/lsdMhQhynI85D
	zAan8N6n0/dZ/dCT+FGIDCY7leQrVIi49rJfPD33ORFQBxRCaT
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_032210_691884_CD9439C2 
X-CRM114-Status: GOOD (  20.44  )
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

On 9/19/25 19:17, Heiko Stübner wrote:
> Am Freitag, 19. September 2025, 01:57:57 Mitteleuropäische Sommerzeit schrieb FUKAUMI Naoki:
>> Hi Heiko, Ed,
>>
>> On 9/19/25 01:18, Heiko Stübner wrote:
>>> Am Donnerstag, 18. September 2025, 17:23:04 Mitteleuropäische Sommerzeit schrieb Ed W:
>>>> On 18/09/2025 05:53, FUKAUMI Naoki wrote:
>>>>> Hi Ed,
>>>>>
>>>>> Thank you very much for your work.
>>>>>
>>>>> On 9/17/25 20:49, Ed Wildgoose wrote:
>>>>>> The rk3566 has multiplexed pins and the uarts can be moved to a choice
>>>>>> of 2 pin groups. The default rk356x-base.dtsi appears to default to mux0
>>>>>> for all uarts, however, specific hardware might choose to implement
>>>>>> alternatives
>>>>>>
>>>>>> The Radxa zero 3 shows that is uses M1 for uarts:
>>>>>> - uart4
>>>>>> - uart5
>>>>>> - uart9
>>>>>>
>>>>>> These aren't normally enabled, but we should at least correct the
>>>>>> default pinctrl definitions. Without these changes there will be
>>>>>> conflicts with mmc0/mmc1, leading to the SD or eMMC going missing.
>>>>>
>>>>> Sorry, but why do we need these definitions for disabled nodes?
>>>>>
>>>>> Or why don't we do similar definitions for nodes other than uart?
>>>>> For example, PWM12, I2S3, and SPI3 also use M1. Are they not related to SD/eMMC and therefore
>>>>> don't need to be defined?
>>>>>
>>>>> If users want to use UARTs on pin headers, they will refer to the correct documentation[1] to
>>>>> determine which pins are UARTs and will of course write the correct pinctrl definition.
>>>>>
>>>>> [1] https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interface#gpio-interface
>>>>>
>>>>> Best regards,
>>>>>
>>>>
>>>>
>>>> Personally, and I'm saying this as a user who is technical enough to fix the definitions, it took me
>>>> quite a few days to figure out what was wrong with the definitions and understand the intricate tree
>>>> of dtsi includes, to finally figure out why I couldn't just do a "status = "okay";" to enable the
>>>> UARTs... (which is roughly what is shown in several radxa supplied overlays to enable uarts on
>>>> various boards)
>>>>
>>>> So my vote would be to correctly define all the hardware for a given board. Then users can simply do
>>>> a status="okay" to enable and off they go.
>>>
>>> And I'd agree with that argument. Setting up the needed pinctrl settings
>>> for the peripherals described in the device documentation
>>> ( https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interface#gpio-interface )
>>>
>>> is the sensible thing to do. While keeping the peripherals itself disabled
>>> and for the user to decide which peripheral to enable.
>>
>> I'm not strongly opposed to this policy, but I thought if you're going
>> to do this, you should do it for everything, not just UARTs.
> 
> yes, exactly
> So patches for the other header peripherals welcome :-) .
> 
> But still it's nice to do it in steps like this one, as it makes reviewing easier.

I agree.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> 
> 
> Heiko
> 
> 
> 


