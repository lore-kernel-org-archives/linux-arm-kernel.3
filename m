Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A762FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peYayiw1Pcm7s0g14z10cDJ8yjfXjHJS8Eoterahf1w=; b=pM/wB+NBt/2iXOCC3yaOZEMIVv
	wNNTdTheLW2QOSdGJl9M55DPnLV7nFExJet7w7KNa4S1NyIGJii5qdMM7YAq3JsWPbND2CJPOzrwB
	wH3JicTE/7afwXqfGXjfB7+dbTTyHrZ1YbJ7qM0sIP6LlRTLOLOxdw4jkJbLTnPRq7NzGhOedKc04
	Lqx3LeBgS6t6cZGgCIytbvTZyvkKPrWQ3vuSz36E4pJEvEVN65ub0HJfxHMbuOOGQOasUvVNO95zX
	sBv5l3wYZ6anfrr2YzlF7Y5nAqlFPr3dtk8qxJQWvEbJjXKRx88cp68elS5nPUUscbD1RbtVVMoVN
	fD9NNPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9uD-00000006yJV-3Cqe;
	Wed, 12 Feb 2025 10:23:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9aZ-00000006uT4-2ZqY;
	Wed, 12 Feb 2025 10:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7883AA41B5A;
	Wed, 12 Feb 2025 10:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF3EC4CEDF;
	Wed, 12 Feb 2025 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739354606;
	bh=5nIGClIepa3vn8Kx0AIIOulxeLtJZx+xFkAW9HB1GUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqHoJraiptilXADmxS1SNDibvf5crLWII9M2ufZI3e4Z2XrwTmbv6qisVhe45f93S
	 lrwsDxa6P8OJPIhUXN7nRDvl+598EkGzmOq3/dyQeweypW1YNDh9aodQTV0LkXc/Em
	 wFUmaV3ig8z5Ge6TIdC2UtGOdPtyDV0xTqdGFBOD7vWzzm257JI6/yXi3ccrmWkecp
	 fx1b3McW81oKzUOUdv8gn2/e+hDKR3ZG5oVd7g10HBhkZKJfZK/tdbYfP6iHd6ytCr
	 njiagqgMKdmwhh/Rqi9Lu9Gr4m7WMuoHEOUbz4bIkwY2fX5jZYTqMjkx9PFBFoforC
	 NQT/mujTJuMMw==
Date: Wed, 12 Feb 2025 11:03:24 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] Enable TSO for DSA ports on Airoha EN7581
 SoC
Message-ID: <Z6xx7AwglUEt_9J0@lore-desk>
References: <20250212-airoha-fix-tso-v1-0-1652558a79b4@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9tnhGwKobYJn02N"
Content-Disposition: inline
In-Reply-To: <20250212-airoha-fix-tso-v1-0-1652558a79b4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020327_717460_6D94F4D7 
X-CRM114-Status: GOOD (  12.17  )
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


--K9tnhGwKobYJn02N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add missing vlan_features configuration to enable TSO/Scatter Gather for
> airoha_eth lan ports.
> Fix checksum configuration for TSO packets with cloned headers.
>=20
> ---
> Lorenzo Bianconi (2):
>       net: airoha: Fix TSO support for header cloned skbs
>       net: airoha: Enable TSO/Scatter Gather for LAN port
>=20
>  drivers/net/ethernet/mediatek/airoha_eth.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> ---
> base-commit: 4e41231249f4083a095085ff86e317e29313c2c3
> change-id: 20250211-airoha-fix-tso-44a6f9cb14c0

Hi,

I figured out I am missing a patch in this series, please drop it, I will
repost. Sorry for the noise.

Regards,
Lorenzo

>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--K9tnhGwKobYJn02N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6xx6wAKCRA6cBh0uS2t
rJm3AQDXbXlIcf436GJupafNCG7ANsY51fU/rVvITbR48Yhd4wEA766hQ2x5T3rJ
s/ksDQ/sB+rrQKgeQJ9wUZu2gGC2FQM=
=bCuL
-----END PGP SIGNATURE-----

--K9tnhGwKobYJn02N--

