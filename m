Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72474E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zvVxg8TjpzTKJeVgAA52MwuzQxHGHAPTbkC5v+VP5E=; b=3IMCyoplirw1nPskiEeZz4wSeV
	2YVvqx43yzJ82IR+0HMvifedYcfm8H22Gyj7/desRO2utj96X0XlbZl3xW7pWt6D/l4lpyIFZNIYt
	VXWnMQdABxUEMPlz+qLA0R2rkQHQc+0pXewiqpLtb7BOZZh9wE5A4Rl+sdSvU6OKfAU3DNwjZqrlJ
	+xV1ICYfmM28vMjlxVgiYMb4qxsJkUEJuyYsNlbiriEnOTse+NCfbXqqWb8vR3KhxlNMQF+CyLRW8
	BQ9u61QFJ+aK3jRiyDkBsy9IbfMaKuakpVtCfRVFj56CjTM/V8KCI/EdUDBUL0bhcOlz5+xuGhWcy
	VWbfgvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp7Z-0000000FtlU-3yYc;
	Wed, 18 Dec 2024 08:09:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp5e-0000000FtGJ-1ijy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 08:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0C3B5C5E45;
	Wed, 18 Dec 2024 08:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930CAC4CED0;
	Wed, 18 Dec 2024 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734509249;
	bh=3YQQgFLzWqXSr+8cpiXWMiZeoDJOT88+J0fk3jLp0XI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iC91VydmXNXgoWb0ae+s8i4Yv/Uuaj+T9PnsEknpF3lE/F2GyaVzRXQvUMg0LH3jQ
	 66yHkkV5ex3UMZ5IyFODmkSr4gAhV8BIaP98+MGZNIiDNCH5CRsxxHZj3RhKrXsRXe
	 5rO9Wh4EHSxmPVDaxXbjut6LawLdAHceNlK6jcUz0SQF/+gax2ir+ZgTHa+cYMz7EN
	 OuMeZ87ln3RDhwWQLDNULpsJsM92cGGur5lI/h5SQLqXijqaJHrrQB48Mqbg/Ijbjd
	 D8XuMGzXNAAJQlOKYLuOF6kmxGtnNpUtwjgZ5vm/tqsMIS9uFYtmxfvY4QL3EKdn9U
	 8QEFzrESLeC5Q==
Message-ID: <4ce799f1-e8c6-4a0d-aca5-dfb3dcb0c1d8@kernel.org>
Date: Wed, 18 Dec 2024 09:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: interrupt-controller: Refine
 size/interrupt-cell usage.
To: Kevin Chen <kevin_chen@aspeedtech.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "olof@lixom.net" <olof@lixom.net>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "konradybcio@kernel.org" <konradybcio@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "johan+linaro@kernel.org" <johan+linaro@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>
References: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
 <20241212155237.848336-3-kevin_chen@aspeedtech.com>
 <11ad5a97-b066-4bea-8829-50e0416cea9d@kernel.org>
 <PSAPR06MB4949CF57BD69B2F7C1D141CD89052@PSAPR06MB4949.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <PSAPR06MB4949CF57BD69B2F7C1D141CD89052@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_000730_540935_690B8AF1 
X-CRM114-Status: GOOD (  14.33  )
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

On 18/12/2024 04:04, Kevin Chen wrote:
> Hi Krzk,
> 
>>> 1. Because size-cells is no need to use 2, modify to 1 for use.
>>
>> ???
> So, is it OK that I change the size-cells back to 2 include the aspeed,ast2700-intc.yaml examples and aspeed-g7.dtsi?

No, my total surprise is that I did not understand what it maens. Is
this changelog? Commit msg? Why such change is made?

> 
>>
>>> 2. Add minItems to 1 for interrupts for intc1.
>>
>> ???
> For variable interrupt numbers, I need to fix the below warnings by minItems.
>   DTC [C] arch/arm64/boot/dts/aspeed/ast2700-evb.dtb
> /home/kevin/linux-mainline/arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@100: interrupts-extended: [[3, 0, 3844]] is too short
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> /home/kevin/linux-mainline/arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@110: interrupts-extended: [[3, 1, 3844]] is too short
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> /home/kevin/linux-mainline/arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@120: interrupts-extended: [[3, 2, 3844]] is too short
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> /home/kevin/linux-mainline/arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@130: interrupts-extended: [[3, 3, 3844]] is too short
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> /home/kevin/linux-mainline/arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@140: interrupts-extended: [[3, 4, 3844]] is too short
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> /home/kevin/linux-mainline/arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@150: interrupts-extended: [[3, 5, 3844]] is too short
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
> 
>>
>>> 3. Add 1 interrupt of intc1 example into yaml file.
>>
>>> 4. Add intc1 sub-module of uart12 as example using the intc0 and intc1.
>>
>> What is all this?
>>
>> BTW, there was no such patch in previous version and your changelog is silent
>> about it.
> Agree, I will restore the previous version.
> 
>>
>> Subject: drop all full stops. Subject never ends with full stop.
>>
>>> ---
>>>  .../aspeed,ast2700-intc.yaml                  | 60
>> +++++++++++++++----
>>>  1 file changed, 47 insertions(+), 13 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast270
>>> 0-intc.yaml
>>> b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast270
>>> 0-intc.yaml index 55636d06a674..eadfbc45326b 100644
>>> ---
>>> a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast270
>>> 0-intc.yaml
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,as
>>> +++ t2700-intc.yaml
>>> @@ -31,6 +31,7 @@ properties:
>>>        type as defined in interrupt.txt in this directory.
>>>
>>>    interrupts:
>>> +    minItems: 1
>>
>> Nope, not explained, not constrained. Your schema is supposed to be
>> constrained.

I still do not understand this commit at all.


Best regards,
Krzysztof

