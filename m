Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9F9D1D899
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLSpuz/6+85v/AQDFlteEhbG2rBrPi0Jt5bHAcppCMk=; b=QPz9CtckgRHasy+K0aZyL/7oEW
	BreH3M4dMYs08W3Zf2B2YBgFpkO3sD6iX5zzXkPz9jyd+3ALNr+lg0SCqSQmj5s9izOfbJ3VoRGQ+
	ePJrB+WanPChZKflRe9hP5OZe5KtZ6fFvYB4pOOxA4k3HKM7cwnDEbJUOjz5Ny+sLW8QyUj+5jl7n
	93OoBRSu3nfnEE3xTJkQXOJSWWPZ1xF1UenWcjlzapIG9xnh0uTYhgFbAK1Qg839ox9BioQuxLdbW
	QFltxf+hQL093S5FGThJIG30zBaO70k1aDzsPIazwC0fR98lUvdHRMI0LAOkknzATgMp6p+j0lWlM
	5sI34+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5Xy-00000007lBI-2m5U;
	Thu, 04 Dec 2025 09:22:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5Xv-00000007lAX-44Ks
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:22:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7296339;
	Thu,  4 Dec 2025 01:22:34 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234933F59E;
	Thu,  4 Dec 2025 01:22:40 -0800 (PST)
Message-ID: <9c00516c-6e07-4c57-a1f1-6dfc32ab3a53@arm.com>
Date: Thu, 4 Dec 2025 09:22:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
 <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
 <5a0e4abf-9e7f-4ef9-af02-dd6e34f5cfa8@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <5a0e4abf-9e7f-4ef9-af02-dd6e34f5cfa8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_012244_140174_C976896F 
X-CRM114-Status: GOOD (  16.95  )
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

On 04/12/2025 02:53, Jie Gan wrote:
> 
> 
> On 12/4/2025 2:14 AM, Suzuki K Poulose wrote:
>> On 08/09/2025 03:01, Jie Gan wrote:
>>> Add an interrupt property to CTCU device. The interrupt will be 
>>> triggered
>>> when the data size in the ETR buffer exceeds the threshold of the
>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>> register
>>> of CTCU device will enable the interrupt.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 ++++++ 
>>> + ++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>> ctcu.yaml
>>> index 843b52eaf872..ea05ad8f3dd3 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> @@ -39,6 +39,16 @@ properties:
>>>       items:
>>>         - const: apb
>>> +  interrupts:
>>> +    items:
>>> +      - description: Byte cntr interrupt for etr0
>>> +      - description: Byte cntr interrupt for etr1
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: etr0
>>> +      - const: etr1
>>
> 
> Hi Suzuki,
> 
>> Why are they named "etr0" "etr1" ? That would be confusing, isn't it, 
>> especially with the Linux driver naming things randomly for the TMC-ETRs.
>>
> 
> Yes, it will cause misunderstandings since the "etr0" here may not the 
> right device we are expecting.
> 
>>
>> What we want is the "port" number corresponding to the "TMC-ETR" being
>> monitored ?
>>
>> Have you explored other options, "port-0", "port-1" ?
>>
> 
> I think it's much better. Will update in next version.

I am not sure if there exists a better scheme for identifying or
numbering the interrupts. Happy to listen to the DT experts.

Rob, Krzysztof, thoughts ?

Suzuki


> 
> Thanks,
> Jie
> 
>> Suzuki
>>
>>> +
>>>     in-ports:
>>>       $ref: /schemas/graph.yaml#/properties/ports
>>> @@ -56,6 +66,8 @@ additionalProperties: false
>>>   examples:
>>>     - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>>       ctcu@1001000 {
>>>           compatible = "qcom,sa8775p-ctcu";
>>>           reg = <0x1001000 0x1000>;
>>> @@ -63,6 +75,11 @@ examples:
>>>           clocks = <&aoss_qmp>;
>>>           clock-names = "apb";
>>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>>> +        interrupt-names = "etr0",
>>> +                          "etr1";
>>> +
>>>           in-ports {
>>>               #address-cells = <1>;
>>>               #size-cells = <0>;
>>>
>>
>>
> 


