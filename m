Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892D1CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+L8m/p9IEyMYT1UnbyJiPTjD5qfi3vt0C0WteZRYkKg=; b=hTUfXdNfBXTejGMFlDZSvUYLvu
	ikWvxyLP0Rz++jJll0p4ynYohbET4ANe0Ymy0+zWUKHbxaPU+2rkmadVd/itNbgS5bifbWR7eWz3u
	Xk9MGMCEfpT2dPxD0qXjujNufQRK+r1AnRcEayWfgIZt5nCNl8HGPhYSiZ/oroqABk+mAYV3fhpF2
	NebQbTcIBSY/TvIviXQWV+Jyzeqcr5isOH3ckJqOgKE/rfTDIMwStcfm3XQG67aTpBGO+iOGaFRZe
	sXsC1r0iZwC95ZxSV9N9xWF16GwXNruLTrpwGbjC7CG8dgXJq2ngcfe+CRELOku3WNs2e1ethKsRy
	2nkIBKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIgl-0000000GtWV-3O0o;
	Tue, 05 May 2026 16:32:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIgk-0000000GtWK-3e9O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 186F860181;
	Tue,  5 May 2026 16:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77549C2BCB4;
	Tue,  5 May 2026 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998721;
	bh=+L8m/p9IEyMYT1UnbyJiPTjD5qfi3vt0C0WteZRYkKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGJQnsTgoMjZoYLgTsyP6vL6jauFF73n2pNkYTif/o2WInikA1BclPC/FkUvPq0+7
	 wqa5s5zTc7Wj42snBK7Ums9sYe6zVqi5acuF3a9eLmXBkVMzTnVEHxpFGmh1oMNGIe
	 HJgyx6Z91thzEihdPko6G8SYzCazJV6sDpsk0B18qgzsItM4533rWIwpfAAma9sCHy
	 7RbeTHUeAglPUu822wZmhCSKFo8YdWjvER31vErKd3orFZMDOry8OI3zgxrVYgZEhW
	 dLlwg0mqvwTyKTKGlA2BuxJhf2Emu5A4YL4BxEf/lUqtHAtdi2tcoOSyYbH4NSGY9V
	 J+fGY1mlO1AOQ==
Date: Tue, 5 May 2026 17:31:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car
 M3Le support
Message-ID: <20260505-freebee-unclaimed-7bd3d1d5fc84@spud>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
 <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CKnv4REyRk1oKXCq"
Content-Disposition: inline
In-Reply-To: <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
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


--CKnv4REyRk1oKXCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 04:43:23PM +0200, Marek Vasut wrote:
> Document support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CKnv4REyRk1oKXCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafobfAAKCRB4tDGHoIJi
0jQ9AQDBfT++JVm1H/VuOc28cNbFV/Q4uuX+2DRkrk6Do/lUeAD9GdaCI3FQ467T
o9yqpxAzCpz0T6Zzl9vMwB/7kPnE1Qk=
=9qFT
-----END PGP SIGNATURE-----

--CKnv4REyRk1oKXCq--

