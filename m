Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C911E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKfiqhxldTWxKz+iVQbR99XJepNfxu1G8YzV3vCaeV4=; b=QMw4xiu1DubZiVIPphbKB9R6GS
	2KsXWMab1RkfdQSo2sM6HGXtqo7aVjCeK0kTAntjKgMnjc2eo0rCXdCFHc8d7riZ9bagqvep8fPk7
	8UpFmNsxuVeOneWQVTkfsevHVlJX/NvC5Z3GgExSA5mWC/DLqsnb4eBD2z+sl/lqF1OklM0JwgfDj
	ZrlWtwGjUt2vZ1x0f9IadRUt/htkz6kOFC06p1Nl78gH/+Tu6ChSFB7bCyM2c5OSMGO+KUB0KhS8D
	guSO8XiZOP+dwJRDaL+jTVOK0hljtXFZx9y+DTpD0iJ2VXaoE/ZpW7Na6v+PLJVvMye8nt2Pe0Wh8
	4LJSKHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4iz-0000000HF9i-23e3;
	Fri, 27 Dec 2024 07:25:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4ho-0000000HEy6-0RbA;
	Fri, 27 Dec 2024 07:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92AE8A411C9;
	Fri, 27 Dec 2024 07:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83933C4CED0;
	Fri, 27 Dec 2024 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735284258;
	bh=FKfiqhxldTWxKz+iVQbR99XJepNfxu1G8YzV3vCaeV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnpHTGvzELQi4ilXrQrOGqMOk0PmfRmso0RHTS899n4t9073pdfPmKmjoYcD93IeQ
	 L0GgACvFkw3PcknP4FOPlIjh6JSlBEnLCQitUnp4FYTSj42vzbYD9EnYafrvzC32C2
	 3oHUb6q4SlpXVj9fbFGEAK95HdEFynqbQGe7qAqeBuRQw9T9ei5RmLoe9fpn161lHK
	 FroMxYBdTXsWdfRFVerSFjHkQeKZd+/RuuL9c4QZEYHfWw52yItpY+9GHsWabw57I8
	 aITjsCCfsd7hUGL490tjgokZZ3Nw5Y9ltpAgFiNE819w2uMFdH4Nr4cM5YeGoUdbcq
	 6DbKuoam6ni/A==
Date: Fri, 27 Dec 2024 08:24:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/17] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
Message-ID: <qvr7x4anlxxtpxjywrqjihxyxejw4i73wrh2ibl3hasayew4s2@obyuxce4ez4g>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-12-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="54zezqdhae62ynag"
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-12-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_232420_213043_AFF65635 
X-CRM114-Status: UNSURE (   8.71  )
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


--54zezqdhae62ynag
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 11/17] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
MIME-Version: 1.0

On Tue, Dec 24, 2024 at 05:49:14PM +0800, Kever Yang wrote:
> Add rockchip,rk3562-pwm compatible string.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

What is your merge plan here? From my POV merging the pwm update via my
pwm tree would be the easiest. But if you want to let it go via (say)
arm-soc to have it all in a single tree soon and then base new
development on top of that, that would be fine for me, too.

In the former case, please tell me. In the latter case:

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--54zezqdhae62ynag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmduVhwACgkQj4D7WH0S
/k4g1gf/euWj+DTnb2zE4V27eM419OFeA5x4S86KZ0uCp85R1Py/Yp+UYsm9Se4g
Bf12EMuLDedAJ+ye72jM8cCD92w8nyOPAxgZRYhJMPy7eMd4R9KLYMwXrMZsqZ9w
e0W4ufYVFQVtZGyW0dTUVnN2LIJKOCgtmhyQdOjoEGIcPGWdX2UYjqaXE3VzBLik
yKtxvFZhvkc+GjnNcjtr9At/YlKcoSCweCN0vle1JcOi/qPrXy+WGQJ4xLdEDj5d
OMNODhIYAuzd2DwxzzlzkKhLlrccEUMyFY15ZkINt8D3ScaKJimmzFYHkCfqjUzD
Z6UW8hRjMmQNkmOS2bY9/MfQ9INGhQ==
=wm9h
-----END PGP SIGNATURE-----

--54zezqdhae62ynag--

