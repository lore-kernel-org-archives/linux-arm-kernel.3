Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5CAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4OD+OhEPLHSlUeAU7DnSyKVEuB90w0zojxGmIz4pq0=; b=RGeOG0darHa2uWNHYigOM84pL0
	CEVRdnRQ/yIiSb2fTx0M4FrQsGbk5K4gvO5KRzS5nEQNF0Uc1f6pMJe0emX6iIzc0kUazIuYrovj/
	UpYO7SNes763LHpY1r+9r5ruZjUX9o7n6k+Bt47cUN6b/yIVfiTA4V/G5nv194Py8DbJmrnK7y9QC
	m3lam3M0C40t/yChAslJjLbS/3Jmo62E3ypflEIJnw8azho7Kd9IsDM9+R+OiVOnu1jMjdJPG08V4
	HPIbOOC+NPjOFkOUQSrGVymzAh7/wCC7hz/3N6h5thT9FsmQGVAH3YoVKgzBWzsyexIqbPbXbkC8Z
	VTR2BJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdT7-00000002dUB-1ZZK;
	Mon, 24 Mar 2025 08:47:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdRM-00000002dEx-1Tr7;
	Mon, 24 Mar 2025 08:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB07F4384D;
	Mon, 24 Mar 2025 08:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DC8C4CEDD;
	Mon, 24 Mar 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742805947;
	bh=My3iW3rQTVfHmWaiaXBjl0AqO8eaZeyr5K3v+jogMwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m23E7Swc3Q6IX3VQrsQq4knOxscSc5QpOFtZ2VF/UvbAZOfdos4/gk8U+FUyF0VcQ
	 h4mmvs44GI80VAM6JsHSbN4wb82izFA0vTkrKBwSsq/KuPgbF+vxBYka1ZD+UiN7XA
	 91KeVY8qL3V9iH0P67xZbSp/VkXwOIJSbmIbx8K8aBuVSDC75x7MCQS2v4vfY6vCcn
	 N2k14OMys6gTKMuUydqJclmb5R8DCSR2JAYE65mvU3x+Ozd4hUVzT5dtfnjYhA70Lv
	 T0pJJn93/P14Vsx70udZPNdd7MRXteSVJGEga6RqGWB3U2moP51+sl7B4W+7WJq3NP
	 ZzTxEBIsk8WZA==
Date: Mon, 24 Mar 2025 09:45:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: phy: add exynos2200 eusb2 phy
 support
Message-ID: <20250324-important-kangaroo-of-prowess-0d2c30@krzk-bin>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_014548_428381_B098C9F5 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, Mar 21, 2025 at 03:58:45PM +0200, Ivaylo Ivanov wrote:
>  description:
> -  eUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +  eUSB2 controller supports LS/FS/HS usb connectivity.
>  
>  properties:
>    compatible:
> @@ -23,6 +23,7 @@ properties:
>                - qcom,x1e80100-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy
>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: samsung,exynos2200-snps-eusb2-phy

These two entries is just an enum.

>  
>    reg:
>      maxItems: 1
> @@ -31,12 +32,12 @@ properties:
>      const: 0
>  
>    clocks:
> -    items:
> -      - description: ref
> +    minItems: 1
> +    maxItems: 3

I am still not conviced that creating one schema for these devices
brings benefits. If this is going to be one binding, then keep the list
here with three items and add minItems, so the list is the same for all
variants.

>  
>    clock-names:
> -    items:
> -      - const: ref
> +    minItems: 1
> +    maxItems: 3

Keep the list here with three items and add minItems.


>  
>    resets:
>      maxItems: 1
> @@ -62,7 +63,52 @@ required:
>    - clock-names
>    - vdd-supply
>    - vdda12-supply
> -  - resets
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1

Not much improved, my comment is still valid.


> +
> +        clocks:
> +          items:
> +            - description: ref

maxItems: 1

> +
> +        clock-names:
> +          items:
> +            - const: ref

maxItems: 1

> +
> +      required:
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos2200-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +

Drop blank line.

and the clocks get here minItems: 3

Best regards,
Krzysztof


