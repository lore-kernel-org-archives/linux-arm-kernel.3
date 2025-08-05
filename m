Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA93C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWsFDgvDef0XAJbTM5lJYk9YT65cFsdqVlkF8tOYdEA=; b=3RbaQIGR9OkUT5uQq3c4o12d5Z
	ZotGyRhDpAE+FzAutKEXHlSl+OcPFkJp+sZtVQcjoZovn6OgkPKoq+ukQ8cJQ6MO5XJIYuQUYpJ5c
	XHF71ht6IHoe4mBnYC7GtLaomTDmyxipop4wAEjnQWjyMbJmaAxCjcj3ROdPMbkuCzo/MFCrN/Qhr
	9WV6gVy1kE6MMvQ4VgWM95mVk7+bRpVLzQbRqoZgC/pr/DxHKmbchwfbpv7BBr0H5yUyk/J2pcB+O
	nNhcpxxo6FXWE9Z4iXfmMrovQUc85Qahaidhj360I/USzIFlSfM/ETqLBVmo7bg0IPyLaIQGssfyx
	YEwPBwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLgZ-0000000DSPK-29j9;
	Tue, 05 Aug 2025 17:42:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL9K-0000000DNrg-3uWm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:08:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68683150C;
	Tue,  5 Aug 2025 10:08:22 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A71BF3F673;
	Tue,  5 Aug 2025 10:08:27 -0700 (PDT)
Message-ID: <742fe06b-81ab-4402-ae6a-19d6734507ae@arm.com>
Date: Tue, 5 Aug 2025 18:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/36] dt-bindings: arm: Add MPAM MSC binding
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ben Horgan <ben.horgan@arm.com>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-12-james.morse@arm.com>
 <20250711214314.GA1376683-robh@kernel.org>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250711214314.GA1376683-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_100831_062914_09134FFF 
X-CRM114-Status: GOOD (  29.24  )
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

Hi Rob,

On 11/07/2025 22:43, Rob Herring wrote:
> On Fri, Jul 11, 2025 at 06:36:23PM +0000, James Morse wrote:
>> From: Rob Herring <robh@kernel.org>
>>
>> The binding is designed around the assumption that an MSC will be a
>> sub-block of something else such as a memory controller, cache controller,
>> or IOMMU. However, it's certainly possible a design does not have that
>> association or has a mixture of both, so the binding illustrates how we can
>> support that with RIS child nodes.
>>
>> A key part of MPAM is we need to know about all of the MSCs in the system
>> before it can be enabled. This drives the need for the genericish
>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>> until a h/w specific driver potentially enables the h/w.

> Is there any DT based h/w using this? I'm not aware of any.

I'm told there is. I'll let them come out of the wood work to confirm it ...


> I would 
> prefer not merging this until there is. I have little insight whether 
> these genericish compatibles will be sufficient, but I have lots of 
> experience to say they won't be. I would also suspect that if anyone has 
> started using this, they've just extended/modified it however they 
> wanted and no feedback got to me.

Sure, what are you looking for here, Reviewed-by tags from someone with a hardware
platform that is going to ship with DT?


>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> new file mode 100644
>> index 000000000000..9d542ecb1a7d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> @@ -0,0 +1,227 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>> +
>> +description: |
>> +  The Arm MPAM specification can be found here:
>> +
>> +  https://developer.arm.com/documentation/ddi0598/latest
>> +
>> +maintainers:
>> +  - Rob Herring <robh@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: arm,mpam-msc                   # Further details are discoverable
>> +      - const: arm,mpam-memory-controller-msc
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: A memory region containing registers as defined in the MPAM
>> +      specification.
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    items:
>> +      - description: error (optional)
>> +      - description: overflow (optional, only for monitoring)
>> +
>> +  interrupt-names:
>> +    oneOf:
>> +      - items:
>> +          - enum: [ error, overflow ]
>> +      - items:
>> +          - const: error
>> +          - const: overflow
>> +
>> +  arm,not-ready-us:
>> +    description: The maximum time in microseconds for monitoring data to be
>> +      accurate after a settings change. For more information, see the
>> +      Not-Ready (NRDY) bit description in the MPAM specification.
>> +
>> +  numa-node-id: true # see NUMA binding
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  '^ris@[0-9a-f]$':
>> +    type: object
>> +    additionalProperties: false
>> +    description: |
> 
> '|' can be dropped.
> 
>> +      RIS nodes for each RIS in an MSC. These nodes are required for each RIS
>> +      implementing known MPAM controls
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +            # Bulk storage for cache
>> +          - arm,mpam-cache
>> +            # Memory bandwidth
>> +          - arm,mpam-memory
>> +
>> +      reg:
>> +        minimum: 0
>> +        maximum: 0xf
>> +
>> +      cpus:
>> +        $ref: '/schemas/types.yaml#/definitions/phandle-array'

> Don't need the type. It's in the core schemas now.

(I assume the type is that '$ref' line)


>> +        description:
>> +          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
>> +          device's affinity is used.
>> +
>> +      arm,mpam-device:
>> +        $ref: '/schemas/types.yaml#/definitions/phandle'
> 
> Don't need quotes. This should be a warning, but no testing happened 
> because the DT list and maintainers weren't CCed.

Yup, its an RFC - I only CC'd the folk that have previously expressed an interest for the
first pass. (git send-email put you on CC!)


>> +        description:
>> +          By default, the MPAM enabled device associated with a RIS is the MSC's
>> +          parent node. It is possible for each RIS to be associated with different
>> +          devices in which case 'arm,mpam-device' should be used.
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +dependencies:
>> +  interrupts: [ interrupt-names ]
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    /*
>> +    cpus {
>> +        cpu@0 {
>> +            next-level-cache = <&L2_0>;
>> +        };
>> +        cpu@100 {
>> +            next-level-cache = <&L2_1>;
>> +        };
>> +    };
>> +    */
>> +    L2_0: cache-controller-0 {
>> +        compatible = "cache";
>> +        cache-level = <2>;
>> +        cache-unified;
>> +        next-level-cache = <&L3>;
>> +
>> +    };
>> +
>> +    L2_1: cache-controller-1 {
>> +        compatible = "cache";
>> +        cache-level = <2>;
>> +        cache-unified;
>> +        next-level-cache = <&L3>;
>> +
>> +    };
> 
> All the above should be dropped. Not part of this binding.
> 
>> +
>> +    L3: cache-controller@30000000 {
>> +        compatible = "arm,dsu-l3-cache", "cache";
> 
> Pretty sure this is a warning because that compatible doesn't exist.

Not sure what to do with this. I see plenty of DT in the tree with 'cache', and you've got
'foo,a-memory-controller' below ...


>> +        cache-level = <3>;
>> +        cache-unified;
>> +
>> +        ranges = <0x0 0x30000000 0x800000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        msc@10000 {
>> +            compatible = "arm,mpam-msc";
>> +
>> +            /* CPU affinity implied by parent cache node's  */
>> +            reg = <0x10000 0x2000>;
>> +            interrupts = <1>, <2>;
>> +            interrupt-names = "error", "overflow";
>> +            arm,not-ready-us = <1>;
>> +        };
>> +    };
>> +
>> +    mem: memory-controller@20000 {
>> +        compatible = "foo,a-memory-controller";
>> +        reg = <0x20000 0x1000>;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        msc@21000 {
>> +            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
>> +            reg = <0x21000 0x1000>;
>> +            interrupts = <3>;
>> +            interrupt-names = "error";
>> +            arm,not-ready-us = <1>;
>> +            numa-node-id = <1>;
>> +        };
>> +    };


James

