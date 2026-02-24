Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC07F4BB63
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX48mmAMpEFsVVWkSO1fWvcBpL1R4FUZWu64MSoexbg=; b=YTZWSN/Um4evSfSsJqSeqf/YPy
	9Igz5YN16XpZ7VdXmjnsyuNi0yTqYIDlRy1hhvQDVYuB6lf8FLe5RdvLnEPUl61F8I20IbyuvY6DX
	6N9aVy4OqZO5YNAz9/oLMRvMzdSk/hN6fWyGrghEBrLnol6pbcJlZpZwVFgT83O8VtbvyBacTGcHQ
	kjLGHXeeX6xESxa3XX3kpleTo3t26VtRE+1clj56bmKdu0fa8UzM3mWEPz8HguNS3Hf38PI+s1j1q
	OvFTg5mkonuafMiPY36ZZGvVIOEc6UqK5D79s8nYGasmdfGcxROx7aPZEm2RrC0ozFmJKPCVuv/2j
	oc+SKyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwZn-00000002Vs9-1Oxk;
	Tue, 24 Feb 2026 17:52:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwZk-00000002Vro-44Io
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2F1843F49;
	Tue, 24 Feb 2026 17:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA09C116D0;
	Tue, 24 Feb 2026 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955519;
	bh=sX48mmAMpEFsVVWkSO1fWvcBpL1R4FUZWu64MSoexbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vB2+OPsz+noR2LQLwsG+KXjrVZbTla4kbQ9BwGC8qid0eI/s9AHfPN5kXt27B3Gv/
	 wmzn9TxYvZDOmu03wkUdr1QwH7fA8EbwxUWjOwtz6XzcnI4oA9oZ03TWF7zlu1W3ps
	 5sdd+2ue9aH3g11wkChzkhMWU4nzrCwARvXFmzKNMn1zBKmz+YfEtV+Y7kcsSKPPDK
	 dAkbw2X7Z8il1aso5tMbCFrAoASpyEC0a+SBOZdO7RpbmMfnj579kyBFw7asAJQTg7
	 FNt7fXR5fVIc2O90i6I6U8DCh6FLSbOr7yR65MxXfs8WStJ+4SQTlRIHNJUbTM5aRd
	 duch+L1g1847w==
Date: Tue, 24 Feb 2026 17:51:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu@tuxon.dev>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Message-ID: <20260224-resisting-mongrel-531537974fa3@spud>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
 <20260224-recolor-hatching-e7d1b1894953@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35unM45Y7q9JQE/+"
Content-Disposition: inline
In-Reply-To: <20260224-recolor-hatching-e7d1b1894953@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095201_035881_CB8BACF1 
X-CRM114-Status: GOOD (  15.09  )
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


--35unM45Y7q9JQE/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 05:43:15PM +0000, Conor Dooley wrote:
> On Tue, Feb 24, 2026 at 02:46:45PM +0000, Akhila YS wrote:
> > Convert various legacy .txt bindings for Microchip (formerly Atmel) AT9=
1/SAMA
> > family system peripherals to proper YAML schemas. This includes:
> >=20
> > - CHIPID (SoC ID register block)
> > - PIT (Period Interval Timer, old style)
> > - PIT64B (64-bit Period Interval Timer, newer parts)
> > - ST (System Timer, including watchdog subnode)
> > - RAMC/SDRAMC/DDRAMC/UDDRC (SDRAM/DDR memory controller
> >=20
> > Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> > ---
> > Changes in v2:
> > - Change email for maintainers.
> > - microchip,sam9x60-pit64b: modify compatible and clock-names in proper=
ties. =20
> > - Link to v1: https://lore.kernel.org/r/20260217-arm-microchip-v1-0-ae5=
d907e10e3@gmail.com
>=20
> Please give me a chance to respond to your messages before sending new
> versions. My comment about partial removal of the text file still
> applies. You've got to send another version anyway.

Also, you probably should have checked the what I thought was Claudiu's
email was actually correct. It's actually claudiu.beznea@tuxon.dev!

--35unM45Y7q9JQE/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3lOwAKCRB4tDGHoIJi
0uZWAQDdm5n+4n040FYRQ81PKTsN0bUxKXjq66BPzYZMhPRA2wEA/rqFijieqVtj
SlgNTzapna1TR11HDJQN/hsvlAvltw4=
=TVO/
-----END PGP SIGNATURE-----

--35unM45Y7q9JQE/+--

