Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4E3D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwkMTjW6sov+wPp+3u36kErHK1s/HqcK3Hwsq1a5W00=; b=fvqgCkbgf4/LCL5P5sskf5pBLH
	arnQZ47RqtBxGd5AGwaK61CP4a67DcKJhMIR+6JXG39oy0HDXovlm1OQfMxZq54+URW/7poeVT0tP
	PTsgd4jFc792TG2+TROiNt2y8IqcQ7d+vhHildIcjHduw/Rqnt0+yHm8ppVTxCb5wHiGO472QdZmU
	niUdoNQqzTcr+TqiAs9PuRwRHoKCIPDvOxKcJRQ2TBHO8+WsQRaZTpzKiWjItDaogEWu/tf7VhLXL
	If0chXPU/3kJEER2jZVQAEVaJFXbXQYjrlR6yAxHKFWb60VoXa/mMrRTVb4axLstnqMbOWGyhcf3p
	Lg8Y+XMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbSs-00000001Grm-2jKr;
	Mon, 11 Nov 2024 20:56:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbBr-00000001DkR-0WT0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04365A40A0D;
	Mon, 11 Nov 2024 20:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964D1C4CED5;
	Mon, 11 Nov 2024 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357554;
	bh=UwkMTjW6sov+wPp+3u36kErHK1s/HqcK3Hwsq1a5W00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rffi9uUXqJX97dyyGl3VIoon2F640mhLmBoXFJei8nKQ3pBb8Rg97Im4U8Nog52Vg
	 u6ztx5vi9Zuouy0H2W+GZBWlaSqaP1pv6406zAZj6p5IlgBZXsPRjCWwgED7Pj2Qfg
	 d7hp2NRZA1VQ+q3jlM1LESIcUkVUHoKnZff9yWKK/dwYz8ktJPJl0X6iGDv70Any6Q
	 riJNz2ma2oWXWlrGvhP0vf4u2tCHmK20xlqDtNTGsnzAORd4ZBFaRaFLutWa7KXNnB
	 vNDoScx5dGelqgf4wFyHH8btS3Dal3EMhLiSoiWAI409z81ArqkS0xUq3F643gsaiQ
	 zyL7BeKZwR09Q==
Date: Mon, 11 Nov 2024 20:39:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 10/14] dt-bindings: rtc: sun6i: Add Allwinner A523 support
Message-ID: <20241111-bountiful-armed-88c010ad592a@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aAEbuXVm7Dr2XTcd"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-11-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123915_248634_C48215CE 
X-CRM114-Status: GOOD (  10.71  )
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


--aAEbuXVm7Dr2XTcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:29AM +0000, Andre Przywara wrote:
> The RTC in the Allwinner A523 SoC is compatible to the D1 and R329, so
> just add its name and use the R329 as a fallback.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--aAEbuXVm7Dr2XTcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJrbQAKCRB4tDGHoIJi
0pirAQCbFDBqlsipWFbGSgOWt/7FKy8zoNUR7RczsJFMnDFlCgD9Ftj4Q9lmlqbR
/UwVx0Fk9EBUBv94ctiTAmXz+3VTzQk=
=a6hw
-----END PGP SIGNATURE-----

--aAEbuXVm7Dr2XTcd--

