Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD7CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpHTq2VyCK6MMaE3F5zeDQdp65AE4LebUx2/HG6St10=; b=RoG1xxsOVaiWhe2PvjgKnluSAR
	61Qo5tRF7Ze2wqs2f05ush8v4QBkHpJ5rcmrXAK3g17U666BxLmyUyusq+IU2wr2Rk+sZ0jqzZMgx
	5Z5BmPbKJiImIqv9i+TL/wUE/w7NcUbdSZJFg6iod81MI1kAu5I3ggzSiQNg48bHzkfvlcTl7WliI
	nK/CF9H9pUgEzWrBW/xFadT3YvPZlDA9zCl6B3oGQfcozxsl0lMhTU2mvgNpR2BW1lTH79zambYmN
	Jtjo+W/toRMcDT0A0hj85S3dB9oSck+jDd2lGkWAeS5LBfy/CcjmFGZsqDcmYegIQP5okGOzht9Xn
	tVNblA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0LH-0000000GGcB-2XJ3;
	Mon, 17 Nov 2025 14:36:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0LF-0000000GGbl-2BqO;
	Mon, 17 Nov 2025 14:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FE4443ECE;
	Mon, 17 Nov 2025 14:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79D4C2BC9E;
	Mon, 17 Nov 2025 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763390188;
	bh=jpHTq2VyCK6MMaE3F5zeDQdp65AE4LebUx2/HG6St10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJjCL/VI3p/vrR/vPKvxut/drD5K9cmyQK/eoY+DNjQCqeG5MpMd0cwEAM2AsxBoq
	 0LV5PiUCf5VdmmokrAfZF6EGsXEqDpR1WTxjc/0fMOkDmmv9gBCI7Vj1uJyYFGW1A1
	 x0P+6npHsrBcuf+Pq5PshLcygzwYWJA1bgCaoKa5pZ77cbNqgKpl2wUA9fTZYT1S1P
	 4ExSbuO9PlNp9THY3kR6Sc81NF9RmgKdR+QJi8SieOlKraNRaONlMPwto+XwG0Tb8O
	 0qS2z/l1Ft9m8VKK9l1E+iqIKBBkD9EnSHcXBhPweQU9508Yui3dbjevURCMRTX6rC
	 vRY+Rn8LtQ90Q==
Date: Mon, 17 Nov 2025 14:36:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: afaerber@suse.de, conor+dt@kernel.org, cy.huang@realtek.com,
	devicetree@vger.kernel.org, james.tai@realtek.com,
	krzk+dt@kernel.org, lee@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org, robh@kernel.org,
	stanley_chang@realtek.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: realtek: Add Kent Soc family
 compatibles
Message-ID: <20251117-platonic-settle-8c4f4b64aeb8@spud>
References: <20251113-preorder-task-4e5ba09580d8@spud>
 <20251117105542.14789-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WGyk7a5/LFEGj+tF"
Content-Disposition: inline
In-Reply-To: <20251117105542.14789-1-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_063629_603153_AEE5F137 
X-CRM114-Status: GOOD (  18.84  )
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


--WGyk7a5/LFEGj+tF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 06:55:42PM +0800, Yu-Chun Lin wrote:
> On Thu, Nov 13, 2025 at 08:30:07PM +0800, Yu-Chun Lin wrote:
> > > Define compatible strings for Realtek RTD1501s, RTD1861b and RTD1920s.
> > >=20
> > > Additionally, convert legacy DTS-style comments to YAML description=
=20
> > > properties, following the pattern from the ARM bindings conversion=20
> > > series [1].
> >
> > "Additionally" is often a sign that it should be in a different patch.
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>=20
> Hi Conor,
>=20
> I'm planning to split the changes into two separate patches:
>=20
> 1. One patch to convert realtek.yaml to match the DTS-style comments,
> following the pattern from the ARM bindings conversion series.
> 2. Another patch to define the compatible strings for Realtek RTD1501s,
> RTD1861b, and RTD1920s.
>=20
> Could you confirm if both patches should include your Acked-by tag, or is
> it only applicable to one of them?

I acked it to go together, because I didn't think it was worth a
resubmission for that alone. You can keep the ack I think, I'll take a
look regardless.

--WGyk7a5/LFEGj+tF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRsy5wAKCRB4tDGHoIJi
0nUKAP9tTYo/6WSr9wWOGgqtt4RhqY3eqn9PXtJSwkDJpcToHAD/dJCPZT1NB/EO
N9IliGRj0I7irxugG7qs1qXuIBKcfAQ=
=a7ys
-----END PGP SIGNATURE-----

--WGyk7a5/LFEGj+tF--

