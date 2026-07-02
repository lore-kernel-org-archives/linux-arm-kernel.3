Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E347C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eBn6yYPLH2ipNnA672FRtzi3xFVI7UPgps+ZwTDFzA=; b=fpEHTSkJSeeRWxSQQNEVP3pENi
	v+wYkT/t0TEcZys6Jp7KN9O2j+YJ0Z9NrnDCt6PccRoNW8h6vcGE3GlCY20aykQJNx987ZDjNN5cw
	z9DJp4M0qn26ovb8jDv6Dvo92ajKaPsbiSoGDprco3n4HdWwhrUo7ofoInS1XKMzadujZjpjWl8m6
	j9iGLs1RUlIGz4DfJN9zXuSiAaecTIb4ma7+G+wYiIM+jVORKPMIaM5jmi3LGd4SuOVoof6CJlFMA
	DTkS5+3NyXyy8qunyw2n5vuff8lA4i/6is3L2TLaapNPsjRLO2f58kLw9WAATC28y9S5D+Yb1FxCg
	NsbwLirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAic-00000003dL3-27PK;
	Thu, 02 Jul 2026 06:16:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAia-00000003dKt-3xyy;
	Thu, 02 Jul 2026 06:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9244860172;
	Thu,  2 Jul 2026 06:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482BF1F000E9;
	Thu,  2 Jul 2026 06:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782972971;
	bh=3eBn6yYPLH2ipNnA672FRtzi3xFVI7UPgps+ZwTDFzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AgOrK9hWFVZdG7FQCX01vljrn7ocPX3JQbiQA6nbxE6oXhRyf8ZcyWAgYu7FZkoA0
	 76+h1enpAdnMpRJEF5JTOElp5ebvnL1CPOZD8o6NBhFjzwHydCczUqbhr2p1G1atSS
	 6SUw86jYT5IYk9OtFbDyINO+5reMP5nfigVeFLwMHwn6gI/FznrIXgdSx7ouoh+obH
	 2QKD288wDD77Q7kABTMiO/T+BXtY1CbWEOevEwATu3IAeSwDxf6k06VawImAu42s5L
	 FreGrS86Zq9VHYVfuWeLdda39dG693hFm4VNR0eXjUo5GeZjWZ64eOxOD4sfuc+6tm
	 94XBuU9R/c42A==
Date: Thu, 2 Jul 2026 08:16:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, 
	michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
Message-ID: <20260702-utopian-termite-of-perfection-f1f3ec@quoll>
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630092406.150587-2-manikandan.m@microchip.com>
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

On Tue, Jun 30, 2026 at 02:54:00PM +0530, Manikandan Muralidharan wrote:
> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so its

What is SFDP?

> contents (e.g. a vendor EUI-48/EUI-64) can be read through NVMEM cells.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 587af4968255..98fd954598ab 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -103,6 +103,20 @@ properties:
>    spi-cpol: true
>    spi-cpha: true
>  
> +  sfdp:
> +    $ref: /schemas/nvmem/nvmem.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      The Serial Flash Discoverable Parameters (SFDP) tables exposed as a
> +      read-only NVMEM device. This allows standard or vendor-specific SFDP
> +      data (for example a factory-programmed EUI-48/EUI-64 identifier) to be
> +      consumed through NVMEM cells.
> +    properties:
> +      compatible:
> +        const: jedec,sfdp
> +    required:
> +      - compatible

Where are any resources? What sort of sub-device is represented here by
an empty device node?

Best regards,
Krzysztof


