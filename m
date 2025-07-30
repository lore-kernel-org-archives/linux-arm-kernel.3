Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF024C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbZQHlYqjKENX4uqHQL86A+8OjwWSU1hvF3rXZbbwOk=; b=bQ9P74c+7zDC4c2jB9UauSzQQ5
	2TrPEL6brzLcKjYpUlnkbv/g/+WOqjrcHy+yO3/1bw9ocIl6YFGyq8n3FSktzHNWSIuQnhmKiLOyZ
	5PWcuTLR/zr5JAjnvKvYIeEjXBlpVV5dq3y4KtXYnz1MDdo/DPnI0rfLOEQdsLUM+yhFFq0nNN94U
	jHCeaQpSqxfWgHFQfmfjEmImAKaeQBj0euIMSqxhg0wOxYkiplFJzruI7nYDI9UBI4T1qKQMObGN2
	UW4g48kw5YYmGiiDCFXfE3OeMQcWQBSMus+qWEeTLY4xgUf2Tukc5Fkj6s+WUF1VKT5JkR8aBc6QN
	JcvTaZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh60p-00000001Tcb-1NL9;
	Wed, 30 Jul 2025 12:34:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5YJ-00000001PYU-0uIj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 12:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B9375C66EE;
	Wed, 30 Jul 2025 12:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D13C4CEE7;
	Wed, 30 Jul 2025 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753877098;
	bh=fhubS5ePL6n0ha77CiCJRFvyxD4OLQrzCZO9cuiJiYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGH7f8ydXuzC5TyfEH7bYraXQzcFznm7WxBg37g65n6MN7MO+QPL0irJm76TFe9jr
	 dNqD7Pi5apkwR7pItb0LdTnRQZ7u7RbSLclPtyb1bZDg66IZELPDlWETmHajRtn2yD
	 39zqT7YnnXl/vzt1FblmnbhAHAbtDvnRHV7q9t37d2IAwM2Z+1UmNduvhm6YG28AUL
	 nQlBeaQ81pWDkfYSeLjGNPLjJjNxtglDUKyYcxy09aiiaUa1w0TBh6IBJIX4gWJ5mY
	 kBZzPU/dk8pITEWrB2hwojwBZha/t739bp2my3L85Vq2fFhMmuynV6pGZaUmSvYU9q
	 azEM/ArEaVo3Q==
Date: Wed, 30 Jul 2025 13:04:52 +0100
From: Mark Brown <broonie@kernel.org>
To: ew kim <ew.kim@samsung.com>
Cc: s.nawrocki@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] ASoC: samsung: Add generic ABOX management driver
Message-ID: <80020ba1-cd00-4ce7-962f-04218559582c@sirena.org.uk>
References: <20250721023052.3586000-1-ew.kim@samsung.com>
 <CGME20250721024611epcas2p45ddc52c1644f5779c7da822573f03246@epcas2p4.samsung.com>
 <20250721023052.3586000-2-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uncjgrThkp45R8LT"
Content-Disposition: inline
In-Reply-To: <20250721023052.3586000-2-ew.kim@samsung.com>
X-Cookie: Linux is obsolete
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_050459_298834_EE91B144 
X-CRM114-Status: GOOD (  12.35  )
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


--uncjgrThkp45R8LT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 21, 2025 at 11:30:44AM +0900, ew kim wrote:

> This driver implements the *generic* (fixed) part of the ABOX management
> stack for Samsung Automotive SoCs. It does not directly control hardware
> but provides common interfaces and state needed by SoC-specific
> (variable) drivers.

> The abox generic driver manages child drivers and provides an interface
> that bridges the fixed and variable parts, connecting the two modules.

I think for such an unusual design we need a much clearer description of
what this is trying to do and why it's not following normal kernel
patterns.  I can't tell what the services this generic code is providing
are, nor why it's done this way.

--uncjgrThkp45R8LT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiKCmMACgkQJNaLcl1U
h9D1Ewf9EGxgcRMPdsLLc8+MwqZ2Yuy0gBJQAtKlLbDOH+w9EcU3zUusN2xBL5Wo
oZekF5oly3qup40QkqyV+6n9Kuc5XbCavzy/HP5SGHSG56YSjndwX9HAbPw4/5b9
z4PEvkzmLy60r2c8zrVVEEKv1dFQHjhnaCwgys/toyYL1ZjRVLtxYsJQLUsv5j5P
+sLoMU2qwtbjptp67QgGZ/sxXw3HJWIJSOLcz1OzEhqjj41numH1+pjjuVeUAmMh
FuEx4frWDrnfQzJEbiHGurYzPn/9wkCj4orly5bRr0g8jbRcDwjlfQZMEmDny1El
Ti4hdIAMod9r4VJc0yLURXHxOruIRA==
=/8UY
-----END PGP SIGNATURE-----

--uncjgrThkp45R8LT--

