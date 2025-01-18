Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876C5C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SxSP1pnDMPIAoFIbshAZCGR8/UyRzjoHfDVHXlLyvY=; b=av9U/M3XrtHUr68xle3KZtnpn1
	an01jr1DmM9eaI+V3imnAKTzNaP3Rub6/61ivH4qYnsSmqmu91dUHQAWOEI7LgvUuh/eaEMDoUuu4
	ksiowW/cG8UmcXJ8F7Fxab5zMo9xs86h+GjwREOH6ZNIMxrcMgVoTU1aLqzZCkn3kbDlpcJSj9Hot
	tLkXVzNIKByiSNx2xownP9adHjD0s7t5fwJp8tVy2HGzsen0xJE+OGT71rMe4saYeo3klTCa43pjN
	7pKIJaZuzqDS5jGjqUvcxvvCJHkmBN6N1TWtHeyFFQgtsePQ+bvPqT4FkJE7O4NiWuWH8HtzJ+gGA
	euPKoKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBBy-00000002eAJ-2EOq;
	Sat, 18 Jan 2025 15:56:58 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBAg-00000002e4n-1IP6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 15:55:40 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1737215727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3SxSP1pnDMPIAoFIbshAZCGR8/UyRzjoHfDVHXlLyvY=;
	b=L/1Xm9egYr9PWZJ8WNXlWGe091lYawTGRrX9Re0P+m3/1ksKE/GrGDHERjcoVL0ARhx2rl
	XYlItLGkfLZcct1JjV6diAzC8kpYoWmXCgLnJCb2julfufpPehrw/30mQK1m6ZiaocLVyf
	k69cfX6Ad7fp4TRUvlnn6jaaDqkWeBPNin8V4o0wfuA5e5l4ugvYf5dmuLTO+oLeCEOvba
	yzK6BhUnQ9a6qIzNKwOi9mBYxwTlk63lQ72pB7sjdJEVCfhwmT6gZTzNjiqrV7PhlM38fg
	dHTy0+Nu5cLuYjhOXMRAyux4PBWlSWuIIf2P1y8MuAK4xi6xhY0p6U9Dd9RM7w==
Content-Type: multipart/signed;
 boundary=6d73a8a051e9f14d4259504ef5c03823cc0e8aa06a923c553c99f8c21a2d;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Sat, 18 Jan 2025 16:55:24 +0100
Message-Id: <D75BKUFGD6OE.1767NEFXCRJEJ@cknow.org>
Cc: <zyw@rock-chips.com>, <kever.yang@rock-chips.com>,
 <frank.wang@rock-chips.com>, <william.wu@rock-chips.com>,
 <wulf@rock-chips.com>, <linux-rockchip@lists.infradead.org>, "Alex Bee"
 <knaerzche@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Dragan Simic"
 <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1 4/6] arm64: dts: rockchip: add rk3328 usb3 phy
 node
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Geis"
 <pgwipeout@gmail.com>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <20250115012628.1035928-5-pgwipeout@gmail.com>
 <7c7ce820-8a9b-46df-b143-f77835b7e5a0@kernel.org>
 <D73NJYSP62XH.28CVZPNUE21H3@cknow.org>
 <e1097f84-e40f-45ff-8b8d-125f7159ec1e@kernel.org>
In-Reply-To: <e1097f84-e40f-45ff-8b8d-125f7159ec1e@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_075538_941854_49946462 
X-CRM114-Status: GOOD (  24.96  )
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

--6d73a8a051e9f14d4259504ef5c03823cc0e8aa06a923c553c99f8c21a2d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Jan 18, 2025 at 9:41 AM CET, Krzysztof Kozlowski wrote:
> On 16/01/2025 17:53, Diederik de Haas wrote:
> > On Thu Jan 16, 2025 at 2:01 PM CET, Krzysztof Kozlowski wrote:
> >> On 15/01/2025 02:26, Peter Geis wrote:
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3328.dtsi
> >>> index 7d992c3c01ce..181a900d41f9 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> >>> @@ -903,6 +903,43 @@ u2phy_host: host-port {
> >>>  		};
> >>>  	};
> >>> =20
> >>> +	usb3phy: usb3-phy@ff460000 {
> >>> +		compatible =3D "rockchip,rk3328-usb3phy";
> >>> +		reg =3D <0x0 0xff460000 0x0 0x10000>;
> >>> +		clocks =3D <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>, <&cru=
 PCLK_USB3PHY_PIPE>;
> >>
> >> Please wrap code according to coding style (checkpatch is not a coding
> >> style description, but only a tool), so at 80.
> >=20
> > I'm confused: is it 80 or 100?
> >=20
> > I always thought it was 80, but then I saw several patches/commits by
>
> Coding style is clear: it is 80. It also has caveat about code
> readability and several maintainers have their own preference.
>
> > Dragan Simic which deliberately changed code to make use of 100.
> > Being fed up with my own confusion, I submitted a PR to=20
> > https://github.com/gregkh/kernel-coding-style/ which got accepted:
> > https://github.com/gregkh/kernel-coding-style/commit/5c21f99dc79883bd0e=
feba368193180275c9c77a
>
> That's not kernel. That's Greg...

FWIW: what Greg and Linus think/say is relevant to me.

> > So now both the vim plugins code and README say 100.
> > But as noted in my commit message:
> >=20
> >   Note that the current upstream 'Linux kernel coding style' does NOT
> >   mention the 100 char limit, but only mentions the preferred max lengt=
h
> >   of 80.
> >=20
> > Or is it 100 for code, but 80 for DeviceTree files and bindings?
>
> From where did you get 100? Checkpatch, right? Kernel coding style is
> clear, there is no discussion, no mentioning 100:
>
> "The preferred limit on the length of a single line is 80 columns. "
>
> So to be clear: all DTS, all DT bindings, all code maintained by me and
> some maintainers follows above (and further - there is caveat)
> instruction from coding style. Some maintainers follow other rules and
> that's fine.

But indeed, before Greg or Linus (likely) see it, a patch submitter
needs to convince the (subsystem) maintainer that it is an improvement.

Thanks for the clarification :-)

Cheers,
  Diederik

--6d73a8a051e9f14d4259504ef5c03823cc0e8aa06a923c553c99f8c21a2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ4vO7gAKCRDXblvOeH7b
bhJSAQDzQOoaAvVda2tvd6s9eC9C9EQKEPJB1f7eTLzoCShz1gEAkguNRpCnf6P/
QgF8sA7HBoXoKL5WcCid45Rzf1yYAwk=
=NPUv
-----END PGP SIGNATURE-----

--6d73a8a051e9f14d4259504ef5c03823cc0e8aa06a923c553c99f8c21a2d--

