Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5B5CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywB2J7ZtGdpNwTs5xx/wUpxuvR6/Qw9lbD1G2ulil+4=; b=ormJ5Gzc+aj7jUYFVGS73uI/cC
	q1zKN9yXxXehspxLZbEK557H3I6rBI6EeQOQ51kNrNzZTz74TIcaITCurpM6BC7swEh/tGJ0QlbAn
	jyJqeFQKWxTaZBUa/B60xxBytvkQusUtscXNQINxC7IpDKAspK1vqyfwuqs07tltPp2yrNpxtYmaC
	FJW2g9gSOubgBK8SJHIphC/1vX8Pj78cdCBhIzng5UOjywvzm9CKTPgf65YBIkWyXYFsC72ycBz/i
	WB7hwJfiQjqgJK4YqUWw0tkwSbFXB5lGqeoJ4NTICAzzKCbStxTWCqyLl1MlvLau4EtpYnfccgL7/
	XGNW3spA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaal-000000099Wi-1hxM;
	Mon, 11 Aug 2025 22:02:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulV85-00000008Lmt-1iDX;
	Mon, 11 Aug 2025 16:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 591CE45D6D;
	Mon, 11 Aug 2025 16:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CC1C4CEED;
	Mon, 11 Aug 2025 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928728;
	bh=ywB2J7ZtGdpNwTs5xx/wUpxuvR6/Qw9lbD1G2ulil+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzaJfVEl3M/Ys3WfHZ9dLYbAm7auCaWvW/s4YH+7GSZcPf0mUlTZguwPJCtvpH7GF
	 L6Lhba1BWh9vLiFbS8jmINS2Cww+GLUaLep5CHuJi4g3A10hZfY8CE1DZDLuXHR3vo
	 rnHZz4w1wSzqK0CkspWvZSNGWPd4xMvvQNsRsaZt4J0/R6Fgs/kChA1HVzG0rohErO
	 D/jS9qAv0IGK7nbN6FbNrJDlCi2vjckCtupQ7qqEbrJuldmHXTkDHFn1L/2yzdKZzC
	 OF9hdX8oFPVFscbSwb7CMG1pvpyXu9xtJn3MfMpm60uCXiM4e69kSC6s6V3bg/Mflp
	 YQzxt+93tYqxg==
Date: Mon, 11 Aug 2025 17:12:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND 0/2] dt-bindings: Drop 'db' suffix duplicating
 dtschema
Message-ID: <20250811-pretext-nurture-f26afcb71bc4@spud>
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7RBXh8TXneQyLtd"
Content-Disposition: inline
In-Reply-To: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_091209_469261_FA420DEF 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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


--i7RBXh8TXneQyLtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 03:54:02PM +0200, Krzysztof Kozlowski wrote:
> Resending because all dependencies are merged.
>=20
> Please take individual patches via respective subsystems (phy, leds).
>=20
> Previously:
> - Link to v1: https://lore.kernel.org/r/20250627-dt-bindings-db-v1-0-d5c7=
072acbee@linaro.org
>=20
> Best regards,
> Krzysztof

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--i7RBXh8TXneQyLtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJoWUgAKCRB4tDGHoIJi
0jEAAP9vwCB8aZKzy3TpMtP3zqVyMGQwcwldZvWKjvk5CrVmKgD/UvaQDx8AyMC8
Dc/Ub+g7NWs3WeUczFQzekOgSwe1QQw=
=6OLD
-----END PGP SIGNATURE-----

--i7RBXh8TXneQyLtd--

