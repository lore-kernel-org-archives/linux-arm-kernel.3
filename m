Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B23AC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgZypOYLMsZoSvxAq0SfaKlg6st5urhPDZYKAy8lRcA=; b=F7rcW+uzIxgI3MR5bOnjBmXoif
	UJcB0cwJ5x8sSJIigue8wn4VB9TGAAaWQWvrcIcGjyPCrFml8Ddy+VnxkdT/M/FMxBE7654LUx7FI
	bGh/er6n2zA1qFClpcNjzYvtyQar2QHbSWUS4iqZ3YwMB2fUx7mun8xv7HPQIyE3sO/nF5341CY84
	oHEAiNwzDaWu7BwgQ85b3JrQpM+tTrzTj6kGpO/ZIjdWyAs9Lu3eps0JjXXSfriM0mZN1PwAb8iVH
	cb2OsD+4v2AKWlURnhEbDg5ZsBQocSaiIs/YzJ0VPExLL/1tuVaMIujptbAuYHAGT4fMc8sGs7vCO
	FSH8jRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG5W-00000007cDv-3rct;
	Tue, 18 Aug 2026 09:26:30 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG5T-00000007cDJ-19NH;
	Tue, 18 Aug 2026 09:26:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8B3B72010D6;
	Tue, 18 Aug 2026 11:26:24 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wwG5Q-0026Gf-1O;
	Tue, 18 Aug 2026 11:26:24 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1345F5856A3;
	Tue, 18 Aug 2026 09:26:24 +0000 (UTC)
Date: Tue, 18 Aug 2026 11:26:23 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Aswath Govindraju <a-govindraju@ti.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	Christoph Stoidner <c.stoidner@phytec.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 2/4] dt-bindings: phy: ti, tcan104x-can: Document
 Microchip MCP2542
Message-ID: <20260818-vivacious-dodo-of-piety-b0a59b-mkl@pengutronix.de>
References: <20260818091701.6441-1-wahrenst@gmx.net>
 <20260818091701.6441-3-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6i7fq3cui44vk3ry"
Content-Disposition: inline
In-Reply-To: <20260818091701.6441-3-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_022627_485536_C24AFB3C 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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


--6i7fq3cui44vk3ry
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 2/4] dt-bindings: phy: ti, tcan104x-can: Document
 Microchip MCP2542
MIME-Version: 1.0

On 18.08.2026 11:16:59, Stefan Wahren wrote:
> The Microchip MCP2542 High-speed CAN transceiver with Sleep mode is a
> pin-compatible alternative for the TI TCAN1042.

If it's compatible with the TCAN1042, why don't you add it with the
ti,tcan1042 as required fallback?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6i7fq3cui44vk3ry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaoQlMQAKCRDMOmT6rpmt
0slMAP9l7TVeexZCcKdt+RpN+BZvAFifxtKNWE3G0YvngbwCpwD5ATMKyiyaGA6X
nIUiXcCBKPn+JgKvp8D/hjUI2hlOEQ4=
=emA7
-----END PGP SIGNATURE-----

--6i7fq3cui44vk3ry--

