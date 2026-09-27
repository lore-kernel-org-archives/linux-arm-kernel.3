Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2256C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9q1TTq+WFXZtSDkuhQJ5tGQi1IBegt1uXiG1V/FjDs=; b=pTaYGXgoptXhZssNNYQnRGse0g
	oHVGhKc5oc6zeHMAYGzKA+hQ+3C+jyEsK56+uByH5Pmun6YHfkWt51fhzEKqg+t3Zt2atS3VPyWbT
	XE/o7CaaWmdS8BrqWOgS0B645TVlV7vnaugeOGm7N/0GA38kT/vfC0UsL4S1SOIxptj8AZKKNLEfS
	J5Y9Hh5mq8WsEQaktZwDVyw5HhYl/mkaEnQ5SUEbYY6QR8Xc2pcJh6NH88ZKLPRpEOwmr1zoiRTXx
	UQa7s4WAOP12p+uIbOb9ajlQiMyH7sKriSOAhKIb/1yAFqKc75ICgBCgVo8BYWg+oeJ1z6zXN3cqP
	gl1t3Ymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApxe-0000000GSG2-0rzG;
	Sun, 27 Sep 2026 14:34:38 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApxa-0000000GSF5-2bIG;
	Sun, 27 Sep 2026 14:34:36 +0000
Message-ID: <80268113-e85f-410d-880d-84598d3b39ca@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1790519659;
	bh=ztJhP76JayIyO0vestWNJjdUJp+q5q9ZNKkeqnfojU0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TRXtbZOBVpquhw7aODGwXsianL++tf49/r+mxiGRB52OrT7mzX3oCYHo3lGvJc0yE
	 CACasfZmg9DjFEWdXlSk7o3LoQpM3oeILuMZwzyLCo368JV2ulEp8NFXwpmPG61WYQ
	 n0mdxnWO8uJLB+//9dIdHpSfMjZVq8N1ISvz1FgE=
Date: Sun, 27 Sep 2026 16:33:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
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
References: <20260925-add-t7-sys-pwm-clk-v2-0-f23a22b71a5c@aliel.fr>
 <20260925-add-t7-sys-pwm-clk-v2-1-f23a22b71a5c@aliel.fr>
 <20260925-facial-follow-032de22361c1@spud>
 <8e23838a-da5e-499c-a8be-3e2a7a0939e7@aliel.fr>
 <20260926-landless-prowess-df404db4d910@spud>
Content-Language: en-US
In-Reply-To: <20260926-landless-prowess-df404db4d910@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_073435_104177_1C6B4F9E 
X-CRM114-Status: GOOD (  19.10  )
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

On 9/26/26 8:06 PM, Conor Dooley wrote:
> On Sat, Sep 26, 2026 at 11:43:20AM +0200, linux-kernel-dev@aliel.fr wrote:
>> On 9/25/26 6:41 PM, Conor Dooley wrote:
>>> On Fri, Sep 25, 2026 at 05:13:28PM +0200, Ronald Claveau via B4 Relay wrote:
>>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>>
>>>> The T7, A1, C3, and S4 PWM controllers have a system clock in
>>>> addition to the two input clocks of channels A and B.
>>>>
>>>> The channel clocks are acquired by index in the pwm driver,
>>>> where the core clock is fetched by name, with optional get
>>>> which is silent when not provided.
>>>>
>>>> Require clock-names and minimum 3 items for T7, where the
>>>> PWM devices do not work without all 3 clocks.
>>>>
>>>> Add an example showing T7 usage with its fallback to
>>>> amlogic,meson-s4-pwm.
>>>>
>>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>> ---
>>>>  .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 33 ++++++++++++++++++++--
>>>>  1 file changed, 31 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>> index c337d85da40f1..59320f288552b 100644
>>>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>> @@ -62,7 +62,7 @@ properties:
>>>>  
>>>>    clock-names:
>>>>      minItems: 1
>>>> -    maxItems: 2
>>>> +    maxItems: 3
>>>>  
>>>>    power-domains:
>>>>      maxItems: 1
>>>> @@ -140,13 +140,34 @@ allOf:
>>>>      then:
>>>>        properties:
>>>>          clocks:
>>>> +          minItems: 2
>>>>            items:
>>>>              - description: input clock of PWM channel A
>>>>              - description: input clock of PWM channel B
>>>> -        clock-names: false
>>>> +            - description: gate clock for the PWM controller
>>>> +        clock-names:
>>>> +          minItems: 2
>>>> +          items:
>>>> +            - const: channel-a
>>>> +            - const: channel-b
>>>> +            - const: core
>>>>        required:
>>>>          - clocks
>>>>  
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: amlogic,t7-pwm
>>>
>>> Shouldn't this (based on your reply on the previous version) be s4?
>>>
>>
>> The change above is for S4 and SOCs which fallback to S4. It allows the
>> third clock but let the schema validation compatible with two clocks
>> existing DTS. Here for the T7, I add requirement for the exact 3 clocks.
>>
>> Do you recommend to require the 3 clocks for all S4 and S4 fallback, and
>> update the associated dtsi files ?
> 
> Yes, I think so. Sounds to me like they only work because of the
> CLK_IGNORE_UNUSED set in their clock controller drivers, so the correct
> thing to do is make them all require the third clock.
> 

Great, Thank you for your feedback, I sent a V3 matching this.

>>
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +        clock-names:
>>>> +          minItems: 3
>>>> +      required:
>>>> +        - clock-names
>>>> +
>>>>    - if:
>>>>        properties:
>>>>          compatible:
>>>> @@ -182,3 +203,11 @@ examples:
>>>>        clocks = <&pwm_src_a>, <&pwm_src_b>;
>>>>        #pwm-cells = <3>;
>>>>      };
>>>> +  - |
>>>> +    pwm@60000 {
>>>> +      compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>>>> +      reg = <0x60000 0x24>;
>>>> +      clocks = <&channel_a>, <&channel_b>, <&core>;
>>>> +      clock-names = "channel-a", "channel-b", "core";
>>>> +      #pwm-cells = <3>;
>>>> +    };
>>>>
>>>> -- 
>>>> 2.49.0
>>>>
>>>>
>>
>>
>> -- 
>> Best regards,
>> Ronald


-- 
Best regards,
Ronald

