Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3118EE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIs+6//9pCaz6EyeOwysIwczhydc369WMFHKaaagOvY=; b=zWJKwY1ZATDdsewHqKpShD6THO
	y5LoWC4CxECH3p/RBZDh5bObS8Px5zKHlRSYb9dzgcbR1XrvQjPN6rnzLNKUE5bjlpguUoeanGmN2
	6yKPNZ007E6lXLfYeWm4HRykDYphLTr5COEgj6KS/ApKrjh0E7wiZUNP5DZu6nNNVdwOCH0zs9UW2
	f/3ibYlx/qkW49skUJ8m87qRON0j6FL3nVxbvPikvwMI38DLaerPUaArUcCvpnYgrD0klyWiNqQbr
	cONSi5uELWxebRUvIREgNXfak095PlLrBosBf0anz6jbphP6FZKr2iPPetML9KMLER6W1nhkQpqR1
	a+/SdZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeZb-0000000A1an-1qTU;
	Wed, 08 Jan 2025 22:30:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeXe-0000000A1J1-47jx;
	Wed, 08 Jan 2025 22:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oIs+6//9pCaz6EyeOwysIwczhydc369WMFHKaaagOvY=; b=BaedSn+aUIt4dGeN6UFrKv3zq5
	SjvxbM6DzIzuwDFspDx8xT61/huayN6VLFfjpyjKUKm7tH58k0vh0lJIUJ+Gx9fn63+Exga3t6sNR
	6b1WxY3XPQNEV036vJ8hHIICLnXXggqpBJ4qjv0veqgaLEzSWUhZr1vxcp4fpXiW42CdsHZjutpYS
	KB7zXZlisMJaJSMnm0mbnuiQhb6SNNWP2jsFCXvKPnJvPpm6YY49TTfpXVIcwna3bBpl1afHzuvkN
	OCOjsp4IDiCQ94Ch9JjiSKMCZJU9QS086B6rPNzGMJr0G8yXx6J7N1TrwfLpAboj5f4mjRuHm0a2O
	xmC2JPPg==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVeXc-0004BU-TI; Wed, 08 Jan 2025 23:28:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device
 trees
Date: Wed, 08 Jan 2025 23:28:44 +0100
Message-ID: <2731770.KRxA6XjA2N@diego>
In-Reply-To: <CABjd4Yy4Qd1rD43u3B-s=HxVBnaQt7fSgP9NFY2YeY0eKMESvQ@mail.gmail.com>
References: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
 <1950286.IobQ9Gjlxr@diego>
 <CABjd4Yy4Qd1rD43u3B-s=HxVBnaQt7fSgP9NFY2YeY0eKMESvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_142847_021742_C25728DB 
X-CRM114-Status: GOOD (  28.74  )
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

Hi Alexey,

Am Mittwoch, 8. Januar 2025, 16:30:35 CET schrieb Alexey Charkov:
> On Wed, Jan 8, 2025 at 2:01=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.d=
e> wrote:
> >
> > Hi Alexey,
> >
> > Am Mittwoch, 8. Januar 2025, 10:09:07 CET schrieb Alexey Charkov:
> > > RK3588s has four SPDIF transmitters, and the full RK3588 has six.
> > > They are fully compatible to RK3568 ones. Add respective nodes
> > > to .dtsi files.
> >
> > While it may seem that way, we still want soc-specific compatibles,
> > to future-proof this.
> >
> > I.e. going the the
> >         compatible =3D "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
> > way, so that now things can just match against the rk3568, but if some
> > fault emerges later on the code can be fixed with the DT staying just
> > compatible.
> >
> > The spdif also has an example already for all the spdif variants that a=
re
> > compatible to the rk3066 [3], so it'd need another "items" block for th=
ings
> > being compatible with the rk3568.
>=20
> Hmm, if we are to believe the driver ([4], [5]), they are all the same
> as the good old RK3366, which in turn is software compatible to the
> good old RK3066. Same seems to apply to RK3576, given that its current
> .dtsi just references the "rockchip,rk3568-spdif" compatible.

I was for a short while afraid that something slipped into mainline :-)
But I guess that "rockchip,rk3568-spdif" compatible on the rk3576 is
only used in the vendor-kernel.


> Does it mean that the binding needs to be restructured so that the
> required fallback compatible ("rockchip,rk3066-spdif") applies to all
> variants? Or shall the existing ones be left alone, and just RK3588
> and RK3576 added inside that "items" block?

I noticed that the spdif binding has had an interestings growth over
the years, with some socs being outliers.

I wouldn't change the whole binding, especially as that then touches
established stuff.

The question would be weather to add the rk3588 + rk3576 to the
existing enum marking them as compatible with the rk3066, or create
a separate items block and just saying the rk3588-spdif is compatible with
the rk3568 one, like:

[...]
      - const: rockchip,rk3568-spdif
      - items:
          - enum:
              - rockchip,rk3128-spdif
              - rockchip,rk3188-spdif
              - rockchip,rk3288-spdif
              - rockchip,rk3308-spdif
          - const: rockchip,rk3066-spdif
      - items:
          - enum:
              - rockchip,rk3576-spdif
              - rockchip,rk3588-spdif
          - const: rockchip,rk3568-spdif
[...]

With the RK3066 being released in 2012, part of me is amazed that that
block survived that long, on the other hand going with the above snippet
somehow feels saver ;-) .


Heiko

> [4] https://github.com/rockchip-linux/kernel/blob/develop-5.10/sound/soc/=
rockchip/rockchip_spdif.c
> [5] https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rock=
chip_spdif.c
>=20





