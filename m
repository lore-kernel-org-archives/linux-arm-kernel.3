Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222B4C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXJAoKuOzaSXieVdd1OyY5L7/X1+2blaPqmx6LTftp8=; b=se+HLBqieUex9zM3icRpEHMhmu
	VnLDxrOvLtT4p1C0nicpqAk8C0EkngAlmBQPE1cI7y/SXXzd95VvgPzjFWmnzp0n4fZuulIq3fO5S
	KXDFvu1QOgZvdV9PSN4DgngySeBQlo9PCv7C1BrBzYfY/vecAMBeCmQJ8F2H83fN6kzABMzUNvxEj
	whYSA1OkDGtOfsoZ8KcIyAIN7iZbUfY960kzRXm3Sv+jFzWUfonVmEjft1PX0qpp4B9c6HvTD6nXx
	t26rSdxr0dYermrKTsg315ea5fzOo0Gr0qcYqFPn6xnoGB7qfoPV6T7WErn9YmjH4p+ix16gARW3+
	+S24XZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6wl-0000000G1RD-0ahm;
	Wed, 12 Aug 2026 11:16:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6wh-0000000G1Pr-1gv2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:16:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB754600E2;
	Wed, 12 Aug 2026 11:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEB71F000E9;
	Wed, 12 Aug 2026 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786533390;
	bh=bXJAoKuOzaSXieVdd1OyY5L7/X1+2blaPqmx6LTftp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aq7b+b7PcLmUOEwd9UicdMfO87JgdcEtptnXSCcIaSWvrXr1ePMlHrIKMCMgDJRoe
	 3IsYqPg00fvZLBvex1B84lsnSnpAJKQNNfdZJRdlj3o9mEo2sro2TuYIkZQ9yXoH6B
	 rxMEz5m/yTiX35wWi4zR+Ak4dt3cw4nY1oEgYvPVOvLt4oqEi25Q7AhB4h/8Ac3JTu
	 1SeA6OSlIJTPkubkkO5OHP610vxPikIYNqJtQyXg72dk32xyBtqVc+RyJL1en1E0LX
	 qIv4L/33x6zTNJb4+5EFNDuzGkVCOYrxCiUmGjvbn4BjzJNfRI1txUD+5+lgDacvnk
	 +4etDeFAQiBcw==
Date: Wed, 12 Aug 2026 13:16:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
Message-ID: <20260812-fearless-antelope-of-might-cf3eff@quoll>
References: <20260811-axiado-ax3000-pwm-v3-0-6ceaccd812cf@axiado.com>
 <20260811-axiado-ax3000-pwm-v3-1-6ceaccd812cf@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811-axiado-ax3000-pwm-v3-1-6ceaccd812cf@axiado.com>
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

On Tue, Aug 11, 2026 at 02:01:50AM -0700, Petar Stepanovic wrote:
> The Axiado AX3000 and AX3005 SoCs include PWM controllers that can be
> used to generate configurable PWM output signals.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  .../devicetree/bindings/pwm/axiado,ax3000-pwm.yaml | 53 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++++
>  2 files changed, 61 insertions(+)
> 

Where did you explain reason to drop the tag?

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

> diff --git a/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
> new file mode 100644
> index 000000000000..7297abccbc24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/axiado,ax3000-pwm.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/axiado,ax3000-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axiado AX3000 PWM controller
> +
> +maintainers:
> +  - Petar Stepanovic <pstepanovic@axiado.com>
> +  - Akhila Kavi <akavi@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +description:
> +  The Axiado PWM controller found on the AX3000 and AX3005 SoCs.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: axiado,ax3000-pwm
> +      - items:
> +          - const: axiado,ax3000-pwm

So 3000 is listed twice. You need to test your DTS.

Best regards,
Krzysztof


