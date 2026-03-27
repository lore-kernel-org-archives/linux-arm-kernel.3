Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74AE10BA45C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vE7aAgOybl8kkMRNRMKH3/474cFLbolEO1kCDStPcHk=; b=XpIm0+SXnZd6rcSo4tYCaIVmeP
	x+8DjPCtzefWivcukHhiV+BsFSGjHwwV7WsnIsHc9jw7tDJWSQSb3GcqZQm4yFCLdHFZzOnPvV+YS
	DIMCzYMZbEVLWyZBXUSuTDD1qA66dYsJKNzF6SzHITiqqRScM3EhrHwlrR4ndbcAHzbIagkmVy8NQ
	35pHWKM4uAqXoJgfBbZJ6IbZhTZv6P2BYG6HXFd68ihCeNA2vau8Ar1uEKI8D9fiYu45xpKeFgiAO
	pleX0wGkti5awsg5+EXu/dRqoTlfvX+IUfDVJ3AH6HmL7p5Amykks4hmjfh2Y+uQp4hQjGfPybz+t
	Y9zDwaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63fR-000000075ks-15wY;
	Fri, 27 Mar 2026 09:39:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63fP-000000075ke-3HGQ;
	Fri, 27 Mar 2026 09:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D09746132F;
	Fri, 27 Mar 2026 09:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E81AC19423;
	Fri, 27 Mar 2026 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774604386;
	bh=vE7aAgOybl8kkMRNRMKH3/474cFLbolEO1kCDStPcHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aG6eFPCNSVxypTv9jEH5KH/xPEibbRyBfFUVet2kUEFX32KUxGclPCcrocoYApiZk
	 1VSGqwxvqtzFLlMgthLlDYa8yUkL5fgDPPsLURNzErv4pmm5WzPmEdp2sZbLSlEJ4S
	 7DBjsBL2GPDPGLeZAz9HyylFUIUaYOTluLi7RxvTecQf25aK1c0TEv1+Sq5JINuXcm
	 lKG/P+Cdr4KwjYaA3qKHvnHb0AfXD0w4XGC9oWLklkdZhmOl1hYO7kw0uyn2+2HPuq
	 JERvnxKGEB3U+MRMMzjLGt+6XtJGgSsTpfkA/eTOKZi3Q0iLPMQG0ArFOaRMrUl6C5
	 qaBALaVB3IFYw==
Date: Fri, 27 Mar 2026 09:55:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Grab flow_offload_mutex running
 airoha_register_gdm_devices()
Message-ID: <acZGBngWPvjB6ZyA@lore-rh-laptop>
References: <20260324-airoha-regiser-race-fix-v1-1-6014df55886b@kernel.org>
 <20260326200605.39222917@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fJ1bmY2v5shV2XLg"
Content-Disposition: inline
In-Reply-To: <20260326200605.39222917@kernel.org>
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


--fJ1bmY2v5shV2XLg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 26, Jakub Kicinski wrote:
> On Tue, 24 Mar 2026 17:54:45 +0100 Lorenzo Bianconi wrote:
> > Netfilter flowtable can theoretically try offload flower rules as soon
> > as a net-device is registered while not all the other ones are
> > registered/initialized, triggering a possible NULL pointer dereferencing
> > of qdma pointer in airoha_ppe_set_cpu_port routine. In order to avoid a=
ny
> > possible race, grab the flow_offload_mutex running
> > airoha_register_gdm_devices().
>=20
> Sashiko says this causes a lock ordering issue:
> https://sashiko.dev/#/patchset/20260324-airoha-regiser-race-fix-v1-1-6014=
df55886b@kernel.org

Ack, right. Thx for pointing this issue out. I will work on a different
solution.

Regards,
Lorenzo

--fJ1bmY2v5shV2XLg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCacZGAgAKCRA6cBh0uS2t
rFjSAQDQ1c+Kgc2ua9ykMwg2Ik7Y9Qnbiz1WGHZhludsXoIdewEA4EpBiexqldQr
kxPBov/kITpBYnXQ0uVDyd5zKQouIwk=
=E/LG
-----END PGP SIGNATURE-----

--fJ1bmY2v5shV2XLg--

