Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75D7CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw3jt4zHNgm4deRIvVS+AZXuU23cUxhaCwFbDt3G//8=; b=dG7DBodL7E4jy3BurPsvxhAmSr
	he//X1bsgh/F84OQE0PKcR/OwnfJAVrLW08vx82pduzV6uv5Ydcaf57SdkGaEKSVV7FRJzsd0bbSd
	DjW1uvUjFoGAyRKZOzoRGoyuEy/dSuXw4Ikga3GJPc5QlV8c0XcI6OuS9sHejp5M83TtiHsNS3rsw
	hpJzUrKwayqsIeFHde/NNZfmrLR4Z3jup//6mA5pJXw6+umZdLGNmICw2D/6fOvzc28CEo8XdLBto
	t+J2/iveTNk4e6D7bwSKphb6q/kjD8RJn7aOctwsEjM/e+tc+I3fAahtSltmEXPk0LSACeOgZvXxX
	Q055hDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKeO-00000005dpV-30Yh;
	Sun, 18 Oct 2026 06:45:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKeG-00000005dk1-2HrM;
	Sun, 18 Oct 2026 06:45:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5B02602BE;
	Sun, 18 Oct 2026 06:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DAC1F000C5;
	Sun, 18 Oct 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792305933;
	bh=Aw3jt4zHNgm4deRIvVS+AZXuU23cUxhaCwFbDt3G//8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IDTtpgBKYaBm2zaIDQhOZ2PSPkv++aTyX8wVxTj2Q0K4oYfe2P93j8UmQzy8lF96z
	 DUbtyoT9e6jjvvowflopO2xrDud7A/6k90+MWxFWOqOPUVGdheUC5VbHjxVDQb45jP
	 QaUwTFsOn8GIQ0mzFKM0tjGXBHU4ItG8DV4W6eyd/LQWwQLPABkuzuDGL+QJwJY1ex
	 KtxIHmkUVQ0ShJsuOFgWVp63M5Lh811FxiJz14zK5bn7wk+HGEST9FP71tDuGB+k8T
	 K1FdW67lK9RxBnPG4N5JDaWxFeQenCyXH7NsUoxkwKtrc9Q520suhkHwmvhuF191kk
	 Wob3D59UMvzxQ==
Subject: Re: [PATCH net-next v12 4/6] dt-bindings: net: rockchip-dwmac:
 document pcs-handle
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 david.wu@rock-chips.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 06:45:32 +0000
Message-ID: <179230593214.3135.8437298852154217978@kernel.org>
In-Reply-To: <20261017054406.1828061-5-coiaprant@gmail.com>
References: <20261017054406.1828061-5-coiaprant@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The rule that makes pcs-handle required is true even when phy-
  mode is absent, and the patch adds a redundant rule that the commit…

--

dt-bindings: net: rockchip-dwmac: document pcs-handle

This adds a pcs-handle property to the Rockchip GMAC binding for the SGMII
support added later in the series. It also adds two allOf rules for
rockchip,rk3568-gmac. The first requires phy-mode. The second requires
pcs-handle when phy-mode is "sgmii".

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 80c252845349c..c434450fd07ff 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml

[ ... ]

> @@ -159,6 +165,27 @@ allOf:
>          clocks:
>            minItems: 5
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-gmac
> +    then:
> +      required:
> +        - phy-mode
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-gmac
> +        phy-mode:
> +          contains:
> +            const: sgmii
> +    then:
> +      required:
> +        - pcs-handle

[Severity: Low]
Is the sgmii if above true when phy-mode is missing?

In JSON Schema, a properties subschema passes when the property is not
there. That means a rockchip,rk3568-gmac node without phy-mode matches
this if. It then gets a "pcs-handle is a required property" error, even
though nothing says the link is SGMII.

The standalone phy-mode block before it does not make this if false.
Each allOf entry is checked on its own, so that block only adds its own
error.

Is the standalone phy-mode block needed at all? rockchip-dwmac.yaml
already pulls in snps,dwmac.yaml with "- $ref: snps,dwmac.yaml#" under
allOf. That schema already requires phy-mode at the top level:

Documentation/devicetree/bindings/net/snps,dwmac.yaml:
required:
  - compatible
  - reg
  - interrupts
  - interrupt-names
  - phy-mode

So an rk3568-gmac node with no phy-mode would get two "phy-mode is a
required property" errors and a misleading pcs-handle error.

The commit message also does not say that phy-mode becomes mandatory for
rk3568. It only says pcs-handle is required when phy-mode is "sgmii".

Could required: [phy-mode] go inside the sgmii if instead, which is the
usual idiom? The standalone phy-mode block could then be dropped.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261017054406.1828061-1-coiaprant%40gmail.com

