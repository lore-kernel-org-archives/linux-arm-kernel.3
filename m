Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E734606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CdgUUJsb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzRbqro9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oCiDdG9uKBtwL1j/tc0kENtt1MdhR46jXVdAFzVfJO8=; b=CdgUUJsbYJwEy2Si8+fI17OnRl
	J95goq5P2ChFmgdSuAqCc+doYvpizWHBbdBBC8oZ9/u0nO0XfiSG6ghy2+54lkRM8ERaHELMDUnRP
	Bhp6CJtIgvG60n1/5JLyhBvK0jC0uGRMinyGcTJqguWTNb2TIURwZfQtOsgvrywpmVTmchpaCGnMl
	Av6QgryJiGYPwnMHjkW78tZkO3hNz5zhIueafHUDseJ/111b9Tai5vqRrkjLawhy6mXD/EmcDRXSf
	3gKvJlac3HuETfYS9q0UK2ZKgWHLZ78nz24+BG+mxyPVmRcdaUJw2RP3Nq0LDmA8NbDEZLUxQj374
	U/lbDExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH4q-0000000BuZS-1zEo;
	Fri, 06 Nov 2026 10:21:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH4m-0000000BuYj-2uKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:21:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 450E943D05;
	Fri,  6 Nov 2026 10:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FF91F008A5;
	Fri,  6 Nov 2026 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960500;
	bh=oCiDdG9uKBtwL1j/tc0kENtt1MdhR46jXVdAFzVfJO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WzRbqro9+jgKZCOnxyV5Qf2FXBVqSRiUdrte9IIL+inQw1Asb9j9CaLguI3Q0K8y/
	 Ps4Ef11TTWv9wmJkjrgZdyYBdXgrwh3FdgLXZF7EoT5g5ZYiPGk26tKrshMayt7jWa
	 Oq9Nsj3tZDxojVnZriW71FFEGOBOa6ghfEhNgn+dlN5qWdjLDBRiNi5UKKsUu0F8Lj
	 A7mTcOfayLNU0/TIYhQ7nh2+ldFWBZVPpG5p48rfVjHsG88Ezxd2YpvSKXfImwpg5U
	 sZ5dJOir4gQVYIKs2/ymgFvIoXa8P5MPenH/eVBeevZ7L2CmFphhPmcTAZ1kp/0lx8
	 Pu41zXcg4YKqA==
Date: Fri, 6 Nov 2026 11:21:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Message-ID: <20261106-tireless-cobra-of-passion-1fca1d@quoll>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 04:20:09PM +0100, Patrice Chotard wrote:
> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
> exposes its backup registers through an nvram child node described by
> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
> 
> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
> into the DTSI made "make dtbs_check" fail on every STM32MP TAMP node:
> 
>   tamp@5c00a000 (st,stm32-tamp): 'nvram@5c00a100', 'ranges' do not match
>   any of the regexes: '^pinctrl-[0-9]+$'
> 
> Allow the addressing properties and the nvram child, gated on the
> st,stm32-tamp compatible so the other syscon variants stay strict.
> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
> (an empty "ranges" requires the node to match its parent) while the
> other STM32MP SoCs use one.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 38 ++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b84..51cb565e05ed 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -43,13 +43,19 @@ properties:
>      const: 1
>  
>    "#size-cells":
> -    const: 1
> +    enum: [1, 2]
> +
> +  ranges: true

Addition of ranges should be separate commit, because you are fixing
existing device which can have phy child.

>  
>  patternProperties:
>    "^phy@2[48]00$":
>      type: object
>      $ref: /schemas/phy/st,stm32-usb2phy.yaml
>  
> +  "^nvram@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/nvmem/st,stm32-tamp-nvram.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -84,11 +90,37 @@ allOf:
>          - phy@2800
>      else:
>        properties:
> -        '#address-cells': false
>          '#clock-cells': false
> -        '#size-cells': false
>          phy@2400: false
>          phy@2800: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32-tamp
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges

This has ABI impact and is not really necessary, as the child node is
not required either. Drop these three.

> +    else:
> +      properties:
> +        ranges: false
> +      patternProperties:
> +        "^nvram@[0-9a-f]+$": false

Best regards,
Krzysztof


