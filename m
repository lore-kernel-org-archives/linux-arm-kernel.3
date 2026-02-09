Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDD4E94602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt4Ovoy4m7nRv3iWqhMS4n2L4nM1SijSDjnOMZdvRUQ=; b=w8bhmjKUtUg1FkCoZZQWuknM/c
	rBizD44bDNX3m4Ol5JygCEb0wLsAS1XLwyrQgDQ+XyxCUzXFZnrADp5BkuhWNwYLLaRR1JvDh7uJD
	HzmdZZovxJ4gf9Gvgn3rpNuZktnqws48g1FGqbD6nQi7AzYyFnyAJkpUNeQjN6mUPisD2igVnWcMk
	uET8qq3fQhlcg6Dg3mb/slMXbA3t4JwEbSH72CLKqu/QgXIIvoL+5V8hziJjshv4TCHlUGS2/pbpY
	/KkjezNxcIJ4jfOW5JItTqzEL2qZx11dciV/1ioSefw7bL4470BjgU0ZEWPh2N0hRwWDYTCJi1ia4
	jJZh+6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpXmx-0000000Fz7G-2nZr;
	Mon, 09 Feb 2026 20:23:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpXmu-0000000Fz61-3Z98;
	Mon, 09 Feb 2026 20:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nt4Ovoy4m7nRv3iWqhMS4n2L4nM1SijSDjnOMZdvRUQ=; b=sQWKgWONrIw6wBZy5vUXrZeycP
	r1qROwKD65KWKsC1hiniLLent/znjlT0A9GSiY+d41OLTXDbmwvr7UGcXRM+rVL4h9Yc4WAF30kv1
	AxJYqPOLrZiGa2gzbIO/veNNXomxl+KaMH9haSs2qLnOa9KQG8kjthtAlzbXkiWeP2s5T4OLYwjA+
	kF7Eyrh/4wlEBl4FZ6ZYVnbcH8A0ehvY9o75GolQ1sxJyLd71E7J5mYJY8yc2Z1rjJvtQbvaBMYMh
	wBLeC+YZz/JQR0OIo1bjDdwNodv7ubdsGY2jI3H9Pdp5Q90TG0lvDQWdYnLaIhvxdjZQKILGtASe9
	LL/9+9Uw==;
Received: from i53875a32.versanet.de ([83.135.90.50] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vpXmn-007q7p-PF; Mon, 09 Feb 2026 21:23:10 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kever.yang@rock-chips.com" <kever.yang@rock-chips.com>,
 "finley.xiao@rock-chips.com" <finley.xiao@rock-chips.com>,
 "w@1wt.eu" <w@1wt.eu>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable OTP controller for RK3562
Date: Mon, 09 Feb 2026 21:23:09 +0100
Message-ID: <4721118.KgjxqYA5nG@diego>
In-Reply-To: <e58ebe6e-1de7-4b72-bf5e-e93cc19e69fd@kwiboo.se>
References: <20260205212347.490636-1-heiko@sntech.de>
 <20260205212347.490636-2-heiko@sntech.de>
 <e58ebe6e-1de7-4b72-bf5e-e93cc19e69fd@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_122316_909555_E3CA90FF 
X-CRM114-Status: GOOD (  19.44  )
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

Am Montag, 9. Februar 2026, 17:54:51 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Jonas Karlman:
> Hi Heiko,
>=20
> Thanks for including my RK3528 patches :-)
>=20
> On 2/5/2026 10:23 PM, Heiko Stuebner wrote:
> > Enable the One Time Programmable Controller (OTPC) in RK3562 and add
> > an initial nvmem fixed layout.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3562.dtsi | 46 ++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3562.dtsi
> > index f84676b47b27..07626dba21bf 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > @@ -1093,6 +1093,52 @@ sdmmc1: mmc@ff890000 {
> >  			status =3D "disabled";
> >  		};
> > =20
> > +		otp: otp@ff930000 {
>=20
> I noticed that the node names is not consistent for all three patches in
> this series.
>=20
> A quick grep at Linux src also suggest that efuse@ being the most common
> node name used for similar otpc/efuse, efuse is also listed under
> 2.2.2 Generic Names Recommendation in DT spec.
>=20
> Maybe the nodes should be renamed to use efuse@ or something else?

=46ine by me :-)
So we'll make this efuse@ for all 3 newly added otp controllers.

Heiko



