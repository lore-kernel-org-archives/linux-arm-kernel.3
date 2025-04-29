Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600A1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuwPJwz0q4SPBmnl1SlwtXvsX7YGknQGSBDFr0NlQ5g=; b=oDPJNFGoYS3PAF8zq8kmEI0wKd
	gCIWVxbeoPnZuYzalhiyFMhcgJPAK/fBq8T0yK54BU1O7v4uOSPGHO8mIU4tSfREqZzigO9qsDgWS
	B0MMWzNJRMnhMYDCcLW+bd5JfE4zbgYT5/vjZFY0w4Xs+qghmspDM7rHbr4O2MBQs4/vxlERpjWXl
	6Mber7G+nOUp4wCon9LydSbxMTl1sfoR4JmWkzZnvOnI0kVEJtP3D72s0bmAAvSTLmLBntcfcZ9Yo
	pkQTIFAmCjRf1q0u2oOe0xXbIqfgdDOTgnN80SgW52ZfnfnrMkRChKQuALCztPRdbLE1EZZbcWkmn
	gG/Wvzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nJW-0000000ABfO-21g9;
	Tue, 29 Apr 2025 15:56:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mwy-0000000A8pu-01Mb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:32:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 729B6A4B7E6;
	Tue, 29 Apr 2025 15:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA0C4CEE3;
	Tue, 29 Apr 2025 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745940767;
	bh=VuwPJwz0q4SPBmnl1SlwtXvsX7YGknQGSBDFr0NlQ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4+OLkUc+rPfi76rhNWT7wemeGn6mjA9XRHVpW3luOJsQkqBKgCxYunErmJBWmxww
	 Pz/MhsezMImTfGOVhc5evW2ALZWvxE6IPJp3Lm7r69sGumFC0WNB8avgQpgCitQV8r
	 OoB+wrj05m6mpKRnO8iYJ2hmFU4PWuIvgpfNk+V2QTZ39fMuZBpFdQKN06kI2u/7vg
	 p7hqC750wH81dqACGzWykNCvyLJ8SBjT9YnVKc94Kk73DJzp8yZ6fEZC71ybcfDNLl
	 IAuahVlhrLxvZ43OnowmtDkhpLjzWlPWzcxzxWLhEUVfrxlVFCObgrH7xcjC0GlLhd
	 JjHosA8omdIdQ==
Date: Tue, 29 Apr 2025 16:32:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Message-ID: <20250429-emotion-nuttiness-f80793625d8b@spud>
References: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8uGVDpvfYDRZlllJ"
Content-Disposition: inline
In-Reply-To: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_083248_114688_363F687E 
X-CRM114-Status: UNSURE (   9.74  )
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


--8uGVDpvfYDRZlllJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 08:40:53AM +0200, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
>=20
> TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
> reference design.
>=20
> [1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqm=
ls1012al
>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8uGVDpvfYDRZlllJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBDxGgAKCRB4tDGHoIJi
0lzkAP0Ti8bUfhCzvVLj12I+uMNG0YNOjgZR0b4b51vWJnOIgAEA346k4xWf38+2
vnU+ktHiSxURtSkmVR4YgndSEakaeQk=
=PQNx
-----END PGP SIGNATURE-----

--8uGVDpvfYDRZlllJ--

