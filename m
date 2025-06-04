Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BB2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIUCb4+mj18vL7IVMw6tRgCs2/j5HRPHEfYTkdiaDeM=; b=LnAqYPJRS8fZ3Er+XSdcL7QtgU
	SRnkGchkFcQ2DudVe1Dx+c42cmpTNEWHR7tikroo1bnAd8bH36KxMIETWM8f8Gz0sDmaO7UecY7Kf
	3Cj/zCl191hsnD/sM5d1YMMeS8aYvfY+5BiQtbuoNaCjTSGIU2fa3hBZIIqtS1Ngca/ztJGzejTHn
	Qh//rFHtjXPQkzc72mUgRVpD49okFFcBR/gUJ59K5+fv+eImlBbzSWpVYJHUaUbrGjftwadCCL3zS
	sdE0dl9Q8l30y+vKNWaCgtgQzeQ4BEsZRKljERKAQcaPIbBR0Q+24S7gbF2R7PtGpoz+PfA+rsh+n
	1jccuJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjk1-0000000Cvlv-2af1;
	Wed, 04 Jun 2025 08:44:57 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjQX-0000000CtHd-2Tyi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 08:24:51 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749025484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kIUCb4+mj18vL7IVMw6tRgCs2/j5HRPHEfYTkdiaDeM=;
	b=AwV4yb5tbzT5syvc27hSpLLoViY4TIGoZg4e8D2mJMfFv5YY5nTSd29CLmW3612NtL140i
	EKKmgmYn7lJQj9bcUKyFbUeLHBuL2hSggdJ4FmqsbPz6RQtVJU8RU8p3CHVtfDBKOJg6di
	HtZ+awSorAM5H6wSi/9l8p9Mx/KTacLaVME0keuXQfzFd6ZqoK6kmP+MLHIBtfOP0DOUXe
	SOgr3RXz9LY3/oCGBNUva+/H/1rddijwVJMqyRxJcQ4S+VNjja1t27oNDqwPKcmF2NGdqf
	ZVwVL9XVM3ZbHrK0Jwfk2rhVhy5x/LNlI8eP0NK9YphZnaTjlMjR9Qx5XCI7bg==
Content-Type: multipart/signed;
 boundary=1972edf4972f0b592376148b0cb4a49b288a246b0dc77c2d96218fcc198e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Jun 2025 10:24:33 +0200
Message-Id: <DADLSAEF1YPO.V0CQK084KFFO@cknow.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>, "Heiko Stuebner"
 <heiko@sntech.de>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] PM / devfreq: rockchip-dfi: add support for LPDDR5
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com> <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
In-Reply-To: <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_012450_562931_65A7946C 
X-CRM114-Status: GOOD (  29.84  )
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

--1972edf4972f0b592376148b0cb4a49b288a246b0dc77c2d96218fcc198e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nicolas,

On Fri May 30, 2025 at 3:38 PM CEST, Nicolas Frattaroli wrote:
> <snip>
> Downstream has some special case handling for a hardware version where
> not just the control bits differ, but also the register. Since I don't
> know whether that hardware version is in any production silicon, it's
> left unimplemented for now, with an error message urging users to report
> if they have such a system.
> <snip>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 84 ++++++++++++++++++++++++++++--=
------
>  include/soc/rockchip/rk3588_grf.h    |  8 +++-
>  include/soc/rockchip/rockchip_grf.h  |  1 +
>  3 files changed, 73 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event=
/rockchip-dfi.c
> index 54effb63519653d20b40eed88681330983399a77..5a2c9badcc64c552303c2f55c=
52e5420dec5ffc1 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -34,15 +34,18 @@
> =20
>  /* DDRMON_CTRL */
>  #define DDRMON_CTRL	0x04
> +#define DDRMON_CTRL_LPDDR5		BIT(6)
>  #define DDRMON_CTRL_DDR4		BIT(5)
>  #define DDRMON_CTRL_LPDDR4		BIT(4)
>  #define DDRMON_CTRL_HARDWARE_EN		BIT(3)
>  #define DDRMON_CTRL_LPDDR23		BIT(2)
>  #define DDRMON_CTRL_SOFTWARE_EN		BIT(1)
>  #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
> -#define DDRMON_CTRL_DDR_TYPE_MASK	(DDRMON_CTRL_DDR4 | \
> +#define DDRMON_CTRL_DDR_TYPE_MASK	(DDRMON_CTRL_LPDDR5 | \
> +					 DDRMON_CTRL_DDR4 | \
>  					 DDRMON_CTRL_LPDDR4 | \
>  					 DDRMON_CTRL_LPDDR23)
> +#define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
> =20
>  #define DDRMON_CH0_WR_NUM		0x20
>  #define DDRMON_CH0_RD_NUM		0x24
> @@ -116,13 +119,60 @@ struct rockchip_dfi {
>  	int buswidth[DMC_MAX_CHANNELS];
>  	int ddrmon_stride;
>  	bool ddrmon_ctrl_single;
> +	u32 lp5_bank_mode;
> +	bool lp5_ckr;	/* true if in 4:1 command-to-data clock ratio mode */
>  	unsigned int count_multiplier;	/* number of data clocks per count */
>  };
> =20
> +static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *c=
trl,
> +					u32 *mask)
> +{
> +	u32 ddrmon_ver;
> +
> +	*mask =3D DDRMON_CTRL_DDR_TYPE_MASK;
> +
> +	switch (dfi->ddr_type) {
> +	case ROCKCHIP_DDRTYPE_LPDDR2:
> +	case ROCKCHIP_DDRTYPE_LPDDR3:
> +		*ctrl =3D DDRMON_CTRL_LPDDR23;
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR4:
> +	case ROCKCHIP_DDRTYPE_LPDDR4X:
> +		*ctrl =3D DDRMON_CTRL_LPDDR4;
> +		break;
> +	case ROCKCHIP_DDRTYPE_LPDDR5:
> +		ddrmon_ver =3D readl_relaxed(dfi->regs);
> +		if (ddrmon_ver < 0x40) {
> +			*ctrl =3D DDRMON_CTRL_LPDDR5 | dfi->lp5_bank_mode;
> +			*mask |=3D DDRMON_CTRL_LP5_BANK_MODE_MASK;
> +			break;
> +		}
> +
> +		/*
> +		 * As it is unknown whether the unpleasant special case
> +		 * behaviour used by the vendor kernel is needed for any
> +		 * shipping hardware, ask users to report if they have
> +		 * some of that hardware.
> +		 */
> +		dev_err(&dfi->edev->dev,
> +			"unsupported DDRMON version 0x%04X, please let linux-rockchip know!\n=
",
> +			ddrmon_ver);
> +		return -EOPNOTSUPP;

I'm guessing you mean the linux-rockchip mailing list here? If so, I
think it's better to make that explicit as 'Joe User' who may run into
this issue may not be aware of that mailing list. The 'linux' and
'rockchip' name combo is used in quite a few places.

Cheers,
  Diederik

> +	default:
> +		dev_err(&dfi->edev->dev, "unsupported memory type 0x%X\n",
> +			dfi->ddr_type);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  {
>  	void __iomem *dfi_regs =3D dfi->regs;
>  	int i, ret =3D 0;
> +	u32 ctrl;
> +	u32 ctrl_mask;
> =20
>  	mutex_lock(&dfi->mutex);
> =20
> @@ -136,8 +186,11 @@ static int rockchip_dfi_enable(struct rockchip_dfi *=
dfi)
> <snip>

--1972edf4972f0b592376148b0cb4a49b288a246b0dc77c2d96218fcc198e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEACzAAKCRDXblvOeH7b
bkQFAP9OdpwIz44YKR7NNVr+icHxXxEQIuDgPcumEG5WTaLrKwD+MC8hHdbqvimT
4XQkVUDdf7DZ/YqAZuzo8OI31a6LOA0=
=z1X1
-----END PGP SIGNATURE-----

--1972edf4972f0b592376148b0cb4a49b288a246b0dc77c2d96218fcc198e--

