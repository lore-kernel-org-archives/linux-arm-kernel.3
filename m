Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6FDC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZnEEppvN+5ZXENvdwQwxEP/i9zLlRLGORxzucL/TZg=; b=DmhA1eAvK+e4reNDqDW4JjZQoA
	rHvfBmPnGvEcO24u1t1A+jCFjs73HxpK036+MkB0Lj96+H2czo6dBfMLAFzPSS9WpH2UmaGDp9ZIW
	ZuyEyScIEWSPl2XpNkFQLAAgxBKzDw2C9MdW+bLiVaQ3tllNV13oACb9vX31MSvh/lN7jYxk4HCE9
	x7ZVl9MODRAgAhMN4yRNCJ6n3j0lutuQw+U7wYRxjQbCB+XchPwKDmdKs28nztnKb8pq5fDCibO+p
	N/VLuUdNI6Kg9TAxLP+0FAaq1if+CCCtHeJsyXUst1OF83/c+U3MoHWlnnpka6/dK7wjD7JUf5neB
	oqYjhI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjy0Y-000000042yA-3eB4;
	Mon, 17 Feb 2025 10:05:46 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxoP-000000040HE-1iQ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sZnE
	EppvN+5ZXENvdwQwxEP/i9zLlRLGORxzucL/TZg=; b=OC2nfi7HRutBmlYALE3T
	gDHUFhmxy/BuqKGGrJ976ZDgnXLCUu8g2Sv12otaRczwj8wHBVQKinS7nQio3yat
	MBROAbvSs0xa4zte/W2mNX+/u/kj43ySWLYnQIMYSQQxflgzf7QdRKyGB9I1xMg+
	PNw7kY/LexIk50ZW3H6asQIgaIvTLSzVYfgxuM52ovMJgyOG7RyrB2MSXJgUC82/
	lmp4iR8no9zMOuav/igAHTJ2zYfGf+yqDyu34FbtnbOegij9dGXroEUWgBAYBolR
	fW/VNhALpecIrr4wwuBKka6ivs2NPBSoeYj0T2xIYXLIIzwItkQNfFndfdk/C9P4
	Lg==
Received: (qmail 3241275 invoked from network); 17 Feb 2025 10:53:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2025 10:53:06 +0100
X-UD-Smtp-Session: l3s3148p1@DcitfVMuTsYujnvP
Date: Mon, 17 Feb 2025 10:53:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 0/4] ARM: dts: at91: calao_usb: fix various naming
 problems
Message-ID: <Z7MHAdHTaituyg2w@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh@kernel.org>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
 <7e966eea-e2e7-4fd4-bc6e-67fd49c57ddd@tuxon.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdPuI6c7IgJyvMFw"
Content-Disposition: inline
In-Reply-To: <7e966eea-e2e7-4fd4-bc6e-67fd49c57ddd@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_015314_316289_6D359163 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--pdPuI6c7IgJyvMFw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> For this, I'll be waiting a follow up on
> https://lore.kernel.org/all/20250131162713.33524-2-wsa+renesas@sang-engineering.com/

I have the patches ready. Will send v2 after I rebased on top of your
at91-next tree.

> These were applied to at91-dt, thanks!

Thank you!


--pdPuI6c7IgJyvMFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmezBv4ACgkQFA3kzBSg
KbbxghAAqLEKBP1Xr517csCtpxYcrb3Xt/NVAlZi/2wANuLBzYofJ/jVEckoEsDo
e0Aj7kt9RB+Ud2A7UnhUgm9eD8UHvzmYTEFoh8c3EwDAd751CjQky7h+jZgn9n8c
yJuRE77MuHyV982btSC48p4wNMwre+mTQ+36zIx5ElnrzwnPyCdm0C+R6ALx6USU
ZOxnHglIr+Flow0/SlhQ1g3HHomLxEX+JKYifiqN3jSJ1PF+qMblyPe1WGe/2tfo
LS/9uphcoqdYGxW65L3CihnnFZecjIEbfbcTS1WR83YeNAbnB8Cl1YRC0yKLZT/M
aiGgsWzMJ4apqpPd8g/HLaRlf/R8HR8iesSfb16e9rvULrF20baooOuukstuZk1q
+o8SnU7bClkSHe+LBkaNU0RDrmcrVWOw5AFcKPswXE33etRD8HsyAEg74P+/I0Ep
SSGe++WlyAKLwxxMs+fXwdljVwbv+xfzZxEMmxMbAmeQK37u6qNHNkikeEY8g8Y5
cgkHRx+KpUMP5ZlDcZz5fkyaIo2YHfrH5YgmCAS1UN7dk88VGb0r+TrLfin3uihT
+tuZhlgzbzlhlOmEQSeM0yazbIrRQf9/OIophEZTvy582tl9piYqeXvGCAIQbFa/
fAKuftxQuTrktC8Sjzip1/+fD35cTN/mDFoWClqb9MCXks9VHaU=
=fcWg
-----END PGP SIGNATURE-----

--pdPuI6c7IgJyvMFw--

