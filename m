Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0720AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TapvtLSZY3/wZcR3OSS27kY0HMOek4T781dUjWXOirU=; b=uUd4L0Ji9TJf7M5yTfN66AvgMy
	mvvhUbmkbtMP1G+6Oe4Sk9S2iCBmLkjkzaALQ6TucPNF9ySWm64UGBmOwSn7thHZcA1Y750vFVbQq
	INZnPMJrZnoLS/fDmRlFnhs3GPmVYxvyizfYBsD4Vm6h4FgLzo7D07ZrWNxcd+R1x5nW4quVYZqn6
	+llWtUQhPUmwXELT46gN1AABO+8EBebwfiTvMvv0lrF6R0L8wvB7BqWwDinPK/RP6gnmQu3NUZF9y
	t/e2fbr4S3ifoYa8XkKpBwENd9RbZgolpD/xTXESqwRCgbGVAb0c2oAfHPVHZpJKGAZA9f9y6j25E
	pHyfDxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfXg-0000000A9ab-1ecW;
	Wed, 08 Jan 2025 23:32:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfWG-0000000A9R4-3Sjt;
	Wed, 08 Jan 2025 23:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4FF48A41BB5;
	Wed,  8 Jan 2025 23:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7DDC4CED3;
	Wed,  8 Jan 2025 23:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736379083;
	bh=hGzh6Ux0equEOkz0+aeV+MQwWoU7zw3mDv7K/oHfxJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuNtBX7gO9+r+kRfw5uE/mylZqfhHuk6TrQGv6FcAiOMa/afIdcIwtJlAuUhxkqEJ
	 aL28jKgy+1KXiTElsi7FNtMlsaowk8YaId0DYdjfZO3NoGHAXRhn/5EHJTwcCPE7lk
	 Tyg0TcgFJ+iTbPexED2K1JjcIXIqf8dAri4hbc63Fb/npIm5uqIE50p32fXDw6KYCv
	 2/uXdqdceLDJOTMI3YCGve0lLtJ9vyAuvjXcvc7hFkhXNSiVt3jmHIKS0fcKEkFB1l
	 juFvd5ZsT0Z6QlSL6KFMGNlpnSZGwR0Y/7EF9HGHktEYyA0N1ngq2/wh7qylEjxWIA
	 qokiP1TX1M2rg==
Date: Wed, 8 Jan 2025 17:31:22 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
	detlev.casanova@collabora.com, daniel@fooishbar.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v9 10/11] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <20250108233122.GA1227227-robh@kernel.org>
References: <20250108115233.17729-1-andyshrk@163.com>
 <20250108115233.17729-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108115233.17729-11-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_153124_999991_D1444339 
X-CRM114-Status: GOOD (  19.36  )
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

On Wed, Jan 08, 2025 at 07:52:27PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v9:
> - Drop 'vop-' prefix of interrupt-names.
> - Add blank line between DT properties
> - Remove list interrupt-names in top level

That's the opposite of what we usually want...

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
>  .../display/rockchip/rockchip-vop2.yaml       | 83 +++++++++++++++----
>  1 file changed, 67 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 2531726af306..44256cdcb877 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - rockchip,rk3566-vop
>        - rockchip,rk3568-vop
> +      - rockchip,rk3576-vop
>        - rockchip,rk3588-vop
>  
>    reg:
> @@ -37,10 +38,17 @@ properties:
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
> +    maxItems: 4
>  
>    # See compatible-specific constraints below.
>    clocks:
> @@ -120,43 +128,86 @@ allOf:
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
>  
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> -            - port@3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-vop
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +
> +        clock-names:
> +          minItems: 5
> +
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +        interrupts:
> +          items:
> +            - description: vop system interrupt, such as axi bus error
> +            - description: interrupts for video port0, such as vsync, dsp_hold.
> +            - description: interrupts for video port1, such as vsync, dsp_hold.
> +            - description: interrupts for video port2, such as vsync, dsp_hold.
> +
> +        interrupt-names:
> +          items:
> +            - const: sys
> +            - const: vp0
> +            - const: vp1
> +            - const: vp2
>  
>        required:
>          - rockchip,grf
> -        - rockchip,vo1-grf
> -        - rockchip,vop-grf
>          - rockchip,pmu
>  
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vop
> +    then:
>        properties:
> -        rockchip,vo1-grf: false
> -        rockchip,vop-grf: false
> -        rockchip,pmu: false
> -
>          clocks:
> -          maxItems: 5
> +          minItems: 7
> +
>          clock-names:
> -          maxItems: 5
> +          minItems: 7
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

Where do the existing platforms have a constraint of only 1 interrupt?

And now while rk3576 has defined interrupt-names, all the other can have 
4 entries with anything.

Rob

