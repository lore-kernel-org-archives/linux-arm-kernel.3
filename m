Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503DFC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sHcL0LVM6rIluypbNhw/4ikU50nvyxWW+Bh/OoX3/U=; b=xgTDGnrjJ9tAFUYIxWgw9WtA+I
	43IJf4Qz7wYGjpaSEW9oboer1mNzbmmQHrnSphuh19iIQSMpVHbluAqrfmBcVEl+aANwA32GjTmiJ
	ekw7aFf+ijVXNj7MhAdOTClYr0rGmIWOmg3W4p6RpGCvj1j9hQpb/10MsKPn5JA7UFIFVqP1zoD53
	coVeunHZlKoDZL7qszxY8fdHkzmXdNvjPRyhMBSlZDE3dNcnm/buggVMc1uQ+GEmJQq8zDaNg/oav
	9BLrmIixoX90Uiah9FXdPvufuZlkcLRc57eQ++RvE6LkQXVKWvIH4opbDT2nkea5+XRw7Tyv+3sso
	J7N3/4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNHl-000000083pN-3Vb7;
	Wed, 26 Mar 2025 09:42:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNEP-000000083Qi-0I9i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:39:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73HPO026884;
	Wed, 26 Mar 2025 09:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sHcL0LVM6rIluypbNhw/4ikU50nvyxWW+Bh/OoX3/U=; b=fkL8WCNZ5xK7InJn
	YeASgUpH1pbrMlo854Lp1j5b9PclhcBQ+dXZe7riUOoM4uwTLJYR8H1mHoCR4PrA
	dL6UdFZxLSZxhnF/d/SmmYrBszfqSokAsBQbnR4SBObAebKtq4YqnGTCNHf2ZtPf
	pG2JTE71Nr6H6mngXN99JlW9YtJxmeY2HJcE/O6MgB3EdVVRX9viJlLkSeYVi0tM
	P6pbJDYkAs4RW6FjmHY6+3949vV+zufdUllY0qPyxm2KJoMRrau4ZHTISVI7E6E6
	O9zwhiK72zN2vNgMqzRNtJVBMHvFrf2maJ9l9FY2erNpLYnSXD0oQCQ1h1/9w28w
	hxi9iQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdt0wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:39:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q9dJSF025718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:39:19 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 02:39:15 -0700
Message-ID: <a90f5b4d-0403-4a44-8788-cb7994ed4fb6@quicinc.com>
Date: Wed, 26 Mar 2025 17:39:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
To: Mike Leach <mike.leach@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Songwei Chai
	<quic_songchai@quicinc.com>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-2-quic_songchai@quicinc.com>
 <20250304-certain-aboriginal-magpie-cade86@krzk-bin>
 <CAJ9a7VjOU2d0tGjvbMBWwWtjKp38hj_NptVYFHDy9Zrs-sdOeg@mail.gmail.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <CAJ9a7VjOU2d0tGjvbMBWwWtjKp38hj_NptVYFHDy9Zrs-sdOeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _mllt_ziUknsxIZCW5AExR8D9rapdEf2
X-Proofpoint-GUID: _mllt_ziUknsxIZCW5AExR8D9rapdEf2
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e3cb48 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=xp1umiiPNtQMqfDkFM0A:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_023929_243722_8EE43F73 
X-CRM114-Status: GOOD (  31.78  )
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


On 3/7/2025 5:28 PM, Mike Leach wrote:
> Hi,
>
> On Tue, 4 Mar 2025 at 08:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Thu, Feb 27, 2025 at 05:26:34PM +0800, songchai wrote:
>>> From: Songwei Chai <quic_songchai@quicinc.com>
>>>
>>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>>> sequences within a specific region of the System on Chip (SoC). Once
>>> configured and activated, it monitors sense inputs and can detect a
>>> pre-programmed state or sequence across clock cycles, subsequently
>>> producing a trigger.
>>>
>>>     TGU configuration space
>>>          offset table
>>>   x-------------------------x
>>>   |                         |
>>>   |                         |
>>>   |                         |                           Step configuration
>>>   |                         |                             space layout
>>>   |   coresight management  |                           x-------------x
>>>   |        registers        |                     |---> |             |
>>>   |                         |                     |     |  reserve    |
>>>   |                         |                     |     |             |
>>>   |-------------------------|                     |     |-------------|
>>>   |                         |                     |     | priority[3] |
>>>   |         step[7]         |<--                  |     |-------------|
>>>   |-------------------------|   |                 |     | priority[2] |
>>>   |                         |   |                 |     |-------------|
>>>   |           ...           |   |Steps region     |     | priority[1] |
>>>   |                         |   |                 |     |-------------|
>>>   |-------------------------|   |                 |     | priority[0] |
>>>   |                         |<--                  |     |-------------|
>>>   |         step[0]         |-------------------->      |             |
>>>   |-------------------------|                           |  condition  |
>>>   |                         |                           |             |
>>>   |     control and status  |                           x-------------x
>>>   |           space         |                           |             |
>>>   x-------------------------x                           |Timer/Counter|
>>>                                                         |             |
>>>                                                       x-------------x
>>> TGU Configuration in Hardware
>>>
>>> The TGU provides a step region for user configuration, similar
>>> to a flow chart. Each step region consists of three register clusters:
>>>
>>> 1.Priority Region: Sets the required signals with priority.
>>> 2.Condition Region: Defines specific requirements (e.g., signal A
>>> reaches three times) and the subsequent action once the requirement is
>>> met.
>>> 3.Timer/Counter (Optional): Provides timing or counting functionality.
>>>
>>> Add a new coresight-tgu.yaml file to describe the bindings required to
>>> define the TGU in the device trees.
>>>
>>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>>> Signed-off-by: songchai <quic_songchai@quicinc.com>
>> Don't duplicate yourself.
>>
>> Anyway, this is marked as v3, I cannot find previous versions, no
>> changelog, no references.
>>
>> What happened here in this binding?
>>
>>> ---
>>>   .../bindings/arm/qcom,coresight-tgu.yaml      | 135 ++++++++++++++++++
>>>   1 file changed, 135 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>> new file mode 100644
>>> index 000000000000..a41ac68a4fe7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>> @@ -0,0 +1,135 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +# Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> 2023 and 2024? Where was it published in these years?
>>
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Trigger Generation Unit - TGU
>>> +
>>> +description: |
>>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
>>> +  to sense a plurality of signals and create a trigger into the CTI or
>>> +  generate interrupts to processors. The TGU is like the trigger circuit
>>> +  of a Logic Analyzer. The corresponding trigger logic can be realized by
>>> +  configuring the conditions for each step after sensing the signal.
>>> +  Once setup and enabled, it will observe sense inputs and based upon
>>> +  the activity of those inputs, even over clock cycles, may detect a
>>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
>>> +
>>> +  The primary use case of the TGU is to detect patterns or sequences on a
>>> +  given set of signals within some region of the SoC.
>>> +
>>> +maintainers:
>>> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
>>> +  - Sam Chai <quic_songchai@quicinc.com>
>>> +
>>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>>> +select:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        enum:
>>> +          - qcom,coresight-tgu
>>> +  required:
>>> +    - compatible
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: qcom,coresight-tgu
>>> +      - const: arm,primecell
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: apb_pclk
>>> +
>>> +  qcom,tgu-steps:
>>> +    description:
>>> +      The trigger logic is realized by configuring each step after sensing
>>> +      the signal. The parameter here is used to describe the maximum of steps
>>> +      that could be configured in the current TGU.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 1
>>> +    maximum: 8
>>> +
> Hardware features are usually defined by ID registers in coresight
> devices. e.g. ETM has a number of ID registers that describe the
> number of comparators / counters etc.
> Does this device not have similar registers? Is there not a unique ID
> for each hardware variant - hardware discoverablility is an
> architecture requirement for coresight devices?
For hardware discovery, replied in patch0.
>
>>> +  qcom,tgu-regs:
>>> +    description:
>>> +      There are some "groups" register clusters in each step, which are used to
>>> +      configure the signal that we want to detect. Meanwhile, each group has its
>>> +      own priority, and the priority increases with number of groups. For example,
>>> +      group3 has a higher priority than group2, the signal configured in group3
>>> +      will be sensed more preferentially than the signal which is configured in group2.
>>> +      The parameter here is used to describe the signal number that each group
>>> +      could be configured.
>> And all groups are indexed by number? Or do they have names?
>>
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 1
>>> +    maximum: 18
>>> +
>>> +  qcom,tgu-conditions:
>>> +    description:
>>> +      A condition sets a specific requirement for a step and defines the subsequent
>>> +      action once the requirement is met. For example, in step two, if signal A is
>>> +      detected three times, the process jumps back to step one. The parameter describes
>>> +      the register number for each functionality, whether it is setting a specific
>>> +      requirement or defining a subsequent action.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 1
>>> +    maximum: 4
>>> +
>>> +  qcom,tgu-timer-counters:
>>> +    description:
>>> +      TGU has timer and counter which are used to set some requirement on each step.
>> Wrap according to Linux coding style, so at 80.
>>
>>> +      For example, we could use counter to create a trigger into CTI once TGU senses
>>> +      the target signal three times.This parameter is used to describe the number of
>>> +      Timers/Counters in TGU.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 0
>> Drop
>>
>>> +    maximum: 2
>>> +
>>> +  in-ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      port:
>>> +        description: AXI Slave connected to another Coresight component
>> So this TGU can be connected to anything in coresight graph, no
>> restrictions?
>>
>
> Coresight uses APB for register access and ATB for moving trace from
> source to sink. The only use of AXI is on the ETR/CATU output saving
> trace data into system memory.
Checked with the hardware team, the TGU also uses the APB to configure 
the register.
Will correct it in the next version.
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>> Most likely you miss also: in-ports
>>
>>
>> Best regards,
>> Krzysztof
>>
> Regards
>
> Mike
>

