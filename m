Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13E21090235
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZGrDqGK3Yzv/4rWa6jrh2EYVzFcohtyu4jINf1tcF8=; b=RVnZLVAJTV12bu16RKhkLhrfdN
	yU+Npqz+LFedJjGfCrgf58WcHJS+EeKFjoP4k4mYVmQ6PV3frJct5uB2qyLf04OJH1RENzbUG62Me
	JxBPq1C2lTZPblr1TPDwybaEOIt2orHmCizFdVP/MMCrhyPxlTvv9QtU19kQDN6ujeW9TaDrYtELi
	F+0kqiAD7tBjeg8EzuD6c0TM3s7jFPpX+kf4dzeHz+mYkNHhZR7giXCnblD2jncKysHbFOr4kXts4
	1AASyRF5nvwEuLzYz9oDwUcpPndn/rw1NxlszyO90LeDaJi51s5T89Ad71DoRkQFd6AbcOeEVJrE1
	sfxI3aLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EVD-0000000Aod3-3hVg;
	Thu, 19 Mar 2026 14:37:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EVD-0000000Aock-08rD;
	Thu, 19 Mar 2026 14:37:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 737D860097;
	Thu, 19 Mar 2026 14:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C01C19424;
	Thu, 19 Mar 2026 14:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931054;
	bh=KLDhtxsHsK8rztqKAtAqMROmIfFr0P5kwaXY6DoAmsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpRLQu8lLh5mgVxrGIq5qNOsH7ANyRHYIRnYo1YmESCVUnnBBcCR9Mi0p/tf7XxNs
	 D3LrNInZhWa7j6aLAOqDUqy0HseKeaXPXOASXsuDPisTzcxtZyofvkZHNUWZgfkSvJ
	 PBh23kpF9RDHhRtqv+t4kHkCH7sOtzU4U8dPesWJWHlu66+UjWwAOwYlDz2SHhmI4S
	 qGeKyjJhfMUqpfghEcpQ/qzz3vZFdle7At8qkf9LFCZKRxheQamD6zFkIBD8VViVi1
	 seG/T87aAQWxehb6O3OfoFmaRSvuGiPYGphZd3+5wjxai0kBgrTp7Qe8TiKzmHQU2m
	 YRZN1lMY069Lw==
Date: Thu, 19 Mar 2026 14:37:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 3/7] dt-bindings: net: ti: k3-am654-cpsw-nuss: Add
 ti,j722s-cpsw-nuss compatible
Message-ID: <20260319-embroider-cloud-0f8b7ea975eb@spud>
References: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
 <1382fed198246f1563dea091478757aebc4e4948.1773751309.git.nora.schiffer@ew.tq-group.com>
 <20260318-sustained-reshuffle-eaf180729a9c@spud>
 <37396c094c7124169ca376cf6aea5350971aec54.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xd7J1FUbMSfddi+G"
Content-Disposition: inline
In-Reply-To: <37396c094c7124169ca376cf6aea5350971aec54.camel@ew.tq-group.com>
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


--xd7J1FUbMSfddi+G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 09:55:24AM +0100, Nora Schiffer wrote:
> On Wed, 2026-03-18 at 17:35 +0000, Conor Dooley wrote:
> > On Wed, Mar 18, 2026 at 03:05:25PM +0100, Nora Schiffer wrote:
> > > The J722S CPSW3G is mostly identical to the AM64's, but additionally
> > > supports SGMII.
> > >=20
> > > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > > ---
> > >  Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-n=
uss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> > > index a959c1d7e643a..9ab8237c7f79e 100644
> > > --- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> > > +++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> > > @@ -59,6 +59,7 @@ properties:
> > >        - ti,j7200-cpswxg-nuss
> > >        - ti,j721e-cpsw-nuss
> > >        - ti,j721e-cpswxg-nuss
> > > +      - ti,j722s-cpsw-nuss
> >=20
> > For all these bindings, why is a fallback not suitable? Seems like it'd
> > be possible here, since there's just a new feature. Is there some other
> > programming model difference?
>=20
> I think a fallback makes sense, I didn't add one because other variants d=
erived
> from the AM64 don't have one either. I can include a fallback in v2 (for =
all 3
> bindings in this series).

Unless someones got a good reason not to, I think you should do so.

--xd7J1FUbMSfddi+G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwKJwAKCRB4tDGHoIJi
0mZPAQDOmTS3hQH1+4EWz3iVgYp6/DejsN7lwqlJyuo0AsAX4AEApNRPLGqBM0jO
szx8cd91ntJY8h7pt4Fw5f8sH3YbFA8=
=r2h7
-----END PGP SIGNATURE-----

--xd7J1FUbMSfddi+G--

