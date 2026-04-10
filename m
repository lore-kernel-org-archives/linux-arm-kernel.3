Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2858E9907F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efZPYGaK0Qk1kuXGiCrPaA7LV0wmuHFUZ8/kjzOSrmQ=; b=NBscDaLTHseD5+3QHn4MTow0Cy
	a/wZIgq9/5QcO4k4bkwuSja3o/yMRhL7qsMmBLctYZE72qpLcmKg8Wb7ZppPmg9VA5F2Ap6lHESgB
	MMfRwdGlniRAp5+RRAbJq7laFx4FFzZzb/8H/qzhV1FHOoCayjsV7S/ma8tPyEGVI44GNssDkl60b
	sMAhNoH/GHZyK1nhUXmFjSlgbS1srrtACBh8C/ixqWkpj7+3JLNw1koQpNebKM0cqkdjfskxhdsmy
	slmPv/39BdEEAJuVE4lRv1haXHbZ/gmsuuvuMRMlcLd2kX5NkgY4J+sN0Fr69CP4duv/5DkyU1h4N
	P20XduLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9H9-0000000C16H-1uHL;
	Fri, 10 Apr 2026 10:39:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9H7-0000000C15t-2KUU;
	Fri, 10 Apr 2026 10:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2EAF40945;
	Fri, 10 Apr 2026 10:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0AEC19421;
	Fri, 10 Apr 2026 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775817584;
	bh=efZPYGaK0Qk1kuXGiCrPaA7LV0wmuHFUZ8/kjzOSrmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mt7HkuUxnn8sc44z2lZodnzAhebUi6C72VQRdpnHBhONc9PTvfyjZOxObbJ7Hu0as
	 EM/YrtAW3H5E/nUHtzkd1vapxnIuNqU0kQ21dReehFXy5LpIvLB6YnZtMzAHMYNFw6
	 e25JBfyMlnBy45FD+5YxMUrUkktGv5p1LUIWqliNL0V6/56uXj3/ciEzr8+JCDNcQw
	 fXyjyf0KyEdFKw3BWpAlbLYHW21ArOjBoeIFHe1349c+0giLHL+qCK0nsf8rVGwoUP
	 Pz5PLb/2+UMKV7BIkDroLGT/CZv1SVNwf6ZBKzgOjBSy1zvFFkRIuNDyr6RKw+7vjd
	 2sDUK9rkBToyg==
Date: Fri, 10 Apr 2026 12:39:42 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next v3 00/12] net: airoha: Support multiple
 net_devices connected to the same GDM port
Message-ID: <adjTbn415fwqUfsD@lore-desk>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
 <20260409195645.16c68979@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9OsCBHIk5k9xxPwx"
Content-Disposition: inline
In-Reply-To: <20260409195645.16c68979@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_033945_639854_BB667D17 
X-CRM114-Status: GOOD (  11.32  )
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


--9OsCBHIk5k9xxPwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 09, Jakub Kicinski wrote:
> On Mon, 06 Apr 2026 12:34:05 +0200 Lorenzo Bianconi wrote:
> > EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> > Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> > manages the traffic in a TDM manner. As a result multiple net_devices c=
an
> > connect to the same GDM{3,4} port and there is a theoretical "1:n"
> > relation between GDM ports and net_devices.
>=20
> Still waiting for the device tree review. I'm going to blindly send out
> the Sashiko review, please comment if any of it makes sense?

ack, I will do.

Regards,
Lorenzo

--9OsCBHIk5k9xxPwx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCadjTbgAKCRA6cBh0uS2t
rLAHAP9fr+xJrviNMbREuUyGBcQn8ZW1o1zADHVS56b5PvPSqQEAqbJlkikpGNEo
lCdL4qOdlPlnY1xlLOhPWxXH/kMt1AI=
=HygG
-----END PGP SIGNATURE-----

--9OsCBHIk5k9xxPwx--

