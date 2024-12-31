Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263D3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywWzPdNRXGjd5TNIsdpN8TgBvmV35oHoNmlE3EUsXY8=; b=xZb+8fdIGSoF/4njgqG5cS34pT
	z9hNdK06/O5an9ljrvil5EpvAXA3OQCw6wcVkP3e1ashpPPeLX7rWfxu+qJUQNYQmGj1Fuage93cZ
	KfRJRJWayw71AxufSClSZ6tT63Qk+7GJ5YkU6aebhHJK8wM/vPZpq495ud5HeSKm30hqF+UcnfcJe
	huEpiCR/AMpRPHu6NmlBFLEgNzAkg4SZXcpbX2IIUfaSu4mbJvjpLgz2CLdPMD5o6t/Zhd4dgARtG
	48B1m05ReRDnKNPixYFCJDBmWeEjv70fzRDZ+TDt0anY7RGm2ztwImxqaNznfRCSh/Oq5zelMsCDX
	UJndEraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXYe-00000006oiG-1Ajw;
	Tue, 31 Dec 2024 08:24:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXXT-00000006oY8-30YY;
	Tue, 31 Dec 2024 08:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B251A4007B;
	Tue, 31 Dec 2024 08:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF944C4CEDC;
	Tue, 31 Dec 2024 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735633422;
	bh=8k7A7pn5KKxr1hAtXg6k+QrsCY9z/C72vgdY+d0asXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aywhAM9CB0qyWKi9qwSfMfwPQayyzhqdqeZOI+brEmTbnRfv8wGj59BYjIGtg0Y/x
	 Ggiowx+uGTybxmDi9KF0rMUJnhFXkOtDV7Ng6XZB45Ah7/u/p5sgxCS5N6s9P0VYpn
	 ekzAjtcvrTKiyadrSuV7Pxsl1xdqktIQNfP1zh9GPEiJVGCctIj/4D0+oDUlr8Apv/
	 s5d3q6C0Tp9Z34xi5nMTirKOL6hwS9VYVl7TH5Ip1YVPYGFJs3czHcZn5i0SNq5pDH
	 VlZs9UrLMkeZVnJt/ZQmKrn0YhagLrAfsYECognXKukpo0T6UbcX2wfv8vqA/OOLrM
	 Iof2vBIg9nWew==
Date: Tue, 31 Dec 2024 09:23:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: robh@kernel.org, iommu@lists.linux.dev, heiko@sntech.de, 
	devicetree@vger.kernel.org, joro@8bytes.org, hjc@rock-chips.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	vkoul@kernel.org, detlev.casanova@collabora.com, 
	linux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, 
	linux-rockchip@lists.infradead.org, krzk+dt@kernel.org, cl@rock-chips.com
Subject: Re: [PATCH v2 5/8] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf>
References: <20241228122155.646957-1-andyshrk@163.com>
 <20241228122155.646957-6-andyshrk@163.com>
 <ihvrdnntfuvvycnlhysnm43wylotovvnivu4wxcne3bwc6etpj@n2rq6n77lmma>
 <4847f6b1.1c60.19412092a7a.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4847f6b1.1c60.19412092a7a.Coremail.andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_002343_884449_11C428DF 
X-CRM114-Status: GOOD (  21.56  )
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

On Sun, Dec 29, 2024 at 06:49:38PM +0800, Andy Yan wrote:
> 
> 
> Hi Krzysztof,
> 
> At 2024-12-29 18:13:39, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
> >On Sat, Dec 28, 2024 at 08:21:48PM +0800, Andy Yan wrote:
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> Add vop found on rk3576, the main difference between rk3576 and the
> >> previous vop is that each VP has its own interrupt line.
> >> 
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> ---
> >> 
> >> Changes in v2:
> >> - describe constraint SOC by SOC, as interrupts of rk3576 is very
> >>   different from others
> >> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> >> 
> >> Changes in v1:
> >> - ordered by soc name
> >> - Add description for newly added interrupt
> >> 
> >>  .../display/rockchip/rockchip-vop2.yaml       | 70 +++++++++++++++----
> >>  1 file changed, 56 insertions(+), 14 deletions(-)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> >> index 2531726af306..f28cea4a6d82 100644
> >> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> >> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> >> @@ -20,6 +20,7 @@ properties:
> >>      enum:
> >>        - rockchip,rk3566-vop
> >>        - rockchip,rk3568-vop
> >> +      - rockchip,rk3576-vop
> >>        - rockchip,rk3588-vop
> >>  
> >>    reg:
> >> @@ -37,10 +38,22 @@ properties:
> >>        - const: gamma-lut
> >>  
> >>    interrupts:
> >> -    maxItems: 1
> >> -    description:
> >> -      The VOP interrupt is shared by several interrupt sources, such as
> >> -      frame start (VSYNC), line flag and other status interrupts.
> >> +    minItems: 1
> >> +    maxItems: 4
> >> +    items:
> >> +      - description:
> >
> >That's contradictory. min/max say 1-4, but here you list two interrupts.
> 
> There are 4 interrupts on rk3576, and the other SOC only have one.

But you listed two interrupts, so where does the "two" come from?

> I am sorry that I am not familiar with this schema language; I have read many
> other YAML bindings these days and try to write it correctly.
> 
> Maybe I should not list the interrupts-names here(then list the interrupt-name by soc at allOf:  part),
>  like the clocks handles in samsung,usb3-drd-phy.yaml  ?

xxx-names are supposed to be fully synced with xxx, so something needs
to be fixed here. You can of course remove interrupt-names *completely*
(but not partially, because all properties must be defined in top-level).

Best regards,
Krzysztof


