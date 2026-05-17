Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49683CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jB48lAr9qmKuTdPXL5we9lNaACJ0hspMPFFut94b2w=; b=FUMOHaA7zRMYo6H+yQduk2EtJR
	CVy0e+mujMg6zvdsLLMf+gYmpTIXG5q6kmOiawomCEZF8JKFX41MUBTitQvvFR53fNLDH9PuRG0fr
	CXqlkT6JSj8EDrKy50bXHcpCGuajk/bule3Q+waW1xFvxjy3b9yHBcFKLlxEqanPtxoKzR+qJHlat
	e4TdW9TVqOGCUPDDCR6phgHUyIUJw0WPgM413+FFl0ZXo+1dNILQMTGVis3/iyHa5p2GdUmkNlydX
	u9g8xidfw6pWlHJfp8ilAFNoSfsGveUoEioHSFfEqXKnc6BYoweOim5ZCipVhbSQEa6XI2xcENWwX
	8CubfA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOd3Q-0000000Cu27-0JXm;
	Sun, 17 May 2026 15:05:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOd3N-0000000Cu1Y-32o3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 15:05:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6305A438DB;
	Sun, 17 May 2026 15:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980A7C2BCB0;
	Sun, 17 May 2026 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779030314;
	bh=HTf0CYA7N9N3ycOlSsH2RN9JpiCBHmSJID9/ns/WmqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OacEpg0BHllVT5dCFHETKkOb/zz7Q6gsVg68LmodwakwJs7TUwK+px4dfd2w1SItX
	 SroQwxfa2dxebFsbEq5TJ+CIIfKootwvJE9alpoAqCLALsL/IFibntmjImIo6CCP9v
	 hMhNc4WPIc2JRIvnEXCUpq8tzXLQEO89zHHz4GPzfn02Vy2WD/KGtkONSGloh3TuKG
	 zTh3oKtNfwX62moIN6h5K6pGVWelBPzdZq+/n9ZViXSd32bbfLO71eeE5RMVQpiDN3
	 nGkQ2RavjezKKqbnCJeZNZfRh96kfFQH5fC75f0aVKPwNl95uHNFBR4qHOR3oJIKut
	 ULi35LN7GpmSA==
Date: Sun, 17 May 2026 17:05:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: lee@kernel.org, linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
Message-ID: <agnY16I4sYAdRd9T@monoceros>
References: <20260509193928.19030-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjp4gispirhzowi5"
Content-Disposition: inline
In-Reply-To: <20260509193928.19030-1-manishbaing2789@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_080517_791376_357F2634 
X-CRM114-Status: GOOD (  15.30  )
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


--mjp4gispirhzowi5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
MIME-Version: 1.0

Hello,

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
> ---
> Changes in v3:
> - Added 'required' properties to the pwm subnode in st,stmpe.yaml
>   to close a validation gap identified by the Sashiko.
> - Updated commit message and description to reflect MFD subsystem changes.
>=20
> Changes in v2:
>  - Droppped the TXT file instead of converting to YAML, as the
>    functionality is already covered by st,stmpe.yaml.
>   =20
>  .../devicetree/bindings/mfd/st,stmpe.yaml      |  4 ++++
>  .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------

If the patch was split into two, each touching just one of the files,
there would be no need for merge coordination. Also logically it's two
patches. Would you mind splitting?

Best regards
Uwe

--mjp4gispirhzowi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoJ2SQACgkQj4D7WH0S
/k7qMgf9F8VgNDKxylmZdIj4jJug5gFq8NLuFrwgb2rwAp26Bz+awUtEStzEzWKd
YpjTwUDqoiOqAam42pv06UN8+mKhBH9BVfekX4xbfyJ3WtQVCvea1hPgVXfWv7Ed
ADiMCiIY/8grsyCNp5IFeCgnhYBjn7gh4u+aCdhebcKWUnmTSZjcLAsncqe2WhWI
PLxxYjvuQyZ32cYE5w0TZ99ak4QNLT4kjaanPA92nxbT7RXSWs2d0OZOPdKAE0i9
s3Bu31dCoJ9u7XgQxtrlZGHxKMhuv6MBZdf+L73abLabw7tMi+nLe2V8p/nOv9AI
XTZoWFflGQwfAyG8uEGHOxvzIgCRyw==
=LQj8
-----END PGP SIGNATURE-----

--mjp4gispirhzowi5--

