Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F79F44868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eCOPn79mwH4Ca9kbCGIq0SRkJ8dL3+eE1sfjSyo2h4=; b=eDSWc44BNLHvpqgL4VGsUp/pEX
	rejPJ5R3Sj+Ls9M67iwoCA07ul0a+rUjb1P8TfKH1fWa16CXYgb2ai9RjQWJ53K4jOuoeHPoRy9WY
	vj7QXmMW1Qp5q7Qb83mTgj+sSQkaUBBNAm7A/BgB9L6yNaphqpr4P/yFVlifCo4KK+O551eRR5ND+
	eyZRYCpTyOkJbuOB3L2vkrBfnoGlAG7ru33IBGhAh+qhmauZXwIZhJK+SuWuTMIb65WtyvZLWU6Fi
	QWbxJpWTYW94SVAJhtxFTOmI8b2yg/fRHpDF2unjgqcXXGSXRS9KwgTk0M2gsHlIs/zae9XLPcqLg
	vWQv/XbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBhA-0000000CIZL-3BRw;
	Fri, 10 Apr 2026 13:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBh9-0000000CIYX-1n2u;
	Fri, 10 Apr 2026 13:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5eCOPn79mwH4Ca9kbCGIq0SRkJ8dL3+eE1sfjSyo2h4=; b=TycpUXfBloVp1q+Q8/HEv/GKLz
	MPy5lqtK9NoXfauWbJplTP/v4/S4zIBbFnjemahrYtpVisxTL+FTeaLfi97yro+PrcfTTbatX8Dia
	NS3jnI+p4ZDpAbxLivFLfvnyR+SLIoucI8mF0uAZ+tYtHsFa9gAerVT18Av3mvRPyxJNySFSQMv6g
	I9ayJJuAG6AyjJQ9PjmJv9Ipgu7V/KE9L7w7CSde2WOdBkCqAIsOQMHZl9I/rO+wK9EJc/XVGcKgI
	JPnyxvld9b73qPa9ysfRIE5BhD21n82ch0Q3t812AtOjSu5i5Cyij8rZl6WYIJyauvncGsWlMN6rv
	QHvW/NuA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBh6-0000000DYot-1BAu;
	Fri, 10 Apr 2026 13:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91AE444141;
	Fri, 10 Apr 2026 13:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244F8C19421;
	Fri, 10 Apr 2026 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775826879;
	bh=mQ/7OrrwieJDTdrH7hooz4EEuxSFq4IEqgQU97DnhbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+I3U6gU0OxyPmQwzoqXjiYH+t54Yehw5ewLHCuioPKr8KMz6sHE7MaTydXX6Igmv
	 +2iM+/lwImgN+0lJbzlr3uC1yPV3kTzA+TxM+9NiQhUZLcXlshdlFkqCdLiOpxdIHB
	 Hkh/TS4sTMKxPhihYha/+QFydpIgHWLpkYTQx7MlAzhWXjTZfWqTBFeEZSxLgjPR83
	 hdzMrTfS4IWLvGQKrq6KfQYbQJMkBO3kCZzmAGz0kdw6tyBjqcEscPt5qwYxawDE/V
	 JYQxffvP869eX9CC5YyLB95QBAF/vAK18VkgOlrOi5NOImbPjnRVYJs+HnEDhG9Ca0
	 /JQXer2WhHuJg==
Date: Fri, 10 Apr 2026 15:14:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 01/12] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
Message-ID: <adj3vW7TKXccLSXa@lore-desk>
References: <20260406-airoha-eth-multi-serdes-v3-1-ab6ea49d59ff@kernel.org>
 <20260410025717.1809904-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8PmPGRkvaOhX7h0"
Content-Disposition: inline
In-Reply-To: <20260410025717.1809904-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_141444_732390_900F5F9A 
X-CRM114-Status: GOOD (  18.37  )
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


--w8PmPGRkvaOhX7h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This is an AI-generated review of your patch. The human sending this
> email says "For your consideration."
> ---
> dt-bindings: net: airoha: Add EN7581 ethernet-ports properties
>=20
> This commit introduces the ethernet-port property to model a net_device
> connected via an external arbiter to the GDM3 or GDM4 ports on EN7581
> and AN7583 SoCs.
>=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > index fbe2ddcdd909c..ebbd433e9c9fb 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > @@ -130,6 +130,30 @@ patternProperties:
> >          maximum: 4
> >          description: GMAC port identifier
> > =20
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^ethernet-port@[0-5]$":
>=20
> The commit message states that GDM1 and GDM2 do not support connection
> with the external arbiter. However, since this pattern property appears to
> be placed inside the generic ^ethernet@[1-4]$ block, does this allow a
> device tree to incorrectly configure ethernet-port subnodes on ethernet@1
> or ethernet@2 and still pass schema validation?

ack, I will fix it in v4

>=20
> Could this be restricted to GDM3 and GDM4, perhaps by splitting the
> patternProperties or using an if/then block based on the reg property?
>=20
> > +        type: object
> > +        unevaluatedProperties: false
> > +        $ref: ethernet-controller.yaml#
>=20
> Does referencing ethernet-controller.yaml cause a validation conflict her=
e?
>=20
> The ethernet-controller.yaml schema enforces a strict nodename pattern
> of ^ethernet(@.*)?$. Since these new nodes use the -port suffix and are
> named ethernet-port@X, will they unconditionally fail the node name
> validation enforced by the referenced schema during dt_binding_check?

ack, I will fix it in v4

Regards,
Lorenzo

>=20
> [ ... ]
> --=20
> pw-bot: cr

--w8PmPGRkvaOhX7h0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCadj3vQAKCRA6cBh0uS2t
rBlnAQChofOe0utPGIDu5PUixZsRZzjAtGGT6M2YM583zTPi5wD9H2ST3gaJBBny
9/CzLBUS8ZiATfT1pwiaaFdOA9BHig0=
=dppY
-----END PGP SIGNATURE-----

--w8PmPGRkvaOhX7h0--

