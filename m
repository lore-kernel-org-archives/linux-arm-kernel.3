Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9929FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twbEl6RIop6nZrrZWjYGdwphD6aGwt1zB9C3V1gHSlo=; b=VU7PMyEq2rG46EoJtGefCPeIfe
	qoxn0JlQ8EiMhACGDhlazcJ+js+SCP/8Yc183zCJx+Z/D3jPX/r895omZofZ8NfICvoM0Laxm4kMI
	uf/NsTI9U0JpRA7nz6nervPQdIm6qIjoPb8NJoXs8gk23xCjZ0b9Atj4qf/+9619+RO2VynemeN9S
	kNckX/y7PVbzwJ8iVhMeJ2gYIkOkLx9AN8RrYIyl4RsvmTryhMLUmPJN34Vfjjsdb217DkCLOKjNk
	3wkJoQDBrhlbn+cgL3MdpUJ2ZQw88PYtdsmFhAnI3e6iN0PmLDO5XytsHmFaHDVHwER5lJTxSgaIB
	dBZ/aQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriBs-00000002yEE-1EkN;
	Thu, 28 Aug 2025 19:21:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfvy-00000002KZb-07vP;
	Thu, 28 Aug 2025 16:57:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 558E36013A;
	Thu, 28 Aug 2025 16:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35398C4CEEB;
	Thu, 28 Aug 2025 16:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756400229;
	bh=twbEl6RIop6nZrrZWjYGdwphD6aGwt1zB9C3V1gHSlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6baMZT0HtqWBcrbX+fYbmZkLsk+3QnIsdA0VS4USY0L3HGXsilySuDBdrDLeWYZ0
	 uiwngObcZqJylx3m/I/vc5EGSlbzbL2qOJedAfvuLkQnW4ALGSYGm061j3Ba51VVwS
	 xgJbVxaVBfh3NrGqpS0xvLq3rrBNHhWyDCVm4QXzhvsdqfgLfoFxb3Ay9EW1V19vfK
	 XHcKn3LdodfBQN6icZ2CJ6hMEsZWevGfMIvAjlR4owY0a2j0CFjRpMygUMj0X2f8cY
	 fWOFXJoQg8HHnO60Jc3HnIvUMbXcuxCI8q/Z0jAY9IWdpnHAgL5NR5ITnOBDOG8sc9
	 A6pW9uU1ti6wg==
Date: Thu, 28 Aug 2025 17:57:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: soc: rockchip: add missing clock reference
 for rk3576-dcphy syscon
Message-ID: <20250828-shame-stinger-e1443c61d31a@spud>
References: <20250828131107.3531769-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p9ZbeHQWfYofwOCV"
Content-Disposition: inline
In-Reply-To: <20250828131107.3531769-1-heiko@sntech.de>
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


--p9ZbeHQWfYofwOCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--p9ZbeHQWfYofwOCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLCKYAAKCRB4tDGHoIJi
0glBAP9334cjtxvGihXrVmnI3SiWQWYFgyyt8jz2Ht0U/JaZ7gEAy3V7xRCiRHkx
ARtCHT1yuoOGr+Lio1IlQih2X4fixQM=
=VoQr
-----END PGP SIGNATURE-----

--p9ZbeHQWfYofwOCV--

