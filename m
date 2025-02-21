Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00788C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e89lSwTU5R7NX0OojyWzr1pfCJiN4kVJIBrsYpnzC1U=; b=COcjNE8C+vVtAZTo4Ap10j6ioD
	A1w0nwm/Bd9NOQYkdnIsQp2l1gCqos5nKECodoERwW71/nASnxCawjj6BdkaZIeHU8St4WTuM6C7Q
	32ZKNoN84/o0hs8/C03CL5jejjp38oGHZYbaf7zusqpBv8stNnUb/j/ENXsDLmH3dpvkF6ZJ476pP
	acVktZPiZPU7bFYPfsH1jO2o8Ekv0yR56VjHfZVKYCbp3p+7Cf+OB6x+rzq9LZFLs8KAPtF5ErAqe
	lL8sSyzEHRMmvNQun+8G/cqP1xpGKIKZtDv6610zdsbzO2gj+I7hM4dlp+3Bc8BzjUwWdx7juVc/6
	ptQXXZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaH9-00000006spS-48vy;
	Fri, 21 Feb 2025 21:09:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaFg-00000006sgi-1dwE;
	Fri, 21 Feb 2025 21:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98AD75C6DAB;
	Fri, 21 Feb 2025 21:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D880C4CED6;
	Fri, 21 Feb 2025 21:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740172083;
	bh=OkPgP7EaLg3zzaugexfyoWlImQLRS4upEXuczawslTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjP/evoV2VwHrbmdUraWzGUzMnMW5rkxuTFNQ3Pygm6Ghc8onscQK5Ik95eaGIK0j
	 6eFoTozzzHYhdc0BAbqPQifxZnALbSMJh+itz7obQhyAahrR/19gGay6wGlvPi1mLz
	 3RamjjbXdsSaOIGbKyKvoGMWHP53AkeO4mhUNe1eS5KWfGMWgVAs94tdwb2Icv86de
	 0IuYHY5s/pOjmQf4AW+seWUqoQudHe3Wb2s4OZX1FcjF3l9X1Yp05dPq0gRqMfG7ad
	 qSDruJWsmdaBt+f/5oVUMapdPqg7BQzE8rMWmoKxwwdTHBJdw7YXXtuKAYueompzQe
	 iIlBJTKh+kzCg==
Date: Fri, 21 Feb 2025 15:08:01 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: Add support for
 Amlogic A4 and A5 SoCs
Message-ID: <20250221210801.GA81340-robh@kernel.org>
References: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
 <20250219-irqchip-gpio-a4-a5-v1-1-3c8e44ae42df@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-irqchip-gpio-a4-a5-v1-1-3c8e44ae42df@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_130804_482376_831C441D 
X-CRM114-Status: GOOD (  16.07  )
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

On Wed, Feb 19, 2025 at 03:29:03PM +0800, Xianwei Zhao wrote:
> Update dt-binding document for GPIO interrupt controller
> of Amlogic A4 and A5 SoCs
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml       | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> index a93744763787..03548ee695bd 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> @@ -35,6 +35,9 @@ properties:
>                - amlogic,meson-sm1-gpio-intc
>                - amlogic,meson-a1-gpio-intc
>                - amlogic,meson-s4-gpio-intc
> +              - amlogic,a4-gpio-intc
> +              - amlogic,a4-gpio-ao-intc
> +              - amlogic,a5-gpio-intc
>                - amlogic,c3-gpio-intc
>                - amlogic,t7-gpio-intc
>            - const: amlogic,meson-gpio-intc
> @@ -49,7 +52,7 @@ properties:
>  
>    amlogic,channel-interrupts:
>      description: Array with the upstream hwirq numbers
> -    minItems: 8
> +    minItems: 2

There should be an if/then schema that retains 8 as the minimum for the 
existing cases.

>      maxItems: 12
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>  
> 
> -- 
> 2.37.1
> 

