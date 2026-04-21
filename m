Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0014F327BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDc2d3kyEHFa88H7CmXPPMqJwUGPF03u1K5EIr/CiqM=; b=ItevZkmLB/F0tRDbHpMGagcqJj
	3LNt6uRjXyQKQC3/9kkBk8HOAHB2Ib/YpNe2k2qRvu+Sw3tXU7BIpORl0GHqa7ksNIa98pc/2Frst
	z5nWeA4Exo849nmRjh9aBVJoU6o1ZM0Ruk7ivmos9U1fvjEPzLhu0OgfeH215DT4SltsPIpYMpAXf
	TETRd4Ty+dAn+UVyUxiMXxNfcylZ7e2+Y16QZmFdClUv9ComMHFbz809c2uBnIhB7rBtWMHQlBlxZ
	g9jA2Zbj7zjL7URQ5fib4WBnK08hiMCdhz+EeKcFBI/bwvW8l8S1pxVEIjuQzMNc6U1dAmcE9Wh0R
	CGw684YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fe-00000008M1u-0EM8;
	Tue, 21 Apr 2026 09:45:30 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fa-00000008Lxr-3LxZ;
	Tue, 21 Apr 2026 09:45:28 +0000
Message-ID: <ff92f28b-8ffa-4ba1-ae7b-a825e4d15fc2@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776764715;
	bh=+pWxADjbyAE/GMK2ZySAS6xYdGVF6YeiaKrsK83rTTA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=iQmmBRGaq5waN8O2LVDi0CcM0VTSK51R0OKI1Ib0sy8pkN8F9eb9++2ERvr5CIIPu
	 iBPR37EhhrZ9A0CWJc8nE4TkVU93cDwAWESd9TIensXbcEOotRQW4kvCwLFan2dkEM
	 oMPFdQL6jlayPuV93MbhCCKqvDX95/9lb8ScWH9o=
Date: Tue, 21 Apr 2026 11:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
References: <20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr>
 <20260417-add-mcu-fan-khadas-vim4-v3-1-a6a7f570b11b@aliel.fr>
 <20260420-viable-plot-862e0c545837@spud>
Content-Language: en-US
In-Reply-To: <20260420-viable-plot-862e0c545837@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_024527_294324_8901EBE7 
X-CRM114-Status: GOOD (  12.15  )
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

On 4/20/26 6:22 PM, Conor Dooley wrote:
> On Fri, Apr 17, 2026 at 06:27:17PM +0200, Ronald Claveau wrote:
>> The Khadas VIM4 MCU register is slightly different
>> from previous boards' MCU.
>> This board also features a switchable power source for its fan.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>> index 084960fd5a1fd..a80718f7595ce 100644
>> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
>> @@ -18,6 +18,7 @@ properties:
>>    compatible:
>>      enum:
>>        - khadas,mcu # MCU revision is discoverable
>> +      - khadas,vim4-mcu # Different MCU variant, not discoverable
>>  
>>    "#cooling-cells": # Only needed for boards having FAN control feature
>>      const: 2
>> @@ -25,6 +26,10 @@ properties:
>>    reg:
>>      maxItems: 1
>>  
>> +  fan-supply:
>> +    description: Phandle to the regulator that powers the fan.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> Can you limit this by compatible please?
> pw-bot: changes-requested
> 

Thanks for your feedback, I will add that.

>> +
>>  required:
>>    - compatible
>>    - reg
>>
>> -- 
>> 2.49.0
>>


-- 
Best regards,
Ronald

