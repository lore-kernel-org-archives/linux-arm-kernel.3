Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432A4C83F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVVjOb/TN1icCsh7cMGXZC40mnSkVzEFWomvt74Gc8A=; b=rtn6Mm1zMvP3HRw3Z35JrsEusu
	QpG1ZIIVV0jIQt9H2ouW6TuNCon4yX0CHpknPEtPTDinzxU1i6zltR+RW5tbB0/Z0e76ThlvDq9DO
	4/pQEl0JxH4Wq+wTNg7oDDPJps67LCe8kGAqfuf39jeBW8QE/UWKOvPZ02/sqJfSg2kW89vcWazaT
	2/s4z8acNsw2Tws/nEXm2hYzsK3h/tXa/kRBGVyZF/uoR/TD7aOOFM4Nfhs338pU8uZL7hyUYVOD2
	sFrrJHuYPaXkJTtve0UqONN61juY0LBogMto9GrA8FSBBq8bjTlby9bAsGMV2Of8r32os/SED3dB0
	DcDKl1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6z-00000005xxv-0JaH;
	Tue, 15 Jul 2025 19:14:45 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhMg-00000005YnV-1Amw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:14:43 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FFEVbQ038708;
	Tue, 15 Jul 2025 10:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752592471;
	bh=hVVjOb/TN1icCsh7cMGXZC40mnSkVzEFWomvt74Gc8A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H3LybZlKZ3cOB4VO+FPRUUjeyHgSiQRyIREkzKEM3yz3ln8pmdM3kNpkWTAadF1Ky
	 QtNTiBtEFxx5Hfo7oFf1yJVdkpGg05xr6dJe5pWDKfji3zxEc9MoQhTAXkgb+AYiMr
	 A3FaFv70/UgiZncT5Fq3eJwMvkqiJqRUweNtIo8w=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FFEVdR1340564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 10:14:31 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 10:14:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 10:14:31 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FFESLV3108169;
	Tue, 15 Jul 2025 10:14:28 -0500
Message-ID: <5488ccd5-c999-4b72-bfc0-ba94bb9a360d@ti.com>
Date: Tue, 15 Jul 2025 20:44:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL 2/2] arm64: Kconfig: Updates for v6.17 for TI K3 platforms
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc
	<arm@kernel.org>, SoC <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <a0401460-8c67-4c29-a6cf-fa4bdf33bc7d@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <a0401460-8c67-4c29-a6cf-fa4bdf33bc7d@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------wZWK4Gx41HaZe09BmvGF5917"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_081442_405889_C9A48E2C 
X-CRM114-Status: UNSURE (   8.02  )
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

--------------wZWK4Gx41HaZe09BmvGF5917
Content-Type: multipart/mixed; boundary="------------HJWeAli08ckFheguafpDshbP";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
Message-ID: <5488ccd5-c999-4b72-bfc0-ba94bb9a360d@ti.com>
Subject: [GIT PULL 2/2] arm64: Kconfig: Updates for v6.17 for TI K3 platforms
References: <a0401460-8c67-4c29-a6cf-fa4bdf33bc7d@ti.com>
In-Reply-To: <a0401460-8c67-4c29-a6cf-fa4bdf33bc7d@ti.com>

--------------HJWeAli08ckFheguafpDshbP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-config-for-v6.17

for you to fetch changes up to 631ce8f743a5c85bd7f0a5e7dcca70566d88f43f:

  arm64: Kconfig.platforms: remove useless select for ARCH_K3 (2025-06-21=
 21:03:31 +0530)

----------------------------------------------------------------
TI K3 defconfig updates for v6.17

Cleanup select clauses for ARCH_K3 allow more modular builds

----------------------------------------------------------------
Guillaume La Roque (1):
      arm64: Kconfig.platforms: remove useless select for ARCH_K3

 arch/arm64/Kconfig.platforms | 4 ----
 1 file changed, 4 deletions(-)

--------------HJWeAli08ckFheguafpDshbP--

--------------wZWK4Gx41HaZe09BmvGF5917
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEyRC2zAhGcGjrhiNExEYeRXyRFuMFAmh2cEgFAwAAAAAACgkQxEYeRXyRFuOg
3gf+KIgCkK+2i4hihExnymIUdaOln0LryX8pbIursQprGnwWlF3wqlipuB/pKt69MudPvf/ODjbn
AD+lI1eYB611FoH13pGOXBzI8wOd39ZJWtNou/dfxthpCoPjbEwtvdsN3MuxfjJIY5faqgIXFhlQ
QEn2kxh3DLaLE4K8OEnAf/8KLUIE+x/iFFQTUDO/3O+Jbv0kzsNuJNx5686xxGfc+YSm65J7dv4n
kJldosEEmtyL4HgCPxT1vFxENyMJFVBUt6EoEbKvUtYZW86Bzs8GE1xJE0+gv6Y9NurloFORJsDd
5x2x5MnuvCa8gZaybMer1taa1g6YV2xeyQjoTZEFLQ==
=Bbps
-----END PGP SIGNATURE-----

--------------wZWK4Gx41HaZe09BmvGF5917--

