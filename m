Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF3BFF60D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag89dtgoFcqmRpOutS+jEo6Sj3sF5Fr9hGzc2IQBvyU=; b=ge9Jzv56v0Rg3K0NkaPgk9T+vU
	5scFJEtm5t8ICYh8yDzji1EeSA7UlEdOlCW3s/IQz3vmzxieoeo/zDZnCwN1ZNVC7qk2Q3h3ZgdYZ
	qywY1+erI43v8QLh5IV1iPgFk92QvLU3mprFeeAI1bIYn6tQPhCbSvongsfw3FYKag/8AytzMQeL2
	r7YpTInvkdXLcbiziiHsNIA98Pwb7wRab8PMdIlVrqniJqw4TGCpDKA2/1cFGLQGX3/YkqWLN6j9J
	PkouQxPNNyBSS6ifHUtmiF2/q+xn8hlNeI1Ew4ioKVsP1MyS2U/ytT1nwbM5b/CsPl7E0J92Jg3ik
	CFf3zuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TE4-0000000CQvC-42Qt;
	Tue, 31 Mar 2026 07:09:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TE4-0000000CQuv-0ReX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35BCD60127;
	Tue, 31 Mar 2026 07:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDF7C19423;
	Tue, 31 Mar 2026 07:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940962;
	bh=OHjzPDaFcFaxb+w0qneX65vvad9Ig+yC3Pon7vSnMcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGd/Mg1VhHHqI8aq+/SuYwyLEo9n0NrsponM34Sina5tcYuWkOmNN4BiwT9wVEAWR
	 v8M8BF8i68zI/yB6xEpnWVNKPIE5u726LARXFdtGgFINl0+5G0hNYEAKHf3ner7ZKm
	 8zW2E8MSOvDsf6sDmyq4KjhDgomnlAMeHPqFhJA4rjG5/ULATYGkyN7FBr6OfHQU6m
	 EksZCWHGWLG32JbAlMHbEt0gY2ZDApaeY+qhb0+iNKnBilfUO5FGJuEYuOS/F3hGlF
	 5x9zdJKGBDyo56ZSM1jvL2rcwnlgspo7YDCOgd3p3D5LxoAEsjRHFC8md6U35SezCk
	 R2rtZPF+e9ZyA==
Date: Tue, 31 Mar 2026 09:09:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, u-kumar1@ti.com, 
	gehariprasath@ti.com, y-abhilashchandra@ti.com
Subject: Re: [PATCH v3 1/2] ti,j721e-system-controller.yaml: Allow
 audio-refclk as clock-controller child
Message-ID: <20260331-flashy-hilarious-whale-6e606c@quoll>
References: <20260330094459.128648-1-m-shah@ti.com>
 <20260330094459.128648-2-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330094459.128648-2-m-shah@ti.com>
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

On Mon, Mar 30, 2026 at 03:14:58PM +0530, Moteen Shah wrote:
> The ti,j721e-system-controller binding currently only allows
> clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
> schema. However, the system controller on J721S2 also contains audio

J721S2 or AM62?

> reference clock controllers (ti,am62-audio-refclk) that use the same
> clock-controller@XXXX naming pattern.
> 
> Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
> or audio-refclk schemas using a oneOf constraint.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index f3bd0be3b279..d5d84a8f1257 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -53,9 +53,11 @@ patternProperties:
>  
>    "^clock-controller@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
> +    oneOf:
> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#

Alphanumerical order.

There is no ti,am62 in the top level compatibles, so why am62 is here?
Top level has j721s2 but this ti,am62-audio-refclk.yaml only am62.

Best regards,
Krzysztof


