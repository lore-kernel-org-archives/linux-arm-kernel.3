Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7EFC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ipP3kFnBl1cxLbmAISW/VKp/4wIJ90jIpMVzpvjG9g=; b=ceUNeb4CQXhS2w1AlaOuYIMGd/
	hHPQXUBPXDuenIAdjAkhzf8rLp2+1SyQqk2cThCRztbsQfnln8Nk6Gg3fEc6Z6YQQ351HfaN//SFF
	zaiVt5ZWnJlt8dR954jbE/njmIeGuen8/S0cb8yN/Xmi5evLZAVovDLxr7W2suJQmZ6Kj5mCoBnR/
	UvJFnqRfphdE/c/chRxGq+gGSjRoz8T6htD52ORlugJh7Jc1/mCh0FX26/7m/Of79Lf6zXEd6M37B
	ZTrdtzzhal+2QRMIcuUn9APCSO2QTrX97Oaryq9TrjJcGWSqgRugj3IdhXZ02CrKF9HdHDru/J2Pk
	b5h9M3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGQO-00000000BJO-1w1Y;
	Tue, 04 Feb 2025 10:45:00 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGP3-00000000BBW-25Rv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 10:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9ipP
	3kFnBl1cxLbmAISW/VKp/4wIJ90jIpMVzpvjG9g=; b=GzPVw4qJyLJyd/fbQZ7G
	uL0XNaCAeSc1FjwBXAdyx/TbqvrdPZ41HSB9TUdxoPwF/BHJVRVRgcG4oaDcNeWC
	xM84N1Ff7EXsxNck/rkvBfJb9Rvb37RLeczgc/HAM1kq3lJQATtWNveEcaRJM/co
	fT2kpE9zNAR6owBTc5yV0xZ28fj/++IqvKzUxFsS0R7S5aZLBDMSwQGchlMFqkhs
	6/qO90c9z/GqHS+s1611+UK6dd2eHVgnINEjkwKctnNJaBZTYBydPi9pjbmJHunf
	sIMbSF5xM0tDUzl3mSMC+GF7GM5XYZw1wjvPf/DLrglrfrGxGEp0zwCVaZZ2E4PV
	6g==
Received: (qmail 3006169 invoked from network); 4 Feb 2025 11:43:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Feb 2025 11:43:33 +0100
X-UD-Smtp-Session: l3s3148p1@JEQlrk4tDIm5aIpF
Date: Tue, 4 Feb 2025 11:43:32 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH 0/4] ARM: dts: at91: calao_usb: fix various naming
 problems
Message-ID: <Z6HvVDV0tE99w3od@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
 <173835855390.46028.13185945524234872285.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kuNg0v0oHwc+O7+H"
Content-Disposition: inline
In-Reply-To: <173835855390.46028.13185945524234872285.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_024338_408359_7F195C84 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--kuNg0v0oHwc+O7+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> arch/arm/boot/dts/microchip/usb_a9263.dtb: /: failed to match any schema with compatible: ['calao,usb-a9263', 'atmel,at91sam9263', 'atmel,at91sam9']

I forgot to mention there is a dependency. As I need to resend the
dependency anyhow, I will put it into the series.


--kuNg0v0oHwc+O7+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeh71AACgkQFA3kzBSg
KbZZhRAAnyOerZ2rDH0wAShdaSb2n/zw0gASiSdkVv6VgfRFgbX3S1+YuxwiWWqP
YM1OLrMBfGUSCLx9DZSy+Ph/ZxWX89BQP/NobQ76R/GCn7/7HnQNMsmobUzrDORe
UQWebxjEvbLPb/Wj8DSFC383jWV9b4/WYI8CQyU1MVQn+YsR0pACkPJGywWYegjV
Txwv5y8qqZhnUShKyAR4ZOzSMqQio8+XCjWzfQ2Ocm4kqP3P1bY1w5cx4O7D6gBk
BsoXoFMOCiscHAcHnlSLUOJflPt981FPApRJ5uS8ivscanZz2xoOqLCZHv9GkP43
oXY1XPs2k+UzRQSJN84s28L8MHNBuOG8lRV7IiQG1shgp99bhLsSw68d/lqcXnq1
a8k9sn7VXNHS8XJCGaLKjCQS04o5QI7AiS47+RV/gF1F7eiZ6ngwJQuTFFoJyPiy
zWM5EC9JLgFzxiF3U0jk4u4gP28vMZC3Idx5bZbmB1d+ejokiB9lek4S6/SvuJgB
iXrd+KzHJc7aohAiIJA8p5HcPfIlVbh5X4nXiyt6bGNskFAXfTij0wa0huecMyZm
RmvH7Xe5YBuYUArvgWDsbrk3hwQX49qi6OZsTCQ2/p2T6lzrk7g/qzu6NZbhV8Ca
Xjs2GGRde/jsy/U72N8E5UI9f3X/NutLwzkqfCXX/bqZI6SDPng=
=/aAy
-----END PGP SIGNATURE-----

--kuNg0v0oHwc+O7+H--

