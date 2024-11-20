Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3FFD6E2D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEfPtkEKJuXggR/KERhjH5OU2nzKGXLOKKuAQxhX9cM=; b=0W7SBu5+aD8mTUvO5wcsrss4ds
	/uzoTMOuV7l0cEc5h9xGDB5Nr1ATxvQhwfyU6wcHcDYB5iicuAFCWUJml4mJaY1scbEkjamBpIbc3
	QlQbhe5q5hOqnDNKFub4M0yMgKwm2vNi4guE3j+nWHnEW8WdOFryi49zzOl3bRt+1QQoQYxOtwMLG
	6JZ9lOvjB++63SRUvMkXzFAwvHVUdohAmEssHUZGkiL+6sxPa/4W0iMcJD3v7ZBTdsLQhbRYRCV1Y
	UWlRNbrSq03NiGBGC6tjgdJW+OJcNBV/EeYOtyRAUsT93GJixYc/uPn+MHTZCKoeaRa62ko23rFy+
	JFAwfSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDg67-0000000El0i-0dOg;
	Wed, 20 Nov 2024 08:30:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDg55-0000000EkpI-0v9q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12C51A41DD0;
	Wed, 20 Nov 2024 08:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35851C4CECD;
	Wed, 20 Nov 2024 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732091338;
	bh=r5LJKMh22+WU9zlQmk8oS8zbTaFxi6bJT9D41aUjabE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObZu/x8cTiiCQ4uqMKDf8ML2Grv1dygO0z0nUV6xGSv4CMHxYvsSXb+2EFsBETV+G
	 FaGn6ZOeJrnlqxCzNBCUHWS8cOIGbHBM8fL6I0sMPB7eUbNft3TOnAxkY3fxFSupAw
	 J+ivIPke741EE6xaoP6O9r8F3kUjiGamyl73MLjbd3+Sskmy9hs2l89lT83t+xVPz3
	 8B86Wg3oI6XSPJl0I8/lfOjJmvY0xXU9DdK/UzvH75IzeDwBplqzw7Gz/89+5v+3p0
	 RKbD7dN8nSBukFimzgS/D0m8fVMucJQBKlu+9lbhfFak6N9t74tporu/FT5z2DYMh7
	 1ZGOGoq3ikZfQ==
Date: Wed, 20 Nov 2024 09:28:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH v2 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <jgabneyvumignjvgy3l7bmjccyxradhl4fguocrynymn5ii7uh@zpdvdsizpm3c>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_002859_381641_4E176E14 
X-CRM114-Status: GOOD (  17.21  )
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

On Mon, Nov 18, 2024 at 01:02:00PM +0000, Matt Coster wrote:
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v2:
> - Use normal reg syntax for 64-bit values
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 9dc55a6d0d4023983a3fc480340351f3fa974ce5..b620baa56a4caa41246f7b53064d0e3309bdda8e 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -18,6 +18,11 @@ properties:
>                - ti,am62-gpu
>            - const: img,img-axe-1-16m
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - ti,j721s2-gpu
> +          - const: img,img-bxs-4-64
> +          - const: img,img-rogue
>  
>        # This legacy combination of compatible strings was introduced early on before the more
>        # specific GPU identifiers were used. Keep it around here for compatibility, but never use
> @@ -78,6 +83,18 @@ allOf:
>        properties:
>          power-domains:
>            maxItems: 1
> +  # Cores with two power domains
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:

Nope

> +              - const: img,img-bxs-4-64
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2
> +          maxItems: 2

You need to constrain power-domain-names. Same for other variants.


>    # Vendor integrations using a single clock domain
>    - if:
>        properties:
> @@ -85,6 +102,7 @@ allOf:
>            contains:
>              anyOf:
>                - const: ti,am62-gpu
> +              - const: ti,j721s2-gpu
>      then:
>        properties:
>          clocks:
> @@ -105,3 +123,26 @@ examples:
>          power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
>          power-domain-names = "a";
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>

Drop. No difference in this example.

Best regards,
Krzysztof


