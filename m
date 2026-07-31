Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C4EC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXC2Au/SZEtpbONFtZ9u2dZZF1NrvflI1A9we56preg=; b=CjQ68LTZ/7spHZsoQMkGTc8Op9
	We2jpsI9NafsB65Fg/bDLFq7OMtoJDoEnatPjaZDIhzPI75trltDq30B7oRD+cX1iC9CDqsVx7vs2
	XTp2zwM4tfFAhNt1jgQTLpSvXtP3L7Jt+kKBVe0BkcTPvVcDuhkBYabc5uTGxAUcprU8PAc1TZsRd
	/8Zv0pWmuPCWjw2wcx8UeIxGymApfu5xA1SeWjLyq4ysz6pbJUAZ7/3GlzMMB4q26fZj7ujbXiyKv
	jLm2dI0E4FOEYY7SNiN1oFVny6vBqfQhG6VvLM+Tkvnb4Jez8Hwp5l+0Md1xYJv3EWqVB9IkcHw1X
	9mwF3p2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkaR-0000000CKf8-1M7i;
	Fri, 31 Jul 2026 10:35:31 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkaM-0000000CKcf-2rqu;
	Fri, 31 Jul 2026 10:35:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 15034200060;
	Fri, 31 Jul 2026 12:35:23 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wpkaI-002CCS-37;
	Fri, 31 Jul 2026 12:35:22 +0200
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A39C8577EF6;
	Fri, 31 Jul 2026 10:35:22 +0000 (UTC)
Date: Fri, 31 Jul 2026 12:35:22 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: kernel <kernel@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-can <linux-can@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip <linux-rockchip@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v6 2/4] can: rockchip: add RK3588 CAN support
Message-ID: <20260731-precise-functional-lobster-cd779f-mkl@pengutronix.de>
References: <tencent_7BAA0052C402BFFD26291A64198084E39107@qq.com>
 <tencent_207E464D12344B3228096E23A001D6882508@qq.com>
 <20260731-tall-camouflaged-earthworm-e1a7d0-mkl@pengutronix.de>
 <tencent_A3698A465C4621E164443B0005D1CC6FAE05@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cnylr377k2yewvl7"
Content-Disposition: inline
In-Reply-To: <tencent_A3698A465C4621E164443B0005D1CC6FAE05@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_033526_872960_F7426DE5 
X-CRM114-Status: GOOD (  15.56  )
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


--cnylr377k2yewvl7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/4] can: rockchip: add RK3588 CAN support
MIME-Version: 1.0

On 31.07.2026 17:23:45, Cunhao Lu wrote:
> Hi Marc,
>
> > Can you attach the TDC to the CAN framework? See commit 5e1663810e11
> > ("can: mcp251xfd: fix TDC setting for low data bit rates"). And check if
> > CAN-FD works on the rk3588 works?
>
> Could we leave the RK3588 TDC support out of this patch series for now?

=2E.and mark the rk3588 as RKCANFD_QUIRK_CANFD_BROKEN for now? Fine with me.

> I will test whether CAN-FD works on RK3588 with TDC integrated with the
> CAN framework and report the test result. If the testing shows that it
> works, I will enable it in a separate follow-up patch.

Sounds good,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--cnylr377k2yewvl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCamx6ZwAKCRDMOmT6rpmt
0vtOAP0UQb/GCgeUljeDGPlvGiMz5FF5kTb5taLlQIf0aMF/eAD/YqQGGpp+XdXD
XNCbZNGlV/rUCLuJOo4u6txQAqLuzgY=
=7yZ/
-----END PGP SIGNATURE-----

--cnylr377k2yewvl7--

