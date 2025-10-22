Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C8DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C7JSiw2cENDeyIwTcB8RFCSbO1mNJYYryNwgOrWVso=; b=AWYiHs4k8hfjlXW5YoZGr4xGoo
	JOlDAcwY4Ah713TNidmPlBsqRUM7QrklY7IizjQUYDi+ABBX5TacLJBvyLrb4UBkKiF+WPlCbKUAJ
	QAjuCtpdP4wvTBRW+A39I5GwDDLGTpsJsRQvqg1ccEj4Vv1IVgue1ZJzfNYPP5x8TQPx7bIb68OtN
	4YfjGowz9D274spMQ2XP9cK6ZEyID3QPsmGAbJaTt8vgmftNvHwt+7AnKwIH1kiNLGsOLqHG9RBoi
	bbib44t4QzTzN1qieW+G4eaQ/hEohofvRQf0/Wm1L/lL9jg0ESGBC9GiEvrRdVXCutVi3IjOWF1Jr
	T8eM6IQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcm4-00000003oSK-0Fyu;
	Wed, 22 Oct 2025 17:37:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcm1-00000003oRj-2GAo;
	Wed, 22 Oct 2025 17:37:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF78A43656;
	Wed, 22 Oct 2025 17:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2825DC4CEE7;
	Wed, 22 Oct 2025 17:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761154640;
	bh=5C7JSiw2cENDeyIwTcB8RFCSbO1mNJYYryNwgOrWVso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8Nl1Ov/VjLVySoMBa78J9a7d+ZFX4EVzcA2t3sF6Y2j7WIyymK/M6nuqwI90VbDj
	 /unVVkTbOx72B2O8rKfle59it6XB63few2+KuCdIdrzHYmPb4812prFN3sMyiBsTfV
	 MK7atH+JfMMZ5rcdVDdjbL+1FxkCDoW7Epj+MR6rMYIR71L31Li+D3BL9s0YS0PZpq
	 pokqPeXjSUyOXDoG2uRvjZFee7XAt5ydHlBDxlS3A8Gav3gEtE66EntVLbnnfQV6BK
	 dxGj9uwu4E4Gmcp03KPeh7RhUwa9Yi/HNHSncKG3h+0IbI3pwbraYviBppNDJl4XpX
	 G4HKT0h8KgMNQ==
Date: Wed, 22 Oct 2025 18:37:15 +0100
From: Conor Dooley <conor@kernel.org>
To: muhammed.efecetin.67@gmail.com
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de, neil.armstrong@linaro.org, lee@kernel.org,
	rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: khadas-mcu: add new compatible
 for Khadas Edge 2
Message-ID: <20251022-maturity-driller-86e2b686066b@spud>
References: <cover.1761059314.git.efectn@protonmail.com>
 <0e604eca9ad9ce71f74b6f3aae60bbb949697590.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkgy7qwVQJZANVWh"
Content-Disposition: inline
In-Reply-To: <0e604eca9ad9ce71f74b6f3aae60bbb949697590.1761059314.git.efectn@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_103721_595736_71041BC8 
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


--fkgy7qwVQJZANVWh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 05:22:41PM +0200, muhammed.efecetin.67@gmail.com wr=
ote:
> From: Muhammed Efe Cetin <efectn@protonmail.com>
>=20
> Add new khadas,mcu-edge2 compatible which is going to be used with Khadas
> Edge 2.
>=20
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--fkgy7qwVQJZANVWh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkWSwAKCRB4tDGHoIJi
0mKOAQCBpjYa4ZhdL2trp7ttjTHXvdg7cdGJcZm3u9Hngw8AAwEA83IZEKUFHqo2
e7poEnoQa42kR0WbPNoO3Xjg3NFgygs=
=OllD
-----END PGP SIGNATURE-----

--fkgy7qwVQJZANVWh--

