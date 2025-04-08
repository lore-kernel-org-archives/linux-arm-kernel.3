Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA460C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e48Pbev6VOGOSJjyEzQZ85gfGf1+hZai8iCVJTt43A=; b=J3qvW7BaypnDqioB8jFlPe+0xc
	dielr/vNrHgU1AXjvQlWAAFEzJ6FCvmXE5Vg/8138HCJt3H1LferUWNQjMlkzAAVN2sElVxMdYRTl
	m3QZpMrzgHrOd+17slJZiFq6FctbUeCWjjxsrGpi5YYAOklclYzf6/sgnVObvmK0QawMGb6BkYjsY
	3jRuLCfXfsAM7FgJzqa8/JpzhbtXDocP1EIgN4UK2vIwAvzhZ9ztpGNhy6806KNxIwBkrhq0yG6BQ
	ZesVvN0MSsH0jdu/5s70AhVweUi4tZclX6HML4T5TySFXqB2VosmrDmLpDgvWSyrEgtRu8KeQeynN
	RGFxsK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CAl-00000004rs1-1Gg9;
	Tue, 08 Apr 2025 16:51:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2C8t-00000004rW3-32gD;
	Tue, 08 Apr 2025 16:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C67368431;
	Tue,  8 Apr 2025 16:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70726C4CEE5;
	Tue,  8 Apr 2025 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744130982;
	bh=docnkBXYdwDwkqgQOlHMc19oD/O+yTnHvXJK4hwfkS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fl62+fywj4jxzSGT/WAqz9WgAiCtRQOxjtU3zqKUryAI8/J56zLD+j/S8x7rbdkfP
	 qojXTPh0KeuzF9FsVsEWulPUxhWmp9hRfmPdnbGAyowv9FrRG5B6OrE3eHSOoGvGAq
	 HgZq/G8DdzpZmLbHlAL6TsJYjElWds5uj7XjWImoOs5xFQVWIbBjxGUJmGWUSN5mj9
	 CpqQARUdAsrKCsXQS/X/Y1BUWyXCitbkaunxQ/4AHuOauwFYEGlpB7rr9Z03Rt2xxw
	 lCSijPRNvYWoNko4ExexiqSwlPgKk0HlY0G46iijreoI72tpgUBuo4reS6vESobMXN
	 5QmAzWPlxHQ8A==
Date: Tue, 8 Apr 2025 18:49:40 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: airoha: Add l2_flows rhashtable
Message-ID: <Z_VTpBhntxXPncsv@lore-desk>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
 <20250407-airoha-flowtable-l2b-v1-1-18777778e568@kernel.org>
 <Z/VCYwQS5hWqe/y0@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VqEHdJY9D56yjHxB"
Content-Disposition: inline
In-Reply-To: <Z/VCYwQS5hWqe/y0@localhost.localdomain>
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


--VqEHdJY9D56yjHxB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Apr 07, 2025 at 04:18:30PM +0200, Lorenzo Bianconi wrote:
> > Introduce l2_flows rhashtable in airoha_ppe struct in order to
> > store L2 flows committed by upper layers of the kernel. This is a
> > preliminary patch in order to offload L2 traffic rules.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> The patch logic and coding style looks OK to me.
> Just one question inline.
>=20
> Thanks,
> Michal
>=20
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.h | 15 ++++++-
> >  drivers/net/ethernet/airoha/airoha_ppe.c | 67 ++++++++++++++++++++++++=
+++-----
> >  2 files changed, 72 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/eth=
ernet/airoha/airoha_eth.h
> > index ec8908f904c61988c3dc973e187596c49af139fb..57925648155b104021c1082=
1096ba267c9c7cef6 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > @@ -422,12 +422,23 @@ struct airoha_flow_data {
> >  	} pppoe;
> >  };
> > =20
> > +enum airoha_flow_entry_type {
> > +	FLOW_TYPE_L4,
>=20
> I didn't find any usage of L4 flow type in the series.
> Is that reserved for future series? Shouldn't it be added together with
> its usage then?

Hi Michal,

FLOW_TYPE_L4 is equal to 0 so it is the default value for
airoha_flow_table_entry type when not set explicitly.
It is done this way to reduce code changes.

Regards,
Lorenzo

>=20
> > +	FLOW_TYPE_L2,
> > +	FLOW_TYPE_L2_SUBFLOW,
> > +};
> > +

--VqEHdJY9D56yjHxB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/VTpAAKCRA6cBh0uS2t
rGyDAQD+/MiN9rnT3IcrZdxscKWStrcvisFTzqCG87xrS38scwEA1zJ7zNWR7F7M
2jHW6MMsL97uScqhfJbq9aDNi5vn9g4=
=tsCu
-----END PGP SIGNATURE-----

--VqEHdJY9D56yjHxB--

