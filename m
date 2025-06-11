Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FC7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0znrgza7HATQ7qNnnEod1+WPK5oNeQn25OEI7/JXaA=; b=vOa6CL7XKQITYxaALrLTxcIT1m
	yx9gOgoHnFF9hjN7Lre8c1ESFFtdTKJp8T6CX9+YVy1xaSAkFyqPTRRWgZyRVIuN50q5JpXoRsCrd
	GxzjgYj95iJ16QLSI+ypkK4N37WEjGiMV5AKlypbQwU/7jDazhG6bSg8BqBSy1ETNE476W97sxT21
	yCRLWp2xmcILQIu51K9JKon35Si8R1JQxGovKaNVDXQMkj/TfMMxsgDMYaN7T0CNYPi/mIYnyTowm
	j3BOF3+j1oT+DZEY7RX20gxRJrhAqXVfBaDb+80wiKCk9FcDgcGDmTJFhiMaP9k8L7Wd4eW5x5Foz
	D9MhGVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPObf-0000000AenY-3EVx;
	Wed, 11 Jun 2025 16:47:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLVv-00000009xHY-3xeT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DF4D629E4;
	Wed, 11 Jun 2025 13:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1533FC4CEEE;
	Wed, 11 Jun 2025 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648550;
	bh=jVoywLIjzkET+7C9/4zMdTppLO0aEIqMddLoYr6BrJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1bMcdQlZmKXoE6ZzP6N2uOp4KbfTIWMvBxj0RRyKwBWiZbzYCio7ndrUZWXGWpoa
	 9gw17Ml+9XyrHL+L4yzdgNE3+b44SSkdIk9gR0n828Z8X/wQiDP3ngR+2qG0f4SuYg
	 0tIE7mmdjGLmP9wF+IyOnt9IZ860UzQ/1YO2W1vRwOpK61N4Ii69kTSiLamv+pJ2Zu
	 uMX/2E0QNPfUkWl+YoxYl5GQSGzRJK8TVEo0mff9GKU/agw/dJahn18XNx0pyqThQ8
	 mm83vmu5KOmk0vNSZLgaig3rmxaZpZtMxwpRROP1dipC2F/R1/GNIZBsJc0LtFg67o
	 3LuFCLzeomelg==
Date: Wed, 11 Jun 2025 14:29:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: cpufeature: add FEAT_LSUI
Message-ID: <ba043c27-710f-4f0b-bbcb-64175bad5df7@sirena.org.uk>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oz64gCgUqRj8hwmu"
Content-Disposition: inline
In-Reply-To: <20250611104916.10636-2-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
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


--Oz64gCgUqRj8hwmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 11:49:11AM +0100, Yeoreum Yun wrote:

> index 10effd4cff6b..d625f4987aa7 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -59,6 +59,7 @@ HAS_TLB_RANGE
>  HAS_VA52
>  HAS_VIRT_HOST_EXTN
>  HAS_WFXT
> +HAS_LSUI
>  HAFT
>  HW_DBM
>  KVM_HVHE

This file should be sorted to reduce spurious conflicts.

--Oz64gCgUqRj8hwmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJhKAACgkQJNaLcl1U
h9BLDQf+KuI5ZMIqzhIfVTfzb+HD4DGRoZA6vg7HfP25HR/0YpUltbfRndSRtRYb
hZeaBR1zeYkCkTzqY/ytnPwXlNKTW9AsTX2BZC8kEwhUKfHyHYqMYxdk5y16Ys6R
oWLpPz2KslpRoe/pFDoB92OOBxC0PdRK9zl+XmphsDiOcfFuV9RCL5e/tg7zqeWe
rYajVsB/tgv/qdh7tgQlImrxN19W4lVVuuNtbiqpIZ9AXKQjMmlk1KkTqlW7Z9ir
ee3GLRH6hXnpZtVrWFHLu01UW/YNBd9pg+IupGaSMvWsc71/2jOKxbpdHY34ieV6
8gTIKD8lxVmwwbleJz0y9VyzOhlp/g==
=l7pp
-----END PGP SIGNATURE-----

--Oz64gCgUqRj8hwmu--

