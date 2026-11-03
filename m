Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hAkGzAGu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xkl1z5GF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qQLHpmsRNMu4pGQ7TUF0TsUadlNWD5NyYDTXP525YNs=; b=hAkGzAGuU089b0MpdSYBPFOX83
	3mnuC9B3WnxaLOQl+EyUK0tBM0ysO08WdaWuaXWBh2VUtp0f6CEXSCU8VaYRFffZVV1OG7AK8icZh
	Kwb7wcXY7y0NZ2P1eDV1xAhUGSqbRWNmn0npZI0P2NL4Jw5wv9UA7Q0sdjb4mYKV0p9w7A4aAZq9V
	4zoJTbiI0q85FadVactWca/2/7t2u6OXr8XudYhNY3Gt79yu4Zp9pJB4OAE0GOOdf8acxnvTN5quw
	bNIZqVG9QI6V5YVkXeAVYOteMYBsifVMx2/MBuVSBj3K3db7oQAs0JMY9AovM1uU0vqRYqwdyVZpD
	hNrsVlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCy1-00000002Fqk-0OpG;
	Tue, 03 Nov 2026 11:46:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCxz-00000002FqT-3nE5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:46:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C47E43A64;
	Tue,  3 Nov 2026 11:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23891F00A1C;
	Tue,  3 Nov 2026 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706375;
	bh=qQLHpmsRNMu4pGQ7TUF0TsUadlNWD5NyYDTXP525YNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xkl1z5GFh4pKn1TYNw3OoNJiPltUB9eGDOMkZhcxVY/Zt2ToX2fVtIzc5Z63ZPr2q
	 pVz1szeeWaRZdU3Gv4jb6TVgKHi+/STjG/II3sOkY0IL/ga2/NBiJrjvIDwWD6Tm8t
	 4jtHeopZ+IEKKUB2yCzP5UNERZQQz/EhwHfsl7t3cu1Pk57nR6HNgdkfary79Higrv
	 hkfzH6ilDVckEmmtQ9r/pHlHOX6sDO3NUDHrGKdXep2FnTJS4MLivH1Qcp4CcWeT8m
	 x78qVOJCxw3wD4/FHB+W6xNMrWAK3/6jb3bVmSjv9Psix11grsGMpy93cJtP5zzDSd
	 CthwY/XvYedMw==
Date: Tue, 3 Nov 2026 12:46:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Agner <stefan@agner.ch>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <20261103-venomous-hyena-of-fortitude-063eae@quoll>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
 <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
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

On Tue, Nov 03, 2026 at 07:44:05AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The VF610 controller has no gateable clocks,
> so keep clocks optional there.

Same second comment.

> 
> Describe the clock items with minItems/maxItems, require exactly two
> clocks for i.MX7ULP, and require exactly one "gpio" clock for the
> i.MX8ULP family.

Drop sentence, redundant.

> 
> Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index a31f64b6d40b..822fa11d18d9 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -57,11 +57,13 @@ properties:
>      maxItems: 32
>  
>    clocks:
> +    minItems: 1
>      items:
>        - description: SoC GPIO clock
>        - description: SoC PORT clock
>  
>    clock-names:
> +    minItems: 1
>      items:
>        - const: gpio
>        - const: port
> @@ -116,6 +118,36 @@ allOf:
>          reg:
>            items:
>              - description: GPIO register base address
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx7ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

So you ignore not only my feedback... Good to know, the more the
merrier.

Best regards,
Krzysztof


