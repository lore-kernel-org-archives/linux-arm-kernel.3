Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073E3D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDEI/thWJiBMY9mHoZhi+D4YDmBmVFk7wRyPk8VhQG0=; b=orNw+mBpP2/TG4aH3/P4+BUO5Z
	4I0NFPRjUAWvMWjHXmqTw3RzXHaQ+619BxtnDSbEixvRYj/zsX45n51xcQ5f/7bdodFNdcI8i0Ohd
	5eq3xOM2UrXu99+1/f+JdkSRiOcScBLZDJ8rqbJSWqYmMxRZhGfazC1lccVV13hk/VOoyZr1901PD
	djIo2vs/6xrMtty+gk4b4dP9YZNdiEr1EjMkBoNAB05uJR91wFUCqdyvcLCDlGZgzt940+7XnxfOb
	XKNbacj962lOYnFK4aONLOTj83hGWr1rBJ3rqGvAZroYwj1vPaYdl8TWH1s9V5yR32R8kEzWztmZr
	SeK1mgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVxE-00000000Rx7-0TfJ;
	Thu, 29 Jan 2026 17:37:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVxD-00000000Rx1-24JH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE2F66001A;
	Thu, 29 Jan 2026 17:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC791C4CEF7;
	Thu, 29 Jan 2026 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708234;
	bh=bDEI/thWJiBMY9mHoZhi+D4YDmBmVFk7wRyPk8VhQG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ts+uVA749boU+9G+2XKeP6LlKRaE+HI8B8FIDpZdTiZz5UpWhTKnaM6rpLy5/Nkkx
	 OpIBpTFjnBJI/btTpp0xSKJQVZOevj7gFaOP8lIrA5IJ2MN1k4RzKNq28L5pLsIwGO
	 ipuFiiWbDpbAZMU8CKnmFjU/wQsWcUiaeJyNZiXThIPdv1FfzT4cmf4pH4CFJMsp/N
	 pm/dZK0ss+0EFUw4iJS1eGTo/SDBWgZdzJ2DhY/2Jz7ARzrx4iNkZ18I6d4uyiWHNY
	 7jQSyTh4L4M50h8UWdZ1oSzQ9Wfj66WFRj0neLy6jdSc05f48+AV20YMj4oWHlhVNM
	 7eL2rIZGMdgMg==
Date: Thu, 29 Jan 2026 17:37:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: xlnx,i2s: Make discoverable
 parameters optional
Message-ID: <20260129-appear-thirsting-9628adba52f1@spud>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fFGVvv6Sr715S97e"
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-2-sean.anderson@linux.dev>
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


--fFGVvv6Sr715S97e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--fFGVvv6Sr715S97e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuaxQAKCRB4tDGHoIJi
0ubHAQCFNwUgG8XLJFa6c9F10Qwq9HGMzvxGVaHwSpRHGxmXGwEAj1DVn5SHnCMO
2rjHPiSbWkwrKh4KEXSjae4/DaSxQAM=
=F31q
-----END PGP SIGNATURE-----

--fFGVvv6Sr715S97e--

