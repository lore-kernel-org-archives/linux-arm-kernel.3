Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CDAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBSmQklKPp0n/9DUVTlSZldsEFQEEOVdWWf47uuF8oY=; b=Loe9w0no7A5h6BIJT7cED6twxG
	xiRaKtHXdpAu/IFxJ83hssOUl3sIiplqNHjTAzQgr90XYOO1K8juo1W+nZ1AnvFOAxWGwLhfUrfH5
	WqrIdiTGcqH6VAFRa1zSnmUFSfEQ939Owihq4GpJna4FyewqhM0uxooAyqN5KFB1q/l9nRSzmdKZ+
	lEheU/p4RREfdCWtVIW12tj0a5YZq4p/BCt0Md7hx7EBThjEPNE1NhXk9YPDatHGtZrJvYfHxaeDW
	ASxTq/Rxf4o3O24xy0KNvFGiUx3/CtaOcYCS7ztFHTW1CnM0RZI0rMRjvaF+W6GIPmt4NQTsuaNoe
	oGy4ykIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJQ8-00000009x1L-0rGQ;
	Mon, 13 Jul 2026 16:22:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJQ6-00000009x0q-3dEB;
	Mon, 13 Jul 2026 16:22:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E98560120;
	Mon, 13 Jul 2026 16:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E301F000E9;
	Mon, 13 Jul 2026 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959733;
	bh=HBSmQklKPp0n/9DUVTlSZldsEFQEEOVdWWf47uuF8oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D7EM2B0sIolWj90N3V8D52TZnBRz0Mg+TfKsifOxkCyz8xJtKwVzbUvW07FuMM+8d
	 Fk8YpUQE7JbVvMvfvdbQ5QpgenqxLXb5M5++ADYcxosShWzgkAUc9qBR4rOegML/fN
	 hkzcjeX0oPfXprkkI0fvfgGQe6edAa0+yYmh9N+UBWor9WiZX8NtkPor6e9aTtSD+H
	 y0QjYuuaqKKUNSBwwRQCcXmU+aglQEk+oi3wpcdxjlc3/eT2DXPeS5PJwpjg3OqiJW
	 siBOyBxDVrpt9w2g6C/Q2MvMbqj69Q7+hT3skSeKVFoqIQef1DyK4Sdfr2g5AkbRxn
	 ASGE/bhX00YCA==
Date: Mon, 13 Jul 2026 17:22:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: rockchip: Add LincStation E1
Message-ID: <20260713-unclad-everybody-263f3beef672@spud>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tEq5gXWOcvJSqEpZ"
Content-Disposition: inline
In-Reply-To: <20260711192842.845048-4-samuel@sholland.org>
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

--tEq5gXWOcvJSqEpZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--tEq5gXWOcvJSqEpZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUQsQAKCRB4tDGHoIJi
0olXAP9w3D4pHfVHHnxQNCamgP1X5vtAm9liDaxGGK9GW0kSjwD/Yw3Lo4gcWho6
n/O6FisFQl/6eiqfqtdb4fxzVtTnLAM=
=BUJM
-----END PGP SIGNATURE-----

--tEq5gXWOcvJSqEpZ--

