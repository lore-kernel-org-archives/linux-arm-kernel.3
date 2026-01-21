Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456FDD262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xv3xSS/bdGOprgZ1T80+vXW0tSiJgpNOTTOrjvC+KbQ=; b=ONtszbAj5MquAUFKHaagg++OIr
	cBbep4Jes65pMZv137ZfKM2WWqdCF2kqeslJ9KuA++346dU6icI56+XhgAI5W5RYZ5FeOLnmX0nN4
	qwk+2ZQ7bhVsw05BDTfm6TzD0NkR77dEXmFqBe6rSQQUUjeX9KhGJHY6u3iLXICIXfrtpfcXqV4D7
	ZE+OKUbmnod7krva7fLZGPi6A/cX1xbhsO7qk9BDop1XabA0oVOrzdwJf/63ydv54gW/gvIkcYvWc
	E3lY3OQyf8yZLpfDySVb6qCgU6vIqXrnCQxumd8ojw0HitciyxKTrjVZsOHowtBc6tRA8BApTpmLt
	QFMTI9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTC6-000000053UG-0eDi;
	Wed, 21 Jan 2026 08:04:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTC3-000000053Th-3CJd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:04:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCC4540871;
	Wed, 21 Jan 2026 08:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E830C116D0;
	Wed, 21 Jan 2026 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982638;
	bh=PsqDsmtUvSMoAGPchw0ANb9blEgv2FuLIEh2Q6T95uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ1vmbG+beB2iwfhyj3XVTL2l++mCmI6l5ZmExwsa68lW58lTMGsTDs6Xs+ZkM6oy
	 Og7ixvumC6seNlVkVoEBb/17yi/LiSgNvXmuCkRw6rtwKL+atFAfvaPCNZpzLog7q1
	 YDFBy3X69Liig5y8ZQy8ResbG6BcbU21IVgsfcLmDSjvmI/cQ3g02sqjxZpguNdKjC
	 OndH9JSnSqgOMh7/uw7/5d3igi6NzPxuluvUmUkxQQJyoKVrpR35g3GbSaDGQzOiFx
	 ItIpu/Qn7FJrpCpj+xKt7Xbhlkgk2ODhP6QDdS1xSDJeyfhExvHl77ubmICS9ntTE+
	 0pCtHucBM4DcA==
Date: Wed, 21 Jan 2026 09:03:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode
 support on i.MX952
Message-ID: <20260121-careful-beige-iguana-c32bbd@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120035210.1593742-3-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_000359_819787_9A07AA33 
X-CRM114-Status: GOOD (  20.05  )
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

On Tue, Jan 20, 2026 at 11:52:08AM +0800, Shengjiu Wang wrote:
> The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
> i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
> this property present, then SAI driver will try to config the setting,

I am still not sure this is hardware static property. You say "can be
bypassed", so I imagine same board could have it bypassed or not,
depending on use case (so mixers).

> fsl,sai-amix-mode = <0> is bypass mode, fsl,sai-amix-mode = <1> is
> the AUDMIX mode.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> index d838ee0b61cb..7808c324eebc 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -133,6 +133,13 @@ properties:
>          - description: dataline mask for 'rx'
>          - description: dataline mask for 'tx'
>  
> +  fsl,sai-amix-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Anyway, string is more readable.

> +    description:
> +      The audmix module is bypassed from hardware or not.
> +      Bypass AUDMIX(0), AUDMIX mode(1)

Drop last sentence and use enum [ bypass, mode-1-whatever-this-means ]

> +    enum: [0, 1]

What is the default? What is the meaning of lack of this property?

> +
>    fsl,sai-mclk-direction-output:
>      description: SAI will output the SAI MCLK clock.
>      type: boolean
> @@ -180,6 +187,15 @@ allOf:
>        properties:
>          fsl,sai-synchronous-rx: false
>  
> +  - if:
> +      required:
> +        - fsl,sai-amix-mode
> +    then:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx952-sai

There is no such compatible.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 

