Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7039EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/P4B8d2WzLvQgRYZ1qmaBlaQvJTkK2VnKNi9lCo3sFw=; b=Gq5JQHj0vhd2NAcISmgs2H9zrU
	tODnn8h3/3H6P3ww3DDG6IcYe9ScttobJ9+2WJF2Ih3L0ReB7YtTjH4t4ndgOMU/0TinrP/hDgLRU
	v9xo6XSk5D1+xp0h/4bRHQiAXRA25DYEDIIUAuwjLwNvVXWF9/k5Z1A1Y/6Vr+Ae0+RoIV59NlLna
	Uk1mhktD1pb05X37rm/sR+jJoeemNR5pvhRtxMqlj0iJTaaPpB8yRqovnjhRejBlqXX8XSbCa9iTY
	3Rmu1nPKqHx5391/4TmF4YySFcPH2EsB4xHLQeagN0esDFJe9F2Widt7rweNoxazr6QEnN1Iq/ptd
	U74VhTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUO4J-0000000Ggrd-337J;
	Sun, 05 Jan 2025 10:41:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUO37-0000000GgdN-0k0t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 10:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E2D75C0183;
	Sun,  5 Jan 2025 10:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200ABC4CED0;
	Sun,  5 Jan 2025 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736073600;
	bh=k8enV/DLDQ/dozBzOheEeZLcjugvWi3Ep5mzqWmEkEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mIBjAhYZX6JiGOAswIq/5Hzhiu31d83Em4zOtY8ft3gGbn5UXKL14sDq+Ay/xL+mg
	 Gf9cnym3l5yMugMA3Y5lvpvyGHtOFzx17HR4WaLqGyGoBIGiyp4DtqlFpixadZdL03
	 fvVcjo5U81hg7AfPdi/Xnb2CxIy6r+j4nGlNye1J4/XtdoK/Zi2aHq2ocaQi3Ey4PG
	 o/Npv0so9e6F+/iZ0bgkAD9KSDf/+PhobC/MzZe2MmhvSDpyN+V//Lun6qdjYtTgIM
	 /PtF3L3j3wh678HbA7CtcTWlfYzw24KWnrM5U+/j3wu8kxXr3q5+b08bokFqEMbKEB
	 5AHppwbWEebfA==
Message-ID: <fca941a4-7c24-48dd-b36a-2f9b5c44575c@kernel.org>
Date: Sun, 5 Jan 2025 11:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
 <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
 <e7444f6c-f280-404a-8172-ae4869e3d492@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e7444f6c-f280-404a-8172-ae4869e3d492@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_024001_322661_331B786F 
X-CRM114-Status: GOOD (  28.38  )
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

On 05/01/2025 10:51, Ivaylo Ivanov wrote:
> On 1/5/25 11:18, Krzysztof Kozlowski wrote:
>> On Sat, Jan 04, 2025 at 06:29:14PM +0200, Ivaylo Ivanov wrote:
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -64,7 +75,6 @@ properties:
>>>  
>>>    samsung,mode:
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>> -    enum: [0, 1, 2, 3]
>> Widest constraints stay here, so minimum/maximum.
> 
> Why?

Because that's the coding style and that's how you define the field,
considering you might miss a variant in multiple if:then: .


> If we are going to add new enum values specific for each USI version,
> isn't it better to selectively constrain them in the binding?

You are supposed to constrained them.

Again: widest constrains always stay in top level property. This applies
to all bindings, all fields. Repeated multiple times, so here is
standard example:

https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127


> 
>>
>>>      description:
>>>        Selects USI function (which serial protocol to use). Refer to
>>>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
>>> @@ -101,18 +111,42 @@ required:
>>>    - samsung,sysreg
>>>    - samsung,mode
>>>  
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - samsung,exynos850-usi
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          maxItems: 1
>>> +
>>> +        samsung,mode:
>>> +          enum: [0, 1, 2, 3]
>>> +
>>> +      required:
>>> +        - reg
>>> +
>>> +    else:
>>> +      properties:
>>> +        reg: false
>>> +        samsung,clkreq-on: false
>>> +
>>> +        samsung,mode:
>>> +          enum: [4, 5, 6, 7, 8, 9, 10]
>> Is it really true? Previously for example GS101 had values 0-3, now you
>> claim has values 4-10, so an ABI change without explanation.
> 
> How is it unexplained? Citing the commit message:
> "Add constants for choosing USIv1 configuration mode in device tree.
> Those are further used in the USI driver to figure out which value to
> write into SW_CONF register."
> 

I don't see reference here about GS101 and others.

> USIv1 and v2 write different values to the SW_CONF register. For example:
> 
> #define USI_V1_SW_CONF_UART        0x8
> #define USI_V2_SW_CONF_UART    BIT(0)
> 
> ..
>  [USI_V2_UART] =    { .name = "uart", .val = USI_V2_SW_CONF_UART },
>  [USI_V1_UART] =    { .name = "uart", .val = USI_V1_SW_CONF_UART },
> ..
> 
> Hence the decision to have separate constants for different USI versions,
> which in my opinion is cleaner than meshing the enums together and
> choosing what to use with IFs in the driver code.

This does not answer at all why GS101 receives now different values than
before.

Explain why you are changing ABI.

> 
>>
>>> +
>>>  if:
>> Missing allOf:
>>
>>>    properties:
>>>      compatible:
>>>        contains:
>>>          enum:
>>>            - samsung,exynos850-usi
>>> +          - samsung,exynos8895-usi
>> Effect is not readable and not correct. You have two if:then:else.
>> Usually it is easier to just have separate if: for each group of
>> variants and define/constrain complete for such group within its if:.
>>
>>>  
>>>  then:
>>>    properties:
>>> -    reg:
>>> -      maxItems: 1
>>> -
>>>      clocks:
>>>        items:
>>>          - description: Bus (APB) clock
>>> @@ -122,16 +156,13 @@ then:
>>>        maxItems: 2
>>>  
>>>    required:
>>> -    - reg
>>>      - clocks
>>>      - clock-names
>>>  
>>>  else:
>>>    properties:
>>> -    reg: false
>>>      clocks: false
>>>      clock-names: false
>>> -    samsung,clkreq-on: false
>>>  
>>>  additionalProperties: false
>>>  
>>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>>> index a01af169d..4c077c9a8 100644
>>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>>> @@ -13,5 +13,12 @@
>>>  #define USI_V2_UART		1
>>>  #define USI_V2_SPI		2
>>>  #define USI_V2_I2C		3
>>> +#define USI_V1_NONE		4
>> Drop, it is already there.
>>
>>> +#define USI_V1_I2C0		5
>>> +#define USI_V1_I2C1		6
>>> +#define USI_V1_I2C0_1		7
>>> +#define USI_V1_SPI		8
>> Drop
>>
>>> +#define USI_V1_UART		9
>> Drop
> 
> How so? These bring different configuration values. Could you specify how
> exactly you want me to implement these in the driver?

Heh, so the binding was made poorly for the driver and driver was
developed in a matching way, so now this became an argument. Binding and
drivers are independent, so whatever argument was in the driver does not
matter really.

What I don't understand is downstream for USIv1 and USIv2 has it correct
- proper string values without mentioning any version. So, surprisingly
proper downstream binding, really rare case, was converted to something
tied to current driver implementation.

You have only one sort of property - the mode how you configure the USI
engine. The mode can be: I2C, SPI, I2C0, I2C1 for special cases with two
I2C etc.

The mode is not "USI_V1_I2C" because it is redundant. USI V1 cannot be
USI V2. You cannot tell USI to be v1 or v2. It is either v1 or v2. Only
one of these, thus encoding this information in the binding is meaningless.

I even mentioned this in original binding review:
"so please drop everywhere v2 (bindings, symbols, Kconfig,
functions) except the compatible."
Well, then I missed to check on that, so now this mess has to be fixed.

Best regards,
Krzysztof

