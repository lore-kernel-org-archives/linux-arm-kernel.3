Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C4EE9904A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+afuylxddCzC0qlWKdr8ONiPG74QuiVnL53Ek0mUU8=; b=A8bNyZseDTol8hjZ4/1jzCktYd
	6O+EDNFZtA4B/ekLfAnR642SOgF8Kovk5jc2QBZQJUeHdUZY7C+O1Uxaj9LsUlqwXZF5Sk5uGBR2D
	mR0QN4nw8LktZJSiSn0uXw3fIO+1v7VaCCKIrY881Vv4mLtSZ0qn5/hSxkqftwK72NsHWOOq8Pejn
	DJhDQI14/cK9AhyJVGxIQwGVAzFsSg+/VoAEZmwQKGQHtkZLWwf0+vMLzkS8gYn7sSVjUMee8eikZ
	xzWhMgiC3pL+vdkLWPM2QPkChda4mz3Lt6v9jBrLpiuqQz+K2Gz4lVSqfe8T54YZiHQtsUxNLe5bS
	sl0xuW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Qe-0000000BkIs-0I4p;
	Fri, 10 Apr 2026 07:37:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6QW-0000000BkCv-1SZ5;
	Fri, 10 Apr 2026 07:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 398D143972;
	Fri, 10 Apr 2026 07:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94982C2BCB1;
	Fri, 10 Apr 2026 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775806634;
	bh=L+afuylxddCzC0qlWKdr8ONiPG74QuiVnL53Ek0mUU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W58v/jDCVmzbiO8lRxEyIcpgoP32tZO4PNUn8ztkh4iNldj9YSNYz8goQA43ylEzb
	 uyiFmdjODWRke/cKBQq97+3gWycaGn5vHV/NoQrJmfLMxo8EoG8fU+YBGfwr0CQh/M
	 VZMwFopLcpUnpwb03e6Al+mZhXauWjqugObkCK/k3cSneie+QMU6302lQ2kJcm/2r+
	 I0K+2fZK0zymB4xPUCB6o8U5+/6LC3fDjoPA8EU9JwYGv66H0wNwKFlEKF3D5lR/Rv
	 cAFMC6oUyt6yLJVmKTNYOJB+6sRtN9DrMYsrHofbLKVg1w3sRDlZ9rASGdk7KDSlnq
	 kvJv2lIL0Q58A==
Date: Fri, 10 Apr 2026 09:37:11 +0200
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
Message-ID: <adiop-9Mo4ADfvfw@lore-desk>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
 <20260409195950.74e4bc97@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NmDR2XRCUQIi1brc"
Content-Disposition: inline
In-Reply-To: <20260409195950.74e4bc97@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_003716_407095_FAA47E32 
X-CRM114-Status: GOOD (  12.15  )
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


--NmDR2XRCUQIi1brc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 06 Apr 2026 12:34:05 +0200 Lorenzo Bianconi wrote:
> > EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> > Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> > manages the traffic in a TDM manner. As a result multiple net_devices c=
an
> > connect to the same GDM{3,4} port and there is a theoretical "1:n"
> > relation between GDM ports and net_devices.
>=20
> Looks like this driver uses page pool.
> If you're sharing the same page pool across multiple netdevs
> it must not be linked to a netdev.

are you referring to slow.netdev pointer? If so, this is not set in airoha_=
eth
driver.

Regards,
Lorenzo

--NmDR2XRCUQIi1brc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCadiopwAKCRA6cBh0uS2t
rCpsAQCwzG/SFe7EZ5FhdmGC1hKji7gkM+WgbUWiUJzcKeYNpwD/UHwDushvGmqd
Qs42s/tZtg4WFpVh0jcCdmdhzxv23gI=
=dEFl
-----END PGP SIGNATURE-----

--NmDR2XRCUQIi1brc--

