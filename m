Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4827BC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmS3UunE+jU6MnNsCkySLw53zXUjpQw/+3hi1h+l+Po=; b=DIrbshkUOAZzwN/I0tvWhj6ngi
	EnblkxITgHoEZbRWnH9Oao4RWzLndmuojFnvp9NArWv1Q8OSGVOmm+TaTkoFSxg5pGgbe3MS+LcAX
	XvwnRmcKFJMmzjXa/MfNbvpWc2fEmm+n8nKK5vE2JgcOqLSvxwEpUbPTWhdcYjPAyiH4LsDRj5s7j
	ULOmkUkDwXzQT1TKEZlDT+DppwyKotugEavW0HnKzpd4i5iJqE42kKcx8x/hL4FDuUiaRE5EY7nCC
	idIe4DvL8u+2N3HYJy3JjLetYheuip73/UJyuCnEpP9NZVmRBl6PKx94zlCyCRTjOJQztBtZPjtrO
	FCSNLgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYTP-0000000E92V-2WYA;
	Fri, 21 Aug 2026 23:16:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYTI-0000000E8vS-1BvI;
	Fri, 21 Aug 2026 23:16:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A846640BE2;
	Fri, 21 Aug 2026 23:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459001F000E9;
	Fri, 21 Aug 2026 23:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787354183;
	bh=YmS3UunE+jU6MnNsCkySLw53zXUjpQw/+3hi1h+l+Po=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SL7OvAN9c7U4bM4OleZMIzpS4DwHNk7GCGvS5U30PqFRv6ijkaNIbBqSuNu0Dar1T
	 v9FnrofaMoB4zB3Ij2brDog/j+coYttbXTCtjOwHTcT62ERPMYV2GR3MUcOePq2xam
	 mR1avt1lKyWzRVlvtIqLj9tncSJ+1P6JxBNiZBdtEj/eKX8TIPtTP1GtC2dzSHiPpt
	 gSkk95TOZn6FLALrhK3n6PEOSe2MGIWEOJWFr+glDB+Mqxl+1g7EG4uBOnsU4NoIv8
	 dMLUO8eq5RL6X+1dCj22AzoSTfGiaqZG9Mt/DYZr7/7NNoHAj9x53Ob1UwoL/PgGT7
	 Hkm2l3yZZHVaA==
Date: Sat, 22 Aug 2026 00:16:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Vladislav Leonov" <vlad@zlab.su>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, "Andy Shevchenko" <andy@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Rob Herring" <robh@kernel.org>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Simon Glass" <sjg@chromium.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106
 compatible
Message-ID: <20260822001617.0f94109f@jic23-huawei>
In-Reply-To: <9425cd59-7b78-7e0e-5d7f-aaff876ce8d6@zlab.su>
References: <20260816113636.33635-1-vlad@zlab.su>
	<20260821-bouncy-sticky-dalmatian-4f72c2@quoll>
	<9425cd59-7b78-7e0e-5d7f-aaff876ce8d6@zlab.su>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 21 Aug 2026 12:30:00 +0300
"Vladislav Leonov" <vlad@zlab.su> wrote:

> On Friday, August 21, 2026 10:27 MSK, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > On Sun, Aug 16, 2026 at 02:36:36PM +0300, Vladislav Leonov wrote:  
> > > rockchip,rv1106-saradc was folded into the fallback enum together
> > > with rockchip,rk3576-saradc, falling back to rockchip,rk3588-saradc.
> > > The two IP blocks are not equivalent, though: per the RV1106 TRM v0.3,
> > > chapter 20 (SAR-ADC), RV1106 only has 2 channels at 10-bit resolution,
> > > versus 8 channels at 12-bit on RK3588. Documenting it as falling back
> > > to rk3588-saradc allows device trees that would bind against the wrong
> > > channel table and report an incorrect voltage scale.
> > > 
> > > Remove rockchip,rv1106-saradc from the RK3588 fallback enum and give
> > > it its own standalone compatible entry, matching the dedicated match
> > > table entry added by the driver patch.
> > > 
> > > Fixes: bdba14f6122c ("dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible")
> > > Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab.su
> > > Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> > > ---
> > >  .../devicetree/bindings/iio/adc/rockchip-saradc.yaml         | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> > > index f0551d665916..dc56855527b8 100644
> > > --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> > > +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> > > @@ -22,9 +22,7 @@ properties:
> > >        - const: rockchip,rk3562-saradc
> > >        - const: rockchip,rk3588-saradc
> > >        - items:
> > > -          - enum:
> > > -              - rockchip,rk3576-saradc
> > > -              - rockchip,rv1106-saradc
> > > +          - const: rockchip,rk3576-saradc
> > >            - const: rockchip,rk3588-saradc
> > >        - items:
> > >            - enum:
> > > @@ -35,6 +33,7 @@ properties:
> > >                - rockchip,rv1108-saradc
> > >                - rockchip,rv1126-saradc
> > >            - const: rockchip,rk3399-saradc
> > > +      - const: rockchip,rv1106-saradc  
> > 
> > So this goes to an enum with all the other single-entries.
> > 
> > Anyway, where is a driver binding to above compatible (see DT submitting
> > patches). git grep on a week old next gave me nothing.
> > 
> > Best regards,
> > Krzysztof
> >   
> 
> Hi Krzysztof,
> 
> I will combine it into a single enum in v2.
> 
> The driver patch adding this compatible has been sent but is not merged yet:
> Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab.su
> 

Please combine the 2 patches into a small series as a v2. 

We aren't in a hurry at this point in the cycle and will make it easier
for everyone to see what is going on.

Thanks

Jonathan

