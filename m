Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53180CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 19:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X12OJNlVrW0M7yx3AAq/R0gndQECFEYKmSvs2udKSlc=; b=IkyJm6veXl7npCqCIUpipjmGXM
	bnyNeqD69NcZesQkOtuD5fUnwwncy1QhKwX/XkgnSWbLXh/+bV2lQa/jVnq00goVc7kJHOHnyvN6U
	RyUk0xTIGB8fWGtmtabo5onuJFRinVxuAncjs+QdbDHxje2paipl2fXNEa9LWn6NvRyDQVpbqL0rr
	7EBcSOOwgPMX+m0XXBiGPmwrsDz1n1MFQuORUx/qrpZH1WUjsr3J6Y/49mP1PmYmEmN1i30SuLeHT
	2TeKHZSzfCo9ACS0EeX0m5bEK3vM3hKVZLIvVEmGycy9V7DPXf8qLzJSbe2BCcxrNG+XiUqTiXU93
	BrLz3LYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMW40-0000000Ea9f-1v0p;
	Mon, 11 May 2026 19:13:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMW3x-0000000Ea8s-1Y9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 19:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 442BC436E7;
	Mon, 11 May 2026 19:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7717DC2BCB0;
	Mon, 11 May 2026 19:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778526788;
	bh=X12OJNlVrW0M7yx3AAq/R0gndQECFEYKmSvs2udKSlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NW11rcbanvSH3mYPfsfnY5FskXYqRF81nyAFznyqOu+Tj9fS9Fn2UP2Uger7MH+xX
	 OIPltO+ignTcczF/De/23UMbQbAvZYWi0wiq9qGlWRO3TcQ/us/2Y0jggFmxj1RASE
	 d7uy5V1i4kkTehiSes1hCgz/kMkxqxwq98/hBwWLyoBbuHCTtnpQBoeBgLg5JqRTc+
	 QeQbjbCU9IHFabdjgefF0t7Vw8f4uDvx9GsYBnLqq1h3VgVq0tL+4SLZjVRyGkU9Te
	 kAJOvGdNaIR8oN+JbZk9uAncauxpHUbngHEA4A0XNKWEqk/mzyj4SmSH7VF3LFYfXX
	 NuWwV+XnIg/ZA==
Date: Mon, 11 May 2026 21:13:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: lee@kernel.org, linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
Message-ID: <agIp2LODsGzHdPzw@monoceros>
References: <20260509193928.19030-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojcn2z3s6bmijsju"
Content-Disposition: inline
In-Reply-To: <20260509193928.19030-1-manishbaing2789@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121309_433208_3634DA85 
X-CRM114-Status: GOOD (  13.04  )
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


--ojcn2z3s6bmijsju
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
MIME-Version: 1.0

On Sat, May 09, 2026 at 07:39:28PM +0000, Manish Baing wrote:
> The st,stmpe-pwm binding is already covered by the MFD schema in
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
> PWM subnode was missing a 'required' properties block. This allowed
> Device Tree nodes to pass validation even if the 'compatible'
> string was omitted. This omission could lead to probe failures
> at runtime.
>=20
> Fix the schema by adding the missing 'required' block and
> remove the obsolete and redundant text binding file.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>

Reviewed-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Lee: If you want to apply that patch, that's fine for me (take my

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

for that). If I should take it, I'm happily taking your's :-)

Best regards
Uwe

--ojcn2z3s6bmijsju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoCKjoACgkQj4D7WH0S
/k5puQf9FNIJGXHuObG07U1AYJ6EVJK43xAHsxWJ4826SymtYp2+r0Pt005bbShx
QWVyaUgwmznt5j81FetFONeelX5eyASciJicMUOrDSeRZSyE64cdqaACaZgpgoOu
CxS2URF2uTN2fr01n7pHoX1mCp3VHeMHu7SpoBkc6Enh0X96tGRYJXVSQR57Sy2R
1muyW41Ijpfckw+5DOPPgV8wgnXdPcv9zWOpHRpO3WOl8maOaTkZ3beZkzdnkqcJ
lYPtb8UJG55q5ZPw5k/ja3GegXWpzCHmGwCl77TQufhudnwcVyMcxP72WQSXh9Js
BIdwoNz1fMDKIOuqS32bnxRqdtrMUw==
=9yEQ
-----END PGP SIGNATURE-----

--ojcn2z3s6bmijsju--

