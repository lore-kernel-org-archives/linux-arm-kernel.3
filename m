Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CB8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUZ7MnJsj7NeVDjLs9yvbYfY4EoGMCRJRoWqd10xVsQ=; b=mSFj7egldt9fjUxG/AwsX3FFXZ
	i28foNlXHZf449bBr5S0avCxEqZCDL4oWyXsxLooESaa/ZOBZPnlfCjM8PYLzXxLIXhs+EzlbnJBM
	YlnXXttgvD9cy5/XT8H0DCyGi+InigGoJCDszzC3pwtOONuvAFC2bM5CL4r9lwmPrJzJr2AH+Hu9K
	KsOE5qJc8ngoCm73EZImY6cuCWdVXvcvv6neN/sT3VeTUrfrisjoR90jJ1ZFdOfC8Aw8mXZ1k/CFC
	NOi3Wt/ipGE1kf8D13E3kijiNaOrIeG1TbiRyJVeiK4R5+tte1XF5JOvqBgdK8lsyD9TI8gPo2OqK
	VhQZnnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYT8m-0000000Fa3r-2zfV;
	Thu, 16 Jan 2025 16:54:44 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYT7W-0000000FZwK-1CYg;
	Thu, 16 Jan 2025 16:53:28 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1737046401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VUZ7MnJsj7NeVDjLs9yvbYfY4EoGMCRJRoWqd10xVsQ=;
	b=ZcegiDNCR82PPzNPxxqBZHckY4FDwRQimQDDvMq53gJzB2YY5uAEIOtIVzmA+ohPl5ugb9
	hjCKWIO9ZT8l8RwTdNnTt4CEJOXG4vKsT0ZU1jg/kMMsBcz93h2qNcrzxvyTp/soGKcH3p
	0Ygv5UrATiEHso1hQv6N7Ew1RlsmQOmSPKlc/mrsKbg4OoMKBTZkRL40mY1KoSD+GFnjQW
	WrgE0rhZhKdI5Cc4aNMvT5pFLxsgSobCKzp6ZdMz6ZkWUXJc8HMx7SLYRiBhmhYJLapGNe
	oyt3rHraZIVe3np7oGs/qifIe0deGQvUXDRkvAY27wxLdoa+TiIYj5V2dXq6iA==
Content-Type: multipart/signed;
 boundary=dc2cece6e426855b60c44a940fefa66ea21ee45d7e4e2aac396aefe0823a;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 16 Jan 2025 17:53:09 +0100
Message-Id: <D73NJYSP62XH.28CVZPNUE21H3@cknow.org>
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
In-Reply-To: <7c7ce820-8a9b-46df-b143-f77835b7e5a0@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_085326_596714_CF4F5106 
X-CRM114-Status: GOOD (  18.54  )
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

--dc2cece6e426855b60c44a940fefa66ea21ee45d7e4e2aac396aefe0823a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jan 16, 2025 at 2:01 PM CET, Krzysztof Kozlowski wrote:
> On 15/01/2025 02:26, Peter Geis wrote:
> > Add the node for the rk3328 usb3 phy. This node provides a combined usb=
2
> > and usb3 phy which are permenantly tied to the dwc3 usb3 controller.
> >=20
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >=20
> >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 ++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3328.dtsi
> > index 7d992c3c01ce..181a900d41f9 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > @@ -903,6 +903,43 @@ u2phy_host: host-port {
> >  		};
> >  	};
> > =20
> > +	usb3phy: usb3-phy@ff460000 {
> > +		compatible =3D "rockchip,rk3328-usb3phy";
> > +		reg =3D <0x0 0xff460000 0x0 0x10000>;
> > +		clocks =3D <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>, <&cru P=
CLK_USB3PHY_PIPE>;
>
> Please wrap code according to coding style (checkpatch is not a coding
> style description, but only a tool), so at 80.

I'm confused: is it 80 or 100?

I always thought it was 80, but then I saw several patches/commits by
Dragan Simic which deliberately changed code to make use of 100.
Being fed up with my own confusion, I submitted a PR to=20
https://github.com/gregkh/kernel-coding-style/ which got accepted:
https://github.com/gregkh/kernel-coding-style/commit/5c21f99dc79883bd0efeba=
368193180275c9c77a

So now both the vim plugins code and README say 100.
But as noted in my commit message:

  Note that the current upstream 'Linux kernel coding style' does NOT
  mention the 100 char limit, but only mentions the preferred max length
  of 80.

Or is it 100 for code, but 80 for DeviceTree files and bindings?

Cheers,
  Diederik

--dc2cece6e426855b60c44a940fefa66ea21ee45d7e4e2aac396aefe0823a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ4k5dwAKCRDXblvOeH7b
bs6ZAQDC5cSmOY8vwv+LO5NC9bkBYKcOKYrtHl4S8vkXgbG8KgEA41RKLH0XXVnk
A+Y9sm1+yNIIiOhDiV/T/WwdDscZdQE=
=MbwT
-----END PGP SIGNATURE-----

--dc2cece6e426855b60c44a940fefa66ea21ee45d7e4e2aac396aefe0823a--

