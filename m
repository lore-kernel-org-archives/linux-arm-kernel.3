Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65696CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTjiv2/TKYKg8TdJlS1e8VNcO9aFXlqH7uu9TXo9p7I=; b=RNUUYul9TnxU0t+t0u+PA8C2Ch
	b3rIe1S4npq6qytYhycgoO97HmN5JDGxdyWwguk0wAD/ERx3qaO+sKj1b/h0P1d5HUeWq9gl8VJNP
	9p++05D08NOn7696ZJ1FoprIr9Zg5NuWaFweGalMySsDaHzvZk28/U+BVizdci0y4qCuF44qZu/6e
	6bxFLNycQkI7wAuifM4/EZGBzAoqVW8t5j7naFG4s3+pWy+KpQJAsz585IclnNUkkHFG2HqaZn4BK
	P4iqBDYbBoGQarj2UKDMEizXsOMg3h9RHfUgkZ4bNYBcuhFkicNUZ9KPOtNfCyFS+oM+NhoyGRcHw
	p2uIge/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNafA-00000006IrP-0HW0;
	Thu, 14 May 2026 18:20:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaf8-00000006Ir9-11eC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:19:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EADD360008;
	Thu, 14 May 2026 18:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4CEC2BCB3;
	Thu, 14 May 2026 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782796;
	bh=gTjiv2/TKYKg8TdJlS1e8VNcO9aFXlqH7uu9TXo9p7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRXrZDVx7GTdXCnIwrHfDFQA0dGr35iuWoB4FubCL5S0/SggcV3ELk6ElUR9Bc7Xr
	 E9RlVLcF+sOuexxBssBK4IQcHoUpAXH5ZdNXZg+V9yPdRT16uPEin1MmUBzJj3EbjR
	 qS6dD++lzzSbVFhEkG2nioBmBS4WC8mOW2j2irA9Cp2m6ry5OkGgcDBhH23JU9LgEa
	 4V1C+ZqUZfxF858MrOZpCDuP3S9Iw2VisXNJ630nq+OV5288iS5K1bAnX+5W/HBxGy
	 dG8OXo8duFyfWRP/DzZKY6LHGoqUnv3oIL1MIYg5fTwJSAXRTbYYHfZxXwQytYuwHd
	 ZvsKB7cT12m4g==
Date: Thu, 14 May 2026 19:19:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Message-ID: <20260514-spiffy-freezable-e8c6d9042d57@spud>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
 <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="URRyEgb7TO15cZW/"
Content-Disposition: inline
In-Reply-To: <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>
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


--URRyEgb7TO15cZW/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--URRyEgb7TO15cZW/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYSSAAKCRB4tDGHoIJi
0pscAQCKHketvGg954MMHYLTbNRveDFA9z87ehYbOYNaP/sQhAEAwtGdaTIOTrWP
3HYqEymg57NUGfTRu+sS10wbhb6qYAE=
=8NEg
-----END PGP SIGNATURE-----

--URRyEgb7TO15cZW/--

