Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F41CC55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfBtA0jkDy5RCgkFVwXvDcFImH1D7s5siBJcKlQuZro=; b=s5tqYBMBs8Sa/Q2nG5pBZeuNWW
	uxtiY3XnFTqjqT2yPDgZ7kAh30FXlO2JNIyIEPU5wkczf0tVmDNxc9ge62fSWtS2EjSh5AWOY/KV5
	dWtD0z3/YrdB5lasvyf/RpqRfkiVPwAAktEYM/XGwu+6p+b042QZ/y/tcGfoLezM4x9zHFvemglsF
	DCRFiIe4nvVztfNAGBI6TxkNJzCg/YK4y9XDeHMRdtCf09DFJDVv83QgDlsPmNpFo1B1UzEUISYv+
	s3s0J1AtoN0rd4qwQ4XfzmIMKy0QtgsJavM2dqrSj5Plum+/m+U15Bkm+M7ZeYhwX3tWICP7C/vBt
	HhF+cmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRE5-0000000Afkn-3WbE;
	Thu, 30 Jul 2026 13:55:09 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRDx-0000000Afhk-3lmR;
	Thu, 30 Jul 2026 13:55:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C862F202AC8;
	Thu, 30 Jul 2026 15:54:53 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wpRDp-0023V8-2F;
	Thu, 30 Jul 2026 15:54:53 +0200
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 682D257702E;
	Thu, 30 Jul 2026 13:54:53 +0000 (UTC)
Date: Thu, 30 Jul 2026 15:54:53 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
	Heiko Stuebner <heiko@sntech.de>, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
Message-ID: <20260730-pastel-visionary-markhor-d65094-mkl@pengutronix.de>
References: <20260730-master-v3-0-91cf030c337d@qq.com>
 <tencent_1BD50002C4093F92A6181A5D99D004949107@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isxl4fjmtnaokeil"
Content-Disposition: inline
In-Reply-To: <tencent_1BD50002C4093F92A6181A5D99D004949107@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_065502_108828_AA64B38C 
X-CRM114-Status: GOOD (  16.77  )
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


--isxl4fjmtnaokeil
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
MIME-Version: 1.0

On 30.07.2026 21:48:38, Cunhao Lu wrote:
> rkcanfd_start_xmit() advances tx_head and requests transmission even when
> can_put_echo_skb() fails. This creates a pending TX entry without the echo
> skb that the RXSTX completion path needs to match the self-received frame.
> The entry cannot be completed, and the netdev TX queue can remain stopped
> after the two-entry software FIFO fills.
>
> Do not advance tx_head or request transmission if the echo skb cannot be
> installed, and account the frame as dropped. Make can_put_echo_skb()
> consume the skb on its remaining -EINVAL error path so that callers have
> consistent skb ownership after an error.
>
> Fixes: b6661d73290c ("can: rockchip_canfd: add TX PATH")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
>
> ---
> Changes in v3:
> - Move the -EINVAL skb free into can_put_echo_skb().
> - Drop the redundant error message from rkcanfd_start_xmit().
> ---
>  drivers/net/can/dev/skb.c                    | 1 +
>  drivers/net/can/rockchip/rockchip_canfd-tx.c | 7 +++++--

Please split this and send drivers/net/can/dev/skb.c as a stand alone
patch outside of this series.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--isxl4fjmtnaokeil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCamtXqgAKCRDMOmT6rpmt
0rvpAP9S6YytcX2HrTpCKlp28NUpqpZ5Z5a4mN/fxFfQCQ1wwAEA6Gd1fREoYcPY
bE9MZJ+d8RphG0xm33x6xCkxSc13ZQw=
=yAyp
-----END PGP SIGNATURE-----

--isxl4fjmtnaokeil--

