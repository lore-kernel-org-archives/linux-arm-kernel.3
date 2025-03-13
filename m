Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196EEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM7fM72Tf7w8xwleAf9ia2U3xGw/SWZdDsMZo1iJVtc=; b=3JhwyedHPoziNWVbcDn4J55KuO
	DpXvCoODVFYPHPruKjwRmXE8lE5AS+bW3HTeYKWwKf7gfXFXh/z4SMkXmWBBvfkLVmSLkGTx8uVbe
	Z6qHFZ/+5rLihJfkXdte89/bf1/4wpcokEZKTE5RLGnMAm+473nCW8ySvF4FgEwVXps26Ej5585i1
	IkhKPzHeg8CvtCrGaZk1+HfYFHmh4sfFTQ8SF3vajgPlU1c37DGlnIKFCIo8kSY/++ixfmbJS0Wy+
	inMAHBARQtNlhVfseEjMsstLZrYeMzFUWHtmq3RGxGkkdMwolT7Jc9u0wM+ZUAhjhtpvUO3sNhMZR
	RkOK6shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgG5-0000000AxjM-0lum;
	Thu, 13 Mar 2025 10:57:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsg6r-0000000Avlm-1h96;
	Thu, 13 Mar 2025 10:48:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86154A46BF3;
	Thu, 13 Mar 2025 10:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DF2C4CEEE;
	Thu, 13 Mar 2025 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741862896;
	bh=ifXxEP9fQ+ca00C4NymK9lkHybBl5yWQFtzUvukmZnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGUxO4IzaiCdImvWcK07pYxlaES+FKpyGSGQS+se2QRK+fS4IxGUEbGzelHwLB+/q
	 u36Ov+lMh2bFtMiWiorUoJsCIqlxAB2/54A1bOfNySQ9EJUwXmVbWVZAZM+MLnNhDS
	 q60fcF/44I6LM6PFWe6Q4t1c0f59nE8pUQQ4N/oOkfmndKcu330/DWQaC8bbtj/Jxf
	 RfMCxb1oFk2O8r81YBQY3m2ZBt5oJyduarUFlJAn7NTGROXk+kX+4295LvHam9tbyq
	 vq24P3CCHWEEcWcrREvOOvYs1e7H5PMvdPTFrQg6LkEM6DzQCCNoZpwVYZzqbe1W3J
	 CwBUYe1l77zsw==
Date: Thu, 13 Mar 2025 11:48:13 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <Z9K37URcF_hkCTBM@lore-desk>
References: <20250312-airoha-flowtable-null-ptr-fix-v1-1-6363fab884d0@kernel.org>
 <Z9Ga7gx1u3JsOemE@localhost.localdomain>
 <Z9GgHZxkSqFCkwMg@lore-desk>
 <Z9GtKwAuEx+7HKjR@localhost.localdomain>
 <Z9G01zGCpbw1YHNs@lore-desk>
 <Z9K2vujs6+yhiXXh@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLfdax2fnK8OYSBS"
Content-Disposition: inline
In-Reply-To: <Z9K2vujs6+yhiXXh@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_034817_578963_AC7BAF00 
X-CRM114-Status: GOOD (  26.37  )
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


--PLfdax2fnK8OYSBS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Mar 12, 2025 at 05:22:47PM +0100, Lorenzo Bianconi wrote:
> > > On Wed, Mar 12, 2025 at 03:54:21PM +0100, Lorenzo Bianconi wrote:
> > > > > On Wed, Mar 12, 2025 at 12:31:46PM +0100, Lorenzo Bianconi wrote:
> > > > > > The system occasionally crashes dereferencing a NULL pointer wh=
en it is
> > > > > > forwarding constant, high load bidirectional traffic.
>=20
> [...]
>=20
> > >=20
> > > >=20
> > > > >=20
> > > > > > +		if (!eth->ports[i])
> > > > > > +			continue;
> > > > >=20
> > > > > Isn't this NULL check redundant?
> > > > > In the second check you compare the table element to a real point=
er.
> > > >=20
> > > > Can netdev_priv() be NULL? If not, I guess we can remove this check.
> > >=20
> > > I guess it shouldn't be NULL since "devm_alloc_etherdev_mqs()" was
> > > called, but I'm not 100% sure if there are any special cases for the =
"airoha"
> > > driver. Maybe in such cases it would be better to check for the netde=
v_priv?
> > > Anyway, such checks seem a bit too defensive to me.
> >=20
> > the dev pointer can be allocated even outside of airoha_eth driver.
> > This pointer is provided by the flowtable.
> > I guess we can drop the NULL pointer check above, and do something like:
> >=20
> > 	if (port && eth->ports[i] =3D=3D port)
> > 		return 0;
> >=20
> > what do you think?
> >=20
> > Regards,
> > Lorenzo
> >=20
>=20
> I think if there's a risk that 'port' can be NULL, it looks like a
> reasonable solution and I'm OK with that.

I guess you are right. I do not think netdev_priv pointer can be NULL since,
even if size_priv is 0, it will just point to the end of the netdevice stru=
ct.
I will repost just doing:

	if (eth->ports[i] =3D=3D port)
		return 0;

Regards,
Lorenzo

>=20
> Thanks,
> Michal
>=20

--PLfdax2fnK8OYSBS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9K37QAKCRA6cBh0uS2t
rCf5AQCtpdGJkY45ujQJ6QxQbPLHKHEUhSbDaTD5WJCphEav2gD+J9GCbdGJ6O9g
UPXzVUQ6dVmmww/RLljE9fOkDfMR0Qs=
=f/tx
-----END PGP SIGNATURE-----

--PLfdax2fnK8OYSBS--

