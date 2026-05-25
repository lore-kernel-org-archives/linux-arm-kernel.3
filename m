Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF22CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 19:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63/2YWqsD7Ors963G51wcV/l7BgjtiH2c939Q4Bz/2Y=; b=DpnHXMa2b8Ytbh50lvy4WA4fMr
	cfgjDtvh68lqzWirQwnp7DcvtRl5LgugJGZVgmn+ZttT1vclaLR2o1wNL2G13werYybtVh9H13vrp
	CdZo9pSoTWFo3+M5keIwmqAXGnfLI66GpqqWfBNmDjhnhx2Vei6Nb4c2GtwmbLuHCGPvuWsTsPbSf
	i3L+0M5EOUZDmTTHtiNiVEdKAiLVV9ou3nD7WaXSns26NgF0nGYRbk4ho0yn9novueQ66+5KKZgWK
	AzLMdBvmWko13IAMJXoNs+Ylox2jPmuP1cx297k6Qj/kUgAdaoWljqg0Trfk/XDJVBOtFb/8SXgFv
	UXjf14cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbHH-00000000MBf-439v;
	Mon, 25 May 2026 19:47:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbHG-00000000MAx-1mAh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 19:47:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41CBD419ED;
	Mon, 25 May 2026 19:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4811F000E9;
	Mon, 25 May 2026 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779738473;
	bh=63/2YWqsD7Ors963G51wcV/l7BgjtiH2c939Q4Bz/2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GVPtEeFCZQSk9Wea8Lxyztx9CSsIescfzNCXFArUSSMYqsGkxNNxKQEysr+S5MOda
	 z46juzqnVw7Mb+v342+1B9m/jrFkMEIgWqaK5n/mgl6ADz6Hr4d7HDV4p1TiMZ4SJL
	 5uA4KBuSf6127jq0dFoqnzpahbM4f/PwE4x9R3UlC8/X5WZMZiDvcgMfr4ZL7036Al
	 95+YVXShjuRvwQoapHPi9Fl5589retks03tP4Ih14LsRxoGSJyYz8DmcttDl8lRTqn
	 aFZLp74USzwDnEzyzwBhY5vznHjeXgkRRosbNhEJz4qak3rSM/5HjPf7Y57DXbHfZp
	 xlFEnvD0BvqTA==
Date: Mon, 25 May 2026 20:47:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace
 clock in R-Mobile APE6 example
Message-ID: <20260525-outrage-lego-2858c3eed769@spud>
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iMjt770BTEZflGTE"
Content-Disposition: inline
In-Reply-To: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_124754_484012_9E1D2F3E 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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


--iMjt770BTEZflGTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 09:25:50PM +0200, Marek Vasut wrote:
> Since commit 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks:
> Document ZT/ZTR trace clock on R-Mobile APE6"), the APE6 clock node
> expects two additional "clock-output-names" entries, "zt" and "ztr".
> Update the example accordingly.
>=20
> Fixes: 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks: Document ZT=
/ZTR trace clock on R-Mobile APE6")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iMjt770BTEZflGTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahSnZAAKCRB4tDGHoIJi
0vl2AP9l+ryVmXD2JyeSGAK3rZF8YEqWuxvXoEPpknmVqr3CpgEAgMfUE6J96aiu
6Qv/mObJL5G8vRFckeaPOk30b+HhLQs=
=5QF5
-----END PGP SIGNATURE-----

--iMjt770BTEZflGTE--

