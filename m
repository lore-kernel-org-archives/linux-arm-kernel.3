Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D049C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m73Q82dkpKlkQ9sqZr4r1cIELFDi6oJxX/fWL+FJurA=; b=Wk6Bc9/xGHWHBC5D2KWZirgbT3
	850CX56/BOybB5GcD/3sLRyAZhxpuwEXt56DoPl19a6ZxAU+LGF5aWYqWTuz+ECGbQPb2EgSFIfPa
	z754QG8dxCjGxKs8Qyd8Crirs6Y74vQEXVRwSCUsgtUwiWUP00KacJ9YujCs95QfqAkYHGIawtNJ8
	zT0L8dGhQECODHZu9SD11V4qJPv6gudmF+ieZALFL4d/zecFPD+323jna/qAYiVy7hKF2jnk6e1IF
	Auyx6JAH3ekr+nDNRYjzuIFvENN2wfnQh2WYDoVTHNtLNaL3V2LibPUFW1EWP4HnUm/F8+RbOI63l
	nBV1QWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01c3-00000006Jxb-3zJ6;
	Fri, 28 Aug 2026 18:47:39 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01c0-00000006Jwy-2Gej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 18:47:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59E4511CF0B;
	Fri, 28 Aug 2026 20:47:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787942846;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m73Q82dkpKlkQ9sqZr4r1cIELFDi6oJxX/fWL+FJurA=;
	b=awRpxIHZQF0n2uHyM73nRpsvtijyMVdHPtYji2+JnPl3Op2nkT+hr8d/V1B/VmizxXUU4T
	gurGZhoWLkHXyQUP90Fn4UnU7fb7rWNEQ8yVe2PCUkVHZoJ8MGGQDUBNpC6UiQbFUB7feK
	VTHa6lziIUjuwgr04kHc3guuYxIS2YCwx9Wli+xhiWTCXH6grxOnijfKoXODBsgflV3Ujb
	xwsi/MMK71NplsinSlNxkh6ExCsV/cqyAFnbKTo8T32HBvJrmuFOUKugUhmDu6INL8F2gb
	OA4PUJmon5AgkNi8c1Y2SqwWxM1Hb2CPnCW2ijN9R7DBynRrV8ly470OFyU+IA==
Message-ID: <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
Date: Fri, 28 Aug 2026 18:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260828-target-operable-ebc87e0bf30a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_114736_792810_2ECFD2C0 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

On 8/28/26 5:57 PM, Conor Dooley wrote:

[...]

>> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
>> @@ -39,6 +39,17 @@ properties:
>>     "#clock-cells":
>>       const: 0
>>   
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/phy/st,stm32-usb2phy.yaml
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -57,10 +68,14 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: st,stm32mp25-syscfg
>> +          enum:
>> +            - st,stm32mp23-syscfg
>> +            - st,stm32mp25-syscfg
> 
> Sashiko comment here I believe is valid, the syntax here only works if
> there's only the listed compatible present. It doesn't work with
> fallbacks.

This syntax is used all over the place ?

Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref: 
ahci-common.yaml#
Documentation/devicetree/bindings/ata/ahci-platform.yaml-
Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-      properties:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-        compatible:
Documentation/devicetree/bindings/ata/ahci-platform.yaml:          contains:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-            enum:
Documentation/devicetree/bindings/ata/ahci-platform.yaml-              - 
qcom,apq8064-ahci
Documentation/devicetree/bindings/ata/ahci-platform.yaml-              - 
qcom,ipq806x-ahci

> pw-bot: changes-requested
> 
>>       then:
>>         required:
>>           - "#clock-cells"
>> +        - "#address-cells"
>> +        - "#size-cells"
> 
> else, false? But I'm also not sure what the benefit is of requiring
> addr/size cells when the child node is not?
The subnodes of this syscfg node have reg property , see [PATCH v4 0/4] 
arm64: dts: st: Add STM32MP2 USB support .

