Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2EDF53D8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do6IcanWjgZ9OwhL8LUBwscJwGSw7kaZ1QHoKmjb8ZQ=; b=Asd08kesYT48eTwLmwG9GktaCr
	ErAr60i+mVLHOM7G6p4OWlg5KcPQ15Ew2KhUk/uSqTfmsmySHjquq/OazuCf4GuvaRbIyuXEWd4vN
	zHPE45Pj/dE5XROCFOi6cdEP9yz8gTGv0m7VMzauFHpVmhwCRWrBVShuks13VjBVGcBxvMker3k8T
	yJV2Vcdu5dgJUtMEIfQZqBsh96rR7u9cH7vFFonkiWhNmZE0SzAZiEPwQ8o36E/wm5U8sAVs8/5Rp
	BM+9cBiIFkf4XdHPWR+yTy4TvOgn1RU9a28upuG+UYChUT8mKQO2BoB5QSqzvXwFI61kmcV7slJnr
	Telgsuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Drx-00000004mCq-1scZ;
	Mon, 16 Mar 2026 19:44:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Drw-00000004mCh-2GEd;
	Mon, 16 Mar 2026 19:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 901BE6012B;
	Mon, 16 Mar 2026 19:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B9EC19421;
	Mon, 16 Mar 2026 19:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773690291;
	bh=Do6IcanWjgZ9OwhL8LUBwscJwGSw7kaZ1QHoKmjb8ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7gI2fPFbiW6sipF9+cN7soA2eq6SYcXIjjvromaLQUBc+/nu/92wZMP/0DSyEBFN
	 /ELA0k8qzvxjOmkPfYj66/5tLtmsx0xtIDWoV0wusQAC2wx2v0tW7cb5pC2Zf448FU
	 4GNCUsZ9jkZChKDvoxNz0ElVBj4lDPzVm/DYA9vACjW4+GqPlAoGAsLOOviOp2Q7jv
	 oBgdDomqt0/j94NZcxg/8mLkBlcaqI6Z97FanJHhNFclQWLeXb+XZy1dhNhnkuSdP2
	 8l5ScV0y5CM3RYRp0PArfRVfqLy33okm0vz+Unzo+eeTObcKyG67nTM8YFz6CvzVom
	 HRF64sVDa8B3w==
Date: Mon, 16 Mar 2026 19:44:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: rockchip: Add compatible for
 RK3576 SPDIF
Message-ID: <50e2f262-6fc8-429d-af0d-5f9d1a0d6ab0@sirena.org.uk>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
 <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GWHp22SbdXNzVybv"
Content-Disposition: inline
In-Reply-To: <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
X-Cookie: Not a flying toy.
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


--GWHp22SbdXNzVybv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2026 at 07:23:00PM +0100, Sebastian Reichel wrote:
> Add a compatible string for SPDIF on RK3576, which is similar to the
> one on RK3568.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--GWHp22SbdXNzVybv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4Xa0ACgkQJNaLcl1U
h9AoQwf8ClliJCIkVoEL1x2kxqi//Z/TMn0wPThl1F77C1XdHAIj0eqrI7EJpMGN
h2iM30XhW4bhMwjLajXvWgUCOAJZoBN9xYL4XEJJBUV77wVOwrMSqnzl5UDTkkJb
0RjA+RNdiHgMeWEZZszliZoB1Oa4yRKiKOCBtT8QXbdb7YtKEhe5vHlmI1tQ/KXQ
fdyzjASvN2QNP+qpFTkdzjyC0Yol6hWK278VY2e6a1mbikwOAlRrTnpCqz0D3bko
63mhZSLtqbXub51FvDH94L7z/qclhOaIR+KwgcXgqxQdhBFlCvCH6RVk2I40R8Ka
HI5Z9NFYnYBcknjfUZmwzqiDpYYAxw==
=R0Ga
-----END PGP SIGNATURE-----

--GWHp22SbdXNzVybv--

