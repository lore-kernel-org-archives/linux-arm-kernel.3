Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51ECC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y05GgcUzyRvbTep5413nOELZn3QacVghe1JgbSP50KQ=; b=0QEdjvOMTynaZP//42bBri8f/t
	fKuvsKJ9UsoCecTbuprlH1YDXEcqLMMmkEjEIZT0v5nS+mAhfMUy9S8SjDFkOkPZw5HaqtmTabPcC
	BrWC29cvdX1O8Qb4JBKlFDssgDT9hsI34vBqizCVBRWKXrWkEdT1SjV4EPe+O1yNrixuK70+o41r+
	DcxoLINBoLRHT62dBpJJdFqSsY45C0NLyHzOVrPr46Ykq0IIfh/4xAXxcWgwRnX5D60xyeOGHkhj8
	LsBFZdoqL+5g6FMOsvMWnWTQui9qHTFOm907PlGf+9dPiTCQ9AupoW4NT+vRr2pbmMhn72KDtzU2y
	JhA5UnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPh6-00000004DrY-3BBu;
	Tue, 04 Mar 2025 10:40:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPeV-00000004DAo-2C2P;
	Tue, 04 Mar 2025 10:37:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abf4d756135so508471166b.1;
        Tue, 04 Mar 2025 02:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741084650; x=1741689450; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y05GgcUzyRvbTep5413nOELZn3QacVghe1JgbSP50KQ=;
        b=N8769KRZj2VgoiuOq4VPCWPscsCocsxXfTi+5QmQhv0NNylB9s3chC7cGogFQjCzQm
         dYhWUDz35xSohIND3YZLpSSawrFt/MfnTLfaM+RKxSTBfxNhCS/k4dKEQrL27GCU9tBe
         HyfmLahD+4dRwB7AYY0seq0TRzEnJcHSirAX0AjB8WMz0gzk3KeIFToPYo3EXBQGlQ1D
         /ez/C7b4CmvX4gVG1ckDq3qOZES41Jy/bvM+1lMhlQv4u065Gg/Tdui1mCY1PRneaTvA
         RWZfjoKyglb1351rxmX2KGaM5LFkoCChNyA8aHC3+btvAq5J0+CpYdUZu1XkidzGV2ag
         tqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084650; x=1741689450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y05GgcUzyRvbTep5413nOELZn3QacVghe1JgbSP50KQ=;
        b=UXon09HY6f00+t9IPAqBIa0X/54av+tsDTTS76kiPDsxX9UqtEstMA08oaLPKNKh2A
         35vHCBg7ruma3GLYD9oeRFUk/JsWfvUGndXqfKuxW+xtS+0gsIAjA65xPu5Pcww7Phwv
         697xzsAXnS/F6TEzbn7tMeKR2q1UTRIaG9di9lMv/Udckoip6IjwrwdVUI5jsYo/8uBD
         Fv1lULj10eCyRg3gTqDQHPAC8cYaYul8xX33cgtzpdWmcHERtohgb2hBIt9/mcpKYeho
         xc0NqYwYE6PtFQ5CKM+0MtvH7LVwZMZWL1UFFBPQ8ooQMnNuFZpqFE8iOekXN1mFL5IN
         uxdw==
X-Forwarded-Encrypted: i=1; AJvYcCV+uWKep6Wh62ZO9d2J34LIq4smPm3bZtm3+Bqu6VICW85PkHhYfmVxhXiaanMNZLvN1kpyA3sDpPkZ@lists.infradead.org, AJvYcCV5z2udtgvbKe2tX+sf9XmD4ZbwiJkl6gZ50u3sEBcRYfC6ujETfBRWSD23PBfoUVcv113Q3ct/9rX7K3Hr/Rc7@lists.infradead.org
X-Gm-Message-State: AOJu0YzZPABYVzyjX8cXuH/u/G5Ps0cWMNCCfJRfJ/UwAJ/Bz+Wc+c1r
	dGHPgP92NFPugkTBDwVTjxOd/jNqa1p5lLTrpjjMQ/m0J6PSV/j/
X-Gm-Gg: ASbGncv2Ovc+o0i4sMA5RQsS9HUWh+G9yfaEIgTlOCGsniPZMA2h0pbVdnpmdGKHsm4
	4cg5eWpalG4aTTLCVe44478O9NSrMGk/zeLkzePiOj+jX3MVrdYgKzMx2aqZkOpBUwo2zQQM/9J
	DOqLWd5xURqRScJro4TaMcSSEi3m7jrgU3p1QXZdmD0hm4REHGsY9Lj2dcdrc6ir448k0yv5YRd
	PPgetVoAFUzXhAqpHMi13BTdUjqSKoi6EWF6En3XEJMLhIrs1i1Pzdd+V0XHOoEAgiGcRwAkTtw
	775Fk+CeXP7hNFFhw9ezbQM6EfO8HkbATcnONbWZD+tVUbQQFbEukGWa3BY=
X-Google-Smtp-Source: AGHT+IH8pMgz4t35O8oyRIFQxpdE0tnaA9mngLuWrWyOfwIXMudSbWqIktMm891rz72griamnTx0kg==
X-Received: by 2002:a17:907:3e94:b0:abf:55c8:4cd5 with SMTP id a640c23a62f3a-abf55c85c18mr1332877066b.12.1741084649331;
        Tue, 04 Mar 2025 02:37:29 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1ea18e32csm149481966b.137.2025.03.04.02.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 02:37:28 -0800 (PST)
Message-ID: <0b8f71cf-03ee-4b5f-94ba-92811fccb541@gmail.com>
Date: Tue, 4 Mar 2025 12:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
 <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
 <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
 <c8184542-5dab-4403-bee4-867810397ae4@kernel.org>
 <4502b578-96e6-49e0-8f3b-54f6e5640c55@gmail.com>
 <354d6100-311f-44d7-b8a5-1fd671b651e3@kernel.org>
 <9fb63a04-5b3d-40cc-b96f-eb4f297f307e@gmail.com>
 <027decb4-3fa9-40a5-9cf4-65f9a69b4566@kernel.org>
 <21460de5-76a0-4576-a7e6-f4873e40de48@gmail.com>
 <9ec6c2c6-cf99-4c6e-8fc2-871716987c54@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <9ec6c2c6-cf99-4c6e-8fc2-871716987c54@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_023731_568368_6E0601DD 
X-CRM114-Status: GOOD (  37.62  )
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

On 3/4/25 12:03, Krzysztof Kozlowski wrote:
> On 04/03/2025 10:09, Ivaylo Ivanov wrote:
>> On 3/4/25 09:21, Krzysztof Kozlowski wrote:
>>> On 03/03/2025 18:18, Ivaylo Ivanov wrote:
>>>> On 3/3/25 09:24, Krzysztof Kozlowski wrote:
>>>>> On 02/03/2025 10:16, Ivaylo Ivanov wrote:
>>>>>> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>>>>>>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>>>>>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>>>>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>>>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>>>>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>>>>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>>>> ---
>>>>>>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>>>>>>>  1 file changed, 76 insertions(+)
>>>>>>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>>> You have undocumented dependencies which prevent merging this file.
>>>>>>>>> First, dependencies have to be clearly expressed.
>>>>>>>> They are, in the cover letter.
>>>>>>> Where? I read it twice. Dependencies is the most important thing and
>>>>>>> should scream at beginning of the cover letter, so if you bury them
>>>>>>> somewhere deep it also would not matter - just like they were missing.
>>>>>>>
>>>>>>>>> Second, you should
>>>>>>>>> rather decouple the code from header dependencies, otherwise this cannot
>>>>>>>>> be merged for current release (just use clocks with long names, without IDs).
>>>>>>>> Sure
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>>>> new file mode 100644
>>>>>>>>>> index 000000000..7d879ec8b
>>>>>>>>>> --- /dev/null
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>>>> @@ -0,0 +1,76 @@
>>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>>>>> +%YAML 1.2
>>>>>>>>>> +---
>>>>>>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>>> +
>>>>>>>>>> +title: Exynos2200 USB controller PHY
>>>>>>>>>> +
>>>>>>>>>> +maintainers:
>>>>>>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>>>> +
>>>>>>>>>> +description:
>>>>>>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>>>>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>>>>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>>>>>>> It's not (I think). There's a few reasons I've decided to make this separate
>>>>>>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>>>>>>
>>>>>>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
>>>>>>> USBDRD phy does not provide UTMI and PIPE on its own either if you look
>>>>>>> at diagram - they call it phy controller.
>>>>>> Ughm. What? So in most exynos cases, there's a combination of multiple phys?
>>>>>>>> for them, and all that is needed from it is to disable HWACG, assert/
>>>>>>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>>>>>>> initialization can be done and USB2 works. If the USBCON phy is not set
>>>>>>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>>>>>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>>>>>>> attaching/deattaching and then initialize the synopsys USBDP combophy.
>>>>>>> Does it mean there is no USB DRD phy controller as before?
>>>>>>>
>>>>>>> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.
>>>>>> So...
>>>>>>
>>>>>> DWC3 -> USBDRD (USBCON) -> PHYs?
>>>>> No, drop last phy. You just wrote the same as me - two phys, because
>>>>> usbdrd is the phy. In all existing designs there is no such controllable
>>>>> object from the point of view of operating system.
>>>> What? Per my understanding, the phy property should refer to whatever is
>>>> is connected to dwc3 UTMI. In this case it's the so-called USBDRD phy (called
>>>> usbcon in downstream). Considering that the eUSB2 IP definitely also has UTMI
>>>> that has to be connected to something, doesn't that mean we have clearly
>>> The entire point is that eUSB2 is connected to DWC3, no? That's exactly
>>> how it is done for example on Qualcomm SoC. Otherwise you claim that
>>> DWC3 controls one phy, which controls another phy which controls UTMI...
>> But where does the USBCON fit? Is it just a side controller? Why's it needed
>> in the first place? This is what I don't understand.
> I assume usbcon, so old usbdrd, is the second DWC3's phy, just like qcom
> qmpphy.

Ugh. For qcoms, does the first phy depend on qmpphy? If we pass it as the second phy,
I don't know how the linkreset will happen. We also have a usbdp phy, which I
suspect is used for SS as well since it's a combophy by Synopsys.

https://gitlab.com/Mis012/sm-s908b-linux-source-code/-/blob/s22_restored_history/drivers/phy/samsung/phy-exynos-usbdrd-eusb.c#L1579

Best regards,
Ivaylo

>
>>>> separated hardware blocks? Now, I guess one could argue that this USBCON
>>>> hardware block could be classified as a syscon. But I don't see the problem
>>>> with the current binding description, nor the modelling, as it represents
>>>> how the hardware is (unless I've gotten it completely wrong).
>>> It is the first time you use argument that it represents how the
>>> hardware is and this is what we actually disagree. It is not like that.
>>> You do not have chain of phys. Just look at any USB 3.0 DRD DWC diagram
>>> from any Samsung SoC: where would you squeeze these two phys in relation
>>> to what is called there "USB 3.0 PHY" which would be the third phy (!!!).
>> Yeah, my point was that it was different from any previous design. Now,
>> I don't know if it's actually theoretically possible to design it like so. It's
>> hard to just guess how the hardware is designed without having access
>> to die shots, documentations or even just schematics.
>>
>> Let's make it clear now, the changes your request are to document USBCON
>> in the existing exynos binding, as well as to correct all explanations of how
>> this block functions, right?
> No, not necessarily. If USBCON is entirely different device than USBDRD
> (different register layout, different features), then go ahead with a
> new binding.
>
> I was questioning your chain of PHYs and this should be investigated.
>
>
> Best regards,
> Krzysztof


