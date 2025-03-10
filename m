Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA2C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LD0x56DcQkz38UMYc+bSzlRfzytstyXfWwWL8HcG1/E=; b=YQ8QQ4sGVAdFuHKSg2HFVw6XXG
	WlKOlN4KIkZjXSe5z3L89MWmeViWsVDmV+h4c5e1IHxAhEUn40w/RKNzsVPCqvJ0XMlud8lfiy+IY
	MB0rQ3c7V+kEcPDBkif9k28xlEiSjQX2p//yPutcVwJh445cKLkEd6R0vQdP2UihGtiv2rV53eO6Z
	1ZhzZxLy/bNhcgveB2OXHrcwY71/RAbflNNjTDdkGQRlV1CJ9YGga9UMUka0toKcb8UAmiL7/2a2F
	KpQboXL/R3HE03yqDh/Q9J4JYZmqqCGxnC1zUn/ahtC6MCT4v6RFH1dqw2pDw2VyYtRA7n+hS6eEX
	DLGG8Spg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdXc-00000002qjU-18dA;
	Mon, 10 Mar 2025 13:51:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcZz-00000002gMf-2Ij1;
	Mon, 10 Mar 2025 12:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76B02A45BB0;
	Mon, 10 Mar 2025 12:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2358FC4CEEA;
	Mon, 10 Mar 2025 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741610998;
	bh=DOEHd6cnQseKz/MeHFswCo+xv14h0VbP6CgZAcOI3JE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0HcoMdXQYndg5RPlZ/Dwc7eluZqRPTg52J1enTxQ+Gaf8XTr2u1yWhmevb/1HfCb
	 NM0JP2gBaWhFobT/aTQwj3PUh7+2yZr0+oj4mKeTM61OmPeeKRjprbHtuGn3yJCZsA
	 Ny94+jR2DkKRL9pvcPEhM9Ap0KAmO0HGH5oI4RMoOgMi+k7SKGqvMRw+r1QS3o3p/o
	 WXS+KHf4HmXv1tupmZQ4PfFjkVlDYf+uXOvGBxQzfJhumJLtJeCluwcu378AdQYihg
	 Hqsehhwtuc63VG27IvqJxAANYVaweTZJO9WQ5tDsUCYxI92p+fUhsxIFaB2y/bmb67
	 o1YH5kOR/RY6w==
Date: Mon, 10 Mar 2025 07:49:56 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: rng: rockchip,rk3588-rng: Drop
 unnecessary status from example
Message-ID: <20250310124956.GA3875809-robh@kernel.org>
References: <20250307093309.44950-1-krzysztof.kozlowski@linaro.org>
 <5417098.31r3eYUQgx@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5417098.31r3eYUQgx@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_054959_649772_D6048AE8 
X-CRM114-Status: GOOD (  23.50  )
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

On Fri, Mar 07, 2025 at 03:05:50PM +0100, Nicolas Frattaroli wrote:
> On Friday, 7 March 2025 10:33:09 Central European Standard Time Krzysztof 
> Kozlowski wrote:
> > Device nodes are enabled by default, so no need for 'status = "okay"' in
> > the DTS example.
> > 
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Changes in v2:
> > 1. Drop unnecessary full stop in subject prefix after ':'.
> > 2. Add Rb tag.
> > ---
> >  Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> > b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml index
> > 757967212f55..ca71b400bcae 100644
> > --- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> > +++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> > @@ -53,7 +53,6 @@ examples:
> >          interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
> >          clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
> >          resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
> > -        status = "okay";
> >        };
> >      };
> 
> Hi,
> 
> is there the possibility we could make dtschema as invoked by `make 
> dt_binding_check W=1` (or W=2) add a warning for examples that have disabled 
> or explicitly listed status properties when not needed? Or is this something 
> better handled in, say, checkpatch.pl?
> 
> The question arises because dumb mistakes by me like this should ideally be 
> caught before they waste precious maintainer time.
> 
> If it's best handled in dtschema, I can look into working on that so you guys 
> don't have to do even more work due to me.

Trust me, I'm always looking for things to check automatically. :)

I have something like that which adds a schema for examples only. I 
think there were some corner cases. I'll take a fresh look at it.

Rob

