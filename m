Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB54C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ha6FUxCVRLxvafpKc2mis+wcsbG7s0Xe/Xfq6cSaYlI=; b=TGNflTINtToxzkkpVAzKNxKLwO
	G6nqynqM1BvnyZVg/mzvFvjUMckZAC0CRbm+x3YFNO5yVhkWmacUSXSB2VT5phn6c6qlTFUmsbIAc
	Mtq4ZTBPE3oTWiVD7pNbtSqOi3Gay39y/+MGNg4qtv+x+dnHHVP8Mt/z75a5HvrckdZ3FsgQAwOKs
	AWcxZ9PqQoVU74ZBWj+sX7dvBICZfIehBqAifurknA1B77CUqIJ6ueXaDPN6WvEWo4YQwj/S5syFX
	d82EQeKP1kvFq1WFF6l1yXv4nJXNV625pUqGyutoUzYxK1xqHxbEz+trS7kFy1v1R0UR3hAwQ039D
	NliJ6f3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67rv-000000040bG-1Yvc;
	Mon, 14 Sep 2026 14:41:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67rs-000000040ae-13TP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:41:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5243A152B;
	Mon, 14 Sep 2026 07:41:07 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B47243F86F;
	Mon, 14 Sep 2026 07:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789396870; bh=+FD/VOEtpkJiv8RtMGh6Vj4oR48HBb21Vg/klWs5GCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jgiJAwIoSHIjCWQqVPLqNO7n+iJfGzSlu/Ud1uOI0smhjd9zQB9s/xtX48CKL4iyb
	 Q5PsiKuuCfBfl3SzAIlv/fg/ih8mRQrrXEQ5VxG4UfsLJC3bIOrrstYMxwcYykJHnW
	 rt3H+NV3j1sGU2yb047zYBp1fvaUvW+YlgFDMzKI=
Message-ID: <f71cfbcc-2e53-4e37-bb98-693996542396@arm.com>
Date: Mon, 14 Sep 2026 16:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 03/10] dt-bindings: arm: Add MPAM MSC binding
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
 Rob Herring <robh@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Ben Horgan <ben.horgan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_074112_417602_DC334267 
X-CRM114-Status: GOOD (  28.59  )
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

Hi,

On 9/14/26 11:37, Yin Li wrote:
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
> 
> Cc: James Morse <james.morse@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 +++++++++++++++++++++
>   1 file changed, 199 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> new file mode 100644
> index 000000000000..53a6fdbbf05f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
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

But that doesn't match the examples below, does it? Don't we want to 
allow just "arm,mpam-msc", but also the memory controller string, with 
"arm,mpam-msc" as a fallback?
I guess the pattern should then look similar to interrupt-names below?

> +
> +  reg:
> +    maxItems: 1
> +    description: A memory region containing registers as defined in the MPAM
> +      specification.
> +
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
> +  '^ris@[0-9a-f]+$':
> +    type: object
> +    additionalProperties: false
> +    description:
> +      RIS nodes for each resource instance in an MSC. These nodes are required
> +      for each resource instance implementing known MPAM controls
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - arm,mpam-cache
> +          # Memory bandwidth
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
> +          parent node. It is possible for each RIS to be associated with different
> +          devices in which case 'arm,mpam-device' should be used.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +
> +dependencies:
> +  interrupts: [ interrupt-names ]
> +
> +additionalProperties: false
> +
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
> +            reg = <0x10000 0x2000>;
> +            interrupts = <1>, <2>;
> +            interrupt-names = "error", "overflow";
> +            arm,not-ready-us = <1>;
> +            /* CPU affinity implied by parent cache node  */
> +        };
> +    };
> +
> +    mem: memory-controller@20000 {
> +        compatible = "foo,a-memory-controller";
> +        reg = <0x20000 0x1000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        msc@21000 {
> +            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
> +            reg = <0x21000 0x1000>;
> +            interrupts = <3>;
> +            interrupt-names = "error";
> +            arm,not-ready-us = <1>;
> +            numa-node-id = <1>;
> +        };
> +    };
> +
> +    iommu@40000 {
> +        reg = <0x40000 0x1000>;
> +
> +        ranges;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        msc@41000 {
> +            compatible = "arm,mpam-msc";
> +            reg = <0 0x1000>;
> +            interrupts = <5>, <6>;
> +            interrupt-names = "error", "overflow";
> +            arm,not-ready-us = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ris@2 {
> +                compatible = "arm,mpam-cache";
> +                reg = <0>;
> +                // TODO: How to map to device(s)?

Maybe we should remove this example, if it isn't ready yet?

Cheers,
Andre

> +            };
> +        };
> +    };
> +
> +    msc@80000 {
> +        compatible = "foo,a-standalone-msc";
> +        reg = <0x80000 0x1000>;
> +
> +        clocks = <&clks 123>;
> +
> +        ranges;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        msc@10000 {
> +            compatible = "arm,mpam-msc";
> +
> +            reg = <0x10000 0x2000>;
> +            interrupts = <7>;
> +            interrupt-names = "overflow";
> +            arm,not-ready-us = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ris@0 {
> +                compatible = "arm,mpam-cache";
> +                reg = <0>;
> +                arm,mpam-device = <&L2_0>;
> +            };
> +
> +            ris@1 {
> +                compatible = "arm,mpam-memory";
> +                reg = <1>;
> +                arm,mpam-device = <&mem>;
> +            };
> +        };
> +    };
> +
> +...
> 


