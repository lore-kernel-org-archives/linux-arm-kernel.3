Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFC1EC111E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrd7zHbcCuyX9gaUTyYT9blxEyQJTB9kGMP/Ud0pMcg=; b=XInUCcjj+tTBl7kuHDa8zT/F6Q
	0q/ao88FN90WEBSsJx5jkhLKSSTPZlp6WR2XdLNMpmCt7Xt7ikMJbSsO1MpDEeDkTNt237DZ56mz+
	ExiHyWsmbwuqsOe/HXwXivhj0037G+5Fm+VJ375qrPNgSExdTDafTnDtbHXWRwPMN54fYX1JtF7wH
	ErCp/E00AgiITqEgYxoJIOcJhWfF7QbMYV7lOd04tOOR/ndmx4ZOuM4VasgxbNGNw2l/rV/euZFS8
	7ivzv1u8goLwZhARhHORtwWIrcAMl7S8kM1agghL+JvsEUU6HZOQ9lNsZJfDX5h+wT6ZHdzNgX7zT
	/vosFo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuato-00000000t1T-2Id0;
	Mon, 23 Feb 2026 18:43:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuatm-00000000t0v-2zaA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:43:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C593143452;
	Mon, 23 Feb 2026 18:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648A0C19421;
	Mon, 23 Feb 2026 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872192;
	bh=vrd7zHbcCuyX9gaUTyYT9blxEyQJTB9kGMP/Ud0pMcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzcT11NJ1/NzhHD22SYOT304H7f7RqGoPDn550YVTQeorlJHPe2FW9lNVHTChNJIo
	 AkBW58G7a107+3CNzb0IxXxyBUYb3vyERuf3n+WbqplKwEaPHhdQot8YGfAliF1fSj
	 Tg5D3rXcKFTQZOPfoWC21pvHfx0VK1GmQLy7r3/bg6US18fZgatusl7TtAmoSCikop
	 bcN3znOKKgX2g2fJTUR52A3rhZnrYn+bv6zMmUsyoT18W4nvhPcc5BvzMkK1TJYwUC
	 +yQj5uDO3yo47yyLwhJkrx6fJvKdCktyqgl8i/QlL04ZLDSvHVjTSHKQCMUz74JBR4
	 fWZX2c0Gxpefw==
Date: Mon, 23 Feb 2026 18:43:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/8] Remove the Kontron SMARC-sAM67 board
Message-ID: <20260223-coroner-perceive-bc5302b228b0@spud>
References: <20260223100459.844967-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XJhr9EQZubmCTvTK"
Content-Disposition: inline
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_104314_821372_938F09F0 
X-CRM114-Status: GOOD (  15.62  )
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


--XJhr9EQZubmCTvTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 11:04:45AM +0100, Michael Walle wrote:
> I was informed two weeks ago that this product is discontinued
> (without being ever released to the market). Unfortunately, this
> collided with the merge window and I had to wait two more weeks.
>=20
> Pull the plug and let's not waste any more maintainers time.
>=20
> Please let me know if this can be picked up in one go or if the
> device tree has to be removed first and then the drivers together
> with the dt-bindings.

I dunno, not like the order matters all that much to users. Ripping the
dts out immediately probably works nicely in terms of avoiding warnings,
but I think you'd be safe enough sending all but the hwmon stuff via
soc for -rc2/3. Platform addition often is a mix of
bindings/dts/defconfig, so I suppose platform removal could be too.

For the lot:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XJhr9EQZubmCTvTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZyfugAKCRB4tDGHoIJi
0gffAP417TFDzpCWdbpGc6XVZHCsiylXwB5TYuT7AOMGCO5TDwD+JAlyzmYcTFju
uuWhRfYd0j6rIxl4Rdr7B1MQW2brigM=
=u9n1
-----END PGP SIGNATURE-----

--XJhr9EQZubmCTvTK--

