Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEBBF43680
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDsx8X2jiZoGka5IIv690r2oNsb+R5D9h2yeJUsEwu4=; b=Z2an0z0avCZf27r4zrP+JNvvYa
	POdsmGAIOoAj2kLLuLjrGR2hGYVBAEKdOrVnmSQhbaxISL1Kd+OGSoSj/gHpV4rGJ9EOF9xwa3YPO
	F/DQDP18bzlGo+W3m0oWxzbN/4IU0CQLAwjFBDJ7S3im3LEfZl06g/J3eAkQ3eoFGAqrKLb4pDJAR
	ikrt7Mb1Up73G95ae22nfVgh6JDb5MNey6rbNlzCAzvAAn/uw3RwiLlLr04fSXWckTvHeSDE1pelj
	8VfeDGCa8j8R7MxxYtY3TqvsvE7UhsXFw/SX6EHl+EVWY6ChWjX/jZcIy77zOHlQ9wRXVXPtHCePI
	psH9JYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfaO-00000003q2X-1OI9;
	Fri, 17 Apr 2026 09:34:04 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfaJ-00000003ptq-3pIh;
	Fri, 17 Apr 2026 09:34:02 +0000
Message-ID: <5514acb2-f4cd-499d-aabd-8f5d7a311be0@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776418310;
	bh=k2/NtjpEqjtp2ZMPsfxKYGQQDyh1+0ETw/LyMjy9rUk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=tLkFPJYlW4M7Y+rvGQG9WBzFs13d68haPvQJ2LRKkkR/r5yeZdVM953uDuGHwnlky
	 FXxNU8iXJ26PB2EBBuzXfCF0KMhhYWBcsHlmtVA8KBa+FEO7Crv69u8/mLOcwjzoWT
	 KKtDdFdd+ts0aTqVaEGF2HTGwIjAYuwvZ59WyfWs=
Date: Fri, 17 Apr 2026 11:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
 <20260403-add-mcu-fan-khadas-vim4-v2-1-70536b22439a@aliel.fr>
 <20260415214815.GA602572-robh@kernel.org>
 <6fc8ddeb-d54d-473d-94d2-49dc78a07154@aliel.fr>
 <6758aaa2-ac1a-4751-aece-2b445b84f2bc@linaro.org>
Content-Language: en-US
In-Reply-To: <6758aaa2-ac1a-4751-aece-2b445b84f2bc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_023400_412594_E55C8A23 
X-CRM114-Status: GOOD (  14.95  )
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

On 4/17/26 9:53 AM, Neil Armstrong wrote:
> On 4/16/26 10:25, Ronald Claveau wrote:
>> On 4/15/26 11:48 PM, Rob Herring wrote:
>>> On Fri, Apr 03, 2026 at 06:08:34PM +0200, Ronald Claveau wrote:
>>>> The Khadas VIM4 MCU register is slightly different
>>>> from previous boards' MCU.
>>>> This board also features a switchable power source for its fan.
>>>>
>>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>> ---
>>>>   Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>>>> b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>>>> index 084960fd5a1fd..67769ef5d58b1 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>     compatible:
>>>>       enum:
>>>>         - khadas,mcu # MCU revision is discoverable
>>>
>>> The revision is no longer discoverable as was claimed?
>>>
>>
>> The firmware revision is still discoverable, and via the same register,
>> but the VIM4 MCU has a different register layout (eg: no DEVICE_NO
>> register). The new compatible is needed to describe a different MCU
>> variant, not a different revision of the same MCU.
>> I will remove the comment as it is confusing with new boards.
> 
> Yes basically it was discoverable for earlier MCU version, but is not
> for this particular board version.
> 
> Keep the comment, but add a comment on the vim4 entry saying this variant
> is not discoverable.
> 
> Neil
> 

Ok make sense, I will do that.

>>
>>>> +      - khadas,vim4-mcu
>>>>       "#cooling-cells": # Only needed for boards having FAN control
>>>> feature
>>>>       const: 2
>>>> @@ -25,6 +26,10 @@ properties:
>>>>     reg:
>>>>       maxItems: 1
>>>>   +  fan-supply:
>>>> +    description: Phandle to the regulator that powers the fan.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +
>>>>   required:
>>>>     - compatible
>>>>     - reg
>>>>
>>>> -- 
>>>> 2.49.0
>>>>
>>
>>
> 


-- 
Best regards,
Ronald

