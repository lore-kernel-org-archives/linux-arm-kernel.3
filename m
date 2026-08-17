Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D328C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mAk4FaNsw+5eWKCWmD6aVXwECgq9fdzcLTWmNXpwTs=; b=j6/ax3y2HeYnfxAMH+KcnnGPKl
	AP+CMXkyVJ5w9ztGw/FA4bcwKwiZ7XnDR3s3/VrOqX62THUZiZaNozGH15iW+hAsNACBOamraTmqU
	cIpZY9F/TM7qnZ7Yh7tZVnnxuswccdZHd1nxGoyGf0seN7RNYeaDgxS7UJCsf3HliCYc24+zBT7nD
	h1v5fEinsrTz9kVsJBMowkcx7pYbh7fi/+JhSnywgMcdbE1UTHQx1fJlh001FeIM0/Os+pgQOFpuQ
	66chTvcCyJFwQdRoYAmTyoxqUe6GjSJuOHjyFbdt930mRjPlV5Zv11ddzWicKsTJZMAmzu21WqT2w
	fCB9K+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Hh-00000006WZV-1hdP;
	Mon, 17 Aug 2026 16:34:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Hf-00000006WZJ-2zdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:33:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5D8F601DE;
	Mon, 17 Aug 2026 16:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860681F00A3E;
	Mon, 17 Aug 2026 16:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786984438;
	bh=8mAk4FaNsw+5eWKCWmD6aVXwECgq9fdzcLTWmNXpwTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eiv12yIMAbB2FjmvF+xmzVRsS0TFMv+YLWPln+Vj3lvij77A2PLYjMi6G0HcYg0Un
	 bV59unxpZ9eNYZTRwhvCU5RAmhYrOHc7gpiS0AElhngGraBR0lE1dM/4TwMv9CIplI
	 yikdCVafBTDJq8nFIU04NLz8uv1WZ2w+lc/T9/Bl3BKY6ucwtnus5n7rrVu3iM44rH
	 tLjaXbtX2Rms9+Bd3xfEFM1cPZ/lDx98RgB3mwt9/G2ZDeNFYnlOaxAzDZv9kFEg2p
	 n1Kki8/4o2RO7MC+DXYtq+NMEQDv7y2rom3NNzG7RLViApBUp2rgOjWLDQIYw1YAKn
	 rc3sfIy6mwhmw==
Date: Mon, 17 Aug 2026 17:33:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH v3 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
Message-ID: <56bdd7d5-c81a-4949-8442-b35a85ca436a@sirena.org.uk>
References: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
 <20260817-ti-davinci-spi-v3-2-23844cfb5e6a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xtHUDevHVpScS+2G"
Content-Disposition: inline
In-Reply-To: <20260817-ti-davinci-spi-v3-2-23844cfb5e6a@gmail.com>
X-Cookie: Obey all traffic laws.
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


--xtHUDevHVpScS+2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2026 at 03:25:26AM +0530, Bhargav Joshi wrote:
> Convert the TI DaVinci/Keystone SPI controller binding from text format
> to DT schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--xtHUDevHVpScS+2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDN/AACgkQJNaLcl1U
h9CV0gf/ZvIva2JXndYmojEgJSTSwu/Luqg0Hu/sJQUEDXuwR7e0NkbKl0CJxShm
F8RImOlH7OSewXFQbpchux1RKecAVF6yyYbG3AiR/M2mSAEqMpvDCb7g9HlheM40
OK6hAPmrXyihiK0zhSue75M0K1QYl6RR3QeNt92xDYZP9osWrdT2CVVBVNSODAD+
zrso9vgG1Le6Fgu+3JKDpIlCx1LCogHygA//cGv2MWjoE5lpMyHOrTHOdzNPMhVy
1mBPI+LGSNNpxG1S2kCyh/GXQv7w96rTStYiC+YcpFUTmepJzdnpIABPJ/g6jbaY
ePdAc4q6s1M2QVrx92OlLk0gtwFOAQ==
=QkrV
-----END PGP SIGNATURE-----

--xtHUDevHVpScS+2G--

