Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3C5CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukpUdQrYpnt1Q7/q1nCWx3NiUYqh/16IeLdqMdpEL5Y=; b=3cZfKFdVkuWqkDItdLb5QwhTaU
	ekO39LY3Y3bcNeUcEnlUgDgpQ+rkQn4DKHLy6h59VY+BFy3fehvdUFsmyn1KQOiiE5CW6BfPnNFE5
	z/tUBswvyg+Yse1vX/f94XHI/sehZoUiLrSBwslwPLxCa/NtoIR/TEa2d4emYEqL4kLULITGlqMKT
	jTO14BVOjha5PWjqbGP1dX4EzCmvHPaYIfr6Q/96zdxzYeOsyu+D04cQOH7eAAszsbsd62nD3LvHo
	x3mle9ZjqGBcP/fUja5/N/frD0CGkEuu9YsJhhY4bQwqxLNFizKBYXHYVovKU4X4aLmRuhviS5bE7
	e6+f6yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLby-0000000GZJO-2FKK;
	Wed, 27 Aug 2025 19:15:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIvH-0000000GAhz-1Suk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:22:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4809152B;
	Wed, 27 Aug 2025 09:22:44 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F0D73F738;
	Wed, 27 Aug 2025 09:22:47 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:22:44 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 09/33] dt-bindings: arm: Add MPAM MSC binding
Message-ID: <aK8w1L3gHBk2Fz1k@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-10-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822153048.2287-10-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_092255_541920_C5D31AF5 
X-CRM114-Status: GOOD (  36.38  )
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

Hi James,

On Fri, Aug 22, 2025 at 03:29:50PM +0000, James Morse wrote:
> From: Rob Herring <robh@kernel.org>
> 
> The binding is designed around the assumption that an MSC will be a
> sub-block of something else such as a memory controller, cache controller,
> or IOMMU. However, it's certainly possible a design does not have that
> association or has a mixture of both, so the binding illustrates how we can
> support that with RIS child nodes.
> 
> A key part of MPAM is we need to know about all of the MSCs in the system
> before it can be enabled. This drives the need for the genericish
> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
> until a h/w specific driver potentially enables the h/w.

I'll leave detailed review to other people for now, since I'm not so up
to speed on all things DT.

A few random comments, below.


[...]

> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml

[...]

> @@ -0,0 +1,200 @@

[...]

> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
> +
> +description: |
> +  The Arm MPAM specification can be found here:
> +
> +  https://developer.arm.com/documentation/ddi0598/latest
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: arm,mpam-msc                   # Further details are discoverable
> +      - const: arm,mpam-memory-controller-msc

There seems to be no clear statement about how these differ.

> +  reg:
> +    maxItems: 1
> +    description: A memory region containing registers as defined in the MPAM
> +      specification.

There seems to be no handling of PCC-based MSCs here.  Should there be?

If this can be added later in a backwards-compatible way, I guess
that's not a problem (and this is what compatible strings are for, if
all else fails.)

An explicit statement that PCC is not supported here might be helpful,
though.

> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: error (optional)
> +      - description: overflow (optional, only for monitoring)
> +
> +  interrupt-names:
> +    oneOf:
> +      - items:
> +          - enum: [ error, overflow ]
> +      - items:
> +          - const: error
> +          - const: overflow

Yeugh.  Is this really the only way to say "one or both of foo"?

(I don't know the answer to this -- though I can believe that it's
true.  Perhaps just not describing this property is another option.
Many bindings seem not to bother.)

> +
> +  arm,not-ready-us:
> +    description: The maximum time in microseconds for monitoring data to be
> +      accurate after a settings change. For more information, see the
> +      Not-Ready (NRDY) bit description in the MPAM specification.
> +
> +  numa-node-id: true # see NUMA binding
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^ris@[0-9a-f]$':

It this supposed to be '^ris@[0-9a-f]+$' ?

Currently MPAMF_IDR.RIS_MAX is only 4 bits in size and so cannot be
greater than 0xf.  But it is not inconceivable that a future revision
of the architecture might enable more -- and the are 4 RES0 bits
looming over the RIS_MAX field, just waiting to be used...

(In any case, it feels wrong to try to enforce numeric bounds with a
regex, even in the cases where it happens to work straightforwardly.)

> +    type: object
> +    additionalProperties: false
> +    description:
> +      RIS nodes for each RIS in an MSC. These nodes are required for each RIS

The architectural term is "resource instance", not "RIS".

But "RIS nodes" is fine for describing the DT nodes, since we can call
them what we like, and "ris" is widely used inside the MPAM driver.

People writing DTs should not need to be familiar with the driver's
internal naming conventions, though.

(There are other instances, but I won't comment on them all
individually.)

> +      implementing known MPAM controls
> +
> +    properties:
> +      compatible:
> +        enum:
> +            # Bulk storage for cache

Nit: What is "bulk storage"?

The MPAM spec just refers to "cache" or "cache memory".

> +          - arm,mpam-cache
> +            # Memory bandwidth
> +          - arm,mpam-memory
> +
> +      reg:
> +        minimum: 0
> +        maximum: 0xf
> +
> +      cpus:
> +        description:
> +          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
> +          device's affinity is used.
> +
> +      arm,mpam-device:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          By default, the MPAM enabled device associated with a RIS is the MSC's

Associated how?  Is this the device where the physical resources
managed by the MSC are located?

> +          parent node. It is possible for each RIS to be associated with different
> +          devices in which case 'arm,mpam-device' should be used.

[...]

> +examples:
> +  - |
> +    L3: cache-controller@30000000 {
> +        compatible = "arm,dsu-l3-cache", "cache";
> +        cache-level = <3>;
> +        cache-unified;
> +
> +        ranges = <0x0 0x30000000 0x800000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        msc@10000 {
> +            compatible = "arm,mpam-msc";
> +
> +            /* CPU affinity implied by parent cache node's  */

"node's" -> "nodes".

(or it this supposed to be in the singular -- i.e., the immediately
parent cache node only?)

Anyway, it looks like this is commenting on the "reg" property, which
doesn't seem right.

Is this commnent supposed instead to explain the omission of the "cpus"
property?  If so, that should be made clearer.

> +            reg = <0x10000 0x2000>;
> +            interrupts = <1>, <2>;
> +            interrupt-names = "error", "overflow";
> +            arm,not-ready-us = <1>;
> +        };
> +    };

[...]

(Examples otherwise not reviewed in detail.)

Cheers
---Dave

