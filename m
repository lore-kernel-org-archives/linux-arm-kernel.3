Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6039DF483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNOY/10bL1EV7q2Imm4uWe0CYApalti2dt5cIVqYu88=; b=WekMSa/TRS4p0GYmsdAlAlz9td
	NatmTE+5ioDJ+oZYmuto5WECAnZgKeAcKkgrRJ7mMLarDeY+9n2wpkw0Ejj8/kaU7X75P30Spsi1O
	pDvl5g2ZzF1I8wQSFxIGF0darSqBd5mdIZXePUmt2Yw2SISsW0Km/1gpIcpXpdHzTbvLfhyoBMZV3
	/nbmkeYU1NZ1dArgoA1CU915PugqsMNluY3F7XAXTTBVNnLunUThL5XI68vxQGwa6Ro7RpDLF/ci0
	e2q9Ktm1dI+uCe3WE9V38eK/cCoI4Z39d6bi8ir8Tjjeynx9TeQd/Yq2ZbIa0yXp5vn+h6ZAwW+0f
	+K2scC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l5i-0000000HSXl-2cGi;
	Mon, 23 Mar 2026 19:37:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l5f-0000000HSWt-2ZB6;
	Mon, 23 Mar 2026 19:37:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34D9A44269;
	Mon, 23 Mar 2026 19:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6F8C4CEF7;
	Mon, 23 Mar 2026 19:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294651;
	bh=YNOY/10bL1EV7q2Imm4uWe0CYApalti2dt5cIVqYu88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wf3lvA+GH/GQJEW785Yo559nDoXleT8uPH40hxJfta5Zz2n/wmJIYAPsSBHWs/par
	 SNch8HOXTjI3xocXCxzZSyg4lUavveInbw5bpnX89woONwx5Jnf5SnjCkKb8EIVxTC
	 /IYKO2SYn11ENt2U4n7aSemuvRok2VgCekr2hMFYb0k2z35fOtrp96Q/ziP+wS23k+
	 U79sYg+3OTnESUCQ95yTcLRiKERECazxOoZqXJCbelhVBDq4DnthtOy28EP8omsGLc
	 rcwzYGmbU6GqaNp3xmuCIKDuxl+38SyZ/Vkl6dumETkOzvyKagwtqH8ZBYLOAG+vdb
	 v03QCoJU3zQcQ==
Date: Mon, 23 Mar 2026 19:37:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 8/9] dt-bindings: net: wireless: brcm: Add compatible
 for bcm43752
Message-ID: <20260323-hardhat-bladder-0c83339de3bd@spud>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
 <20260323-add-emmc-t7-vim4-v3-8-5159d90a984c@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8LJrZXED2O+23fWg"
Content-Disposition: inline
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-8-5159d90a984c@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_123731_668591_F882AC52 
X-CRM114-Status: UNSURE (   8.12  )
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


--8LJrZXED2O+23fWg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:55:33AM +0100, Ronald Claveau wrote:
> Add bcm43752 compatible with its bcm4329 compatible fallback.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8LJrZXED2O+23fWg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacGWdQAKCRB4tDGHoIJi
0mLYAQDKVk2X94u3DdOJf1xVZS1DjAAOaqRhxQmCavFb8iljzgD/a7q4+h0ExxYk
1S35bjSvl2V4D0hADEYDx1qRaOas3QQ=
=yoc+
-----END PGP SIGNATURE-----

--8LJrZXED2O+23fWg--

