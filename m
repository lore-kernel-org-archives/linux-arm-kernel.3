Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D61CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGWCOM3e+bRXnE2xzumNuc9vBFJEQJOY8QZmmJ0IlQQ=; b=bOvILIEm3jnV7SpFgzitltXjo/
	ZFqPKPbiI1DuqO2iMto5PVPOBlt5f0fT825nf3zAklHtFy2tDFo4tKXFtckxX9aXe1JHl4KUfOAx7
	0HRv9tYz8g5+fZWYg2iQh1yO1CVU0iFYFcCef4ZsxlTgxAMtkA2p7KYqWya2mddiyZiWbbs5FGpJB
	CVMxYJWsWH861ulSIpM+IOWBzymzkaJgqfLPdZHJGOcoBNr8w1bNQshpvYKaOO/CB8whzhZ//gO2w
	dYY7aPH61N8NwXFsrkCoSdw8ipdq4lb5BSNEyW1HvQ6rS5uYWMjZ+SpwGoqtq2G6Dz+swJUO4k4MM
	xXP2DdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqShR-00000007L4m-03bi;
	Mon, 25 Aug 2025 08:37:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqS1S-00000007E6k-2xo6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 07:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16BA544960;
	Mon, 25 Aug 2025 07:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16345C4CEED;
	Mon, 25 Aug 2025 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756108425;
	bh=siHquftZz0T1lNm1I/MwnFut9RzLZNKPq03XuIRiIPo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=k8k6sKazH9DJEFs5CtJJZLnhiTBHEO1bX/rnpwXPJNZo48yymmubbIOmwJXqmv3ZT
	 SXMv8m+oCNZ4P77DBsHf83wsZJBEwPkYslRFxaRNV+8uFmTJwqoQnOnwxwIImhSujO
	 ni/5YRSbxTbT41bL5jHSDuALdxqcnA4cXU5ObFuGB3xObZAq6i4/BPlzIl3Zgdmz0S
	 WqoV7Ysfn9mtf77GxKI1gNL7195/rMrSIzzXw+s2BnenqJqgy2M9yC4U4CYB2oU/ub
	 nv7PO6XkeDpTpKuL+SR6yzrdxjS7GHP8IcX6ZrK84U9e7fkyamhoXFLjPCDukgNsM8
	 88TAAehP6HF9g==
Content-Type: multipart/signed;
 boundary=4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 25 Aug 2025 09:53:41 +0200
Message-Id: <DCBCHBIVM5IE.12J0BRE4I5KXZ@kernel.org>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Cc: <devicetree@vger.kernel.org>, "Tero Kristo" <kristo@kernel.org>, "Jean
 Delvare" <jdelvare@suse.com>, "Srinivas Kandagatla" <srini@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-watchdog@vger.kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Lee Jones"
 <lee@kernel.org>, <linux-hwmon@vger.kernel.org>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nishanth Menon" <nm@ti.com>,
 <linux-kernel@vger.kernel.org>, "Guenter Roeck" <linux@roeck-us.net>
From: "Michael Walle" <mwalle@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <175589786195.518444.15005080125108403794.robh@kernel.org>
In-Reply-To: <175589786195.518444.15005080125108403794.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_005346_761878_DFBD4B0A 
X-CRM114-Status: UNSURE (   6.79  )
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

--4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Aug 22, 2025 at 11:27 PM CEST, Rob Herring (Arm) wrote:
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/ti/' fo=
r 20250822131531.1366437-1-mwalle@kernel.org:
>
> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dtb: pmic@44 (ti,tps652=
g1): 'gpio-line-names' does not match any of the regexes: '^buck([1-5]|12|3=
4|123|1234)-supply$', '^ldo[1-4]-supply$', '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#

Damn, very late change on the device tree :o I'll add a new patch to add

  gpio-line-names: true

to bindings/mfd/ti,tps6594.yaml

-michael

--4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKwWhRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gPpgF+MlSY31S0rn1uDnKEPRt4gulqhcaJE2kZ
Hy1IB+bI3+b9ZHbrP259Ugakq5SnfCa5AYCq7S6UcN4nPsU+gNFqo7B76clPp/xf
6zY9VAtwCedukMzpOu/ekK8Jl3HXM63sn+Q=
=KZxC
-----END PGP SIGNATURE-----

--4ea3e07d3396ec2b46c8f27f87f01aae1de62acf24971f2d21860800c284--

