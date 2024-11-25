Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92816D58D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrEDXK97Thw1NMus0OXelc/eVf7V9LJVAaFZblO4sNU=; b=EG0KPiVaBmsjIXo9MtffESVbkL
	NSJYV+KOvvipAPKPyIMP/K3VAtb2ORZbwdvmbVEoO7212ilVjmQyn7NCZCYjSRiADVsxggytKjI1q
	yv4tAWa+k+QvxCDLXRvubkaOorxjVtR9A0k93yfpwf4uhmU1MVaoyGK87EjxfqDwOD79fZpBOx4T0
	pkvTzv3ZMRwZ9AnspseAVhVO4CkosFzqLRcYTyz3aSbcd3h0aR7a9ItjRl+2x/mNNZHHk+AGzOlCn
	VuV40i601w874KYYXQrXH069dDKcjwCNJjj0RV0D2pF3ydkmDpw7ott+Ikm16xi0P+DCG5UJRpWOA
	Hm3y6gBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFckn-00000008jzY-2mHv;
	Mon, 25 Nov 2024 17:20:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcj9-00000008jdl-0jGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D264CA41895;
	Mon, 25 Nov 2024 17:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D65FC4CECE;
	Mon, 25 Nov 2024 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732555101;
	bh=qv6niZQQLx41Nb3bAK4/DqwOTz0gNYInH/aOd0ZHP5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZXBrj6IuAF5G6BpBhuEPFvZZil8n3Bv9F83nD0V7elY/08uEX0qYJnG8VtJvg+rPF
	 +MQo0eziSsDuxn0oWFN9mpdGPSDmxnrI3ZyoRYDYSPn8n9IX7UJlIsXGeskah7SMi6
	 IvK8LzvP4OURw+nVdEoMVxPqEYXEXYJukbb/6ayMV7LAc2XTRgnSLoucIV/7KSZFNe
	 kR+rKUo6bJEOhCBlFzDWX9fjlSZVQOl9ed2Nd39sPgREn7GNfoYiQA9ogfIJ60JRCd
	 W2EZZRbXtog6nBqZB9HmFFzyMlteGGwm5ApheBEYUpYTaigwTexC+qf+nY+HuIWuPM
	 OibVcG8IvttDg==
Date: Mon, 25 Nov 2024 17:18:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ardb@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com,
	pierre.gondois@arm.com, hagarhem@amazon.com,
	catalin.marinas@arm.com, will@kernel.org, guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with
 force
Message-ID: <458d865b-5e3f-4c5b-94b3-8f4368d27677@sirena.org.uk>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
 <20241125170758.518943-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YV9P+puc7MWUbFlk"
Content-Disposition: inline
In-Reply-To: <20241125170758.518943-3-yeoreum.yun@arm.com>
X-Cookie: This bag is recyclable.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_091823_276152_DD4A420E 
X-CRM114-Status: GOOD (  11.34  )
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


--YV9P+puc7MWUbFlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 05:07:58PM +0000, Yeoreum Yun wrote:

>  	unsigned long fdt_addr =3D 0;
>  	unsigned long fdt_size =3D 0;
> +	bool acpi_force =3D false;
> +
>=20

Extra blank line added here.

>  	if (!IS_ENABLED(CONFIG_EFI_ARMSTUB_DTB_LOADER) ||
> -	    efi_get_secureboot() !=3D efi_secureboot_mode_disabled) {
> +	    efi_get_secureboot() !=3D efi_secureboot_mode_disabled ||
> +			acpi_force) {

Should this line be aligned with the prior one?

The actual change looks sensible to me.

--YV9P+puc7MWUbFlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdEsVUACgkQJNaLcl1U
h9AsWAf/QSGOqMYYd+eYGMnHrnZ0AgaaXNLrw3M3ayw57Jy3VehHfp4Mgm7JX++h
m/UHDaEswp+qVz6C1OAGrjwewp2VAkZuDckWvnQ2SjHgh3k2lWdG8yXkb1Wm6zT4
4untrM/28KHrRhsbKYdD6NXzKGyY5wO3zj0mEmo5RhZPcm++kytZASVdCsNF2auf
GQ7qGHrHxPAs9EJCHiF5FOr8mIXfvnSlRi693POc3RwX3WupYjlnfM9yoSnan01N
HfocNpYGRYXxiMN1vuDoTFWmyMM9bO1TIUzzStOIT8oJHlFmmtYmycSQpTN/J7QM
r/Y4X6sQ2Xwj3qYQXyZEH31pi/ltkg==
=NKy0
-----END PGP SIGNATURE-----

--YV9P+puc7MWUbFlk--

