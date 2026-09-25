Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B13C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpbHrdm4suMSuWNW6YpsGyCIA8PlTTSnwsvCVPglIac=; b=3am53c5XNxyE5eQTO4A4BMrzXP
	Wxwv2imt3MST9hDdu4zFGWij3JaF8XFxd8UxhUSLe+qlTNuSczi0DugM2T40+vAEvAeiL2XOOtWM8
	HbVjcW0gznYVYGPKuH3JWPkSQacl9xSvxva6EkcLm14gzr1FKHuaJpbrBLnPwVLQG2xT/CpSpRuqH
	uk3NOzr0N2mEpnDNdptG5Z8KZRcJtsY0VsRQOKs0JivKnZhva0X8KU5ML/sU+DJCSLXRqfujLvCZr
	+vvXy8p+JDFqmjggidjp2PBKhgKSPz3Rum1Obprb70f13gmsvOKE1Ej6sbJpoo3vv2SVqkaDxVRl5
	zmaJTKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6zh-0000000DbFb-2EOu;
	Fri, 25 Sep 2026 14:33:45 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6ze-0000000DbEa-07Vk;
	Fri, 25 Sep 2026 14:33:44 +0000
Message-ID: <ab7ddd32-47eb-47d1-b317-94ee190362a3@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1790346812;
	bh=9jqyIRV/pOYj50TCwmyP6yS9VVMyAsAlhPgldRTFX2k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=D8kZzq91ojMHy1q3+FkGTAj2eKm1J5aSPaflO0zmCg8BH1ETab4I0pA1MHP/6hknr
	 w8df/Xgj5owDwM7Bt0wQUyuhFiRb7Ey7YCUsfm9h98W92rQHetD2TSOdhxK+4pH9oM
	 PXN3yM78+mOOZe5WoU6qFy2gJzsNYQP0iVk6nSaM=
Date: Fri, 25 Sep 2026 16:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
 <20260924-add-t7-sys-pwm-clk-v1-1-05b91e87f0a9@aliel.fr>
 <20260924-reprimand-taste-3481319d9e31@spud>
Content-Language: en-US
In-Reply-To: <20260924-reprimand-taste-3481319d9e31@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_073342_524549_6E7FE390 
X-CRM114-Status: GOOD (  20.02  )
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

On 9/24/26 6:35 PM, Conor Dooley wrote:
> On Thu, Sep 24, 2026 at 05:14:28PM +0200, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The T7 PWM controller has a system clock (the register access clock)
>> in addition to the two input clocks of channels A and B. Add it as a
>> third clock, named "core", for the amlogic,t7-pwm compatible, and
>> require clock-names for this SoC for clarity.
> 
> What additional clarity does that actually bring? I think it's kinda
> less clear, because the git history is required to explain why drivers
> cannot fetch the existing clocks by name.
> 

Right it's not clear, I will rephrase this.

>>
>> The other compatibles are left unchanged. Add an example showing the
>> T7 usage with its fallback to amlogic,meson-s4-pwm.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 37 +++++++++++++++++++---
>>  1 file changed, 33 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index c337d85da40f1..9212a40d9fe48 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> @@ -62,7 +62,7 @@ properties:
>>  
>>    clock-names:
>>      minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
>>  
>>    power-domains:
>>      maxItems: 1
>> @@ -135,17 +135,38 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            enum:
>> -              - amlogic,meson-s4-pwm
>> +            const: amlogic,t7-pwm
>>      then:
>>        properties:
>>          clocks:
>>            items:
>>              - description: input clock of PWM channel A
>>              - description: input clock of PWM channel B
>> -        clock-names: false
>> +            - description: gate clock for the PWM controller
>> +        clock-names:
>> +          items:
>> +            - const: clk_a
>> +            - const: clk_b
> 
> I'd rather "channel-a" or similar, we try not to state the obvious in
> the names of clocks etc - of course this is a clock!
> 

Thanks for the suggestion, I didn't want to add "clk_chan_a", I will go
with "channel-a" and "channel-b".

>> +            - const: core
>>        required:
>>          - clocks
>> +        - clock-names
>> +    else:
>> +      if:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - amlogic,meson-s4-pwm
>> +      then:
>> +        properties:
>> +          clocks:
>> +            items:
>> +              - description: input clock of PWM channel A
>> +              - description: input clock of PWM channel B
>> +          clock-names: false
> 
> Are you sure that the s4-pwm doesn't also have this core clock? Seems
> likely, no?
> 

You right, S4, A1, C3 and T7 have this clock, but S4 and A1 clock driver
declare them with "CLK_IGNORE_UNUSED" flag.
I will make a new proposal on V2.

> Cheers,
> Conor.
> 
>> +        required:
>> +          - clocks
>>  
>>    - if:
>>        properties:
>> @@ -182,3 +203,11 @@ examples:
>>        clocks = <&pwm_src_a>, <&pwm_src_b>;
>>        #pwm-cells = <3>;
>>      };
>> +  - |
>> +    pwm@60000 {
>> +      compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>> +      reg = <0x60000 0x24>;
>> +      clocks = <&clk_a>, <&clk_b>, <&core>;
>> +      clock-names = "clk_a", "clk_b", "core";
>> +      #pwm-cells = <3>;
>> +    };
>>
>> -- 
>> 2.49.0
>>
>>


-- 
Best regards,
Ronald

