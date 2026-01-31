Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6325CE7C6E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lewz4qnNVbNBEvCRmfUiMH3/a7XAklebuCMfi3/B71U=; b=zcbe/0FGvK29VQ2UVwXW5wQG1K
	eV0fdmWqKIvr6sy6yI71WQzclXrDfNSJuWsK9YoOA2aaj7I9QPGaSiEjgtS3/e65jgvYw9QHUtAjf
	115HaXmgcKciUok+1zqg0eIpuWgnrTNhMzw0rKD6CO5LzjV+dnkl+Yq/Qb1aqI8303kVyJFPZlyfQ
	aBpUTmh+mEwEwkLx+KqVQ7hNMS2R6SuvpnfbMVxZPNI37em5OVNNj/5lNTlKmVxcRLRb+7P0I+qrm
	ErM0jsYLXVoar3fAglYnJV1eh/I+TqSln5JcfgrEBpgPTwM0WQGh9UY00Ndt/kenB6jGGL2EoUQeK
	mIT+tvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHbO-00000002z0u-0HqB;
	Sat, 31 Jan 2026 20:29:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHbN-00000002z0d-0ynI;
	Sat, 31 Jan 2026 20:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3F2560200;
	Sat, 31 Jan 2026 20:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5859EC4CEF1;
	Sat, 31 Jan 2026 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769891392;
	bh=Lewz4qnNVbNBEvCRmfUiMH3/a7XAklebuCMfi3/B71U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+/glb7SxXHll2OjKMpVry4y2VAPyP9Zh4Zj9NGOgNfILSO8EBeVKGGmKjyg1wcWa
	 jNrFnxuQTFqFBNSrdifbAvRpw73PzbDRA0ER+U9zTJulHVKRNrYCNJFFZRs/pHMN81
	 n20mfJ+RHy6hqzzkDwRRW0Q8JxZq6XHfTfIzsTOOi7+Wde2ajIcz3jfjYHssgWmi9h
	 v8iVle5+j2ehHAzA7y/iI626DREajXEgdb873inxifNAS/vWz3fx0RYKolWGS2iM3M
	 xBrHqpuunZUyCCdFFPEuMT80SQ5rSOxmEcFEtmJmTrf7FjdZRpXidxjA56OZEx46CY
	 w7ov3U7wA2uHw==
Date: Sat, 31 Jan 2026 20:29:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	alchark@gmail.com, dsimic@manjaro.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen OneThing
 Technologies Co., Ltd.
Message-ID: <20260131-emporium-patrol-38135e9019e5@spud>
References: <20260131153106.31723-1-jerrysteve1101@gmail.com>
 <20260131153106.31723-2-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgWpgL+R6/i0XvEy"
Content-Disposition: inline
In-Reply-To: <20260131153106.31723-2-jerrysteve1101@gmail.com>
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


--fgWpgL+R6/i0XvEy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--fgWpgL+R6/i0XvEy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaX5mPAAKCRB4tDGHoIJi
0kYAAQDtM2AA3Ol/gkSLPBdaQzEsJRgqBnNmMB2vb6l4284bvwD+PKrio30dLdp4
ONTBmhcEIAw9kWhh/+0N8dFt2igtLgg=
=drnZ
-----END PGP SIGNATURE-----

--fgWpgL+R6/i0XvEy--

