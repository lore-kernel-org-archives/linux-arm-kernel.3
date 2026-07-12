Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41E8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYmNQeN1MMv3XCMLlgvSMjuvdlpxNtGkNTF/uC1tgH4=; b=BKdVEjOu0APvLfah7WRaSQPrPM
	CUdS7APIMKNJsNMdEOjXc4pNR3uFk7+oWdljedYkWa5jnQsg/Ymd7GO65skHxHGqtrbwaLxums/F2
	HSwKZK0xJfM88KPIcQ1JerFXRvt/nj99vgaO/H4qXH6yu+I162dOiOj+0B1vCqLozuNuIIWb6j5Sb
	VgfCD8S5DEUM9xFRrpH08wUBjFeXNxiMYyyneMAhFMbioc+VeLn9y6RChbNtgOHONUGKAh1aWQ+jJ
	ktJcTBGywWajBfSvwoXLAVrK0Ks/suECYUi12r6GtsIkAHfs9nNuutReFF2CHKROTYRXeMiHHpLBB
	ynlFSjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wixXU-00000007dFU-1Buk;
	Sun, 12 Jul 2026 17:00:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wixXR-00000007dEq-3Vft;
	Sun, 12 Jul 2026 17:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EYmNQeN1MMv3XCMLlgvSMjuvdlpxNtGkNTF/uC1tgH4=; b=Gt1Rprs4T9rS1j+zsV8bvuaMOJ
	t7HxPBa1j1m0JItJ5WHAaWmlGPpF6gFPbEzako2YaWKDyPn6RpFFl4wPFmJ1G2cHh/cWOFXV0pDy+
	7665P+rXo5HJU+a3PhPpKTFetM0t/Sa8R+4diZkHEP6hE1gveOaDX+bV/sKq6dazewNDTq8zDAvND
	gUrbd7EdSaUWOX1CMI34fTuWJRq1ENfwlklPur7u/lGYipW6uo+xYUVCTbBt2dGwB7W1/6Y4yOUUX
	m31AslFuztVTIFfri4hisKAwxoxiKZI/VKR9FTzI8FUf1R02FbZskhoHiVUbPb9ts/qLgc4If5Cif
	I0jf13Ig==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Linus Walleij <linusw@kernel.org>, huang lin <hl@rock-chips.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Sun, 12 Jul 2026 19:00:13 +0200
Message-ID: <13316226.iMDcRRXYNz@diego>
In-Reply-To: <20260706195818.3906949-5-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-5-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_100021_977971_3341566B 
X-CRM114-Status: GOOD (  18.96  )
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

Am Montag, 6. Juli 2026, 21:58:00 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Simon Glass:
> Add pinctrl support for the Rockchip RV1106, taken from the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). The IOC registers are spread across several
> blocks, addressed through per-bank offsets, with the GPIO0 block in the
> PMU. The drive strength uses the RK3568-style exponential encoding.
>=20
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>=20
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  drivers/pinctrl/pinctrl-rockchip.c | 208 +++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |   1 +
>  2 files changed, 209 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
=2Drockchip.c
> index 7e0fcd45fd26..f9cbcb955853 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c

[...]

> @@ -3310,6 +3470,7 @@ static int rockchip_set_drive_perpin(struct rockchi=
p_pin_bank *bank,
>  		ret =3D strength;
>  		goto config;
>  	} else if (ctrl->type =3D=3D RV1103B ||
> +		   ctrl->type =3D=3D RV1106 ||
>  		   ctrl->type =3D=3D RK3506 ||
>  		   ctrl->type =3D=3D RK3528 ||
>  		   ctrl->type =3D=3D RK3562 ||
> @@ -3482,6 +3643,7 @@ static int rockchip_get_pull(struct rockchip_pin_ba=
nk *bank, int pin_num)
>  				: PIN_CONFIG_BIAS_DISABLE;
>  	case PX30:
>  	case RV1103B:
> +	case RV1106:
>  	case RV1108:
>  	case RK3188:
>  	case RK3288:
> @@ -3547,6 +3709,7 @@ static int rockchip_set_pull(struct rockchip_pin_ba=
nk *bank,
>  		break;
>  	case PX30:
>  	case RV1103B:
> +	case RV1106:
>  	case RV1108:
>  	case RV1126:
>  	case RK3188:
> @@ -3843,6 +4006,7 @@ static bool rockchip_pinconf_pull_valid(struct rock=
chip_pin_ctrl *ctrl,
>  		return pull ? false : true;
>  	case PX30:
>  	case RV1103B:
> +	case RV1106:
>  	case RV1108:
>  	case RV1126:
>  	case RK3188:
> @@ -4623,6 +4787,48 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl _=
_maybe_unused =3D {
>  	.schmitt_calc_reg	=3D rv1103b_calc_schmitt_reg_and_bit,
>  };
> =20
> +static struct rockchip_pin_bank rv1106_pin_banks[] =3D {
> +	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU),

sashiko is correct here,
only pins 0-6 have drive-strength registers.

Some different setting starts at the 0x30 mark.

This should be easy to handle in rv1106_calc_drv_reg_and_bit()



> +	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0, 0x08, 0x10, 0x18),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x10020, 0x10028, 0, 0),

in theory only the first offset should be necessary here - same for the
other bank's offsets.

=46or offset-values of 0, the driver will automatically create the right,
offset increments. 8 for 4bit wide iomuxes.

See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/pinctrl/pinctrl-rockchip.c#n4344


So with the drive-strength thing fixed
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko



