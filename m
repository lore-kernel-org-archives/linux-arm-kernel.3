Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C2EC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAbJLZQ6tRw+3JpuTTlFStB7YRIx6psZDSrH5XlcvdI=; b=d2IaCnDhGb4xSjDGMTf9IHnaxV
	gBqKpbmXu2EF26JSStzOiqMKD1HOO+0zxwGlytBiN3Dg+7nAlb8kPuzbePcrYfNBS2N+jdf1CG1T2
	tzyaZjphbXDpFXXbrAibR0JmW4X8gKUzZzd5B9nMzK+50ytGSotB+WZZP0IUIzzfmk/e9qteL1n+Q
	ecJ0I+H5vg8f04+qLEJuT7nlmoXf8VWYYILsSThTXF7u50/3NJscyv2PrpbIx1JYxW7SgwhwqB+in
	VXh1CWW9JlyRD0US6tE3visBHe4svdk2mXICYJQ49JlUJ/t+hp6TPs9K+IE8XZCbe+EhQJ2gIAT1c
	2Dtug7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQWe-000000005kj-2766;
	Thu, 13 Aug 2026 08:10:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQWd-000000005kT-2BpA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:10:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ABB6403D2;
	Thu, 13 Aug 2026 08:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0411F000E9;
	Thu, 13 Aug 2026 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786608654;
	bh=LAbJLZQ6tRw+3JpuTTlFStB7YRIx6psZDSrH5XlcvdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CjWZhFXRdNo09EhhkbEYURxbkgpci1IzSja/nd9HBfkBVZ0l/tt8HtzQUzID8buL+
	 sbmudUpL1K4Up5L9VmIjxL/LLI0Y+B3j3Q8FZhMcVnqiFh9F/TGatzVl2kZo4UCYkJ
	 Wt7eVJVPmzTlNH34yTN41/GJwHHqlguYuwkTtEliHjFxTfmTTEUM3G/0/AIWSC4o1f
	 jfYcFOyMiSYwgsn4k/su3ByKc3aRrTNDuJpfG9fe5wZbeH0tvSfEoTCebNftttmfTe
	 OVYZIvgdnhzHarOUWFThup8oGhuKfAZAQ/FPewd9ZUMeHUt77EDHCiRH+bOw47ZLDW
	 jPxftFuGAqIDA==
Date: Thu, 13 Aug 2026 10:10:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
Message-ID: <20260813-classy-boa-of-apotheosis-57207e@quoll>
References: <20260812132954.148571-1-francesco@dolcini.it>
 <20260812132954.148571-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812132954.148571-2-francesco@dolcini.it>
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

On Wed, Aug 12, 2026 at 03:29:49PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The DPI output of the LCD interface can be configured with a bus width
> of 16, 18, or 24 bits. Introduce a bus-width property to the output
> endpoint, specifying the number of parallel RGB bits connected.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v3: use video-interfaces.yaml
> v2: use the common bus-width property instead of the legacy interface-pix-fmt
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 2dd0411ec651..1f3daf002707 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -71,6 +71,15 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: The LCDIF output port
>  
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml

This won't work, you need to test your DTS. The port schema does not
allow video-interfaces properties. You need port-base, like in every
other case.

Best regards,
Krzysztof


