Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09485E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fguhziW4d7hgZOp4YzgHe4qZHO5jZfJiMBBPCufPp5U=; b=TQgFoR4BvCvNfBiKVFjxuIjrWZ
	xM2WvZOskHF3StdEyyljdiRFtJwwo0xow35A8Byc6LeApq3L4EllhpQlpBZ48Sk0mgzwjIPfwOufg
	/3CpgikdNZceyZCJG8EIQ7bVweLgrcrTuOCycp96xxPorgZCP2H26ih75Fcp3jdw8fsQHjLHmLbGv
	w1N1hUOSVKIipqePvCgQk8+PlJNP2nZvp5RD9/jov0aF8lnTxCEH3iqZFdCh/KjhSU32nkvoFF/6D
	z/4NFM8Zr0Kukg+5SvbhRHX5MhDQ8qqO8g4kFCbX70WpLpmrHS9c2OU9YzYruq/MnK159dVh2Dwut
	cpzmb7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHSw-0000000G8Vn-3OQk;
	Fri, 10 Jan 2025 16:02:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH4W-0000000FyuF-1L2o;
	Fri, 10 Jan 2025 15:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1ABDAA42526;
	Fri, 10 Jan 2025 15:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DD9C4CED6;
	Fri, 10 Jan 2025 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523435;
	bh=t/DCLtxTAMc6j2jDTGiXPzE5QLvYDxwka7Xtc0lpisQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IO/BUphEXrds0kt8ktdN0EDh4YXbN7rr/hC1yO0J37SC1Gf5SF1IInMlU2ChMaG9n
	 jyi516GoF+AEOuts7KPRJgOJ3Vt01PRePBb8m7AByK7bvvSLzbNKRvpDBhlkjBSRm6
	 a2bnT4yA9HcMpovdLCe06Gw/aabyimLWOWzKjwMW+hJLZ+O0fz+PMLcpwpSY9X/dJC
	 i8ap8sl4v64+KuA4NfQ+aJs20O2vDqHf0OCOsiTQz/XJvPM4fijMfHtSkr2EU9B/nl
	 5LpRTtflSz9orIksuejhxc0WaQsM7L4I9eP9bmEg6Wx8tDFw3ClpH8Mh8RD0Uxa2fA
	 6myCtPjBgNLxQ==
Date: Fri, 10 Jan 2025 09:37:14 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
	detlev.casanova@collabora.com, daniel@fooishbar.org,
	sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v10 10/11] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <20250110153714.GA2912633-robh@kernel.org>
References: <20250110100832.27551-1-andyshrk@163.com>
 <20250110100832.27551-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100832.27551-11-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_073716_485556_9D3E4903 
X-CRM114-Status: GOOD (  21.24  )
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

On Fri, Jan 10, 2025 at 06:08:25PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v10:
> - Move interrupt-names back to top level
> - Add constraint of interrupts for all platform
> - Add constraint for all grf phandles
> - Reorder some properties
> 
> Changes in v9:
> - Drop 'vop-' prefix of interrupt-names.
> - Add blank line between DT properties
> - Remove list interrupt-names in top level
> 
> Changes in v8:
> - Fix dt_binding_check errors
> - ordered by soc name
> - Link to the previous version:
>   https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u
> 
> Changes in v4:
> - describe constraint SOC by SOC, as interrupts of rk3576 is very
>   different from others
> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> 
> Changes in v3:
> - ordered by soc name
> - Add description for newly added interrupt
> 
> Changes in v2:
> - Add dt bindings
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 101 +++++++++++++++---
>  1 file changed, 87 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 2531726af306..3bae71142018 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -14,12 +14,14 @@ description:
>  maintainers:
>    - Sandy Huang <hjc@rock-chips.com>
>    - Heiko Stuebner <heiko@sntech.de>
> +  - Andy Yan <andyshrk@163.com>
>  
>  properties:
>    compatible:
>      enum:
>        - rockchip,rk3566-vop
>        - rockchip,rk3568-vop
> +      - rockchip,rk3576-vop
>        - rockchip,rk3588-vop
>  
>    reg:
> @@ -37,10 +39,21 @@ properties:
>        - const: gamma-lut
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
>      description:
> -      The VOP interrupt is shared by several interrupt sources, such as
> -      frame start (VSYNC), line flag and other status interrupts.
> +      For VOP version under rk3576, the interrupt is shared by several interrupt
> +      sources, such as frame start (VSYNC), line flag and other interrupt status.
> +      For VOP version from rk3576 there is a system interrupt for bus error, and
> +      every video port has it's independent interrupts for vsync and other video
> +      port related error interrupts.
> +
> +  interrupt-names:
> +    items:
> +      - const: sys
> +      - const: vp0
> +      - const: vp1
> +      - const: vp2
>  
>    # See compatible-specific constraints below.
>    clocks:
> @@ -120,43 +133,102 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-vop
> +            enum:
> +              - rockchip,rk3566-vop
> +              - rockchip,rk3568-vop
>      then:
>        properties:
>          clocks:
> -          minItems: 7
> +          minItems: 5
> +
>          clock-names:
> -          minItems: 7
> +          minItems: 5
> +
> +        interrupts:
> +          minItems: 1
> +          maxItems: 1
> +
> +        interrupt-names: false
>  
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> -            - port@3
> +
> +        rockchip,vo1-grf: false
> +        rockchip,vop-grf: false
> +        rockchip,pmu: false
>  
>        required:
>          - rockchip,grf
> -        - rockchip,vo1-grf
> -        - rockchip,vop-grf
> -        - rockchip,pmu
>  
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-vop
> +    then:
>        properties:
> +        clocks:
> +          minItems: 5
> +
> +        clock-names:
> +          minItems: 5
> +
> +        interrupts:
> +          minItems: 4
> +          maxItems: 4

max is already 4, so drop.

> +
> +        interrupt-names:
> +          minItems: 4
> +          maxItems: 4

same here.

> +
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
>          rockchip,vo1-grf: false
>          rockchip,vop-grf: false
> -        rockchip,pmu: false
>  
> +      required:
> +        - rockchip,grf
> +        - rockchip,pmu
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vop
> +    then:
> +      properties:
>          clocks:
> -          maxItems: 5
> +          minItems: 7
> +
>          clock-names:
> -          maxItems: 5
> +          minItems: 7
> +
> +        interrupts:
> +          minItems: 1

min is already 1, so drop.

> +          maxItems: 1
> +
> +        interrupt-names: false
>  
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> +            - port@3
> +
> +      required:
> +        - rockchip,grf
> +        - rockchip,vo1-grf
> +        - rockchip,vop-grf
> +        - rockchip,pmu
>  
>  additionalProperties: false
>  
> @@ -184,6 +256,7 @@ examples:
>                                "dclk_vp1",
>                                "dclk_vp2";
>                  power-domains = <&power RK3568_PD_VO>;
> +                rockchip,grf = <&grf>;
>                  iommus = <&vop_mmu>;
>                  vop_out: ports {
>                      #address-cells = <1>;
> -- 
> 2.34.1
> 

