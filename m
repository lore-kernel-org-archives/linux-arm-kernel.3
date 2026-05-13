Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B41ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai4pDHQq+VBsqnLcB/Kk+KSD5BW8SaK3TC25BxBjGDg=; b=jr3KH7bWWqdQxufT0V7Huo33BZ
	Fr/HGiXo8QUeprtKXPcmtWfso9lsQiB3t7RwaZzulUmayDpz2X7CetTpraUNCmpTbNE+F62TYgamt
	L3r9JAQ40fDqIF9QGs+/zXJm6v6wveiJ5LCM6V9HXd+JDkUC3ASIb+hAvYvWsnT9oMsYje4owbJ34
	fP1WX/eBi68jGmugf7ngg2B/5UZIj1TlY8N7zV5CkJqd93t28gU51SuidxQdzSltTgAMSvRtSTE3C
	z1Ryu3jrDe8CmrkaIsx92SJylBOBJ+bQkjiZngz5tm32kWI3N2JaViGGLZw/8eYLS9UFZXcSQPxSR
	x6wUHGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDqm-00000003PdN-3Xsz;
	Wed, 13 May 2026 17:58:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDql-00000003Pcw-0334
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BDAE402E3;
	Wed, 13 May 2026 17:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A7FC19425;
	Wed, 13 May 2026 17:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695106;
	bh=AxClpjGMFT/IS8TAonyIRQqd4Y8WS5Q+6hwbcruaAjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpmq3Hq9P0j7QXE+5mLqJHwS1cXfU4Ral57BbyHV3Jd6qqyP9R7+zSbBgS9PTdj2e
	 ihZOcy9VQYy+u4QJyo10n3O3Oi5JMN7qib0QIkaDNo4QyBo3M2+glGo+sy+KoCQIck
	 JZDF83e5p8Un0HNHdRuor5wTYoTc0X5+YNv5W2Mf/Vofn1Oc1EprL6u3z1v/ufc1Uw
	 kJ6G44rhH+pKjSlan3Sn4SpFQ4uDMcZAeuPadtvcdDGR0RxSweyVyOzMaxw4E2YDqj
	 CKjnHjpdALtpdWZ+pM52fe8BX9O4S0FScN/bfW7UA+7+bqsilwK8ssKJsPTUi1MNN9
	 Jg7xPqCjL51kw==
Date: Wed, 13 May 2026 12:58:23 -0500
From: Rob Herring <robh@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Ruidong Tian <tianruidond@linux.alibaba.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
	mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
Message-ID: <20260513175823.GA1471517-robh@kernel.org>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_105827_092549_DBA73E50 
X-CRM114-Status: GOOD (  25.30  )
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

On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
> The Arm Error Source Table (AEST) specification describes how firmware
> exposes RAS error source topology to the operating system. On ACPI
> systems this information is provided via the AEST ACPI table.
> 
> Introduce Device Tree bindings that provide an equivalent description
> of AEST error sources for DT-based platforms.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>  include/dt-bindings/arm/aest.h                     |  43 +++
>  2 files changed, 449 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
> new file mode 100644
> index 000000000000..7809a0d38270
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
> @@ -0,0 +1,406 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Error Source Table (AEST)
> +
> +maintainers:
> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
> +
> +description:
> +  The Arm Error Source Table (AEST) describes RAS error sources and their
> +  register interfaces. Each error source exposes one or more error records
> +  through either system registers or a memory-mapped register window, and
> +  may signal errors via interrupts. The top-level node acts as a container
> +  for one or more child nodes, each describing a single AEST error source.
> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
> +  Flag bit constants for use in DT source files are defined in
> +  <dt-bindings/arm/aest.h>.
> +
> +properties:
> +  compatible:
> +    const: arm,aest
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
> +    type: object
> +    description:
> +      An AEST error source node describing one error source defined by
> +      the Arm AEST specification.
> +
> +    properties:
> +      compatible:
> +        description:
> +          Identifies the type of AEST error source. Each value corresponds to
> +          a distinct error source class defined by the Arm AEST specification.
> +          arm,aest-proxy represents a proxy error source that forwards errors
> +          from another error source.
> +        enum:
> +          - arm,aest-processor
> +          - arm,aest-memory
> +          - arm,aest-smmu
> +          - arm,aest-gic
> +          - arm,aest-pcie
> +          - arm,aest-vendor
> +          - arm,aest-proxy

This is a fundamental difference how DT and ACPI get structured. ACPI 
defines new table for some feature and puts everything in that table. 
For DT, these all belong in the node for the corresponding h/w. For 
example, if the GIC supports AEST, then that belongs in the GIC node. 

> +
> +      reg:
> +        description:
> +          Register ranges for the error source. Absence of reg implies
> +          system-register access (interface type 0). A single range implies
> +          memory-mapped access (interface type 1). Two ranges imply
> +          single-record memory-mapped access (interface type 2).
> +        minItems: 1
> +        maxItems: 4
> +
> +      reg-names:
> +        description:
> +          Names for the register ranges. The base error-record window is
> +          unnamed (or first entry). Optional named ranges provide access to
> +          the fault-injection, error-group, and interrupt-config register
> +          windows defined by the AEST specification.
> +        minItems: 1
> +        maxItems: 4
> +        items:
> +          enum:
> +            - fault-inject
> +            - err-group
> +            - irq-config
> +
> +      interrupts:
> +        description: Interrupts associated with the error source.
> +        minItems: 1
> +        maxItems: 2
> +
> +      interrupt-names:
> +        description: Names of the interrupts associated with the error source.
> +        minItems: 1
> +        maxItems: 2
> +        items:
> +          enum:
> +            - fhi
> +            - eri
> +
> +      arm,fhi-flags:
> +        description:
> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
> +          in the AEST node interrupt structure flags field. Constants are
> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
> +          AEST_IRQ_MODE_EDGE (1).

DT already has a way to define interrupt flags. Why invent something 
new?

Rob

