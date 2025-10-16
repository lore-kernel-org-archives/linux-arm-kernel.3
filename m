Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422D4CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koW1mtyWEV/9nGXq0ft96CzBEM4wcxSxPZ7e/TfT/EQ=; b=r0imP8vTx62EsIHFuKtvKNsNIR
	RJQWgf6BQMMBQtlvbcBFxOJHiYui17FbkXHdcI+lHEOPxkFke8RZIK5fZJZLXKHCv45VlIcBxM0Im
	46hEroVnTV+uG2Wkx7bogHLXpaFjgBljlbOW0Ahs5m275+ptt4SlbwhQGgq3jgS5qeHhnP2HFhH5S
	0naHOEEs+Uq3juXyQD7feOUBlJyVlLSNDSQEv1G9ai0clZQ+QFTDFxllkI/wgDq3+SYydxayM+pAa
	ri27yTsaagUfzaZqMNx3TjPr3Cdrm+E3oILHDSVzhkskDbY/B+o2CpXenMekp5J36IYqXyCHA5z0A
	dYiVjmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JhV-0000000436I-2AjL;
	Thu, 16 Oct 2025 08:51:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JhS-0000000433u-3tDX;
	Thu, 16 Oct 2025 08:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 830474923F;
	Thu, 16 Oct 2025 08:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D8EC116B1;
	Thu, 16 Oct 2025 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760604663;
	bh=koW1mtyWEV/9nGXq0ft96CzBEM4wcxSxPZ7e/TfT/EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fEpdiWMqRmp2xMTf47ahEHRYc/qm/JhOfrqZWWkQDLeH+jWySKsWrUtIpnjjldzQR
	 C2Wb7EqNcPxRXQGryLLOgwVy/05DYboRnewGfthosAddKV6MrYwVBCSLcdgQxF1ME8
	 gxtVHsUJI3E+pv+TkHnU/5w/XWDJ9tQngKggz2FmjM0IJTd2dKYlzFIStvZhmqK5YO
	 gNpqFmXs5JfcEIhmUBuvOl0B65Ag11rL4pkdS5Jn9gn+TrlTida6kBH2sCFFqVQUlR
	 d/tuSbjKC5Q6rn7UQxPPqjVtK55dMb9x3HKA8qQLhr+cRnSWAsB+vqaoYDy2+lAHdG
	 8yJ+aCPBlA/Tg==
Date: Thu, 16 Oct 2025 10:51:01 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: airoha: Select default ppe cpu port
 in airoha_dev_init()
Message-ID: <aPCx9dvYfxRoc1VB@lore-desk>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-10-064855f05923@kernel.org>
 <aO_Dwn9r_32-U72N@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7ChpTZEVr/Bj1tf"
Content-Disposition: inline
In-Reply-To: <aO_Dwn9r_32-U72N@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_015107_004337_90B30AE0 
X-CRM114-Status: GOOD (  13.58  )
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


--h7ChpTZEVr/Bj1tf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 15, Simon Horman wrote:
> On Wed, Oct 15, 2025 at 09:15:10AM +0200, Lorenzo Bianconi wrote:
> > Select PPE default cpu port in airoha_dev_init routine.
> > For PPE2 always use secondary cpu port. For PPE1 select cpu port
> > according to the running QDMA.
>=20
> Hi Lorenzo,
>=20
> I think this could benefit from a few words around 'why?'.

Hi Simon,

ack. I will do it in v2.

Regards,
Lorenzo

>=20
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> ...

--h7ChpTZEVr/Bj1tf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPCx9QAKCRA6cBh0uS2t
rDjbAQCyZUZ+AGx+0t5mlhcr/wn0mB+6DKuep4ewNRmoYnyr/gD+K6LdpaOBgRPi
Rp32H0CGkNzsfZVTiKA5T12MoC7Vrwo=
=4yyA
-----END PGP SIGNATURE-----

--h7ChpTZEVr/Bj1tf--

