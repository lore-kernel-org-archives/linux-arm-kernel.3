Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B081D6E2D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ej/d4nMJ9Jx+tWkMXMZRjfMLMLobRxDLUyBn5+eprxA=; b=LZ6/Ctq7NDZWUTm1Qc3yCwIw3X
	JS1P8vQuRMMI4Qr501A9SRiVEpXjXeS+d1sj7xvaBIHyGTwqykeCQGZcAR+hFsj7doe+agdx7Xnmn
	y13tkBrUnH/wQvb1kvPC4w7tjAx1bLQCRJuxw+4NwyFq3DsuIQrCe+J3BUGC2N+oNZImjHFEW8DaP
	HwoCv58dM7aWj0+GYImjqxRt/Z+HRDd39FkHEclcg0uYapphHyGmbIAmXVl2a6IXLiy6g2n1Hmb8A
	8G2jbJpoS2xlPOu44NNjZP/0PT4QFB646NwxIl73yKLA3Nar/G5EbmptzTSJUtuAo2nHLVKB4RDnB
	fxInKWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDg4I-0000000Ekfo-3agq;
	Wed, 20 Nov 2024 08:28:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDg3M-0000000EkRd-1mFM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29184A41DD0;
	Wed, 20 Nov 2024 08:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A8CC4CECD;
	Wed, 20 Nov 2024 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732091231;
	bh=tEs7YJheOg0akvlILu5xk9FyaMQ6VUNo0eHv9oq3w4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXUEDCpmmpMU+pYHL5B2xnvX8L+ZLDO78IR5GrI80GSCqnU0A7IAIyd8GLm58asmY
	 b9kjn2BxnvYtCv4oKmU4ySEQFHrDSZ04K633yrqh7O6y40D0Av8GlM8OwFGrKAw+ZP
	 cSivLMggDdz2C6DvQLriGKk3dAdUQYnEY8d2XvYAhugJHB3KyDYCHH5QF0DScC2ZF6
	 8Ar5KEJ4ZD8VhFq1RoSN/VnBUY+/bVvv2nOmPT1vRCP4Og0sjj+Zt1WxC1xnsjsc6X
	 bp33MQusXdO7wlDnNSN4J3B88wdCrgTcJQjBQAgPghOlGlvU4fHqSDizT9kcLMvWjB
	 DdAoYIcyVpuOQ==
Date: Wed, 20 Nov 2024 09:27:08 +0100
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
Subject: Re: [PATCH v2 03/21] dt-bindings: gpu: img: Power domain details
Message-ID: <756y5ahz6oko32uqymdc4umdzl747gi6gpei6cjdotix5mkofp@q6cxo2ldt5dh>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45d9fb0cf@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45d9fb0cf@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_002712_592133_C1D56F0D 
X-CRM114-Status: GOOD (  18.33  )
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

On Mon, Nov 18, 2024 at 01:01:55PM +0000, Matt Coster wrote:
> The single existing GPU (AXE-1-16M) only requires a single power domain.
> Subsequent patches will add support for BXS-4-64 MC1, which has two power
> domains. Add infrastructure now to allow for this.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v2:
> - Simplified power-domains constraints P3
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 25 ++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 3b5a5b966585ac29ad104c7aef19881eca73ce80..c629f54c86c441b4cc9e57925f1d65129cbe285b 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -43,8 +43,15 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  power-domains:
> -    maxItems: 1
> +  power-domains: true

NAK for the same reasons.

> +
> +  power-domain-names:
> +    oneOf:
> +      - items:
> +          - const: a
> +      - items:
> +          - const: a
> +          - const: b

No, list items and use minItems.

But what's more: there is no user of it. Sorry, that's a no go. You
probably organized patches incorrectly, but this on its own is just
incorrect.


>  
>  required:
>    - compatible
> @@ -52,10 +59,23 @@ required:
>    - clocks
>    - clock-names
>    - interrupts
> +  - power-domains
> +  - power-domain-names

That's an ABI break. Explain in commit msg why and its impact on users.

>  
>  additionalProperties: false
>  
>  allOf:
> +  # Cores with a single power domain
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:

No, drop.

Best regards,
Krzysztof


