Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA14C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9v4SwcQ5vdA9+ouTxbt0WQiG6smmLyKCJzfw85SYFY=; b=e5OoMUO3n0nUBltH46BId21hm/
	DjC5L1vQNGq8dB62+tgxR+24WgKvbKOqi8NSCWEa0QtJtLRDkx+CffSbEr2KFWoK+KF9PVQ6uWLOW
	+KnH1Wswo469y1Fbi80U+xGWTr6JxzWKktWACv88VhHICAan98SrO9snyicVaCa6Jgzc0nlDD9+Du
	p5zH6CPbBBfAB2hzYjfFPKZ7SgDFMAGEBRsceQrKgX7YPMpd1XJXe0/ZLrwinr3/AdI9tm+XKTsdA
	7lIrr8YJv5KgZdXPKssrF1aPUGJAncvHRWjK+Pqd/rx63A1xTJ60XM5gyqdGmGzQXRH403vmJndIJ
	omcUzzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK8L-00000007Zih-1TSX;
	Tue, 18 Feb 2025 09:43:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJvw-00000007WnD-1P7j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:30:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJvu-00028g-Id; Tue, 18 Feb 2025 10:30:26 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJvu-001Yva-0p;
	Tue, 18 Feb 2025 10:30:26 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJvp-0003Ot-0Y;
	Tue, 18 Feb 2025 10:30:21 +0100
Message-ID: <be4e8fe598f8a56210154c40d8a6d973a3fbeee1.camel@pengutronix.de>
Subject: Re: [PATCH 3/5] reset: imx8mp-audiomix: Introduce active_low
 configuration option
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:30:21 +0100
In-Reply-To: <20250218085712.66690-4-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-4-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_013028_376291_986D33D5 
X-CRM114-Status: GOOD (  14.79  )
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

On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> For EARC and EARC PHY the reset happens when clearing the reset bits.
> Refactor assert/deassert function in order to take into account
> the active_low configuratin option.
                            ^
                            missing 'o'.

>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 45 ++++++++++++++-------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 6b1666c4e069..8cc0a6b58cbc 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -23,16 +23,19 @@
>  struct imx8mp_reset_map {
>  	unsigned int offset;
>  	unsigned int mask;
> +	bool active_low;
>  };
> =20
>  static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM=
] =3D {
>  	[IMX8MP_AUDIOMIX_EARC] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
>  		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +		.active_low =3D true,
>  	},
>  	[IMX8MP_AUDIOMIX_EARC_PHY] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_OFFSET,
>  		.mask	=3D IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
> +		.active_low =3D true,
>  	},
> =20
>  };
> @@ -48,48 +51,46 @@ static struct imx8mp_audiomix_reset *to_imx8mp_audiom=
ix_reset(struct reset_contr
>  	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
>  }
> =20
> -static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcd=
ev,
> -					unsigned long id)
> +static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
> +				  unsigned long id, bool assert)
>  {
>  	struct imx8mp_audiomix_reset *priv =3D to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr =3D priv->base;
> -	unsigned int mask, offset, reg;
> -	unsigned long flags;
> +	unsigned int mask, offset, active_low;
> +	unsigned long reg, flags;

Nitpick, I would make active_low bool, like assert. Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

