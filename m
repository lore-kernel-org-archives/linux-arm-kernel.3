Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3D5E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+Xee7GpV54tydDHHvBPDf1MkDT+f6DLXdhWroDYNRc=; b=lNql7J9XxvnwueYJYcXB/q5rGn
	gW1FPkwU0FD6ARveChnZo46EaN+CVXIpLRl09h8FAPA9i7jH3NZ5dISOjdv60P9ZD83PvYyRuPQVN
	oB55uSF3QpwtRUgkrlLJBBxmo99Anb6sOtsBg774lp5osDk7Gy9apIkPTh+ZGOjtHD87mE4Gr8T07
	KYJMOP6SrU+y6Qj2K9UimT3KvhdHO3ZIqV4DcW//3JIM8Bs26LInfdwjZSxZF+09nUBV6GaLbFOuV
	9MoKl6CBQnEdXIxHqYX2BV+I7LNK4/N9bchvOCDTnnnKCgfbVQsF0kNIPd6K7EQn9QPxrM5Fw5hhh
	sFL1iH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCxF-00000006P4S-0okZ;
	Tue, 03 Feb 2026 09:44:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCxC-00000006P41-0G7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:44:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E187339;
	Tue,  3 Feb 2026 01:44:05 -0800 (PST)
Received: from [10.57.69.219] (unknown [10.57.69.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 526223F632;
	Tue,  3 Feb 2026 01:44:09 -0800 (PST)
Message-ID: <cab2be55-2ea4-4bca-a574-eb6800cc38f1@arm.com>
Date: Tue, 3 Feb 2026 09:44:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
 <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
 <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
 <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_014414_216152_A6EE6DC8 
X-CRM114-Status: GOOD (  16.77  )
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

On 03/02/2026 09:36, Konrad Dybcio wrote:
> On 2/3/26 10:31 AM, Suzuki K Poulose wrote:
>> On 03/02/2026 09:00, Jie Gan wrote:
>>>
>>>
>>> On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
>>>> On 2/3/26 9:08 AM, Jie Gan wrote:
>>>>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>>>>> compatible for probing.
>>>>>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>>>>    1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml
>>>>> index e002f87361ad..68853db52bef 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> @@ -29,6 +29,10 @@ properties:
>>>>>        oneOf:
>>>>>          - items:
>>>>>              - enum:
>>>>> +              - qcom,glymur-ctcu
>>>>> +              - qcom,hamoa-ctcu
>>>>> +              - qcom,kaanapali-ctcu
>>>>> +              - qcom,pakala-ctcu
>>>>
>>>> Platforms with existing numeric compatibles should continue to use them,
>>>> so that the mess is somewhat containable
>>>
>>> Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu
>>
>> Why do we need different compatibles for the others ? Are they not all compliant to the CTCU programming model ? i.e., sa8775p-ctcu ? or even,
>> a generic,
>>
>> qcom,coresight-ctcu
> 
> It's a huge anti-pattern with the DT maintainers, since a compatible is
> the only way to effectively differentiate different implementations (i.e.
> instances on different SoCs) of an IP block

Do you mean, same IP block integrated to different SoC ? Or are they
different implementations altogether ? Why are these not applicable for
other components ? (e.g., Tnoc, I-Tnoc, TPDA, TPDM etc ?)

> 
> This is important for the case where a DTB is shipped as part of firmware
> and can not be replaced - if some quirk needs to be applied retroactively,
> we can look for "qcom,glymur-ctcu" without affecting all the 50 other'
> users of the effectively-identical IP block

Fair enough, thank for the explanation.

Kind regards
Suzuki

> 
> In this case, we're already reducing the impact on the driver, as that
> only looks for the single fallback compatible (qcom,sa8775p-ctcu)
> 
> Konrad


