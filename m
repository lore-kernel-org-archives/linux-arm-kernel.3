Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2D3C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Hpx5updEnG6CR6tdCfveNfPE2OmvxTxNFtA6EfUaWU=; b=GP3nYHzYNqf2AKDB5XRoLxmpjj
	bq1gIqn/yZz+3RgwXFxIggVgS5HI9WEfxAj/aWqbp9sCF1IBJ1JC/Mvza5damHCwXdhNEfPA/uKPT
	H3wW35Vt/G1TBVma4MzpxldUY4MIfYwdv9bN0XzohxERuII/3T+7k7WjH2MgJZeDBlUptatY8Z6UH
	2B3kEMEly2XYw58XGiY7YrZzi92vvwIyruYN+61of7KbVlsE+SIa5uI9kFWjpfBeyWa4hoO5Pf2es
	YpVqqw8wiB+17QreaZPenYVw1h7jK4xjKEzZiKg429kjC5349A9QIWJxA2IFTkyFqhwdU6Z1VtO6z
	M7g9dzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcg1X-0000000AzSf-06Qy;
	Mon, 05 Jan 2026 08:33:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcg1U-0000000AzSC-2o1y;
	Mon, 05 Jan 2026 08:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE29342D65;
	Mon,  5 Jan 2026 08:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57010C116D0;
	Mon,  5 Jan 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767601987;
	bh=jR4fFLVRiuegFqSf3wGQVE9BvrmQiyfEnJAXr4ps4Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UK3Dce6S+YtTWs/Rlbr7cbBA/AcEhlPFHOM5rRNu8ft8yJYAhfFxN6T2gRTuH2MKD
	 UOCv2DQ4WnUZl4pDsT71NtcqecqnM2MHGl6rP3eFd+So5+9LCDLR5+GQeY4j3HeCfl
	 fUOflI3v1aq8o36rS1l0/L8450oJ2uljS5RGcuLeO6OYQx79kcItfxiGdeWwWOI7OQ
	 CovGMLXQ6XN0PsMB36cNcm1VU24lOezbyiGEBiaYhttKnIe45zE51nFRfQQZKlLz53
	 tPhLPapYsbcS0HvZeaom+07J5yc5y0CEuZRNF2GLKad6GTN3tuyJBqhupNp0KRcBHU
	 fcgZEmmMEy7uQ==
Date: Mon, 5 Jan 2026 09:33:03 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
Message-ID: <aVt3P_sAeb0UtshZ@lore-rh-laptop>
References: <20251223-airoha-fw-ethtool-v1-1-1dbd1568c585@kernel.org>
 <20260104095748.70107b9b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fJ2NtbytHDl8SsTF"
Content-Disposition: inline
In-Reply-To: <20260104095748.70107b9b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_003308_747997_355F91F8 
X-CRM114-Status: GOOD (  12.99  )
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


--fJ2NtbytHDl8SsTF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 23 Dec 2025 22:56:44 +0100 Lorenzo Bianconi wrote:
> > Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order to fix
> > schedule while atomic issue.
>=20
> The information in the commit message is not sufficient.
> What "schedule while atomic issue"?

The issue is we run kzalloc() with GFP_KERNEL in airoha_npu_ppe_deinit()
in atomic context but we do not really need atomic context there.
I will fix the commit log in v2.

Regards,
Lorenzo

>=20
> > -	npu =3D rcu_dereference(eth->npu);
> > +	mutex_lock(&flow_offload_mutex);
> > +
> > +	npu =3D rcu_replace_pointer(eth->npu, NULL,
> > +				  lockdep_is_held(&flow_offload_mutex));
> >  	if (npu) {
> >  		npu->ops.ppe_deinit(npu);
> >  		airoha_npu_put(npu);
> --=20
> pw-bot: cr

--fJ2NtbytHDl8SsTF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaVt3OwAKCRA6cBh0uS2t
rOkJAP4jrr9vVu+SoLlKEvC8/13XPzrDIHx03ib3U4KbcNisjQD/WfD6TFYOSFEG
UOd9aqYCXOtyhpoyTsUnD/vsLMRmlgE=
=vvTn
-----END PGP SIGNATURE-----

--fJ2NtbytHDl8SsTF--

