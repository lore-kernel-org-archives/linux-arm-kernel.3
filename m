Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315C8C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdSw+G21z2NrE5iHKTKAJzseZhloGwIrHZmDJjo4p4c=; b=hCBTiE3tSPnNZIzv8FCsSVNXf0
	jaRf2I8cwsaMi0O86brLtR68fBR1o4oXbPiapIl1rJhnZDD3piL2KsMjs9BTzLzXq+IW/egO9dY1x
	qfDxOhLXfPSO6ovQdxYHH6eIl8ivNzFM+7YY6usVckR2WZKJypwaa+voM2bEIblwAvLTJdN5C3JN0
	ETV/w2ew7SSK9KdME/Hn76RhVdLr6EF3fcck1TY7ugvknrDL4ZOfFPFtC++htUx5eK5sLzNmacNfA
	U8WCc7OwMvkHR+VpBnsCiQjpp/e76WC+kRrP9EKmuWI6J7YwHnt2O0U9GQToOMzjn9qEiHqfOQAQi
	NRI0G80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whirD-00000001Eki-3JaN;
	Thu, 09 Jul 2026 07:07:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whirB-00000001Ejd-3ICN;
	Thu, 09 Jul 2026 07:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pdSw+G21z2NrE5iHKTKAJzseZhloGwIrHZmDJjo4p4c=; b=wzpkFYTSB2o038W334C7hu8s9v
	7+L3+hqneJ1n9ursKNn/qF9aAa80jolpgMvJtb93jbbHpRHdG7+hl4Hfgwotw3LsMcvvE7NGnbpHi
	9bFxj2FYvyUZbgVxteLRtrPMAZUOt0YENy0Hg9DFimz1NYygsj0BXE2v77IoA+8H4/3fPk0tX6Qai
	9MNf5M9KYENWFUWpkudTS1bInIn8spWFtpDgqpeTmTaYvRRZrzRS3ULHq7/RMFB+tahmMaQ2B0uXo
	l5z9MVr1Xc+4GJPPZKcA1sh1Xo4ASqn09/xQX2HsOyMt+jqVybBUP0gYe8w8Vm4iOpudzcyPjxnsF
	08GKkryQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dawid Olesinski <dawidro@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
Date: Thu, 09 Jul 2026 09:07:23 +0200
Message-ID: <4011768.FjKLVJYuhi@diego>
In-Reply-To: <ak7jEYTAGgeDdi1W@venus>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260708175837.1718437-4-dawidro@gmail.com> <ak7jEYTAGgeDdi1W@venus>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_000737_876965_36B4978F 
X-CRM114-Status: GOOD (  21.99  )
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

Am Donnerstag, 9. Juli 2026, 01:56:10 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Sebastian Reichel:
> Hi,
>=20
> On Wed, Jul 08, 2026 at 06:58:24PM +0100, Dawid Olesinski wrote:
> > Add the device tree node for the V2 cryptographic hardware accelerator
> > on RK356x SoCs (RK3566, RK3568).
> >=20
> > The IP block sits in the non-secure peripheral domain. Its three clocks
> > (core, aclk, hclk) and reset line are accessible directly through the
> > main non-secure CRU, so no firmware intermediary is required.
> >=20
> > The node is disabled by default; board files that wish to use hardware
> > crypto offload must enable it.
>=20
> Why is it disabled by default? It doesn't seem to be board specific
> at all to me (the same question applies to the RK3588 DT).

You're definitly right about that ... there are no board specific resources
needed, so Dawid please drop the status from both nodes.


Heiko

> >=20
> > Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk356x-base.dtsi
> > index a5832895bd39..9de7e7487ca1 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > @@ -1112,6 +1112,18 @@ sdhci: mmc@fe310000 {
> >  		status =3D "disabled";
> >  	};
> > =20
> > +	crypto: crypto@fe380000 {
> > +		compatible =3D "rockchip,rk3568-crypto";
> > +		reg =3D <0x0 0xfe380000 0x0 0x2000>;
> > +		interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks =3D <&cru CLK_CRYPTO_NS_CORE>, <&cru ACLK_CRYPTO_NS>,
> > +			 <&cru HCLK_CRYPTO_NS>;
> > +		clock-names =3D "core", "aclk", "hclk";
> > +		resets =3D <&cru SRST_CRYPTO_NS_CORE>;
> > +		reset-names =3D "core";
> > +		status =3D "disabled";
> > +	};
> > +
> >  	/*
> >  	 * Testing showed that the HWRNG found in RK3566 produces unacceptably
> >  	 * low quality of random data, so the HWRNG isn't enabled for all RK3=
56x
>=20





