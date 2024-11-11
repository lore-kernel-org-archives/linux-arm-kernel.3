Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99FAD3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJUgRBJXeIpWfWL2A4lNrZPzQEHHoj5ONqPuy+LPT+4=; b=VoNjeiudnMjwITzyGFXLtj7aDD
	mp8ls94kQU8iZvlPmDIeBqd04UdWKYsqqoTZABMqRwyAj64xy55DjwJbz6/KTYzgiUXXJfBclkEkw
	x1hX4DJK4UHrrrRUswNRuWUom3EDURCEUV3jCrCTkA4nMBFtocjhsd7kdLRn4x9H/K6yeEENolTpN
	MZxPVrzAVFpE8PncEQ3lx3DP5mXXgYB+hywMep6stGvMxXhKTqtcjcOtwgjYnu/PUCfrtqtlVZM/r
	1yQF2mA1roYwQ5wRcICRIVriKDyv7fHR2mEkNBXB8xDoFSPlBdXV5OL/tWiJXaVtgAy7ZKeMr6aKU
	oBAZ+HtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbCl-00000001Dui-2K2g;
	Mon, 11 Nov 2024 20:40:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb8H-00000001D70-3XH8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87645A40851;
	Mon, 11 Nov 2024 20:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAA2C4CECF;
	Mon, 11 Nov 2024 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357332;
	bh=SJUgRBJXeIpWfWL2A4lNrZPzQEHHoj5ONqPuy+LPT+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndAD+MHfRHSBbSaHozkXBdf6jY7I3VmQYwnQ9Bn5xXa225IXvEFASbd+rbiNMSOXn
	 GtZiESzjmpXWGAZcdHnwWDCI0GHXIaEWrxdVB/CsXwDZSmi1pxNElsF3CQ/MX+l1/c
	 3F+d/QeC6Q3tJ1nnYbDvCV5qx23sN/NSwjyT/SfB+gb6kTl/EMWoXYGrkBQa33fOIz
	 5y+MUihepVu1V+YIssK8efiVws9X+LlEfkQbl8JFWx2CxX2zR2/6jXWzAsLRnt56iM
	 ZctfPOOSwNh+Hl+CC8JiYrJpcC09di75QC7vIgkJbxfV1ccHExI1RFw4Z15X+7Nqea
	 DcX01mW8LZKtA==
Date: Mon, 11 Nov 2024 20:35:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 02/14] dt-bindings: mmc: sunxi: add compatible strings
 for Allwinner A523
Message-ID: <20241111-enviable-caucasian-0bde133c7ddf@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P2tUd8xoLv9YzkgD"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-3-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123533_965224_C024EBBB 
X-CRM114-Status: GOOD (  15.13  )
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


--P2tUd8xoLv9YzkgD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:21AM +0000, Andre Przywara wrote:
> The Allwinner A523 uses the same MMC IP as the D1.
>=20
> Introduce the new specific compatible strings, and use them with
> fallbacks to the D1 strings.
>=20
> Also it turned out that the A100 is not compatible to the H616, instead
> it is the same as the D1. For compatibility we cannot change the fallback
> chain, but any drivers are from now on supposed to match on the H616
> string directly. Mark this fallback chain as deprecated, to avoid new
> users to be added.

tbh, I think this should be split out into a fix commit of its own.

Split,
Acked-by: Conor Dooley <conor.dooley@microchip.com>



--P2tUd8xoLv9YzkgD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJqjwAKCRB4tDGHoIJi
0hyMAP9ZGAHS/FCK9zdjUAX2svq725gONsDtrgBRvMElf9rRlwEA+fVjQ2wgl5wW
kbFO0vy7b481xik4eOPVjVc/KhxN6gw=
=V6hC
-----END PGP SIGNATURE-----

--P2tUd8xoLv9YzkgD--

