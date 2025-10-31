Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A477CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A9oKwdJl5X2K6tXtTFmc0bGnJ/ecm67MrnyiZJhhCY=; b=4nEgSqbOHumN9xB47iqusfRP2n
	ozhV5gcR4DUpDaG2K/9+b0sd/C/vMrny2+jzco9aH9khCbBJr2ifoGiazHT/HVWKPI94qoxMwg633
	8AHGKyTexe82PxdRfi6RBM5jimD7ajnS1+QR3j1evp/1DbyT89K8fMgUmf+N/cCASgTzWh6yZIl9X
	poYhIb/fQ/YXhuc2Jk9xIHR/OFMoonJyGBHFtWtRbdnscwXNsOyQL7Juzw4FePnV0wxjY+lgAGqR6
	xlJ5rBSZgbpdlLEU4sN2TNIxA+Hn6LRX9sTVvvgT2EolfOQCZ1mpy/upUQ+BKyp0pBX/RjSlcgrsJ
	Ac1w6o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqmR-00000006Iv7-3e1d;
	Fri, 31 Oct 2025 15:11:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqmO-00000006IuU-2J3t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 15:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D67D743477;
	Fri, 31 Oct 2025 15:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4A7C4CEE7;
	Fri, 31 Oct 2025 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761923463;
	bh=x3VSbBlEbgi98N0ASDLgCvMIMjNmer8kZpUmrY0wHSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rlwf91O9n6C1X6BtIrkR2zdlyxot6WLUec6wDdod0UT+oFLYi6tSdggBuqUMI7uWw
	 Oaruq14wC+HE6qrasfO48JNlVLoHVzoqCv9Y7wdL5DHSwXdjZFTGg/FEEA5euPKOxL
	 0yPLXnkV1i2QVIkANlxI2Mt+eU48R65OYlm7Bak4vFDK4JHk3C19cmTVxghuxvPV8G
	 zOX0npm6gjCyr2DHMgBYjGOYJaqOA9VdVyiODQktwVCaSmeb/Sk0696R1T+PuWLKa+
	 9Jldsln1OQZiNKlNW5rlEjSmBfp4Qc0Gz3/cRwBjWMjhB2u74yxskMu8k/RAqBO2r7
	 oqpZ7oqbZRlpQ==
Date: Fri, 31 Oct 2025 15:10:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Jun Guo <jun.guo@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
	linux-spi@vger.kernel.org, michal.simek@amd.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: spi-cadence: update DT binding
 docs to support cix sky1 SoC
Message-ID: <20251031-pretzel-managing-5aaeb4d4ed7b@spud>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
 <20251031073003.3289573-2-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yvOpd+HVFAw+SZmX"
Content-Disposition: inline
In-Reply-To: <20251031073003.3289573-2-jun.guo@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_081104_603794_A9102EFE 
X-CRM114-Status: UNSURE (   8.10  )
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


--yvOpd+HVFAw+SZmX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 03:30:01PM +0800, Jun Guo wrote:
> - Add new compatible strings to the DT binding documents to support
>  cix sky1 SoC.
>=20
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yvOpd+HVFAw+SZmX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTRggAKCRB4tDGHoIJi
0sG7AQD1fJR7wB0W6kUA2rGfkuGdEbH6r2TxX2fKQeL4MyhfCwD7BGSPcLs4m62A
mGkvhDiE5n78Y/8F5v5X7/LHr+JOJwU=
=LJmS
-----END PGP SIGNATURE-----

--yvOpd+HVFAw+SZmX--

