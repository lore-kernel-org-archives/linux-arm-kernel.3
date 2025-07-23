Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083D9C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 05:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nN/wgLWV4/6RbrG4hZ9RMePW8FkpeBVdEvCLb+GB1Y=; b=SW/kx0Dgji9+GIgHOzmnp3uCYw
	Hs8P9GzYi/n3t/7pJLG+uTcG986sqyF1eqvqbVG+FAUDgeOUiDITHHYs0WEM4pMFlxmP80HZZQNsK
	Zk4AgizXHSXrYGgmtY+EOjFCmlP6i91k8RorV6L+FlFS1MaRYbzmk8TLOHQUEtr305Sti/xlGrfb8
	a19CN6iyhXlTnXxZVth7N9Sc4GoLPalA6hCX+07mQ1vfpDwTU8LrKisWDc4VMjpftB29Ey65306bw
	R2p92cyZEMkeue0xhHv1Med0F1Cg96ovD5esea89UjUFmQX7GaSDnFgkPfM1HmQwKtjXkbihfcyqg
	nR+lTShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRib-000000042CM-3NG6;
	Wed, 23 Jul 2025 05:08:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRdR-000000041sS-1LDK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 05:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 832C8A52920;
	Wed, 23 Jul 2025 05:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA37BC4CEE7;
	Wed, 23 Jul 2025 05:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753247000;
	bh=sGUgLIaP/Z0tvkzXFj01jJ3wxnd0SZ2j65uyOh60nU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFgEIPu6EtnEWZfeCcl7APZas9ZV/jC40tp36n3EIp3UKg9u+eUDU/r7QPtMC6P4Q
	 VQYwQyS/i9wKs4m6/WTcYuqrB42CNH3M1FmZ60WeahCovItnFKxozFtfertYHnbUac
	 1lwlt44WaPTjHODh4/7ulZngjKNdV9IHvk7YzJ2a2DisyqywDmCHxM7+RXX2DV9Kvf
	 eJdR7nLSOJbVCxJBS/E2+JMbiRVYS1KYhotkq+MFsBlK6p6BvbWdez+EGizC2tUBry
	 fZE1OD8tADJ7hVdTk4vrrU/XxuL0AJT1jfF/IN1ljbMDcB1sJfPJT8xROh9fWCRdQk
	 uv6LtbP0pa0MA==
Date: Wed, 23 Jul 2025 00:03:19 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
 fsl,glitch-threshold
Message-ID: <20250723050319.GA1239529-robh@kernel.org>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_220321_424731_8A7B5A57 
X-CRM114-Status: GOOD (  17.12  )
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

On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> Add support for glitch threshold configuration. A detected signal is valid
> only if it lasts longer than the set threshold; otherwise, it is regarded
> as a glitch.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> index 678756ad0f92..2fee2940213f 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> @@ -62,6 +62,23 @@ properties:
>      description: Number of data samples which are averaged for each read.
>      enum: [ 1, 4, 8, 16, 32 ]
>  
> +  fsl,glitch-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    enum: [ 0, 1, 2, 3 ]
> +    description: |
> +      Indicates the glitch threshold. The threshold is defined by number
> +      of clock cycles. A detect signal is only valid if it is exist longer
> +      than threshold; otherwise, it is regarded as a glitch.
> +      0: Normal function: 8191 clock cycles
> +         Low power mode: 9 clock cycles
> +      1: Normal function: 4095 clock cycles
> +         Low power mode: 7 clock cycles
> +      2: Normal function: 2047 clock cycles
> +         Low power mode: 5 clock cycles
> +      3: Normal function: 1023 clock cycles
> +         Low power mode: 3 clock cycles

Don't we have common properties for this expressed in time? Debounce 
time IIRC.

> +
>  required:
>    - compatible
>    - reg
> @@ -94,4 +111,5 @@ examples:
>          measure-delay-time = <0xfff>;
>          pre-charge-time = <0xffff>;
>          touchscreen-average-samples = <32>;
> +        fsl,glitch-threshold = <2>;
>      };
> -- 
> 2.43.0
> 

