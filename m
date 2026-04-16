Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADECF8A16B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CEgH5vfDA9csfkXtI2eF457OuAkLzLscnTydYlyUXw=; b=YyoAR7TpEkZBxlNLm8kzQESu1M
	16CHk8uzu6DnBSbilUpG4Bx1LfljevH720yqPj/9U2qxbZavXdtdJNq8ZAjMHPuxqJJeX3Bcr1wgA
	9V/waS3HABH5Qk/tXXqupht4eYx6EEWWZYb2exT5Elc02FVTpScFzSt8Fdm+n7UybkFZY0pXwoqFj
	K6Ymqt4ei+MMYaQLlxPo53UOTDCGFQ+om/S80DnfrYB5h9dVPCAbr93fQlwBlQCxrxkUKjFGG/FpJ
	qV+fjRri0Otv9hKAUT/qAd75Im17Jp/4fUYNScSm3YsHUKbBesblXAxPurQXailiblBkPv7rBHnfs
	Zqvntksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLZX-00000002QMb-1tfo;
	Thu, 16 Apr 2026 12:11:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLZV-00000002QMT-3a09
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 12:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4C2A60127;
	Thu, 16 Apr 2026 12:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC6DC2BCAF;
	Thu, 16 Apr 2026 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776341508;
	bh=G/ZOfwn4xRS/lG0O2EK4Ai08HHVkXUmq9KdtaDg5v5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThIvKKCIybtUgEJT1YM8xw7G99TisDIF9oIIX2J5iag8Fj9v0veZJIZNT9TtVlq5h
	 9P7FQR0V8CLktCzBhf+pLiJtqVHkHS1yBchLtyA7tAT6R1aM3/df4sA1sl0hhvNC7W
	 Jy3Di2XfS4YUtHrvekwGLaU5IUXgwjaVf3L9QoEPzIxxsaNe84R43D3e2dSMOBMqon
	 1+tn57KSMDGO/SRh8n8x71+sHNDWltbX+E1QMxD474Tf7YhYCiBTG6Byv0lhhzc6on
	 bxYiqDoFKsTZJaDJaeWh7SrfGM+qZlJZAcUbaa78iFQHVcRsyIlh+TqFj7Jrhv/4ti
	 3UPIW9XKr9EFQ==
Date: Thu, 16 Apr 2026 07:11:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add support for
 secure donated SGIs
Message-ID: <20260416121146.GA2736962-robh@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
 <20260412-b4-ffa_ns_sgi_gicv3-v1-1-af61243eb405@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-1-af61243eb405@kernel.org>
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

On Sun, Apr 12, 2026 at 06:04:37PM +0100, Sudeep Holla wrote:
> In GICv3, SGI security is defined by interrupt grouping and configuration
> rather than by SGI number alone. Linux conventionally reserves SGIs 0-7
> for non-secure internal kernel IPIs, while higher SGIs is assumed to be
> owned/stolen by the Secure world unless explicitly made available.
> 
> Document secure donated SGI interrupt specifiers for the GICv3 binding.
> It describes "arm,secure-donated-ns-sgi-ranges" for SGIs donated by the
> secure world to non-secure software. It excludes SGIs 0-7, which are
> already used by the kernel for internal IPI purposes.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  .../bindings/interrupt-controller/arm,gic-v3.yaml  | 27 +++++++++++++++++++++-
>  include/dt-bindings/interrupt-controller/arm-gic.h |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> index bfd30aae682b..664727d071c9 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> @@ -45,17 +45,24 @@ description: |
>  
>        The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
>        interrupts, 2 for interrupts in the Extended SPI range, 3 for the
> -      Extended PPI range. Other values are reserved for future use.
> +      Extended PPI range, and 4 for SGI interrupts. Other values are
> +      reserved for future use.
>  
>        The 2nd cell contains the interrupt number for the interrupt type.
>        SPI interrupts are in the range [0-987]. PPI interrupts are in the
>        range [0-15]. Extended SPI interrupts are in the range [0-1023].
>        Extended PPI interrupts are in the range [0-127].
>  
> +      SGI interrupts are in the range [8-15] which overlaps with the SGIs
> +      assigned to/reserved for the secure world but donated to the non
> +      secure world to use. Refer "arm,secure-donated-ns-sgi-ranges" for
> +      more details.
> +
>        The 3rd cell is the flags, encoded as follows:
>        bits[3:0] trigger type and level flags.
>          1 = edge triggered
>          4 = level triggered
> +      SGIs are edge triggered and must be described as such.
>  
>        The 4th cell is a phandle to a node describing a set of CPUs this
>        interrupt is affine to. The interrupt must be a PPI, and the node
> @@ -136,6 +143,24 @@ description: |
>        - $ref: /schemas/types.yaml#/definitions/uint32
>        - $ref: /schemas/types.yaml#/definitions/uint64
>  
> +  arm,secure-donated-ns-sgi-ranges:
> +    description:
> +      A list of pairs <sgi span>, where "sgi" is the first SGI INTID of a
> +      range donated by the secure side to non-secure software, and "span" is
> +      the size of that range. Multiple ranges can be provided.
> +
> +      SGIs described by interrupt specifiers with type 4 (SGI) must fall
> +      within one of these ranges. SGIs(0-7) reserved by non-secure world
> +      for internal IPIs must not be listed here. "sgi" must be in the
> +      range [8-15], "span" must be in the range [1-8], and the range must
> +      not extend past SGI 15.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:

As a matrix, you need:

items:
  items:
    - ...
    - ...

However, given this is at most 8 entries, I would just do an array:

minItems: 1
maxItems: 8
uniqueItems: true
items:
  minimum: 8
  maximum: 15

Unless we need more flexibility in GICv5?

Is there an example we can stick this property into so it gets tested?

> +      - minimum: 8
> +        maximum: 15
> +      - minimum: 1
> +        maximum: 8
> +
>    ppi-partitions:
>      type: object
>      additionalProperties: false
> diff --git a/include/dt-bindings/interrupt-controller/arm-gic.h b/include/dt-bindings/interrupt-controller/arm-gic.h
> index 887f53363e8a..52c2f3f090c5 100644
> --- a/include/dt-bindings/interrupt-controller/arm-gic.h
> +++ b/include/dt-bindings/interrupt-controller/arm-gic.h
> @@ -14,6 +14,7 @@
>  #define GIC_PPI 1
>  #define GIC_ESPI 2
>  #define GIC_EPPI 3
> +#define GIC_SGI 4
>  
>  /*
>   * Interrupt specifier cell 2.
> 
> -- 
> 2.43.0
> 

