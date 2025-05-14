Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A29C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24MnUSFFfwAq8i69SzuL7SpN9d741kOz5SY4aZXLEHk=; b=qxYAHZUVjZpHyGbnyOYb8KW8EQ
	shtxNVatLEWf7GPJIUd+x3bplJ4Q0xnzXgQbICqa/VtiVwstXbDqUtPB+l43Y1FiVnlrDRja99NDV
	55QswjMItldk7xzCOqJs0IHqetA6kyjoEuULxO8EcWlW2LN1Y0apgfGJqRLTd663PY/XIgpJ77UKy
	6JpJozSw0LPcSIFMXgTnL1flt1YzK0lqV5gjFAVk+2Y0FiB+PFiy0FPHkifX0i109cxPSbgHSJcyV
	tA9idtr0i9e2JvuUF++dQrqmxARO1knP6uei9wU70II1+PxvAoJtsKNL0lUhxbkUCQq1AW/WcGsg5
	XlwEfmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB3c-0000000Ezxs-0fgI;
	Wed, 14 May 2025 12:17:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7sx-0000000Ea9b-2QCH;
	Wed, 14 May 2025 08:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 959FB5C6442;
	Wed, 14 May 2025 08:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3C5C4CEE9;
	Wed, 14 May 2025 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212882;
	bh=xw5uD58QST9stWyPF9wBRPxKJjr7Ja1UDw/xcOocFfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ11nnEjAdHJMfSucx20z0NavXjnsj8DnmLykqMROz0e5BiM9ovpfHz5mrhf+4daL
	 uxGbwU1YtnjSrpltFMHNdPtxoLslRr/Wbj1xEZWNZkSiRFNpRAMU8Zp50B1Esopl9B
	 zMxud3HoZ/1ooyXaWwinfk9uNcM+Uto4AJmrA6ioKJLN6X+cuUdHUfvcIBwu/vgAR3
	 j8STdXt93KWcwE2q8zay6QWAaa88kkL8DXb9Q5QgiPTZm/bSwMg5w2wl+6Naf0qwlW
	 I9/FWnnru/FvjwFqWrC3nxzh0FkMmiH65NR4X4GpLb1xT+P9muguD50bACwx7Qbips
	 pNB31oJ6FfWeg==
Date: Wed, 14 May 2025 10:54:37 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable
 buffer pre-allocation
Message-ID: <aCRaTY76dnaavsrd@finisterre.sirena.org.uk>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U6cHvsBIp+ec+dLN"
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_015443_668618_B920BBD7 
X-CRM114-Status: GOOD (  13.40  )
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


--U6cHvsBIp+ec+dLN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 06:24:54PM +0800, Chen-Yu Tsai wrote:

> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
> buffer pre-allocation on some platforms". Link to v1:
>=20
>     https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.o=
rg/
>=20
> Angelo requested that these platforms use reserved memory regions if
> possible, and fall back to pre-allocated buffers only if that fails,
> to align with other MediaTek SoCs / platforms that already use reserved
> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
> SoCs.

AngeloGioacchino?

--U6cHvsBIp+ec+dLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkWk0ACgkQJNaLcl1U
h9DPngf9HFu/3ZkDnoocrHYYu5p+eGsgCT9kWQ5SHJS29c9lsMZ30HwQZo/2vDhr
LDZ87sH8is2iPnBLPKzC5eJTKi7IHkj15yVKd3yWn050kVCPM3GICvomDajGSSr9
byq5kvn7QdweGf0pLByBQuowHY6cG3ogpFmihc3YJiNxfpGDSATvAht6P9dRNJSD
UxzlHu9i5iEz1h9J3SHF/ywynx897V9X3JgmB8ygPA2kqen58+D6uecKrGCJYpjf
0e1GaIuq5ZPDzo0uDXz+s1rWUydrVSs9So23cBxhuWirlc+LkzQUvPULwUWlWV9A
uR+j5rrJ6Bqy9TXGYNLkZ/W4dp63dA==
=pmSJ
-----END PGP SIGNATURE-----

--U6cHvsBIp+ec+dLN--

