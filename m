Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E376DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqmRj+O5fd8qG7PApgXDc1S+gj8TAQV3Kst3ZRj/JO0=; b=aRjjryE64S3bj6hkHhhNkgBuUW
	YTzRaOVMOsvm2OGkA4Cxln0SnD99dZ+UrqFTQqkvmlR7j2VDDJpApkhB+ilcCt/eZXlXtFBuiEt24
	4NVsQON0/KKZacYViM+gQMIaZfWp4VjjFfp+PRpRbdqXoBhW/8dGNOzWJbxt5yxll1fkHhinAPofD
	Opremmzp6q6erRJd8RnYLRXKV/TyGNa94dzd+gywbc/SBiEOhF5WuVoKFlLE5RgcdQURdh11rlQgn
	yhaeBdFYQ+6EAcSkmMtd3LY31jZP4fCE9JELRfiWC+BBYW2IT68lN6QCAPk2prhxsBqYSnq4Ymthw
	kY8o8m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1s7-0000000FojR-0m7D;
	Thu, 06 Nov 2025 15:25:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1s4-0000000Foij-0MXM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EF4543C7D;
	Thu,  6 Nov 2025 15:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98ED6C4CEF7;
	Thu,  6 Nov 2025 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762442754;
	bh=nqmRj+O5fd8qG7PApgXDc1S+gj8TAQV3Kst3ZRj/JO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eniOaR1m0amJcUnXLgQWdlqa2e8wmUIwsVQn/7wkAsTtLZdTm33x4/VkcTDTt62qk
	 kSZb0THjB/VzOY+WNGsI4qj7qtMci2SHcvN/kvrm676veELkvYsCDRMkUkhZ99ReH+
	 c/4rVmj0HITermB4HBRsE2EUkjNz1/uu+tiKN+onL6x+JetLQE6hwbuu389c27E4vt
	 YatTFbaL5vCY6zRuryZ9VMSW9bEMEHfo0QmmF+9yKiaOv49g8oOskRUFK6xU522DaW
	 GA9/l62NPMgF9d2Lw/yUIzNZTceRqX9pGoj8+7NC4bIpXagKv7BdCUPr0x6+rDqC0H
	 0itFwPaKQFg8w==
Date: Thu, 6 Nov 2025 15:25:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Yicong Yang <yangyccccc@gmail.com>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com
Subject: Re: [PATCH v2 -next] arch_topology: Provide a stub
 topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY
Message-ID: <aQy-AKsS00fhQyiK@finisterre.sirena.org.uk>
References: <20251105103849.4093-1-yangyccccc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z2WNciJQtzUDSbTW"
Content-Disposition: inline
In-Reply-To: <20251105103849.4093-1-yangyccccc@gmail.com>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_072556_147868_8D8EC0F1 
X-CRM114-Status: GOOD (  10.94  )
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


--Z2WNciJQtzUDSbTW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 05, 2025 at 06:38:49PM +0800, Yicong Yang wrote:

> The arm_pmu driver is using topology_core_has_smt() for retrieving
> the SMT implementation which depends on CONFIG_GENERIC_ARCH_TOPOLOGY.
> The config is optional on arm platforms so provide a
> !CONFIG_GENERIC_ARCH_TOPOLOGY stub for topology_core_has_smt().

Reviewed-by: Mark Brown <broonie@kernel.org>

--Z2WNciJQtzUDSbTW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMvf8ACgkQJNaLcl1U
h9B9uQf+J/WCo5PhEAM+fosqCZZr3iselhMe6LEbOstd0tJ3HXhDl1a7j9RvlJxa
SNoe8cKtbAV3yU3GRVoMZvY6zTVxYI/O7hJMedpHuwLambW4ZDK+jwuXksXKLu13
xYlhGgIjqxH+RfSiMvCYYS58dcOJnomLveABy2NhQCU+6Nxg2DLPHESaW/chxkyO
cc8mA4mF8aM4ANjoRK7jSmhsREPhS2RkhtSLSBlFyKhVYTap1RrDOBaC/+DGwRw9
ntl5rAHdE/63Z08F9B1bBapn8GqbwfMRZQCOzbrCC02hTuQaqScnP2+3U0mbDfQu
JiRmnpEkArur90wZ4WVBZ+zqiMuwvg==
=P1xZ
-----END PGP SIGNATURE-----

--Z2WNciJQtzUDSbTW--

