Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C718D1118B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcyzAwmdxnWy+UVULn96QrMVl71ckk1exPOcq3X4mbM=; b=VT1WVDaNrRhMwIJuJ5Qzqxh1is
	wDYRnpydVEJIRMICPpAZ6bxpV2pn2aGWsp5vTwbJ5htdnTMrV6CgDZ5B9vK85kaHyvrFlkVSOVTyw
	JQ8/hO6n9tpvKrjk7Mb0KX7rr8Z+Cx91S41JFI06UCk9C9Jb+xOdUSQF/OFBkKTTOaMX9H7mvvXxE
	i4+Sj1Y0mZEPs+VB0WUKcbIfsxG/CFTYsin9C/rDBQc0wyri5Opwm9+j+LFfiL9W+89QMUkBeC6Ax
	q7c+RzTzomvqRvG564V5Fbpqzx8wOEJ/L20gKbTRa7quwA1kDWnA3/fysFvaMSrzX6ZL2uMnx7a12
	A0fEKa/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJOJ-0000000FOQh-4C7I;
	Wed, 26 Nov 2025 17:33:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJOI-0000000FOQI-1Qcy;
	Wed, 26 Nov 2025 17:33:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F7A9601B2;
	Wed, 26 Nov 2025 17:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0335DC4CEF7;
	Wed, 26 Nov 2025 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764178397;
	bh=bcyzAwmdxnWy+UVULn96QrMVl71ckk1exPOcq3X4mbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFGnnsA5YUEL3FiD6yoOgaxPOShY5oWXs1z35b1435B5cdiB9cXufhIBG6XvajKDO
	 NyqeJAdT6yOkyjXGhLUHwMbY6adgyoKVhRKz0czDfjkE55NhqsMyjetlwNIWDKXaOL
	 Rw3QoY2cg1mBAxaJJWATL9wGYOFfS27exD+lDUKa88UYMlE0s9xgNIigkLTkIGVgUa
	 Pq154PlYf2GuTxPQSNCM7h/jdbw/CxUkCnvxtWsxYLjiK6mW7MvNuQVuk3fNX3sTeQ
	 2b2Gt+7Jh6MBlnOeYyuKswNVCcXatdgZ7CbsoN3JKDtzoUIQWFUPf+81KpAPD497g/
	 VbXoCvpyGTFRw==
Date: Wed, 26 Nov 2025 17:33:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/8] regulator: Use container_of_const() when all types
 are const
Message-ID: <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
 <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EUvgKA/KNoLAmFYA"
Content-Disposition: inline
In-Reply-To: <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
X-Cookie: One FISHWICH coming up!!
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


--EUvgKA/KNoLAmFYA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2025 at 05:58:44PM +0100, Krzysztof Kozlowski wrote:
> Use container_of_const(), which is preferred over container_of(), when
> the argument 'ptr' and returned pointer are already const, for better
> code safety and readability.

This doesn't apply against current code, please check and resend.

--EUvgKA/KNoLAmFYA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmknOdcACgkQJNaLcl1U
h9BNrgf9G3fagliSlzTowrVDUqWxcGYU7cQZPP9nGAGfPD/i+R6fl4OquNcow0L9
ysbIm6eDUtqQxdwJExlK2JXNNIN5acDeXyKa2GTrgqNkS/gg0N9jAWQytwpDalyD
FCWYZLLIz2HqdbnBCUQb9c4Mdd3Xq9W7/kdS4JVoqM+xGoH4n+2v+1pUb1LPiM+t
p7zojqHzjB3Gjdg7oFtPDEdsTTjq9ZG3BccgyQZpXOpOYdc1Hvc+SgPb0gb2ySMr
6nHqYeyrOMtxv757PCjoFo7k+0MF0F4darMITcn807Go7yfiuSJP2dar02xTpqup
OTGcqYKBSBovCNqy9xuNiutCu6xU1A==
=+YeG
-----END PGP SIGNATURE-----

--EUvgKA/KNoLAmFYA--

