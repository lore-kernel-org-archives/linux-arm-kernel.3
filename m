Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB80C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BbKiigODEicaiDNzx9aoa4j4mF/NM/KKv41e3U3xBE=; b=Mx5T/Zm6PZJ5Ym4OjKTzZhk0nm
	/ob6/Mw00WCZAz0SEwYX08VEpqduie5R/D4v91Mawic7TEzETpScvwhcP3YVf8QT4lBEFZoJoHBR3
	fhzb2Fo7pTV/GpNzbWm4or97sm78VCG9X0YeO+GU60i281vqT0YESgHDCwbu7FAKTlYOT8Xt7r8JZ
	sdER4st36Rpvyh/d1Shjh8CNL9yl4pGNUMA0KVzjrYPVhDCPpxYVos2jvuHek89HLkIUXg/MEmfwO
	14Ie5k3YeqFoPZYJiUtva5Oo00rrBh7FtfMPL4NCSMhGNs2DuUyPyi75K/4sKaSJC+DkfFSpuwRBP
	/JbyN2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxnl-00000006jTW-0ger;
	Tue, 10 Jun 2025 12:10:01 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxEb-00000006eYH-3YWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:33:43 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749555209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3BbKiigODEicaiDNzx9aoa4j4mF/NM/KKv41e3U3xBE=;
	b=wd5lub2M4ly/Y+UM69qrQaNtuHzWYZUNWzPhgJ5L+BRHBdHOKaSc0U7f9jrgezU99Ly57K
	Se/7+7htSTy3pxzR/F3XNjBC+6KlQzFyvaS2Hsq2Dwv69glNGtzNs0xgcmv7M5ysEPuLFb
	ReTuWft92EiA/X+iLCNyqfsuxsp6rI3axXtAqaibrzwvUJgSxgd4bvhwdrScGSIH/cvTMW
	Qd7g8i3pL8ln/exU+Cpvrs2+UUwRkmSchAOnhQf/2mAeBea66iafoPzARbtdZBf8He/iUn
	9tGmOJkuffUEr8OBmtrUjJk1ulfkeLlmgRdl5VZ0JyeA9qbGq+JYYwra2YKfqQ==
Content-Type: multipart/signed;
 boundary=784e285f5dea8c9600fc349e98833e3e9f44c336efd28cb84210aa5d2a54;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Jun 2025 13:33:25 +0200
Message-Id: <DAITK5IPG0QA.2EMB23KS83SBE@cknow.org>
To: "Peter Robinson" <pbrobinson@gmail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, "Peter Geis" <pgwipeout@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add overlay for RockPro64
 screen
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250518215944.178582-1-pbrobinson@gmail.com>
 <20250518215944.178582-2-pbrobinson@gmail.com>
In-Reply-To: <20250518215944.178582-2-pbrobinson@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_043342_023115_6319C1A0 
X-CRM114-Status: GOOD (  15.85  )
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

--784e285f5dea8c9600fc349e98833e3e9f44c336efd28cb84210aa5d2a54
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun May 18, 2025 at 11:59 PM CEST, Peter Robinson wrote:
> The Pine64 touch panel is a panel consisting of the Feiyang fy07024di26a3=
0d
> panel with a Goodix gt911 touch screen. Add a device tree overlay to
> allow the display to be easily used on the device.
>
> This was previously included in the main device tree but left disabled
> by default which still required rebuilding the DT to use the device, now
> overlays can go upstream the overlay is the best way to handle the
> add on devices.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |  9 ++
>  .../dts/rockchip/rk3399-rockpro64-screen.dtso | 89 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.=
dtso
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 3e8771ef69ba1..c7b13bff3ac20 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -77,6 +77,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rock-pi-4c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rock960.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64-v2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64-screen.dtso

``s/rk3399-rockpro64-screen.dtso/rk3399-rockpro64-screen.dtbo``

Cheers,
  Diederik

>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-sapphire.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-sapphire-excavator.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399pro-rock-pi-n10.dtb
> @@ -209,6 +210,14 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-puma-haikou-=
haikou-video-demo.dtb
>  rk3399-puma-haikou-haikou-video-demo-dtbs :=3D rk3399-puma-haikou.dtb \
>  	rk3399-puma-haikou-video-demo.dtbo
> =20
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64-screen.dtb
> +rk3399-rockpro64-screen-dtbs :=3D rk3399-rockpro64.dtb \
> +	rk3399-rockpro64-screen.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64-screen.dtb
> +rk3399-rockpro64-v2-screen-dtbs :=3D rk3399-rockpro64-v2.dtb \
> +	rk3399-rockpro64-screen.dtbo
> +
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf5-vz-2-uhd.dtb
>  rk3568-wolfvision-pf5-vz-2-uhd-dtbs :=3D rk3568-wolfvision-pf5.dtb \
>  	rk3568-wolfvision-pf5-display-vz.dtbo \
> <snip>

--784e285f5dea8c9600fc349e98833e3e9f44c336efd28cb84210aa5d2a54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEgYCQAKCRDXblvOeH7b
bpDlAP42dz1RokCahWYcKFjBZeZ82YRBLCv2WWK9segBBQ42mAD9GwubVa32FumV
yuonJTRt3xHaFfm2Dhc1UTppyeq1Wgo=
=HBM1
-----END PGP SIGNATURE-----

--784e285f5dea8c9600fc349e98833e3e9f44c336efd28cb84210aa5d2a54--

