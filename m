Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84962C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ts3ILevWOPYqx+gXJKBFw80Ij8IEjysS1Tj+hCyd9E=; b=tRc1kRF5vwGLsyVsFZEpA2AlBx
	GR1/RK8PWS9l+0qN9ETs+OHJxD/XmAg9RuKB4erMQ7btLE9I+wcX6A28Z4qZpIrvvPUkFbWZ+p6/E
	P+ydumDHuK35REsoztPK9ttEvhQd3TCRyGXBuih55gUOHEsq99PX/FeUr4SbLBIqUESgij83N71O6
	I0t7SQ5s82rGCr37I16adbprVmF1wMyqzJUTfPtqwN0OK3pJXRYHc3Kfo4VQBAGVj//YpJzwK26Sp
	n+MFX91UtLlMP9WXjb7eXM8AvC6QosGrESgb+lhVvuUO8lBb5uBw5lnyfKXPm9MXIO2iVJE25YgnP
	lJkE2eIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzRa-00000006tfY-3uDd;
	Mon, 02 Jun 2025 07:18:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzPM-00000006tWd-2LJ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 07:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4ts3
	ILevWOPYqx+gXJKBFw80Ij8IEjysS1Tj+hCyd9E=; b=gKpj/VTDWEUb0RdiAHS/
	ax63fKQeGg2XTYEIm1BeN1RwE1lI6Q587Mra4bC8y8vgIP/IRrQHmnaisEtkSqsl
	tS+S3VLIkjcYapmcmYRoMSM5UCNJhl3X89Vpk007lmHUTi5a2EKgeMTtoVPvq4Bx
	k4MjPWFpEVEzvySiQq7YSaTkHDtjs8Vib4HH0smMMYjYy6nRXA/uQC7LWzfEM5yH
	6oN+zq4kqL5nszFnTlJRPdK/K+oxHhswwyva8xLvMRHcZ9R76KsPjNYQ/tnRJwBM
	8cTyApmfsBvVlf6O3+SK4V0FTUabO+bo+0MdY1OtHp/IhHcypCeGlPE/K9EZ3f+h
	Gg==
Received: (qmail 3287185 invoked from network); 2 Jun 2025 09:16:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2025 09:16:24 +0200
X-UD-Smtp-Session: l3s3148p1@mkeYipE2bTltKPDF
Date: Mon, 2 Jun 2025 09:16:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/8] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
Message-ID: <aD1Px6zvXnan3rq6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ZEsolx7UMbGHb56"
Content-Disposition: inline
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_001633_456229_95143250 
X-CRM114-Status: UNSURE (   7.94  )
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


--+ZEsolx7UMbGHb56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please provide your feedback.

Don't have bandwidth for a review, but I did test this series on my
G3S/SMARC with a x1 PCIe USB controller. Worked fine, I could access USB
devices with it.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--+ZEsolx7UMbGHb56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg9T8IACgkQFA3kzBSg
KbYrDw//fVqzg9qvc/j2in3DmuPNolbFXSgSdXbnHeaP64s7ZMvP1VjP7lm2xRXV
mnnKbzEvCpQqJusArmqUVao96p/Sr/PKfWLK5P+bVreIOp4JHL6B4/n3GGgWB4gY
W+pXg2OSSLXUUn84eIfR9q4ExE5NJ67LH0FucGCE2MLf69mR8JemaIOzsjcArKme
XWJwwlQ3O+VmBtOM3vbw8FPOOsh9lGyxS2Euc26Si36zsQGuKKNCAR+DumFKCTXm
cJa9heoLi/Tse5sUAXVSn1fxLkyLx5NFJNY8NtIzO8AvP3ZymGZdEH3fLVc7e0T5
CVGvrh39mKJFFWsTaEe2cazD910SmVIvHvAt7H9WOpkhxDk0Qn2Xx1KKyctO2Ktf
qwa4liCYjx7aE+Kf2zoZTc+XaAUad/rG47vIZSb7dNThe/x31LOCStVXcwbFX53i
zYGUGZ64uj4I8x7+Cv9Key/mPrwMOqtsKmc0p7jS72WrXzRpSIyMxFbYCthpEKBO
ueJFNcA/xDkCsjTW1tY2+VitZe0OL4Zi3IGunkNk2X3VL931ONqNvFe84uBcOQ2q
Ktm8IvF6zWCwBKGjuOe+DsrRA8DnSiScFvA3tlPOy0jkDFkNSL9aVrG0dH9+OLrK
oApyRKwdLFyMjCyoKyV1WOjwOv8IE5WzXCpIOrWBjj189aJMp+0=
=bmYM
-----END PGP SIGNATURE-----

--+ZEsolx7UMbGHb56--

