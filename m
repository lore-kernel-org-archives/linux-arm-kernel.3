Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFD0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31gOTHz/ebGa3W3r+33yR1DrojtjP2REs9LRBXLJK8I=; b=XLMtoJi9ONW7mrA+ueX0ku+lp2
	7UrHm5UO4QXQG0YnlB8mEw2UlH8W8DFu/dw2zPs6vJJcGsWafHHm/bnWatYV6vplc0bMQqUq5EVMG
	h28QTNXUNHtQd2sQ9zRQByqZ7Xyc1YOURln1zHGjKn95xFj/U2TJhBrZV1GVWlIbjr8KDIKlHf8lL
	pjZx4bMDUImB+aqUGOONDppv9FEUVJwD+ITv+n2VqYFkb6ySZiqEbpasW6pb7Ir1qyFoaDQQMF9WF
	gOfVorYeXGacKBw91F1tauEMWSdnEqC8/YFIRAPPHuiPgx/Kk3cngE9xva2RMGhCMAoPaExyB1Aj4
	NXGXqNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcY-000000011Yv-1IYl;
	Fri, 22 Aug 2025 00:27:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8lv-000000001rJ-0DQ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 678C55C067F;
	Thu, 21 Aug 2025 17:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C03C4CEEB;
	Thu, 21 Aug 2025 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755796098;
	bh=31gOTHz/ebGa3W3r+33yR1DrojtjP2REs9LRBXLJK8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zx7KcmwHGYzBB8Wz7/IqA9JoUmOMKz9o4IlC+Nr+VFleqUDYHw3uR8Aoz6xwmCPr6
	 MWSfdqeoXvoR2UgCXiW633WgJQF+Bc7Wfc0EkBTEqigegYs2sdLncthO3zpl5fTxnR
	 JQcf3jma81dBP3NG3WSSvN+QZBJPAEsB/DE7eOmFFhuUdyIJxOTUBfnc8FeZ/BYGh0
	 U9BnNfrcR32om/UNtBADGLtDYbdEQ7DUzthFyuSgcz4G2Jp/ogX6lDOS1NfPrLVFFw
	 KYKfQwFwv/fo9hzyq73OfCkXgwApXs2leHC5MqosKILQ/AuuyJd46OGQ3hlLw0++3G
	 jJ72zB0iC90ow==
Date: Thu, 21 Aug 2025 18:08:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kselftest/arm64/gcs: Correctly check return value
 when disabling GCS
Message-ID: <24a68b5d-2c24-46ec-aee2-74b45b45deea@sirena.org.uk>
References: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
 <20250821-nolibc-gcs-fixes-v1-1-88519836c915@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DVFZaVUj4cP8FPoR"
Content-Disposition: inline
In-Reply-To: <20250821-nolibc-gcs-fixes-v1-1-88519836c915@weissschuh.net>
X-Cookie: Warp 7 -- It's a law we can live with.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_100819_129231_028E67AF 
X-CRM114-Status: GOOD (  10.49  )
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


--DVFZaVUj4cP8FPoR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 05:13:02PM +0200, Thomas Wei=DFschuh wrote:
> The return value was not assigned to 'ret', so the check afterwards
> does not do anything.

Reviewed-by: Mark Brown <broonie@kernel.org>

--DVFZaVUj4cP8FPoR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminUnwACgkQJNaLcl1U
h9AaNwf/dx/DkunGpnhn2H/7SWaWs67mqHdnj5v38faOVHnQsUi5f48labTyAYNQ
kB8icvE9A8Z/KCxsc92S2lwv5bshWE8ZvbWyFyytJbFEXGpI5XGlPRagdL6UzJr+
BmZIcMpbVd+DG2g4DY4yqiqBOpaCVEPneOOi3mC1ZC5BGNMExvhGCQ2XPhpFDpKL
cydo41hLLhbq3OcuPnuhwc2vqAX3dzDVU/QsYacFYA7rN5ZjsJk7GQLrtmZecXiq
IU1bx1FOwi+5oHHG9b7QS0OLSbftM+gO16Q3yeXxfU3BxR8iHsF4Jv11Fn/Qt7e9
aNZxz1s6oz8GKK2Oh8DqAvZuOtqxCw==
=Auzd
-----END PGP SIGNATURE-----

--DVFZaVUj4cP8FPoR--

