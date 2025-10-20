Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8539CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1YYlwvZJcHj3cRypJW49aARjh1abXFYf74hk2SqfvI=; b=hT58GsLCAkVw6jg9sNhwae1j9Z
	zIEv1OfsDyR1OM/seDWAF8EChO54R/U4IjtZOJUfQBSEjvZHyx3BxM0gX+jzTTHozOst6xSCukH60
	KJDSjhZvb1IwlxhMhg2hM4EGydqE8fDtYAipbrbtkZeZe5PyI/O7ymlA9E8B0ua1VJOozw/a8KaRE
	i72zr7Dy3wyfjiexzlVj3mgoiryccMuANqCy6VVrlGHd9MpWDPQGFVVu10LeO0t4cpBjf5UFBcwg1
	JARhBVjVR3xretd6Yha+8wSCnDiq8KR999v52rp5t84Owkdmk/ygLEgwGY2JeNT8gUp0Qv/r7GGBl
	tFcH9bUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtiQ-0000000EUjc-2EvQ;
	Mon, 20 Oct 2025 17:30:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtiO-0000000EUix-3aNo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5225A620C9;
	Mon, 20 Oct 2025 17:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821A5C4CEF9;
	Mon, 20 Oct 2025 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981435;
	bh=j1YYlwvZJcHj3cRypJW49aARjh1abXFYf74hk2SqfvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5cpivVpgWMuClQFbbF5i4A5x2SZJX5tpGoPlmmQ4DBWAXEJLDHjehrnbYfYlMuSP
	 8WX7axy9a2VOBkpd28GA24JngncaurJDCSyFLaBmX0rGtcXZ6E04avpv2L4OvDXttf
	 j8cP0n0cVK24SfhACuoVMhS2OOVQWdfKJmqBhCJgacowioHIZHqtycJQMWBvKBKHV7
	 ywTLw7rmdgSxeN7+neYTUN8AO9zPvgRQpxVUytbfFhKyIlyZPrJqvC/b5nzJcxRhWl
	 3HYkK5Up5UPBkEMk3/lLozkiMyrepLHU1T76HCQuPApY3IurwD43Q72SE6b5+uZmgd
	 eJDtx5O95XzXw==
Date: Mon, 20 Oct 2025 18:30:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the
 allOf section
Message-ID: <20251020-deserve-tipped-fbf75a0e7612@spud>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVNoAyQTwvsLjUE5"
Content-Disposition: inline
In-Reply-To: <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
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


--TVNoAyQTwvsLjUE5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 03:00:59PM +0200, Marek Vasut wrote:
> Rework the current allOf: section such that all handling of
> clocks/clock-names properties happens first, and all handling
> of power-domains/power-domain-names happens second.
>=20
> This allows the allOf section to limit various GPU models to
> matching clocks count in the first half, and apply the same
> for power-domains count in the second half, without conflating
> the two limits together.
>=20
> This makes addition of GPU models with different clocks and
> power-domains count easier. No functional change intended.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TVNoAyQTwvsLjUE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZxtQAKCRB4tDGHoIJi
0kRoAQC70QJpZNmQzWYCj25MA0DaOEK7Tqn0OizZPOjwMtu+/gD/boMVKbDhI6jf
r2UD8AMHhsO2/IE8GGzp8eD9r0aoywU=
=bmSF
-----END PGP SIGNATURE-----

--TVNoAyQTwvsLjUE5--

