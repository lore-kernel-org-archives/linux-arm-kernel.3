Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD352E63CBE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaSYEp2UmSXBCH7DspOMTkZfq3AHWmmg6Ae+JLYt7ec=; b=eKJ9PriADsAaKna9m9KsMOux3M
	qiZOz99n43EAvsabYaMiKaxti5POMjQ8wtG0Xe6xBruqVpQKRIgIKNe8bq8NWfY5/vPVVM6KWK1f8
	639yM88bJnCDtl+uj5zl2P0SFhZ+Lg1hKugb9Ec0qmV79ZMI4wElyrinN4Sjn/H4Y6blzAUlRyTSm
	9qVgklJTUqwpAnPUuvtIYxHs1rIAfOx+0Tk1xtEEsY4fot1z9aeAuCoMMpe1SqvPGVM06DgRni37O
	3UcBmx4h0KQBuG6lDvyLbogUC930phKbmqi7Oe6/rXU8cGY4qB50Fq/0qmbLGA9ixVh193VAUojoy
	zKkqqg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk6m3-0000000BUm5-0gTZ;
	Sun, 25 Jan 2026 20:31:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk6m0-0000000BUle-0Ogz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 20:31:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vk6lp-0006Cb-PX; Sun, 25 Jan 2026 21:31:41 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vk6lo-002T5n-0Y;
	Sun, 25 Jan 2026 21:31:39 +0100
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E9B934D7CFD;
	Sun, 25 Jan 2026 20:31:38 +0000 (UTC)
Date: Sun, 25 Jan 2026 21:31:38 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mailhol@kernel.org, alexandre.belloni@bootlin.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] can: at91_can: fix an error handle in at91_can_probe()
Message-ID: <20260125-towering-faithful-axolotl-bebe3e-mkl@pengutronix.de>
References: <20260125120947.1997682-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ohny4f6pmfsa4ffv"
Content-Disposition: inline
In-Reply-To: <20260125120947.1997682-1-lihaoxiang@isrc.iscas.ac.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_123152_148218_F13EE206 
X-CRM114-Status: GOOD (  13.64  )
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


--ohny4f6pmfsa4ffv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] can: at91_can: fix an error handle in at91_can_probe()
MIME-Version: 1.0

On 25.01.2026 20:09:47, Haoxiang Li wrote:
> In at91_can_probe(), if devm_phy_optional_get() fails,
> the memory allocated by alloc_candev() should be freed.
> Modify the goto label to do so.
>
> Fixes: 3ecc09856afb ("can: at91_can: add CAN transceiver support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

A similar patch has just been reported, see:
https://lore.kernel.org/all/20260122114128.643752-1-zilin@seu.edu.cn/

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ohny4f6pmfsa4ffv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAml2facACgkQDHRl3/mQ
kZzVUQf/dMddQDTEMqCsbECHSaI7kMuAp/4m0wV+bzXVjfpY2wkIa7+toivtGCfz
MH2conhtvSsTpgIZVj3sxuWg4jYn65mz+XQBWD/Gi4ki8FvJzOy06/MhHt5SSV3P
uRc2/0WGHLZAqBjEPuSMF37e3gfCyoqPvIiIMRFkrZoSXG9ZkU+q7iGfveKW5XMd
jETr3IHlMkv25Iz+IaVUMQg1j/rbQNIjcqEMkdPeX8IDjbdlf7YDoI5qQ1FN2ga1
QDcJK2Cm8U3SCi25uYLv4hd9KeN1AybRaab95LV53DbF3bUAlq0CD2gq+/YQRC88
tyjY52ayT/hAnKLrDDpZqyzzZBpULQ==
=I6yb
-----END PGP SIGNATURE-----

--ohny4f6pmfsa4ffv--

