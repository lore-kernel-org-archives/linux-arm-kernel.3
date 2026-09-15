Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318ACC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1p08njRzaxxJUGeViwEgW9D9BKYP62TZf0wUv6jTmcs=; b=lM77Xm1V1xu1RKhOTf2fduEYXL
	xXd9hwHJwiZNRcrhAUQyUausnuIxhcl74hSEeakiYis7br8dHqY1qJhg6ZgM860OWbc9DuzjUuRi6
	VcBL2bG3sTqbGL+xWdVleH0MvJpnSIzT1WJAN4dpyxp/iRiXJzAu0M+vqCdLfMPDBQZcgBUNs8Dr9
	SQDOst1ZbB2IjRlzzWsDjLzlN0edpyQ2GK6prViCB64R+/zc7K+001vvHaEkswUjnkdRyq/ROeGrg
	mlKWUVXeUbmWmBwYcmvopXWv9YaW66EELlte9R8d18YzMw3JvGBxA7NuYUPh4BYR1CqUX+ttzhxjo
	yAuPCVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WV3-00000007W2f-2bxh;
	Tue, 15 Sep 2026 16:59:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WV2-00000007W2K-1mjM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:59:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B81040987;
	Tue, 15 Sep 2026 16:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D779D1F000FF;
	Tue, 15 Sep 2026 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491556;
	bh=1p08njRzaxxJUGeViwEgW9D9BKYP62TZf0wUv6jTmcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFjTYw0V5uMopAB+XnR9iv4O7/EgB2tOBkHcbBcSlAsgQ/xlSPvy3+PNJESBCa3EM
	 rHEu8+JZx96SCWSgS0Fuf+gRPq+rGdNcaQhX4EuvI6BqapgZ9ktyrdvMCrxOqfheC3
	 5WSkAfr46R3lQoAW6zMC8T/HZ7o90XY/B7TtoapZUvvyqxg1epA/1Rywa5xNzvIvav
	 0EwoJzO+ckeFGRHwcwTf8X1J3wF3zfkVKxWOWJWOAGCck5F4TVzMCFTIgfc9PR080C
	 4ia7pzIQ+KgvICHtHvqr8daUDn+H9/DQ9UDYXOxY2gry4g2gK2Pukq+ClpA/DBWj5Z
	 Bm3S/msLT0WwQ==
Date: Tue, 15 Sep 2026 17:59:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for
 Teclast
Message-ID: <20260915-stubble-jarring-8ac922fb7465@spud>
References: <20260914210115.28151-1-andre.przywara@arm.com>
 <20260914210115.28151-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ds7rGmwnVtxv+Snq"
Content-Disposition: inline
In-Reply-To: <20260914210115.28151-2-andre.przywara@arm.com>
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

--ds7rGmwnVtxv+Snq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ds7rGmwnVtxv+Snq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql5XwAKCRB4tDGHoIJi
0hZLAQCKbMz0kBjj4L8osaddTBmbeWcDEaxQ9D8TnpULZdlE6QD/RqZKDFDrpK1A
MjljX3MSYrM9HlLEQxswYcGqI9hd/AY=
=B+4o
-----END PGP SIGNATURE-----

--ds7rGmwnVtxv+Snq--

