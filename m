Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4D6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVca6DjuCokch3g6UOaoMbLExoSfhGwO0o61/t9JK4M=; b=jhgiz8W21XubpjetWWLUN/SHXi
	0RtBNGF4csji6ZAsrVsJCW/umyzg9pWqLeJQvZqt9pGOIe7uSuICPhREXDlSdTxoENn1NxFCR3Wk2
	051hGBeEWXopTsLcg23CqMiNGO/E0+AxeGa9vXKtPSPWps9nSmtDtoq0czyVcEUbdSUnGpPmRp58u
	tahvrgT/CXo4C4BVjuJTK4A9UxG4XDHekTMztSxjpQGhwbmzT53phBFvn08+eN39qP2E4Ia2e5pMR
	Z4S7nfwoVVSIOiFS1d3eiAScXhqhdnjdteg5qHDXkTbBMEEl9zaDLwQSFGMpA69przlIu6JWHxW43
	c5OaaA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMnl-0000000GatY-0Ie0;
	Sun, 05 Jan 2025 09:20:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMmY-0000000GamX-3k5C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCF1C5C58BB;
	Sun,  5 Jan 2025 09:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974DBC4CED0;
	Sun,  5 Jan 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736068729;
	bh=TdK3l02Mvjr7icEQxVdmSFVx/esDQGcdPzwQMMKF92s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZdqrsbdCuBt4PpJLGpaR7sak3pbZVAI6sMXUvzR7TrGeH6fymOz2KgZBqS35eOhfj
	 fbv/Z5Z5UzeSM7I8KU6pn2tq7FNXNdQE/kiSmE4VUwXouM155IbUomDi287qVf7kh/
	 6erXeZ+8NnrIWdqC3CVQvo7TkWNAsQTvQw9HLomFFykYNNhKz6QqYjo9ZYd7PQE4Lh
	 VHUlwvzeJ4M+Ch9PAPnuIX5wpWGIett2FLz5vcWMxcjdG9sofSThbTvtxe1eUC7bIu
	 boImhCVACu6v/XLEsE2wSwMhLm3PiZNfOfJrtD3O60QXTfepe3MskBj/D4Hy9uXyXp
	 R48I2CPpNXoww==
Date: Sun, 5 Jan 2025 10:18:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <nk7rifc5mcsdlmgpncrpoumerajrpdekxpvqwwe2hz4b63rgci@flowtxwchm7y>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_011851_022396_12A7CE45 
X-CRM114-Status: GOOD (  14.12  )
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

On Sat, Jan 04, 2025 at 06:29:14PM +0200, Ivaylo Ivanov wrote:
>  
>    reg:
>      maxItems: 1
> @@ -64,7 +75,6 @@ properties:
>  
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0, 1, 2, 3]

Widest constraints stay here, so minimum/maximum.

>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
> @@ -101,18 +111,42 @@ required:
>    - samsung,sysreg
>    - samsung,mode
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos850-usi
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        samsung,mode:
> +          enum: [0, 1, 2, 3]
> +
> +      required:
> +        - reg
> +
> +    else:
> +      properties:
> +        reg: false
> +        samsung,clkreq-on: false
> +
> +        samsung,mode:
> +          enum: [4, 5, 6, 7, 8, 9, 10]

Is it really true? Previously for example GS101 had values 0-3, now you
claim has values 4-10, so an ABI change without explanation.

> +
>  if:

Missing allOf:

>    properties:
>      compatible:
>        contains:
>          enum:
>            - samsung,exynos850-usi
> +          - samsung,exynos8895-usi

Effect is not readable and not correct. You have two if:then:else.
Usually it is easier to just have separate if: for each group of
variants and define/constrain complete for such group within its if:.

>  
>  then:
>    properties:
> -    reg:
> -      maxItems: 1
> -
>      clocks:
>        items:
>          - description: Bus (APB) clock
> @@ -122,16 +156,13 @@ then:
>        maxItems: 2
>  
>    required:
> -    - reg
>      - clocks
>      - clock-names
>  
>  else:
>    properties:
> -    reg: false
>      clocks: false
>      clock-names: false
> -    samsung,clkreq-on: false
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
> index a01af169d..4c077c9a8 100644
> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
> @@ -13,5 +13,12 @@
>  #define USI_V2_UART		1
>  #define USI_V2_SPI		2
>  #define USI_V2_I2C		3
> +#define USI_V1_NONE		4

Drop, it is already there.

> +#define USI_V1_I2C0		5
> +#define USI_V1_I2C1		6
> +#define USI_V1_I2C0_1		7
> +#define USI_V1_SPI		8

Drop

> +#define USI_V1_UART		9

Drop

> +#define USI_V1_UART_I2C1	10


Best regards,
Krzysztof


