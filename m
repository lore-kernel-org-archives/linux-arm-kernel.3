Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136C9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTMF9p28b0/KPV25ZqYQ8bHAuqem7ZHsRw4YpIWwMVE=; b=SnKTn+DvikmMeHLJMifuclGiNt
	lkI32XoK/T0UM8HJNDMj8awjel+G6omcYZM5kuOMtSu8Ppku3VA67olt6ZyixYH6CXCTd6960qPix
	IMaMqw0pb+bTpqYBWomgTaNrey0EzO2MlW0n3JCTlhKUVCsOy7lG28ADXQwrgNtbltdns/lWx/VKh
	aUSl6/uwsisOQAgpYX57TShjNQWDI2xfStIxtgG+uSeEyxST3Kt5O+gNcAo5If7BtT/3N6/1/HuEV
	jzIwEXz5+Gs1osv7f8b4YanzelR+QWrB+O0MXSmoBUzjaThjUXb4v7PcjXMCabr6kJW6QPrk5OaL9
	Dkz078Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkee-0000000DRWP-2EE3;
	Fri, 03 Jan 2025 16:36:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkdQ-0000000DRPz-3qqK;
	Fri, 03 Jan 2025 16:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4576AA404DC;
	Fri,  3 Jan 2025 16:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB947C4CECE;
	Fri,  3 Jan 2025 16:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735922091;
	bh=83DIF3mFLGw5ydl0IM2PKCB3azWLkypjNn+5xAAuKf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEB0OThNpNMl8LgLujdnkXrUmKE5Wb85k8l+FG7RzmbH3Ubi+tomlN4HOJ3oAbCpb
	 8NNNougV5UcWMlVTsJZprC0S/f1eyedEj0eKguSag9pqfsxFzGQalgR5RUsZM95YHz
	 2oHkaFSH0s5QbcO+tV5tDk2yAmpxedA7yzNISkqPiqDNFsWfIq8AWgV7VsPN01j9DJ
	 gTQtLVStdEAtSLBzLwqf1bB+ca971cz0ocekt35XEnKNB305Px2OPchhGksj6xBCLv
	 BeruJQPpAOvK7QQmuSKCMueJvkDj2mCrC7oEYbMXOJ7kJlq7Mh31BZEdmVl1LOT1Zx
	 U0O1fBazmP2Bg==
Date: Fri, 3 Jan 2025 10:34:49 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
	detlev.casanova@collabora.com, daniel@fooishbar.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 8/9] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <20250103163449.GA2382623-robh@kernel.org>
References: <20241231090802.251787-1-andyshrk@163.com>
 <20241231090802.251787-9-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231090802.251787-9-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083453_085079_7C061B31 
X-CRM114-Status: GOOD (  20.20  )
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

On Tue, Dec 31, 2024 at 05:07:51PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
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
>  .../display/rockchip/rockchip-vop2.yaml       | 81 ++++++++++++++-----
>  1 file changed, 63 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 2531726af306..4cdd9cced10c 100644
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
> @@ -37,10 +38,21 @@ properties:
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
> +      - const: vop-sys
> +      - const: vop-vp0
> +      - const: vop-vp1
> +      - const: vop-vp2

Drop 'vop-' as it is redundant.

>  
>    # See compatible-specific constraints below.
>    clocks:
> @@ -120,43 +132,76 @@ allOf:
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
>          clock-names:
> -          minItems: 7
> -

Keep the blank line between DT properties

> +          minItems: 5
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> -            - port@3
>  
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

blank line

> +        clock-names:
> +          minItems: 5

blank line, and so on.

> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +        interrupts:
> +          items:
> +            - description: vop system interrupt, such as axi bus error
> +            - description: interrupts for video port0, such as vsync, dsp_hold.
> +            - description: interrupts for video port1, such as vsync, dsp_hold.
> +            - description: interrupts for video port2, such as vsync, dsp_hold.

These descriptions belong at the top level.

> +        interrupt-names:
> +          items:
> +            - const: vop-sys
> +            - const: vop-vp0
> +            - const: vop-vp1
> +            - const: vop-vp2

Why are these names defined twice?

You just need 'minItems: 4' in both of these.

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

How is there no long a case without these properties?

> -
>          clocks:
> -          maxItems: 5
> +          minItems: 7
>          clock-names:
> -          maxItems: 5
> -
> +          minItems: 7
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> +            - port@3
> +      required:
> +        - rockchip,grf
> +        - rockchip,vo1-grf
> +        - rockchip,vop-grf
> +        - rockchip,pmu
>  
>  additionalProperties: false
>  
> -- 
> 2.34.1
> 

