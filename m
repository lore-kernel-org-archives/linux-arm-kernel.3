Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C504C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46VI5kI7DARz6nHBYySD64FMtN5SGMQUkOWuVytVrXk=; b=PMH2YYKkUFU+c7qlLXL3u7qb+p
	YgpY+abp0CPTJkgR7cYdrHRjLwZ1s/DFk8nfaeyRpFgVC2p5Op6dnSp9LegQ01Qm4YtI7/Xzl80fh
	UgXBgCp6GncoGyLyXjOQrZySnUopCHIPnLOp/XvA0xeoRBEgcbo/amcrOqF36Ysi7PV11FjJGWN3u
	IZ2lcBtSSj4/gfwecT1NtQhBbKNC0+bsyU60vD7FLVDp6+09QjZ16qmWxrkjkGpn8stab+GcgzaAM
	OTZV7DZDUJC4PvaCYZQnPERvZi8R2hkSuP5/Qc+DyykGp2dU6y3CyCgB7n1FZWtDVrRu8SM/hk4xz
	CrMH/nDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLn-000000055WU-2WXi;
	Mon, 16 Jun 2025 17:10:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBIG-00000004mHZ-27gA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:58:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2786A51322;
	Mon, 16 Jun 2025 14:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC04BC4CEEA;
	Mon, 16 Jun 2025 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085919;
	bh=46VI5kI7DARz6nHBYySD64FMtN5SGMQUkOWuVytVrXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiZE7a6+q/GsIslhl70mP/J8IrMeR55PETwqoVObqI42VN9ygAKPpurXpMyg7ltMi
	 NSp5vThbbmRt23amO1B4nR/h9wT5OfJbYJTwfQBrzy8ReX7s3sD51LeWfQK86gndm8
	 jmSmscaqmNm+o+jZGKCGpxAshtTC4OtparBXGjZAJlzP+Xv1WRI/6GhjrTpdehub31
	 9QCXaEsIynLHSBMLTc6A15NycKv5ZpZxI3uEG2HnovSHQ1vG3Y/wm7B2nnfQGKobOC
	 ABHMIFcyAEZILSjwuq6LU+MHfrjo9HwVbXw5wPzYdhOF9OfC23Ioq3YoKVH5N0PE2W
	 0jBc3poySiyBQ==
Date: Mon, 16 Jun 2025 15:58:34 +0100
From: Conor Dooley <conor@kernel.org>
To: yassine.ouaissa@allegrodvt.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Message-ID: <20250616-dragging-lego-ff264b3edcb6@spud>
References: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
 <20250616-allegro_dvt_al300_dec_driver-v3-3-7d746cb9e5f9@allegrodvt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="92GXpTHi+dETNUEw"
Content-Disposition: inline
In-Reply-To: <20250616-allegro_dvt_al300_dec_driver-v3-3-7d746cb9e5f9@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_075840_624572_3499113C 
X-CRM114-Status: UNSURE (   9.15  )
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


--92GXpTHi+dETNUEw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 01:12:14PM +0000, Yassine Ouaissa via B4 Relay wrot=
e:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>=20
> Add SAS (Soci=E9t=E9 par actions simplifi=E9e) to the allegro of vendor
> prefixe description to include French simplified joint-stock company
> legal structure.
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--92GXpTHi+dETNUEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFAxGgAKCRB4tDGHoIJi
0pe7AQCCAy/NM7p1ATskCojxMrDBWbbWKo9pJJCx6Dx5ekBNpQD+NfWNjp1D+GEx
Wsn4ri9kcmt6thxJqpWmk/7juUafGwQ=
=gDpX
-----END PGP SIGNATURE-----

--92GXpTHi+dETNUEw--

