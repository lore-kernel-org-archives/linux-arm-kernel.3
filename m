Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0542CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3E6EVCmTXhkNsJvUIsr03dWxu7jo0Km6AmP2s8D1UE=; b=qFMMSRJ4+KYa50VQIjdym73IJk
	8giumKLxZZ3/NxMUWyXRlUOU+F9Yps/PNdgpMsxvEl1gjQeuJFGa8lWrR2twq0NhPvOhI6B/DVW2O
	gmKKxio5XZBpARAcFBJz1MX06yzRXA/0ophyOQipH1wAIPquHrq/udtHgcNQ9LSFEzIy+nuSga/nj
	uXtl4Q+q6/Y7l2KvbQ+NRlh8XPUJmM7oOuEUfCLCSXdhnThqOThvSK/7xS/wSUFXLGHUrOwh3z+uA
	Kft8hX4EO78AhKVZi+jqbxqekGJMIMOY6Rl9dQYR0rOB65HH06Y5ZWQh9814T4URloVrnXgPXswlo
	xld2dF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrKd-00000009YH6-3VVa;
	Mon, 03 Nov 2025 09:58:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrKc-00000009YGu-05MH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:58:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0741760007;
	Mon,  3 Nov 2025 09:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2284CC4CEE7;
	Mon,  3 Nov 2025 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762163912;
	bh=AQVt53EcUhGtycvRvdbhIy9l4ZVj1BQDK1Eh3TQzU3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdTyXk64a6SoBF2/pJUMVlz5jU5aR1tzVMqXCULhfRj4pIkOvFOf6FIp+Ztipbk37
	 KceYPFct5Ya2Kr/NdS+C/NlBh8/5uvfFmh/skUwiiLLZHxvtaE8XEBITkduTZjiqxy
	 FwVsyV5BGaAFbsuJc08/jCym+PZLc5KVtgQrsSseXLgxRmvKcEn9Vx1YEdA/jZdY1A
	 RP64pPjO6lJfT3PZJANA13sTylaYqnIgJa4D+YlLvKrkrHF6q3FcRmG0VWT013FYEf
	 tigiuqxVdb4JSkLftXkezpKX6Snt1DXr9Cud3xLuGWk4Nqo0jZtCarQkDMX9fCiwxX
	 y27WIfxuUYpqg==
Date: Mon, 3 Nov 2025 10:58:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: hwinfo: samsung,exynos-chipid: add
 google,gs101 compatible
Message-ID: <20251103-economic-tuscan-mink-0ebfa1@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-1-d78d1076b210@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-1-d78d1076b210@linaro.org>
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

On Fri, Oct 31, 2025 at 12:56:00PM +0000, Tudor Ambarus wrote:
> Google GS101 Chip ID references the nvmem cells from the OTP controller,
> it doesn't need a reg space. Add the google,gs101-chipid compatible.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/hwinfo/samsung,exynos-chipid.yaml     | 51 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> index b9cdfe52b62ff3a365d61368c39db21facff6565..6d6260be02d47712ebf1e4d31973802e8340cdfe 100644
> --- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> +++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> @@ -33,6 +33,16 @@ properties:
>                - samsung,exynosautov9-chipid
>                - samsung,exynosautov920-chipid
>            - const: samsung,exynos850-chipid
> +      - items:
> +          - const: google,gs101-chipid

That's a part of first enum at the beginning.

> +
> +  nvmem-cells:
> +    maxItems: 2
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: product-id
> +      - const: chip-id
>  
>    reg:
>      maxItems: 1
> @@ -47,7 +57,46 @@ properties:
>  
>  required:
>    - compatible
> -  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            oneOf:

No, don't copy. It's just redundant. Just like the fallbacks under one
enum.

> +              - enum:
> +                  - samsung,exynos4210-chipid
> +                  - samsung,exynos850-chipid
> +              - items:
> +                  - enum:
> +                      - samsung,exynos5433-chipid
> +                      - samsung,exynos7-chipid
> +                      - samsung,exynos7870-chipid
> +                      - samsung,exynos8890-chipid
> +                  - const: samsung,exynos4210-chipid
> +              - items:
> +                  - enum:
> +                      - samsung,exynos2200-chipid
> +                      - samsung,exynos7885-chipid
> +                      - samsung,exynos8895-chipid
> +                      - samsung,exynos9610-chipid
> +                      - samsung,exynos9810-chipid
> +                      - samsung,exynos990-chipid
> +                      - samsung,exynosautov9-chipid
> +                      - samsung,exynosautov920-chipid
> +                  - const: samsung,exynos850-chipid
> +    then:

properties:
  nvmem-cells: false
  same for names

> +      required:
> +        - reg
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-chipid
> +    then:

reg: false, similarly.

> +      required:
> +        - nvmem-cells
> +        - nvmem-cell-names
>  
>  additionalProperties: false
>  
> 
> -- 
> 2.51.1.930.gacf6e81ea2-goog
> 

