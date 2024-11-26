Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8676D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP/H/0dzCgPRB0GMyLHltJaLK9Pd6hnKN0kC1kAofEU=; b=E14ZfHMZ2A65YnwU3pDs0hvm3+
	b2zcNtmeYzQT78zFxBgE8XPph7QBM58Xiri5qi9F1r7msxUSBX33Of/MzaXmbgBKIEhkzM2Rk32s/
	n2uy8/UCjCMAI7iKIkAFN4jWO0vbjXI250yQ2kFBw0mG6CkKJHGTvUJ3LPFNZtgVvS1elx4duAqVa
	u3SWjAg+jLRiVz5s1F5GrPYjx3iObb6bejkp7En4Wn544VeI47IhruoKzFLVZUjETr4Sp2KFn6H1Z
	h3xlGsGaYod3JZ/DxKDW65EfItZR5d+LfsnaQDzakOoGLm7kV0szqS5iZIdtWUgEkw0jxgAxgP1VW
	9cqohlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz1A-0000000BFZx-0q3C;
	Tue, 26 Nov 2024 17:06:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz0B-0000000BFVV-32MB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 17:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D119A40FC3;
	Tue, 26 Nov 2024 17:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2ECC4CECF;
	Tue, 26 Nov 2024 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732640726;
	bh=HP/H/0dzCgPRB0GMyLHltJaLK9Pd6hnKN0kC1kAofEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJo/6spMIAnnbKXIptCzsu+BXMccGwmKn2v+VN8kFPXyNOAud6731jsSuRyrSqEJD
	 aPrwp00q6bLXWvW/+2eHk0Jf5kZ7GpQShNzxT1jEMPLA+cO2sqW2Xg8WfAJP7MvbJ0
	 Czks742dsutEpROpFAwZ/NmNqhDe+ATGdiLSN8YrtbAyeFHgfoxHqzcxRA1ZBfkI7F
	 OZ6ucK6FK7jySdgEB4I5LBQJEIkmjBEru4N6HipmukaCMUOxTfOEPm6fXVYYg2Onj8
	 QnkGBVK6xCJsEknCw1DDKZDybUtaoZ6O5r7zMghQ1mtt//tFtlHassOewNQB7HosTo
	 /DAsUCdEr6M1w==
Date: Tue, 26 Nov 2024 17:05:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BOOT-WRAPPER PATCH 2/3] aarch64: Enable use of FPMR for EL2 and
 below
Message-ID: <dee189fc-b307-4c71-9fb8-a481f4f8d3da@sirena.org.uk>
References: <20241126153955.477569-1-mark.rutland@arm.com>
 <20241126153955.477569-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O5kDVospwuUoDUAc"
Content-Disposition: inline
In-Reply-To: <20241126153955.477569-3-mark.rutland@arm.com>
X-Cookie: Have a taco.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_090527_830543_C2C84DD2 
X-CRM114-Status: UNSURE (   9.66  )
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


--O5kDVospwuUoDUAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2024 at 03:39:54PM +0000, Mark Rutland wrote:
> FEAT_FPMR adds the FPMR register. Acceses to FPMR (whether direct or
> indirect) trap to EL3 unless SCR_EL3.EnFPM is set, and so boot-wrapper
> support is necessary.

Reviewed-by: Mark Brown <broonie@kernel.org>

--O5kDVospwuUoDUAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdF/9EACgkQJNaLcl1U
h9C6+Af/d9gFBC+AdlSb0Gd/XhEJpwkdNX6Jq/ppfjHf1zugMeJVA6rLVVgjnv9d
zMyrM0VGZZYMvWbFDc2HgVGe0+3xERaXltb3NH0RhrrGX5ssA5y+13BwvBju/vtF
S+h1aG2qiJ6c49tWtTsYo2132x9mPKdPPLlZ+WxiMyeFl7NekzR9tZUbusrhbIcv
NFrzQ7wG0wu3HnBbtym+JeeztFDwWbka+FG5ccgndEbVToU6k1QKvsSqI3voMILj
MMehMARdJaywuJopeWP/IFyQkYISThnBvdVOSxqOpOI8wl8+OmVxOEYGr0tE6oAE
Tg7iMEXowdA5GynDXM/lis3s0PlijQ==
=Ox3e
-----END PGP SIGNATURE-----

--O5kDVospwuUoDUAc--

