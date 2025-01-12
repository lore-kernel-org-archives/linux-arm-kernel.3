Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BB1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6PhE/fpqnmYTXOIoaPtaP9Kefnm2oilnXMATRpAp18=; b=1S2MqEvNEnPS6fvbjxztifqWf/
	wN54bDmWIK0wMS/BGE953iy26r6cer0VGKUBEkIn58MRJMT9DqRCScTmtY75bD93QBffMSjHoXJmB
	GJWIFe8ENFjygZhwokibC4x6UB70NRY0BGjCSf2VOYpOJJXMHDMR2pxhFwPPi6k8vcTDX91/Ixm4O
	A1DpErbORLFkbVYy1zVOlFctTA9QMoQTuVg6y7XX0nQtSwkbeeDq8fvFLB+ea0/fl+RVE/94kMg18
	Wjjrgrk3kKq6dj8tUWGQIhb6lEfT+B0IowpI3ikV9zpZjx7863ftMyB81xHY54LIt0VKTkxAIOyE9
	ElnY31Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWuGx-00000002QkL-1zre;
	Sun, 12 Jan 2025 09:28:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWuFf-00000002QZ5-47Fj;
	Sun, 12 Jan 2025 09:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2720EA40424;
	Sun, 12 Jan 2025 09:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDABFC4CEDF;
	Sun, 12 Jan 2025 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736674041;
	bh=S6+HEIIa0TC4zQcS76msgthENjx+/il9nhKI8WUIGnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8KOck9q7pVtgoxZwSX0Ry4lFmGJrIj2j3Kx4bWyBvNfbfxVO7P1Bys2jmtmkxR+o
	 lhpmVKVMSLIV5nH4EieAa+E4gOgfS5EI8juagsOISl4qKNKirtZUztlyfjv3nGGevy
	 6IzkucMxB/RXAIuaxgt4pAo/mLNCMrrVpDL3ApdToSC86iPfrakKAbopJeCr2eEKCP
	 SWYSw5Vt4TPR91g4EiahnMJCInNVU/qeg0K89dYJDtASqIXg2lC5W6A0bU4dEyxNzW
	 9IdXuw8tp0MVPazCpeCvmbCxucFGqTYPyo/Gj8g+l+VVNYFAbPFQt4dQhG12HkANmr
	 rxG1oNrzzIJ/A==
Date: Sun, 12 Jan 2025 10:27:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v11 10/11] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <i5mp7wrogfc7w3fbmvqgqxsbgcx4xnfnjik4rpd35amdwgppan@fistrhikrrmd>
References: <20250111112614.432247-1-andyshrk@163.com>
 <20250111112614.432247-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250111112614.432247-11-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_012724_158222_911970DD 
X-CRM114-Status: GOOD (  10.74  )
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

On Sat, Jan 11, 2025 at 07:26:08PM +0800, Andy Yan wrote:
>    # See compatible-specific constraints below.
>    clocks:
> @@ -120,43 +133,98 @@ allOf:
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

That's wrong, why maxItems became minItems? How is this related to rk3576?

> +
>          clock-names:
> -          minItems: 7
> +          minItems: 5

You are doing here way too much. You need to split reorganizing, so we
will see what comes new.

And of course you need to explain why you are changing EXISTING binding
(I am not talking about shuffling around - you change the binding).


> +
> +        interrupts:
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


Why minItems? Nothing in this patch makes sense for me. Neither changing
existing binding nor new binding for rk3576.

> +
> +        clock-names:
> +          minItems: 5
> +
> +        interrupts:
> +          minItems: 4
> +
> +        interrupt-names:
> +          minItems: 4
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

And again weird change to the binding.

Best regards,
Krzysztof


