Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE6BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9x4vHTWLDDV/EjZbLueO2qDkSixymH79Wp6H2fnVmhk=; b=kn2LugH7/Kd0IiBvYzvlF8g+80
	DX/5a7vgoHn7GrV69Vqop/UeLfzrrff08SNuhKuFsk3czZLH1qExKFU1r9gMph8ZjVTXrebQmdf01
	jmN1J0+a3NxjAb6bwy2pNbK94YqubtGfjdzYBzYqadXTzN2zZNsvnxRViPQvezVtVnlUxVkPPuJk3
	NBXf789dP6wOhvZeEcLKmpTRA5dnxc2PWoqa6tAiOhHeI1xHCc6AfEwuxrYbUGujM5pEVBj0XNh1W
	FnNQ208tXwL1qX6XCndYw/oiZwxkEoxor2wMkdRRV70XXwYZiocjCFmfd5XHp+ZWqFUR2ovo9bt/0
	29+3RovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQhI-00000000MwM-2dcG;
	Fri, 07 Nov 2025 17:56:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQhG-00000000Mvz-3KP7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E17FD61919;
	Fri,  7 Nov 2025 17:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066D0C4CEF8;
	Fri,  7 Nov 2025 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762538185;
	bh=9x4vHTWLDDV/EjZbLueO2qDkSixymH79Wp6H2fnVmhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1xoS26d7PrUkPjZ5qve3wL37bUFTIk5DTkt2j1bBZlXdPQrZfiNYI+1tr0YLTVx5
	 rJy/dsLIw/XpBulzSlFC0fuM41D6d1cNO+/TFEL60UeWyDQb8v9ILtcljZB/vxcUUm
	 hOUDyvzUGzUkulXkACbZjLRUApFped5PYzjxSG8gOjtebxGSm3qJVDkZHUV7IC59Ny
	 /KzolGTa1PjqFDg6/b5cbmKcV3zT/2bklBTSdsfugZNroaQ5bxBZYCoo1a+z9fxWCU
	 X63npk7V261yOxoaLYPsIarxawGSl18+gjgG5zQW96JOE4xHIsxxQz2pTWTo4qiX42
	 jYrFGOH63kcXA==
Date: Fri, 7 Nov 2025 17:56:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add Skov Rev.C HDMI support
Message-ID: <20251107-selection-operation-872d258103c5@spud>
References: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
 <20251107-v6-18-skov-revc-hdmi-v1-1-595549e5b496@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f0HiALue791MdAzQ"
Content-Disposition: inline
In-Reply-To: <20251107-v6-18-skov-revc-hdmi-v1-1-595549e5b496@pengutronix.de>
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


--f0HiALue791MdAzQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--f0HiALue791MdAzQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4yxAAKCRB4tDGHoIJi
0lyfAQDVSalTcYUJmk0ioM/yeJUganCmrgpGbR20PSmMd21+bwD9HWuM9Wc0F74/
lbNwWA+HHw469PXUotscxIRfjMsmwQU=
=7C8A
-----END PGP SIGNATURE-----

--f0HiALue791MdAzQ--

