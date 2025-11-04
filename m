Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ADCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EJ06/xu+MF3npKBmkZkcX4nKJgZvz6INMbxir4/Xe4=; b=tQmoIwOMLZFuQ0Kt7tbCq0H6hn
	8JcilrCu9wqObzhpk9hAg6/ck21xdKIQtc068Q880OzGSns+wWYYEU7sr8rWrB2E1zJVgzxLUSpXj
	//e/FSVSWIrAJ/35r0dMMeLZWYkcuZT3w4QzFBUN9PZq/Xr+9dk6+vAQqol+F+RzWkgr2LjDXaxzX
	B6zhplxfQEGbbWkF9sts/82mUDq5S3WQZwVkyOOkHswZwPeSyvZ6cZg7IfRLAnaUA/IlL3o4c3GGA
	86ktw43N4vdknZzosiLCY27K/LY5hOVsH4EM8egwvyQR5+ZuMuPt/L68h5NT0wFP9GqtSE+1aQ4oS
	S23hY2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKj4-0000000CGFx-1eaO;
	Tue, 04 Nov 2025 17:21:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKj2-0000000CGFU-0ugc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:21:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E84402E7;
	Tue,  4 Nov 2025 17:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C666FC4CEF8;
	Tue,  4 Nov 2025 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762276903;
	bh=8EJ06/xu+MF3npKBmkZkcX4nKJgZvz6INMbxir4/Xe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O09p6ApLebmrl/aHzF6TcAoaXfhDCrzMISaQ5q8vGfdY8Bd6AIySyugt1StuAtiar
	 ozDRdquvT8cnFImmxDdKkLTu08IgDACEku9FuBDOfWnqsrVwDaq4S016OwF2C4P8Dx
	 Fve71DPcsTCjSmGb0ZQszdeS3QxPKwBTpvRIeGwgNNaMJEZlmBzmjiGTQd+lGutRe3
	 3eu26Fs9ShJx51vYDGf58SqAjHdICcA0pF01t6Gxd2kZwEivF2ZyFdVJ555Fj7rx+T
	 WuYKQXsdojm6sHUUbGlPmeG9garKVVzsMsj+ppOuaOgr7KlPZgCltdQYcUUNlO9O6T
	 orin7P94k+zxw==
Date: Tue, 4 Nov 2025 17:21:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: bus: add stm32mp21 RIFSC compatible
Message-ID: <20251104-cycling-paralyses-8e99cda7944c@spud>
References: <20251104-rifsc_debugfs-v1-0-7ebdfbf8d33f@foss.st.com>
 <20251104-rifsc_debugfs-v1-1-7ebdfbf8d33f@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ja5NuCERZEEhWodx"
Content-Disposition: inline
In-Reply-To: <20251104-rifsc_debugfs-v1-1-7ebdfbf8d33f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_092144_279573_AD9E4E3B 
X-CRM114-Status: GOOD (  10.36  )
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


--Ja5NuCERZEEhWodx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 02:54:10PM +0100, Gatien Chevallier wrote:
> The STM32MP21x platforms have a slightly different RIFSC. While its
> core functionalities are similar, the wiring is not the same. Hence,
> declare a new compatible.
>=20
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ja5NuCERZEEhWodx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo2IwAKCRB4tDGHoIJi
0sdCAP9L1bHKFI2Qo75eH5i+O1mmMlb2f4QGSM0NNzMxwNGoRwEA6NFzMMoR4anc
eHAn0FSEmUesoeTP9grmuAiPkOVScAw=
=8oy3
-----END PGP SIGNATURE-----

--Ja5NuCERZEEhWodx--

