Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9876AC55171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuPcQ3b0prUMMRt7129RsTrmlnHFqiswiElFHsv+geI=; b=uQZps4UborIlo4W7CYcStCfnek
	x8eicWvfugDAGOqHvOCvbWjGD/Q6lCs+dMCuKiwznVkWGDvkRf4Msh86a6PLNvvq6NkG0TacEnIF+
	9/pFsfTp0WxMF07EkZwRNk59JO0/AwVZAQf1vjbam31zSvZVwB+ezw0dYL53OAU4EWBupQ5f3Gh5U
	pf9Eer2NbW2cvEzIdcnFNPXwPPhzI3i9H0V6aCh7VGI1C17Y1Ro/NDvgP8l7+hjmC8+zJVVezJcH2
	GN84LqDdvEsroXvz/qvUzuh5RJeO5YpkB/JQ3OV6IjtpcBwigDX3Yxp9EHiL/J4Q+QqikB9Dj7jiY
	e0n1CwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiVj-0000000C3J2-1a1R;
	Fri, 31 Jul 2026 08:22:31 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiVf-0000000C3Hy-3mfg;
	Fri, 31 Jul 2026 08:22:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2D9E52021B3;
	Fri, 31 Jul 2026 10:22:24 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wpiVc-002B9e-0D;
	Fri, 31 Jul 2026 10:22:24 +0200
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C2EEA577CDD;
	Fri, 31 Jul 2026 08:22:23 +0000 (UTC)
Date: Fri, 31 Jul 2026 10:22:23 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de, 
	Heiko Stuebner <heiko@sntech.de>, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
Message-ID: <20260731-important-dingo-of-abracadabra-054a28-mkl@pengutronix.de>
References: <tencent_929320CDB8CC5402DD486A402122B7DF5606@qq.com>
 <tencent_BFFE7E8E4D7E349F32F509B7233D01FB8808@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2bsbsmil5anrrh5q"
Content-Disposition: inline
In-Reply-To: <tencent_BFFE7E8E4D7E349F32F509B7233D01FB8808@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_012228_102088_FC45AF25 
X-CRM114-Status: GOOD (  14.28  )
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


--2bsbsmil5anrrh5q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/3] can: rockchip_canfd: prevent TX stall on echo skb
 failure
MIME-Version: 1.0

On 30.07.2026 23:50:41, Cunhao Lu wrote:
> rkcanfd_start_xmit() advances tx_head and requests transmission even when
> can_put_echo_skb() fails. This creates a pending TX entry without the echo
> skb that the RXSTX completion path needs to match the self-received frame.
> The entry cannot be completed, and the netdev TX queue can remain stopped
> after the two-entry software FIFO fills.

Have you seen sashiko's reply to patch #3?

>> Should the driver only write to the hardware registers after
>> can_put_echo_skb() succeeds?

I think it's better to call the can_put_echo_skb() after the
"if (!netif_subqueue_maybe_stop())"

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2bsbsmil5anrrh5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCamxbPQAKCRDMOmT6rpmt
0kswAQDlV7wYQ0x9hzeWB3ThJBYu7HS6D0tL/LkyqJEPkxuKuwEAwmQSALVhaYdi
rI0YBtBNnxmZR5iqTe55aydOSmff0Qo=
=tlqy
-----END PGP SIGNATURE-----

--2bsbsmil5anrrh5q--

