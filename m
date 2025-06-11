Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDC8C71147
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmmOw49SxnHupyG+F6glekIY4iQHk7rVtVr9Idrc4XE=; b=vL3FtmJ4MwdZiPTJ8A2Jm3XHB4
	znLLFb4yXH7EYmbnZ6sLjE0Jp9Yx19Mcrbq9rUQVR0RjloaZPDNVgtwi6vcv274DODVuvIFvOR+gY
	BwiC9m4r6IGt1B13s9mHtcND3H4FgCPn/xWrlaEY3amay2mvd9ZmwEFiXuJWXsK2tkir4zqG/4EkT
	Eohxvn0leq9mBBkSngPtEquGb+iIsWwtQPgC8psSYBFLFI/SRHP2Rlk7kHpP4CzKvDdDjHJCjtfEW
	74SzKA/m9lzC6ejX726iONFDsu6A0r8D/BxG5InIIbnxTywnEii8Y5yOhqpzEFwzwxSUPLrLpijjn
	oJZogZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjk-0000000AluU-2Nip;
	Wed, 11 Jun 2025 17:59:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLbE-00000009yQu-2rFJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:34:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F2A743E7D;
	Wed, 11 Jun 2025 13:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB50C4CEEE;
	Wed, 11 Jun 2025 13:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648880;
	bh=ex8KsKH12LSMtycnf5SABL9oUeYEALDAkNqEcx61TOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uv8dgwwV3cs6KC7bXZI/xwvXIASvVzPBn7up6NpqkjrfknAGRGvp0+mDdJ+70u/ND
	 X6eT7GD2n0EVwcN3UvoJHqEYZ1XjHf9TpVk64Do2He1nCZ+aUT29QG8vsyqqN4I1uV
	 S72woiGKNQEOVasrQ2mNU+9rvQQTdiX8iOGdlV1a0g4biN5xtV6BpIR7Vv7T8Vx9Ty
	 1LTe9xdJl87V9UZhTRYG5Qqfr47NDx0vRWZ5scq0Z/C7OR8tarjmlvYOWTYG4vx7tq
	 49tmAJ0Ws0SZ0tPc99o8sRqQs4ogBk50cQVXAvycaC4RbZWVrP1qOV+dxXkA6gqTKZ
	 yPIdmKJq+5hpg==
Date: Wed, 11 Jun 2025 14:34:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64/Kconfig: add LSUI Kconfig
Message-ID: <07190b99-5e8c-4de0-b460-248ec39996f4@sirena.org.uk>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UQjXRDhZmiaJX03S"
Content-Disposition: inline
In-Reply-To: <20250611104916.10636-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_063440_735987_216288F4 
X-CRM114-Status: GOOD (  10.99  )
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


--UQjXRDhZmiaJX03S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 11:49:12AM +0100, Yeoreum Yun wrote:

> +menu "v9.6 architectural features"
> +
> +config AS_HAS_LSUI
> +	def_bool $(as-instr,.arch_extension lsui)
> +
> +endmenu # "v9.6 architectural features"
> +

This is adding a menu with no user selectable options, does that not
result in a confusing user experience?  We do often add toolchain
feature checks inside the menus but that's usually associated with
hiding a user selectable option, if there isn't one (or any other option
for that arch version yet) we should probably put the check elsewhere.

--UQjXRDhZmiaJX03S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJheoACgkQJNaLcl1U
h9DOLAf/V3EtUSflmw97gKJt14F9sBXTVsVEsGkxJ9wunrkYfb8CyI9bOFFVyXq4
iRkpd8JSCLaYfaPJcGCVAq/CRZxKpraMUmtdYkHTMQIM/9IsOg7CQv7UXfFopMiQ
DB8QxQ2OTS8eeShNDkYxG3uC445EaE/ZvI86ZO9LtFIQH8gV8bvLBvfZy8JDohp2
Ds0uH1xWljks77BY9LqcdgQkolE5EnFlR2mWZQ+x7I246zsNGheOcRaV+FJ2Q5rL
+s9B7EOynd2TBvGlGnOr6cEOIqYfVvcl9sr/f+MVPEC2Q/YjsuIqaQYHxHnD4b85
q9l0ng7lE+usfRkYZ42wG2IVVGsBEg==
=4/M5
-----END PGP SIGNATURE-----

--UQjXRDhZmiaJX03S--

