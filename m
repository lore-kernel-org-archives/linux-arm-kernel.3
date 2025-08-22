Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E57CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI4S+Cfn/P10Eg8qjEHO9hXbG9rIH/PlkrXcpQyh7Po=; b=mOGMWnBMU1y0Fz8lA2q9LRZdRW
	yOcFPYT9b71WVMyUvAbMPEXFj88GSjEGgPkRU4E8y20X8t5P9ZJ0rBOZPPQc7HNoiYLeE06NPxz4z
	ucVkopaRvH4DLUGaot1iYXE/DI4arYWivDzpJXkTBf/LbnCo/KF6VLth2WQTdMLnxfgqfXeBRURjT
	yB9X/BWrLQuK6zDVGUAdhUIZlOdJdyOGsCQuURr7jy4AGlhWv13BAFeWjUZTsdiANjC32v1htYIZ7
	7q1/u5A6GUaBLegrhfA0LZQfxlIfOYdmbRF6xG0AAYzgHnwtzLioatRVH57kbNJbamZZtnmTi96I7
	ByFf8A6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upR1S-00000002Vol-0jEE;
	Fri, 22 Aug 2025 12:37:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLlI-00000001lSu-2b3H;
	Fri, 22 Aug 2025 07:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 522934391A;
	Fri, 22 Aug 2025 07:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC610C4CEF4;
	Fri, 22 Aug 2025 07:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755846032;
	bh=QI4S+Cfn/P10Eg8qjEHO9hXbG9rIH/PlkrXcpQyh7Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOFIAolKI2qMkjFwPhLSWCq221EIYCu/mID8GiikO/HQtWo0w4r+24RBu5CBpL0YO
	 X9ept7kI7u4AK2afWQIrHJOI3NUc3mlGfKiO2N1IuJp2zH+1Qp13caqO7qkbjKuOB7
	 86Fkfv1ClEbT0OM+XEUg/Q1mdYApYzcqY5uAfqIcYMBSy6ujasYV1ZoIdoMPok/8pm
	 qUZqwsKzGl8F3mA71LrLwg6T4Tuiu1FUEV+OL9nQkVFReqyyZ/i4HaAecovTors+LI
	 J+ZkT+ZIYz/AHYGsTb71UyFSt5jm8j8hGxKmeEjlkTcDsfo2dbJ7Nz+D9WLMunvNo/
	 1onFQnaa97Iwg==
Date: Fri, 22 Aug 2025 09:00:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: airoha: Add PPE support for RX wlan
 offload
Message-ID: <aKgViYI74bN1y--U@lore-rh-laptop>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
 <20250821183420.45af8077@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="onp8zdhmBvKzfJxz"
Content-Disposition: inline
In-Reply-To: <20250821183420.45af8077@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_000032_690417_2EEF1C26 
X-CRM114-Status: UNSURE (   9.96  )
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


--onp8zdhmBvKzfJxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 19 Aug 2025 14:21:05 +0200 Lorenzo Bianconi wrote:
> > Introduce the missing bits to airoha ppe driver to offload traffic rece=
ived
> > by the MT76 driver (wireless NIC) and forwarded by the Packet Processor
> > Engine (PPE) to the ethernet interface.
>=20
> Doesn't apply :( please rebase

Uhm weird, it applies cleanly on top of net-next to me
(git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git). I will
repost.

Regards,
Lorenzo

--onp8zdhmBvKzfJxz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKgVhgAKCRA6cBh0uS2t
rLaTAP0TqBnNLsXSZso8mTSrP9MFqN8++YyOP4qmvMkUNeHOwgD/eCGuV3E9W5fP
vj5pEBPHqb7A4FhFLjoa2Tl2fauFlgY=
=ig+N
-----END PGP SIGNATURE-----

--onp8zdhmBvKzfJxz--

