Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A49BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkyAo74eNYt7g7Tf3ylj7ygI4/rqvLaIrNTAgDqHndo=; b=vp4P2xVqZ1GKJtI7/bdEy630OF
	njt/3i7sCMb2VknnhxbH6ac8WyBG7cJskLWEdQjj3MWLq7ndGr14KzHuGsJNgsIvfKKt8teJgC9MT
	KOrbmCT6IAXpO7LqaTJUu7qj4uS0G+EuCngcQtgrY3m2WnwmTvihch7zuAWNbRD26wPp25g0X7Mgy
	dq2a9qC2ZZ6xYWW6ihPIPhsP/V77Yo5HEZbRED+J7Qea8TWnScRWqXDkzpST6ckqX/OhsheQwKlgI
	95TBOokR4wVKVMXruilbUFpGSXysu8STPply/x7Wkmz0PRGVzIhYHAzfmDUu1poXrev3yb4hhOnf9
	61ucqVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDPu-00000008QM1-49uQ;
	Thu, 01 Oct 2026 09:49:30 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDPq-00000008QIl-1Nmn;
	Thu, 01 Oct 2026 09:49:29 +0000
Message-ID: <cb8a33f0-2aa3-4ec1-9efc-af78eaa4b435@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1790848157;
	bh=OfzALKUKErDnTeV6+Scy6LOty9NGQxM9etrLaViB0jA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=YducBsFgeTVWLgaNUEqqiArMeOdjw49nO470W2tuk25ONR6sR62oPwPLiXoDrRjla
	 7uw9c3Hu2p51okugWypnlZkwCRXxCqtXjGERkf8r7rCfxtdBpi3aAn0ei/FPtoMcJj
	 6f1VSsbp6XBQ61/Pz3tl8ESa7xr+rK4XVpLlIOAY=
Date: Thu, 1 Oct 2026 11:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
To: Chuan Liu <chuan.liu@amlogic.com>, Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
 <20260928-cardiac-relax-cdccdecdd4c2@spud>
 <1bf03811-40f8-4c85-bf45-e48c5545c3e1@amlogic.com>
Content-Language: en-US
In-Reply-To: <1bf03811-40f8-4c85-bf45-e48c5545c3e1@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_024926_986834_06440188 
X-CRM114-Status: GOOD (  21.07  )
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

Hi Chuan,

On 9/30/26 9:13 AM, Chuan Liu wrote:
> Hi Ronald, Cc Conor,
> 
> On 9/29/2026 12:46 AM, Conor Dooley wrote:
>> On Sun, Sep 27, 2026 at 04:28:15PM +0200, Ronald Claveau via B4 Relay
>> wrote:
>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>
>>> The T7, A1, C3, and S4 PWM controllers have a system clock in
>>> addition to the two input clocks of channels A and B.
>>>
>>> The channel clocks are acquired by index in the pwm driver,
>>> where the core clock is fetched by name, with optional get
>>> which is silent when not provided.
>>>
>>> Require clock-names and minimum 3 items for S4, and devices
>>> which fallback to S4, where the PWM devices do not work
>>> without all 3 clocks.
>>>
>>> Add an example showing T7 usage with its fallback to
>>> amlogic,meson-s4-pwm.
>>>
>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>> ---
>>>   .../devicetree/bindings/pwm/pwm-amlogic.yaml        | 21 ++++++++++
>>> ++++++++---
>>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> index c337d85da40f1..e9cd5f1fdf264 100644
>>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>> @@ -62,7 +62,7 @@ properties:
>>>       clock-names:
>>>       minItems: 1
>>> -    maxItems: 2
>>> +    maxItems: 3
>>>       power-domains:
>>>       maxItems: 1
>>> @@ -143,9 +143,15 @@ allOf:
>>>             items:
>>>               - description: input clock of PWM channel A
>>>               - description: input clock of PWM channel B
>>> -        clock-names: false
>>> +            - description: gate clock for the PWM controller
> 
> This is the APB bus clock gate for the PWM controller. If this clock is
> disabled, the CPU can no longer access the PWM controller's registers.
> 
> This clock serves the same purpose as the "bus" clock in the thermal
> sensor patch you submitted previously [1].
> 
> By the way, in the Amlogic clock driver, many sys_clk/clk81 clocks are
> used to provide the clock for the APB bus of individual controllers.
> Some of them also provide the functional clock for the controller, such
> as I2C.
> 
> Therefore, would it be reasonable to keep the description here
> consistent with the description in the thermal dt-binding mentioned above?
> 
> [1] https://lore.kernel.org/all/20260923-fix-t7-thermal-clock-v2-1-
> bff7a09eb487@aliel.fr/
> 

Thanks for your help and your feedback on this series. I will rename and
change the description in v4.

>>> +        clock-names:
>>> +          items:
>>> +            - const: channel-a
>>> +            - const: channel-b
>>> +            - const: core
> 
> Similarly, would it be more appropriate to name this clock "bus" as well?
> 
>>>         required:
>>>           - clocks
>>> +        - clock-names
>>>       - if:
>>>         properties:
>>> @@ -179,6 +185,15 @@ examples:
>>>       pwm@1000 {
>>>         compatible = "amlogic,meson-s4-pwm";
>>>         reg = <0x1000 0x10>;
>>> -      clocks = <&pwm_src_a>, <&pwm_src_b>;
>>> +      clocks = <&pwm_src_a>, <&pwm_src_b>, <&pwm_src_core>;
>>> +      clock-names = "channel-a", "channel-b", "core";
>>> +      #pwm-cells = <3>;
>>> +    };
>>> +  - |
>>> +    pwm@60000 {
>>
>> If you respin, drop the second example please, since it doesn't actually
>> do anything different anymore.
>>

I will drop this example in the mean time.

>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> pw-bot: not-applicable
>>
>>> +      compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
>>> +      reg = <0x60000 0x24>;
>>> +      clocks = <&channel_a>, <&channel_b>, <&core>;
>>> +      clock-names = "channel-a", "channel-b", "core";
>>>         #pwm-cells = <3>;
>>>       };
>>>
>>> -- 
>>> 2.49.0
>>>
>>>
> 


-- 
Best regards,
Ronald

