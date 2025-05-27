Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162A8C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTDYVT4Fm2T/lUtc/RI1uCV4AArghUhC34ZH/UVhh9M=; b=hmq/kaQWXjd6cNNSly78p2gaH+
	rYNa7jVkh6Al/OHjwdngWDXvnbq/Rvz71bcYjMnClRgF/gtD1xSWW8o/ds1dSP8K2tvX9VrP2l0TB
	5VSE8f4Gg6vkm5B/5Rv9Dvp0SDLcr0Xy3A3ZjEsksL1C7b06XLDCj+BfJyKLfNnlJlN5cj108aWNz
	DmzgNR5ylsXuq/NqeMMYbwBSM3x+v2icQGihvD/5KpZGR5QVB4KFsMhVfa07oho/jMAsmt1qaOG0t
	3gVNeBwlqUCOOY2ykYOrEmrcCBQjPjfH9WlDuvQSNrTs4d/Ve3jccsmKUnEhLl0LU+qGXKonHy7U3
	VkmLmKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsea-0000000AbLY-0NFY;
	Tue, 27 May 2025 11:39:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJscQ-0000000Ab0Q-1PnJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 11:37:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uJscK-0006US-6f; Tue, 27 May 2025 13:37:12 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uJscI-000PZg-1p;
	Tue, 27 May 2025 13:37:10 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 3364C41A77F;
	Tue, 27 May 2025 11:37:10 +0000 (UTC)
Date: Tue, 27 May 2025 13:37:09 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/4] net: can: rockchip: add can for RK3576 Soc
Message-ID: <20250527-sage-python-of-variation-1c7759-mkl@pengutronix.de>
References: <20250526062559.2061311-1-zhangqing@rock-chips.com>
 <20250526062559.2061311-4-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wm5rma25slqeowsj"
Content-Disposition: inline
In-Reply-To: <20250526062559.2061311-4-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_043718_529232_8AF3FDBE 
X-CRM114-Status: GOOD (  32.35  )
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


--wm5rma25slqeowsj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 3/4] net: can: rockchip: add can for RK3576 Soc
MIME-Version: 1.0

Hey,

here's a partial review.

On 26.05.2025 14:25:58, Elaine Zhang wrote:
> Is new controller, new register layout and Bit position definition:
> Support CAN and CANFD protocol, ISO 11898-1
> Support transmit or receive error count
> Support acceptance filter, more functional
> Support interrupt and all interrupt can be masked
> Support error code check
> Support self test\silent\loop-back mode
> Support auto retransmission mode
> Support auto bus on after bus-off state
> Support 2 transmit buffers
> Support Internal Storage Mode
> Support DMA
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../net/can/rockchip/rockchip_canfd-core.c    | 453 ++++++++++++++++++
>  drivers/net/can/rockchip/rockchip_canfd-rx.c  | 111 +++++
>  drivers/net/can/rockchip/rockchip_canfd-tx.c  |  27 ++
>  drivers/net/can/rockchip/rockchip_canfd.h     | 267 +++++++++++
>  4 files changed, 858 insertions(+)
>=20
> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net=
/can/rockchip/rockchip_canfd-core.c
> index c21ca4c1fb9a..92e260cb2527 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -31,6 +31,8 @@ static const char *__rkcanfd_get_model_str(enum rkcanfd=
_model model)
>  		return "rk3568v2";
>  	case RKCANFD_MODEL_RK3568V3:
>  		return "rk3568v3";
> +	case RKCANFD_MODEL_RK3576:
> +		return "rk3576";
>  	}
> =20
>  	return "<unknown>";
> @@ -176,6 +178,30 @@ static void rkcanfd_get_berr_counter_corrected(struc=
t rkcanfd_priv *priv,
>  		    !!(reg_state & RKCANFD_REG_STATE_ERROR_WARNING_STATE));
>  }
> =20
> +static void rk3576canfd_get_berr_counter_corrected(struct rkcanfd_priv *=
priv,
> +						   struct can_berr_counter *bec)
> +{

Is the rk3576 affected by this problem?

> +	struct can_berr_counter bec_raw;
> +	u32 reg_state;
> +
> +	bec->rxerr =3D rkcanfd_read(priv, RK3576CANFD_REG_RXERRORCNT);
> +	bec->txerr =3D rkcanfd_read(priv, RK3576CANFD_REG_TXERRORCNT);
> +	bec_raw =3D *bec;
> +
> +	if (!bec->rxerr && !bec->txerr)
> +		*bec =3D priv->bec;
> +	else
> +		priv->bec =3D *bec;
> +
> +	reg_state =3D rkcanfd_read(priv, RKCANFD_REG_STATE);
> +	netdev_vdbg(priv->ndev,
> +		    "%s: Raw/Cor: txerr=3D%3u/%3u rxerr=3D%3u/%3u Bus Off=3D%u Warning=
=3D%u\n",
> +		    __func__,
> +		    bec_raw.txerr, bec->txerr, bec_raw.rxerr, bec->rxerr,
> +		    !!(reg_state & RK3576CANFD_REG_STATE_BUS_OFF_STATE),
> +		    !!(reg_state & RK3576CANFD_REG_STATE_ERROR_WARNING_STATE));
> +}
> +
>  static int rkcanfd_get_berr_counter(const struct net_device *ndev,
>  				    struct can_berr_counter *bec)
>  {
> @@ -206,6 +232,11 @@ static void rkcanfd_chip_interrupts_disable(const st=
ruct rkcanfd_priv *priv)
>  	rkcanfd_write(priv, RKCANFD_REG_INT_MASK, RKCANFD_REG_INT_ALL);
>  }
> =20
> +static void rk3576canfd_chip_interrupts_disable(const struct rkcanfd_pri=
v *priv)
> +{
> +	rkcanfd_write(priv, RK3576CANFD_REG_INT_MASK, RK3576CANFD_REG_INT_ALL);
> +}
> +
>  static void rkcanfd_chip_fifo_setup(struct rkcanfd_priv *priv)
>  {
>  	u32 reg;
> @@ -220,6 +251,72 @@ static void rkcanfd_chip_fifo_setup(struct rkcanfd_p=
riv *priv)
>  	netdev_reset_queue(priv->ndev);
>  }
> =20
> +static void rk3576canfd_chip_fifo_setup(struct rkcanfd_priv *priv)
> +{
> +	u32 ism =3D 0, water =3D 0;

no need to init as 0

> +
> +	ism =3D RK3576CANFD_REG_STR_CTL_ISM_SEL_CANFD_FIXED;
> +	water =3D RK3576CANFD_ISM_WATERMASK_CANFD;
> +
> +	/* internal sram mode */

personally I would prefer:

reg_ism =3D FIELD_PREP(RK3576CANFD_REG_STR_CTL_ISM_SEL,
                    RK3576CANFD_REG_STR_CTL_ISM_SEL_CANFD_FIXED) |
          RK3576CANFD_REG_STR_CTL_STORAGE_TIMEOUT_MODE;

> +	rkcanfd_write(priv, RK3576CANFD_REG_STR_CTL,
> +		      (FIELD_PREP(RK3576CANFD_REG_STR_CTL_ISM_SEL, ism) |
> +		      RK3576CANFD_REG_STR_CTL_STORAGE_TIMEOUT_MODE));

reg_water =3D RK3576CANFD_ISM_WATERMASK_CANFD;

> +	rkcanfd_write(priv, RK3576CANFD_REG_STR_WTM, water);
> +	WRITE_ONCE(priv->tx_head, 0);
> +	WRITE_ONCE(priv->tx_tail, 0);
> +	netdev_reset_queue(priv->ndev);
> +}
> +
> +static int rk3576canfd_atf_config(struct rkcanfd_priv *priv, int mode)

With the proposed cleanup, this will become a void function.

> +{
> +	u32 id[10] =3D {0};

What's the use of this array?

> +	u32 dlc =3D 0, dlc_over =3D 0;
> +
> +	switch (mode) {

It's called with RK3576CANFD_REG_ATFM_MASK_SEL_MASK_MODE only...

> +	case RK3576CANFD_REG_ATFM_MASK_SEL_MASK_MODE:
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF0, id[0]);

why not call it with 0x0?

> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF1, id[1]);

create:

#define RK3576CANFD_REG_ATF(n) (0x700 + (n) << 2)

and use a for loop

> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF2, id[2]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF3, id[3]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF4, id[4]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM0, RK3576CANFD_REG_ATFM_ID);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM1, RK3576CANFD_REG_ATFM_ID);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM2, RK3576CANFD_REG_ATFM_ID);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM3, RK3576CANFD_REG_ATFM_ID);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM4, RK3576CANFD_REG_ATFM_ID);
> +		break;
> +	case RK3576CANFD_REG_ATFM_MASK_SEL_LIST_MODE:
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF0, id[0]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF1, id[1]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF2, id[2]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF3, id[3]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF4, id[4]);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM0, id[5] | RK3576CANFD_REG_ATF=
M_MASK_SEL);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM1, id[6] | RK3576CANFD_REG_ATF=
M_MASK_SEL);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM2, id[7] | RK3576CANFD_REG_ATF=
M_MASK_SEL);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM3, id[8] | RK3576CANFD_REG_ATF=
M_MASK_SEL);
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATFM4, id[9] | RK3576CANFD_REG_ATF=
M_MASK_SEL);
> +		break;
> +	default:
> +		rkcanfd_write(priv, RK3576CANFD_REG_ATF_CTL, RK3576CANFD_REG_ATF_CTL_A=
TF_DIS_ALL);
> +		return -EINVAL;
> +	}
> +
> +	if (dlc) {
> +		if (dlc_over)

both are 0, please remove the dead code

> +			rkcanfd_write(priv, RK3576CANFD_REG_ATF_DLC,
> +				      dlc | RK3576CANFD_REG_ATF_DLC_ATF_DLC_EN);
> +		else
> +			rkcanfd_write(priv, RK3576CANFD_REG_ATF_DLC,
> +				      dlc | RK3576CANFD_REG_ATF_DLC_ATF_DLC_EN |
> +				      RK3576CANFD_REG_ATF_DLC_ATF_DLC_MODE);
> +	}
> +	rkcanfd_write(priv, RK3576CANFD_REG_ATF_CTL, 0);
> +
> +	return 0;
> +}
> +
>  static void rkcanfd_chip_start(struct rkcanfd_priv *priv)
>  {
>  	u32 reg;
> @@ -285,6 +382,68 @@ static void rkcanfd_chip_start(struct rkcanfd_priv *=
priv)
>  		   rkcanfd_read(priv, RKCANFD_REG_MODE));
>  }
> =20
> +static void rk3576canfd_chip_start(struct rkcanfd_priv *priv)
> +
> +{
> +	u32 reg;
> +
> +	rkcanfd_chip_set_reset_mode(priv);
> +
> +	/* Receiving Filter: accept all */
> +	rk3576canfd_atf_config(priv, RK3576CANFD_REG_ATFM_MASK_SEL_MASK_MODE);
> +
> +	/* enable:
> +	 * - CAN_FD: enable CAN-FD
> +	 * - AUTO_RETX_MODE: auto retransmission on TX error
> +	 * - COVER_MODE: RX-FIFO overwrite mode, do not send OVERLOAD frames
> +	 * - RXSTX_MODE: Receive Self Transmit data mode
> +	 * - WORK_MODE: transition from reset to working mode
> +	 */

please adjust the comments

> +	reg =3D rkcanfd_read(priv, RKCANFD_REG_MODE);
> +	priv->reg_mode_default =3D reg | RKCANFD_REG_MODE_WORK_MODE;
> +
> +	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK) {
> +		priv->reg_mode_default |=3D RKCANFD_REG_MODE_LBACK_MODE;
> +		rkcanfd_write(priv, RK3576CANFD_REG_ERROR_MASK,
> +			      RK3576CANFD_REG_ERROR_MASK_ACK_ERROR);
> +	}
> +
> +	/* mask, i.e. ignore:
> +	 * - TIMESTAMP_COUNTER_OVERFLOW_INT - timestamp counter overflow interr=
upt
> +	 * - TX_ARBIT_FAIL_INT - TX arbitration fail interrupt
> +	 * - OVERLOAD_INT - CAN bus overload interrupt
> +	 * - TX_FINISH_INT - Transmit finish interrupt
> +	 */
> +	priv->reg_int_mask_default =3D RK3576CANFD_REG_INT_RX_FINISH_INT;

please adjust the comments

> +
> +	/* Do not mask the bus error interrupt if the bus error
> +	 * reporting is requested.
> +	 */
> +	if (!(priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING))
> +		priv->reg_int_mask_default |=3D RKCANFD_REG_INT_ERROR_INT;
> +
> +	memset(&priv->bec, 0x0, sizeof(priv->bec));
> +
> +	priv->devtype_data.fifo_setup(priv);

Why do you need a callback here? You're already know you're a
rk3576canfd, here.

> +
> +	rkcanfd_write(priv, RK3576CANFD_REG_AUTO_RETX_CFG,
> +		      RK3576CANFD_REG_AUTO_RETX_CFG_AUTO_RETX_EN);
> +
> +	rkcanfd_write(priv, RK3576CANFD_REG_BRS_CFG,
> +		      RK3576CANFD_REG_BRS_CFG_BRS_NEGSYNC_EN |
> +		      RK3576CANFD_REG_BRS_CFG_BRS_POSSYNC_EN);
> +
> +	rkcanfd_set_bittiming(priv);
> +
> +	priv->devtype_data.interrupts_disable(priv);
> +	rkcanfd_chip_set_work_mode(priv);
> +
> +	priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> +
> +	netdev_dbg(priv->ndev, "%s: reg_mode=3D0x%08x\n", __func__,
> +		   rkcanfd_read(priv, RKCANFD_REG_MODE));
> +}
> +

more later...

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--wm5rma25slqeowsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmg1o+IACgkQDHRl3/mQ
kZwlcAgAp0JdNemXDYJQP2NtGDnnNFQoPnjeNpkF+YvkXizqgIxjzLfewpIZf3Be
MA2WfFN/ewOwBAX7TrBfWAoCiRqc4mdHlupNO5VrKflNq4cQXRkbSoB9Q2xl3SQX
VFTUeyJDd5i/N1kGYa8iXDVQ5I3T9eNjlCmKqP9PwrXkQHAyKlfu17u1nW7Uf4GS
h8ebrFhb5FlTtanZY5+GL7Qlngg0lEaYdqcvOx0JyepgNugewSmTcWf1QSUnwx7h
bQF4IoVm12zELwQRPalBgC2qX/nwXeZKOi1i4GTzVMZvqqPSba7JOMYgnCNZagK3
AHtBIhG91hPtC0ykR3IYV3LbR3SWcg==
=wAW9
-----END PGP SIGNATURE-----

--wm5rma25slqeowsj--

