Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86349C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qenKTVWyU01On6Yw6pYMBwlPmtPWnc/gnMEn7oSbyBs=; b=uD84gXArJ6kCQeEu5rrswLjmBd
	7xOV0K0cWnj/W6B0rUaiAfMyeyMsTqucY2oceNWo9x1kppZTnxBdtAsBqq7dO5w/ZbjdLrOrjKEDT
	Bv1pfRP27o5ztwp2iZAlM1a9YARjECeMoVIqPQnVexEl7HI4EGH0vzZNTpSMd0ASpQHDt+7IZBpPv
	b+5Ji1pSvdmduCtAkuyJleuwR9L2qmlde51eliaudjNEVOWCQxq+3m5NaJFh5/f8L1PbFZZKGe5w9
	pXaC9DKE5lBgUCQMYeR0geYQmdOwZ33xVULuQXeVjH9M92dUEzlbfReKQ4K46qUsVeqw5UX8iUt4q
	pTLObiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mIb-0000000Bb82-2eci;
	Thu, 24 Sep 2026 16:27:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mIa-0000000Bb7p-41pH;
	Thu, 24 Sep 2026 16:27:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11B2A601F6;
	Thu, 24 Sep 2026 16:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2911F00893;
	Thu, 24 Sep 2026 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790267271;
	bh=qenKTVWyU01On6Yw6pYMBwlPmtPWnc/gnMEn7oSbyBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IYby8l6aDvXWpdeZsYTt/jeo3Js47BSl7SbC7IGw4Kz8auUpYXHbRsRalnz/nxJQU
	 aIHG6nldUH8Ktbtoc8f9mWp51AtzNcOUzzUSE+FbE9gW3pOB5X2z9cELJLEWKVZc9V
	 aIhdf8QZLqOEpLZQGETEwGs3LKETSsEmg/AanLNfci9YU78y3/pxhzzDUOaMBXzJmB
	 aPxlWf6FwuWcMT9juIwq9RPjJJ1jkAXj9TEfOICX/j16ke5xRuIzQbwL9pPPV4d7tj
	 drFJ1h1d+MjcniAiCRxKxYV8lYf6k9DwFEjXGBHg8CAHVk4joie3g8Qq/ctTanmsqP
	 wyQX/pQzLkhXg==
Date: Thu, 24 Sep 2026 17:27:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
Message-ID: <20260924-verse-attendee-c2e7a68e4f18@spud>
References: <20260924132217.1281752-1-sander.speetjens@gmail.com>
 <20260924132217.1281752-2-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aPgkns3KRYWa2vD/"
Content-Disposition: inline
In-Reply-To: <20260924132217.1281752-2-sander.speetjens@gmail.com>
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

--aPgkns3KRYWa2vD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--aPgkns3KRYWa2vD/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVPgwAKCRB4tDGHoIJi
0oGJAQCRVhltLXItEeu6nDUP7z3EBw9Gm5wQxxOZpP0zbP8BUQEAo2HbGW7dzdql
+B8T9q4Wqx3eewFhfetPLRumDlBgOAc=
=5Lam
-----END PGP SIGNATURE-----

--aPgkns3KRYWa2vD/--

