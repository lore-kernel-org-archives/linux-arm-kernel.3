Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC587C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCexYxAZphjNtk85kNtdT/OWFBrAENclUMcEvbI6Hp8=; b=nwas8m4O9/XoS4/Y1QFGEc17P9
	iPF+P5s4MQUrzx603JSqsvbywPHyzhsdlPf6GPZ3xeJDrmKMETjPYlMAGS+4wudebgkdyaeHzdNEs
	ser5Bxpw77IJjkT3vB8dH1ttYEKq+9/QLy+uvpiSUXrf1ImN6BX2n1QhCO/+P3J1pLcdUBGiYo5jv
	wuIJMzcJ/8QwlZ4knM4GknrzaXn3chlf+a4Lhb/wwWmz1DeIlcxNeXLx7xJ0wFss7pfNmRO1HuZJ8
	geH/jyw9xfhy81QFHeMNYctHDUKPeaqQZb4GLy9MwEvYzda6ICk+FfBzRDVxUu7gqh8IC93o0LByf
	JOdduoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIV2X-00000004MM2-0tdV;
	Fri, 23 May 2025 16:14:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUbk-00000004IDZ-0YPp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF891A4F89F;
	Fri, 23 May 2025 15:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3FCC4CEE9;
	Fri, 23 May 2025 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748015210;
	bh=qCexYxAZphjNtk85kNtdT/OWFBrAENclUMcEvbI6Hp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7P2FK0adRcZEtddKoYec9mV81p3Swvl5i6WCIRGi8tYYYxHUkqVq8dCzuA0x9Wi6
	 hEmnzaW34tsDj6pT8MV+jocMUEfUSALbQUX0EaFrSe41+QO0b6547cgreu5s7ETjpV
	 C6XhM9rFC3oEA2sqS+Rp1Tcmi9NLxk7NaS7TkDVvSyW4Cly9FMnfLPQIPyU2ShTCCn
	 edDUeIMzHlJCFVDh2SOTcee/kcHrgsgz/zk9ll4xj1nCK3wsgZV+cSpFC1xE+q+N0s
	 5bakl4UkWCQm6ROZmTRQLH9axPY/vQjdtzQeM/j2MC/1WBPTY4JwiFyLO9HsCxbU0C
	 Fvk3LWu7EoAQQ==
Date: Fri, 23 May 2025 16:46:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: watchdog: fsl-imx-wdt: add compatible
 string fsl,ls1021a-wdt
Message-ID: <20250523-track-buckle-d230c718ea78@spud>
References: <20250522194732.493624-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uMvCA+WJjmSxZ+Ae"
Content-Disposition: inline
In-Reply-To: <20250522194732.493624-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_084652_233450_7E6B6339 
X-CRM114-Status: UNSURE (   8.47  )
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


--uMvCA+WJjmSxZ+Ae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 03:47:31PM -0400, Frank Li wrote:
> Add compatible string fsl,ls1021a-wdt for ls1021a SoC. fsl,ls1021a-wdt
> allow big-endian property.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uMvCA+WJjmSxZ+Ae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCYZQAKCRB4tDGHoIJi
0v0RAQCfArc82gj3+UAwkYXV226g+dAe9CXTF+eWnvxCctDENAEA98eUITq+VhNO
liFPMkRyW1seKULF08eLEVKDBTUEwwg=
=zIgZ
-----END PGP SIGNATURE-----

--uMvCA+WJjmSxZ+Ae--

