Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF4ACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNZ6MNgNe6DTC6umS3HtJSWu9ADNgF1DDrQJmprEDdQ=; b=aHM5hPl1Tx7sunvGb4/4Qr0oTf
	IIpw/gOxXF9upMTfR4JNY9iaCthP8Gs/aoZorZmzoTUN+CFQOnKgTngsd09y3jOmVpEM+vxpv3egf
	/7KF/Qdbu4Er4oW1mxGBvMQ52cB5ODcMkAbdj+JgTEIPpScVhwg9/9e3VYT+4K8GFpHioQOMmDGZB
	KVstkeaS84PqABRsvrDQye69JdhHP2B0hoDMzCid5bswFgsYaAWvl4/qizNRMoP9t9tlEh7xayzJz
	jU4F7Zigd/QhJe1KGEjOo+FbqpDpCV9CUIOV/WxOSo6Wd014f7IOaMgmFCEdP2qIrOt3UVcyqvAXw
	nnSBHa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ptp-00000003VoS-3qKg;
	Wed, 08 Oct 2025 08:51:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ptn-00000003Vo0-3Xmk;
	Wed, 08 Oct 2025 08:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 270A744F06;
	Wed,  8 Oct 2025 08:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF27C4CEF4;
	Wed,  8 Oct 2025 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759913511;
	bh=61um9Z5Z7w5C/Y58XBFy7nF1UiQ4Fnu9RxUx6QSY6KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3oyHJ7+KXvjNYGV5Fw5uVcZFR4+Dfis8w+SPAoiZeuT8CCSZL72C2ZNT3XnM4X8l
	 bMhevnQ5KyKzsRfHNt71zpptisC15rsjIIVAi44gIS8E+I0zCDW0F5QQp7+YRDPe7P
	 3p/GVPIThd97flfhMDWetR/RZPXHyyH8WnYDZLNSTrr1t3q30iQ7Uc9C+OJ3Ht4ceR
	 oUnpFEg+pPQukM9ywLeLLtY8oFRmhyYSCRrSpBgapEjIH4KoxfdmTGYRM+aW5WIlvP
	 mtT6GEgD+CPMnSYQcM8WC2uX3nk8dTLheOOCm76VDI0mG2CzeRolDurjExgVeIc+SW
	 S6LVF3V3wA1jg==
Date: Wed, 8 Oct 2025 10:51:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix loopback mode configuration for
 GDM2 port
Message-ID: <aOYmJC1-mn22ehRG@lore-desk>
References: <20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org>
 <7b460ea8-c340-4ab8-96d9-43568227ee07@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F73I8gfksC2p3ILC"
Content-Disposition: inline
In-Reply-To: <7b460ea8-c340-4ab8-96d9-43568227ee07@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_015151_925714_6180BE11 
X-CRM114-Status: GOOD (  15.50  )
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


--F73I8gfksC2p3ILC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 07, Paolo Abeni wrote:
> On 10/5/25 4:52 PM, Lorenzo Bianconi wrote:
> > Add missing configuration for loopback mode in airhoha_set_gdm2_loopback
> > routine.
> >=20
> > Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 81ea01a652b9c545c348ad6390af8be873a4997f..abe7a23e3ab7a189a3a2800=
7004572719307de90 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1710,7 +1710,9 @@ static void airhoha_set_gdm2_loopback(struct airo=
ha_gdm_port *port)
> >  	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
> >  	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
> >  		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
> > -		      FIELD_PREP(LPBK_CHAN_MASK, chan) | LPBK_EN_MASK);
> > +		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
> > +		      FIELD_PREP(LPBK_MODE_MASK, 7) |
>=20
> I suggest introducing some human readable macro to replace the above
> magic number.

ack, I will do in v2.

Regards,
Lorenzo

>=20
> Thanks,
>=20
> Paolo
>=20

--F73I8gfksC2p3ILC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaOYmJAAKCRA6cBh0uS2t
rLIaAP9ZpLaeZx/xuXWhNczt2hljchjtx1rGalRK9vfN4hRXaAEAwAG7dafqK7nA
xqMvinYWqO1bJ84j20g9/PDkDWmpGg8=
=3Lie
-----END PGP SIGNATURE-----

--F73I8gfksC2p3ILC--

