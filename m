Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB101D711CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 23:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ss7mw5h9tZHWb4vZVmqkxQf5bNHQT65yXMb2s9UJt2c=; b=2Mi8+jUAN4OQoSaCT/qCC/8hkk
	PeOVnE1yWw72nYC4J12NGUZAJCZWsj5EEdEOY/vlPfuOrmJ7rNj9OQtQOhGaBnfRO+393sIn3Tvww
	rhZE1982WoBqZLVtxt7d75Cy8W+070n4Y/0HQZDuN0L4EJ0O7xcyN41yo3lf5+Y9nXeJUh9q7Xdhi
	gYincqUs94dsM0hF6cFw5On4tqpW+6qI/kh5CrixduvW3dYrz3LOmHxDiRs8XuTF7Y9c4v6bX/X2d
	12r5BdOzCmutKcei+hJk/xSDUpXdBHI+e/ly92pIXNIbaDvOMw6KvhDB4HV8SEF5AGpdHnMOiMplf
	d/dovWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNHo-00000009JKq-1dOl;
	Thu, 18 Dec 2025 23:19:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNHk-00000009JK7-3f2p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 23:19:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10FFFEC;
	Thu, 18 Dec 2025 15:19:42 -0800 (PST)
Received: from [10.57.74.203] (unknown [10.57.74.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D3113F73F;
	Thu, 18 Dec 2025 15:19:46 -0800 (PST)
Message-ID: <2db74a3e-4aeb-4e87-9fe8-5c9693bfb67c@arm.com>
Date: Thu, 18 Dec 2025 23:19:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, Jie Gan
 <jie.gan@oss.qualcomm.com>, Rob Herring <robh@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
 <20251211133723.GA859302-robh@kernel.org>
 <dfa43a63-ca14-4dd7-a7ab-acd95748a8b9@oss.qualcomm.com>
 <a9537dc9-c767-4909-8b1c-6e939ce4f3fc@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a9537dc9-c767-4909-8b1c-6e939ce4f3fc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_151953_001300_A2B7D7EF 
X-CRM114-Status: GOOD (  25.31  )
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

On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
> On 12/12/2025 02:12, Jie Gan wrote:
>>
>>
>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>> Add an interrupt property to CTCU device. The interrupt will be triggered
>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>>>> of CTCU device will enable the interrupt.
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>>>>    1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> @@ -39,6 +39,16 @@ properties:
>>>>        items:
>>>>          - const: apb
>>>>    
>>>> +  interrupts:
>>>> +    items:
>>>> +      - description: Byte cntr interrupt for the first etr device
>>>> +      - description: Byte cntr interrupt for the second etr device

This is really vague. How do you define first vs second ? Probe order ?
No way. This must be the "port" number to which the ETR is connected
to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
filter) connected to the CTCU. I was under the assumption that they
are identified as "ports" (input ports). I don't really understand how
this interrupt mapping works now. Please explain it clearly.

>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: etrirq0
>>>> +      - const: etrirq1
>>>
>>> Names are kind of pointless when it is just foo<index>.
>>
>> Hi Rob,
>>
>> I was naming them as etr0/etr1. Are these names acceptable?
> 
> Obviously irq is redundant, but how does etr0 solves the problem of
> calling it foo0?
> 
> I don't think you really read Rob's comment.
> 
>> The interrupts are assigned exclusively to a specific ETR device.
>>
>> But Suzuki is concerned that this might cause confusion because the ETR
>> device is named randomly in the driver. Suzuki suggested using ‘port-0’
>> and ‘port-1’ and would also like to hear your feedback on these names.
> 
> There is no confusion here. Writing bindings luckily clarifies this what
> the indices in the array mean.

The point is there are "n" interrupts. Question is, could there be more
devices(ETRs) connected to the CTCU than "n".

e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the

TMC-ETR0 -> CTCU-Port0

TMC-ETR1 -> CTCU-Port2
TMC-ETR2 -> CTCU-Port3

Now, how many interrupts are described in the DT ? How do we map which
interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
from the port is possible, with the topology).

This is what I raised in the previous version. Again, happy to hear
if there is a standard way to describe the interrupts.

Suzuki


> 
>>
>> Usually, the probe sequence follows the order of the addresses. In our
>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its address
>> is lower.
> 
> How is this even relevant? You are answering to something completely
> different, so I don't think you really tried to understand review.
> 
> 
> 
> Best regards,
> Krzysztof


