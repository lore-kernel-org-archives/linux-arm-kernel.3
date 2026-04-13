Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E0AEBFD36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XueimPDZD4ii762L33XaFO65U/3dumP3mZwccEK19k=; b=wUOPaxIrzyJ+tJBt024B6si/nS
	4asUwCEbfqRR/LrscuS14PcDSZp4pjmIV8uWoUSJhmrr+d80s2DC1vV6fEoZq5rvb0OBXmWkSdawk
	Q69FmqRyIkiao5zt+fpQdi1j2uhb4pR5/4RqwlrRk3SJlzEom7k7l0XUbuDhPi//3O/iAjjEOz/5L
	p1naoV3hHhavZapX8PIaEL84UtTbkWZPul5O+98rV21o1ifoxRPhSww8xfNv7wuA3QJ8dMjQ4Y+5Z
	CsPuzv49bsG6Zdmx8/A3R9xi+KiWnL93w2h414MIS70kCuZK6F+qLqmjX0emR8uq9ejG84s5eRLEi
	6lKSZ30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEhw-0000000FVFD-0svD;
	Mon, 13 Apr 2026 10:39:56 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEhr-0000000FVEF-335i;
	Mon, 13 Apr 2026 10:39:53 +0000
Message-ID: <6a204eb0-ab08-462b-8dad-8f0990dc500d@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776076785;
	bh=duq9L31NUVCD1nJNJYBo8ZhlfesdFiU++70jz5ELPL8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=i7A3JI9g79SdnCtohMFvDOCVny58Mep5/hD+vBGfIvZxClV7vztMISAsgPZLMkgIO
	 30bpiC+t/4hyPb/dwf+/m7AZyU2Co4ynqeNbB9TjjsVCf6y6M/HaaqcJdSQAyOkMLb
	 eQVwAcjNlP/nvQ7YyVrNCOtlLK42yte8REpDGrgw=
Date: Mon, 13 Apr 2026 12:39:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/8] dt-bindings: thermal: amlogic: Add support for T7
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
 <20260410-add-thermal-t7-vim4-v1-1-19f2b8da74d7@aliel.fr>
 <20260412-abiding-silver-turkey-1623cc@quoll>
Content-Language: en-US
In-Reply-To: <20260412-abiding-silver-turkey-1623cc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_033952_088195_0069413F 
X-CRM114-Status: GOOD (  21.33  )
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

Hello Krzysztof, thank you for this feedback.

On 4/12/26 11:58 AM, Krzysztof Kozlowski wrote:
> On Fri, Apr 10, 2026 at 06:48:02PM +0200, Ronald Claveau wrote:
>> Add the amlogic,t7-thermal compatible for the Amlogic T7 thermal sensor.
>>
>> Unlike existing variants which use a phandle to the ao-secure syscon,
>> the T7 relies on a secure monitor interface described by a phandle and
>> a sensor index argument.
>>
>> Introduce the amlogic,secure-monitor property as a phandle-array and
>> make amlogic,ao-secure or amlogic,secure-monitor conditionally required
>> depending on the compatible.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  .../bindings/thermal/amlogic,thermal.yaml          | 40 +++++++++++++++++++++-
>>  1 file changed, 39 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> index 70b273271754b..85ee73c6e1161 100644
>> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> @@ -22,6 +22,7 @@ properties:
>>                - amlogic,g12a-ddr-thermal
>>            - const: amlogic,g12a-thermal
>>        - const: amlogic,a1-cpu-thermal
>> +      - const: amlogic,t7-thermal
> 
> So these two entries are enum.
> 

I will change to enum.

>>  
>>    reg:
>>      maxItems: 1
>> @@ -42,12 +43,40 @@ properties:
>>    '#thermal-sensor-cells':
>>      const: 0
>>  
>> +  amlogic,secure-monitor:
>> +    description: phandle to the secure monitor
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to the secure monitor
>> +          - description: sensor index
> 
> For what exactly this sensor index is needed? commit msg explained me
> nothing, instead repeated what you did. That's pointless, explain why
> you did it.
> 

Thanks I will add the explanation in the commit message and in the
description here.

>> +
>>  required:
>>    - compatible
>>    - reg
>>    - interrupts
>>    - clocks
>> -  - amlogic,ao-secure
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,g12a-cpu-thermal
>> +              - amlogic,g12a-ddr-thermal
> 
> Drop both, you need only fallback.
> 

I hesitated between the two methods. I will change to fallback only.

>> +              - amlogic,a1-cpu-thermal
> 
> And list is sorted alphabetically.
> 

Thanks for the reminder.

>> +    then:
>> +      required:
>> +        - amlogic,ao-secure
> 
> Best regards,
> Krzysztof
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


-- 
Best regards,
Ronald

