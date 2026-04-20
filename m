Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C944F588EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Kt8as8mq2L8x/oiYrn71n4n+iBL8ZBduPggFgHlRBw=; b=CwD2C9T7HtA4sGLkhU0J659A+e
	j3HhsUUGAqXWkg1gR0c5KjpFrFEyYQzWIH6JklfFz1Sc7LU85XOJNRw2eu6lUP6C6Le9HOBTBUYIv
	QCEGml17ngv+1v2Az0KER4bm7kr+5XQPscSyYawgzV/Q2VO640c8Zm00yznztsaVjiZGp5b224TLF
	uMwAQdKoTzHnXmwLgA8snudgueNx0tyC7FvKAmUXzhIdlA30fjOv/YZUHYNnqP/SWl9NWtBo9elmI
	1oxK6jDFTDW6dI9f18J41SPFD6TLZq/0FolU8bWIzmvhVKpYCG4tTK74K5GmaVIiyPnLENHmsa1a2
	ekD/VN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErJH-00000007Pc3-2za2;
	Mon, 20 Apr 2026 16:17:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErJE-00000007Pbj-3tZh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 16:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47B81445AB;
	Mon, 20 Apr 2026 16:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D75AC19425;
	Mon, 20 Apr 2026 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701836;
	bh=6Kt8as8mq2L8x/oiYrn71n4n+iBL8ZBduPggFgHlRBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBZ3xlp+PbuDcHXj3lOpYFdY/2W4q7wYZnaNho+iY/mcUC17oXEZX72D4CSiTEkHH
	 N3r2cW5D2U2AEVsaWUl+FpbPuZsO5Et5MJnNz3eb8KFIHH9DmgacJQ9qNV6yI6DDTv
	 ycIvJdZhE0C68y+bVHMvCivfsIAICbY2wPB0ehoMxk7yUqkZrhnFy4qhUnB3O3LE3V
	 DWNhChfj5k/EWqecpJXkLGbrxTMgi+ACN5Gg8xtdMfFe7xv94rFgaDks8a8JeHd1ug
	 FRAR3Pik5yo1Eo6Oy+GWV9JCmkbTYGtJU3wgsdJrFyLcBjFxEqiTtIcUkgqCvLXbGx
	 ci0EgAMj6nrig==
Date: Mon, 20 Apr 2026 17:17:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
Message-ID: <20260420-petted-hardwired-323bc49c237e@spud>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IGrUQItqXndu9owC"
Content-Disposition: inline
In-Reply-To: <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_091717_023598_9491EF72 
X-CRM114-Status: UNSURE (   9.86  )
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


--IGrUQItqXndu9owC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 09:35:32PM +0200, Marek Vasut wrote:
> Extend the Renesas DU display bindings to support the Renesas R-Car
> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> except the HDMI port@1 is not present.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IGrUQItqXndu9owC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZRhgAKCRB4tDGHoIJi
0vUmAQDMYNW2PseVrsC21cn9Wv1ntbk+NzKXu24VD4tt5g6LPAD9EiJcDYGjU9gz
EBCGuVdoC1lg6lw4LFmY+kw9vVtH9Ag=
=c6pp
-----END PGP SIGNATURE-----

--IGrUQItqXndu9owC--

