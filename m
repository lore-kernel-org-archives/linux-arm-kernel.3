Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96188CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFfunlBQ+rIXSDL6TwNkljY/p2J0uHg2toiKGPvNvV4=; b=bU+SrSWbPEaI9GWziaqPWDQbev
	WMvgHDjAG07AFAzrR+9mDNuSxLRlVaUzRwvn+fGPA+pDm7Cqq/0K2MO7z2YfNg/86oaxSWC8B2J0j
	58Znaj4LDodsQ+yGwXhglP0TFOHXz9mxWvG14hkdgaWHJ2HsNln2a07J7BcSkhpsf4ig4aJNdAYSd
	9gHeFp6+4QyMFn4gtI52HVSlh0zTVy2KahVPTVIedTemsmV62BYbmGdEQtpPXVJlbR7XkKKgtbbxS
	/VyvlXvhlCEdJTrUc7h06WkBdIV1/EfLmlL5sC3GH3dip2Xb0YQqEll3EBIaoC/gpBx5BCGUJPKLp
	5oTJ7ilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1pN-00000006VTt-0DO6;
	Thu, 20 Nov 2025 10:23:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1pK-00000006VTS-0Ps6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 10:23:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 930E9339;
	Thu, 20 Nov 2025 02:23:34 -0800 (PST)
Received: from [10.57.87.140] (unknown [10.57.87.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51E7B3F740;
	Thu, 20 Nov 2025 02:23:39 -0800 (PST)
Message-ID: <c23f72a6-24a4-41c4-b5f5-70a8589f1199@arm.com>
Date: Thu, 20 Nov 2025 10:23:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
To: Ashish Mhetre <amhetre@nvidia.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, will@kernel.org
Cc: joro@8bytes.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jgg@ziepe.ca, nicolinc@nvidia.com, linux-tegra@nvidia.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251031062959.1521704-1-amhetre@nvidia.com>
 <20251031062959.1521704-3-amhetre@nvidia.com>
 <20251031-witty-sociable-chachalaca-b73dbc@kuoka>
 <4f6496de-d3c8-4701-a9b4-6f695018eb5e@nvidia.com>
 <ef5bcd93-c88b-4242-be31-a3a4765fe5d8@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ef5bcd93-c88b-4242-be31-a3a4765fe5d8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_022346_260777_4C37519D 
X-CRM114-Status: GOOD (  25.19  )
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

On 2025-11-20 6:07 am, Ashish Mhetre wrote:
> 
> On 11/3/2025 7:24 PM, Ashish Mhetre wrote:
>>
>> On 10/31/2025 1:44 PM, Krzysztof Kozlowski wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Fri, Oct 31, 2025 at 06:29:58AM +0000, Ashish Mhetre wrote:
>>>> The Command Queue Virtualization (CMDQV) hardware is part of the
>>>> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
>>>> virtualizing the command queue for the SMMU.
>>> If this is specific to Nvidia, then I think you need specific front
>>> compatible and disallow it for other vendors.
>>
>> Yes, CMDQV is specific to Nvidia. There isn't currently a vendor-specific
>> compatible for Nvidia's arm,smmu-v3 implementation. Would it be 
>> acceptable
>> to document this as Nvidia-specific in the description? Or can we add a
>> new Nvidia-specific compatible string like "nvidia,smmu-v3" if that's
>> preferred and use conditional schema to restrict the property?
> 
> Hi Will, Robin,
> 
> Do you have any suggestions on this? I have followed existing ACPI approach
> for implementing DT support.

No, the way the ACPI binding is implemented has the lookup going *from* 
the CMDQV node back to the SMMU instance (via the matching identifier) - 
this is entirely the opposite. The literal DT equivalent would be to use 
for_each_matching_node/for_each_compatible_node to scan the CMDQV nodes 
for a property indicating the relevant SMMU.

I'm not hugely fussed either way though - since the fact is the Tegra234 
SMMU does have this custom modification, a specific 
"nvidia,tegra234-smmu", "arm,smmu-v3" compatible isn't inappropriate, 
even if it really doesn't make any difference to architectural SMMU 
operation without awareness of the other CMDQV nodes.

Thanks,
Robin.

> Will it be fine to add separate compatible 
> string
> for Nvidia Tegra264 SMMU to restrict the usage of CMDQV?
> 
>>>> Add a new device tree binding document for nvidia,tegra264-cmdqv.
>>>>
>>>> Also update the arm,smmu-v3 binding to include an optional nvidia,cmdqv
>>>> property. This property is a phandle to the CMDQV device node, allowing
>>>> the SMMU driver to associate with its corresponding CMDQV instance.
>>>>
>>>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>>>> ---
>>>>   .../bindings/iommu/arm,smmu-v3.yaml           | 10 ++++
>>>>   .../bindings/iommu/nvidia,tegra264-cmdqv.yaml | 46 +++++++++++++++ 
>>>> ++++
>>>>   2 files changed, 56 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/iommu/ 
>>>> nvidia,tegra264-cmdqv.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu- 
>>>> v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>>>> index 75fcf4cb52d9..edc0c20a0c80 100644
>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>>>> @@ -58,6 +58,15 @@ properties:
>>>>
>>>>     msi-parent: true
>>>>
>>>> +  nvidia,cmdqv:
>>>> +    description: |
>>>> +      A phandle to its pairing CMDQV extension for an 
>>>> implementation on NVIDIA
>>>> +      Tegra SoC.
>>>> +
>>>> +      If this property is absent, CMDQ-Virtualization won't be used 
>>>> and SMMU
>>>> +      will only use its own CMDQ.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +
>>>>     hisilicon,broken-prefetch-cmd:
>>>>       type: boolean
>>>>       description: Avoid sending CMD_PREFETCH_* commands to the SMMU.
>>>> @@ -92,4 +101,5 @@ examples:
>>>>               dma-coherent;
>>>>               #iommu-cells = <1>;
>>>>               msi-parent = <&its 0xff0000>;
>>>> +            nvidia,cmdqv = <&cmdqv>;
>>>>       };
>>>> diff --git a/Documentation/devicetree/bindings/iommu/ 
>>>> nvidia,tegra264-cmdqv.yaml b/Documentation/devicetree/bindings/ 
>>>> iommu/nvidia,tegra264-cmdqv.yaml
>>>> new file mode 100644
>>>> index 000000000000..f22c370278a3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/iommu/nvidia,tegra264- 
>>>> cmdqv.yaml
>>>> @@ -0,0 +1,46 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: NVIDIA Tegra264 CMDQV
>>> Missing blank line
>>
>> Ack, I will correct this in V2.
>>>> +description: |
>>> Do not need '|' unless you need to preserve formatting.
>>
>> Okay, I'll remove this in next version.
>>>> +  The CMDQ-Virtualization hardware block is part of the SMMUv3 
>>>> implementation
>>>> +  on Tegra264 SoCs. It assists in virtualizing the command queue 
>>>> for the SMMU.
>>>> +
>>>> +maintainers:
>>>> +  - NVIDIA Corporation <linux-tegra@nvidia.com>
>>> No. It should be a person. If entire Nvidia cannot find a person, I
>>> don't think we are interested in having this in the kernel.
>>
>> Okay, I'll add Nicolin as maintainer.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: nvidia,tegra264-cmdqv
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: cmdqv
>>> Drop interript names, obvious.
>>
>> Sure, I will update in V2.
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - interrupt-names
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +
>>>> +    cmdqv: cmdqv@8105200000 {
>>> Drop unused label
>>
>> Okay, I will remove the label.
>>> Best regards,
>>> Krzysztof
>>>

