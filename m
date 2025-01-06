Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3C0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 06:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A7cjE5KieuwsyKrWIyaoe2XMFGTaOOLgYeYGjgwSE0=; b=K5/iVX2/8f/YKltmiNC+scJGS/
	rw0q8dbzYEBcGbBc2bkA+w72lUUgLYrzppx6Gu3vJQF5rGLtqbm5hsLidykyheke97sedmRXZ/2Lq
	ndWklxS6ec5MMOcT+6qV8Sm/Tixazq34ajDfCcZuGhbneFJhtn70A1u5udUxEzmEwnSjGRkckmmob
	ic5noymTPhsBLNcbMDk90D5aiVrLWl9l014YUWk1MzQIEXpqwnhM7YR40SQCrEiwTvWoYzZtqIeUt
	D9Td71EQ5u7zPWTtMYv9RVRElcIHva9hNoQD2asUdL+cCo3ohJYTYYIZh/0Zny/S6zV8B1BXnKCy4
	MgyDkgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgfi-00000000Iux-124C;
	Mon, 06 Jan 2025 06:33:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgeW-00000000Ipz-3Hpc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 06:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D960C5C4967;
	Mon,  6 Jan 2025 06:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7EAC4CED2;
	Mon,  6 Jan 2025 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736145111;
	bh=ReehICcFsuYHM6emN6qSRF1/JQg8rc/eMPB/Mcew+p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPk757BfT18qzAm5sUY/+AtFy9GvFHRukbmAW/H5b5LiaLElXOYwwCIG98qwTfZSw
	 5+KkXNfo9wu0WKjNkL+U2/TNKmvcH1yObs9UTGpqMtZ2mMFrg7otJ+oafBwd/pOqVA
	 8+YbOdJ1cYb29Y+jq4LagQYZQ3go6VRkMgipryyHTsTDffUKtou8nrG6rwnzFvBY7e
	 fBUMPZqGklvovRaSAIlN+7g8Eyw5s48s7WnbmPftTsTTRFPgkUJoZgQLeFWvNRPAW8
	 ErqOy/TZAQQ0wKDVlt31tNM2xVTje0DRW81iQ1o6a0x/2IiROIi844i2u1NoxofowX
	 ErWB/e03oPT3A==
Date: Mon, 6 Jan 2025 07:31:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <kgcgxhfwxdrja6djiv45f45pqwbtwnd2bw63xcsyo2msewkzfr@qypxgl2a7gyg>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_223152_912723_6C419CC8 
X-CRM114-Status: GOOD (  11.60  )
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

On Sun, Jan 05, 2025 at 06:03:44PM +0200, Ivaylo Ivanov wrote:
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0, 1, 2, 3]
> +    enum: [0, 1, 2, 3, 4, 5, 6]
>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
> @@ -101,37 +111,62 @@ required:
>    - samsung,sysreg
>    - samsung,mode
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - samsung,exynos850-usi
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-usi
> +              - samsung,exynos850-usi
> +              - samsung,exynosautov9-usi
> +              - samsung,exynosautov920-usi

I made mistake during last review - the binding had a confusing "else"
here, but that else was a no-op. All existing compatibles are fallbacked
to samsung,exynos850-usi, so previous code "contains: enum:
samsung,exynos850-usi" was covering everything.

You can drop other variants and keep the original samsung,exynos850-usi
only.

> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        clocks:
> +          items:
> +            - description: Bus (APB) clock
> +            - description: Operating clock for UART/SPI/I2C protocol
> +
> +        clock-names:
> +          maxItems: 2
> +
> +        samsung,mode:
> +          enum: [0, 1, 2, 3]
> +
> +      required:
> +        - reg
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos8895-usi

I don't see where this compatible is documented.

> +
> +    then:
> +      properties:
> +        reg: false
> +
> +        clocks:
> +          items:
> +            - description: Bus (APB) clock
> +            - description: Operating clock for UART/SPI protocol

Best regards,
Krzysztof


