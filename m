Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F627C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5p4jevbzCcNT8+15DGunWCaousHFOTOP1KQpTKa9Ng=; b=Y5LdJ495XLzTUkBcr+TTYeVjx8
	I/BYhiqONFSpYGMZqHdlm+1JF4979tPUyMz7mPHhyqn9kW4I+KHH+p7oYTqAnUi+5SoRZFIOpyUqC
	eoCW1NGi2TzGq6m3ZhGNeTCgH9NL61oswfbzlqXZx9qraO7DFN0VpClS15AFEtExgeaR+VdMECP2I
	zAF6rhx4SUgzgq+3WU/i3oCxMDNa8d4kXeE5qUTWMy9Ip7GDR5/COok6a2uQVG0KJ6+uBvQ2cDR3z
	yA0tSmpsZcl19dLIL5/kXo696ci14EIcJN74SabL9vlICudcnE7ubB9P+1H8pjF7sbD9AzLfywTph
	1iC94w1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MGC-00000000DS7-2Xov;
	Sun, 20 Sep 2026 18:27:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MGA-00000000DRu-3EJN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 18:27:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77D1E400EB;
	Sun, 20 Sep 2026 18:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F1B1F000FF;
	Sun, 20 Sep 2026 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789928850;
	bh=o5p4jevbzCcNT8+15DGunWCaousHFOTOP1KQpTKa9Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kw1X5ljYdyuEx/BPqcdPHjTfSCZXvubINjRkiuwp8bRrfYloJ61juTEezvERFm7Uk
	 nZzUcMV7bkua/zEUx3SO+rDaV13RZ7Jc8CMJJDf0Ubwo+H5XNcDxRcQoTeioylwdTW
	 3kjJ0p0Xm1uKTYScNP9M7lNAauagOHZSGPR43cFfr6oqfomhUGky2eJN6OhIAv0NYN
	 bvw8wj/TvgqVxBXOCkfVfWTWzZN7d4aXpC1yHdwEcRdbSKd4GQrNAETBHSO7FqxYT4
	 0Yu5O2aclGFVkWRC+58AWGE75oGW1GcgYHtmOQASpAkKbLG3cScaS4gl6v68Sb3dhD
	 ydUMxy6ulU97Q==
Date: Sun, 20 Sep 2026 20:27:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Message-ID: <20260920-therapeutic-wapiti-of-novelty-76abfc@quoll>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-2-365615a74ef3@studio.unibo.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919-send-dt-v1-2-365615a74ef3@studio.unibo.it>
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

On Sat, Sep 19, 2026 at 09:44:18PM +0200, Nicolo Giuliani wrote:
> The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
> separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
> SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
> PCIe. It serves the front panel ports through a Marvell 88E6193X switch.
> 
> Document the compatible string of the NPU board, with the CN9130 SoC
> compatibles as fallbacks.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> ---
>  Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> index 7e77310da6..2e114139f1 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> +++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> @@ -136,4 +136,13 @@ properties:
>            - const: solidrun,cn9132-sr-cex7
>            - const: marvell,cn9130
>  

Looks like you add to the end of the file, not in correct spot.

> +      - description:
> +          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
> +          with an 88E6193X switch)
> +        items:
> +          - const: sophos,xgs107w-npu
> +          - const: marvell,cn9130

Why is cn9130 used once as final compatible and once as not?

> +          - const: marvell,armada-ap807-quad
> +          - const: marvell,armada-ap807

Best regards,
Krzysztof


