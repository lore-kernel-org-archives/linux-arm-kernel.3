Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F67CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hKRfueAUrzjkM91UBXn5M20nwzcmhT+lP/g5iDeet9o=; b=SbN+/kFvJo6gr2Hdonhajnc+0K
	bFEpC1fDBS6VcALOpcLg+zAXXmTt1CREVGyn/t1Tpta7QBp+3eM17qkndko98rN1UKfB64A/Tm4ES
	oBV6qs2BrOg95PmXf4Yyd6NDjQhbI0LL2iIl33VrIEUK3rETwwDTppbWkdPY7IXCvpRNKDE8PxEsv
	LFe6hOqKcdE+ITlyGB/HlfYFuRIYaagekZNJX3EUV7TpkJW9flZ7MedBjU6YCNnM9Tab8PJMVx9xz
	UjjdtDVPSQ7Um34ZiYnc0hqag1jjNaG7370YcGioNVpvt6mwIg+vDVhpeQOROncNnaPizQlm2WSI4
	W6Et7cXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGzr-00000003o7U-1hSE;
	Wed, 13 May 2026 21:20:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGzp-00000003o5Y-0doQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:20:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48d102471a4so72452125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707199; x=1779311999; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hKRfueAUrzjkM91UBXn5M20nwzcmhT+lP/g5iDeet9o=;
        b=O/tA+a3q/tAe69gHaT4fszjz5ndCPu6V2DaOlEipELDc7smJJhr+uJYl793DXRMaY5
         s7TJelGFdg9AgzF6brtBkWzJFj/cld4yEVNB0vsEGI8Eh33WhBKfavCUB/wOhy1BQzyP
         zKhUH64mbnQkFcrB5Et19bbxcsjAuL9PrN96nAk8XOSJvGXSlkurLbyyWXtarKRtkwXU
         zgwJyY1rURSpP0PSe/hTu+MjGM4Y1ZSRizWo6e/6/Wd3p5r+la//KTsRITiyrl4Oi2NL
         waXIufGQUYQyXCGsjGLtcgZKqjQ+M9DoUdWPsXdCCMQSwzxKTjqFWncKMeKqgsVFLn3B
         IrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707199; x=1779311999;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKRfueAUrzjkM91UBXn5M20nwzcmhT+lP/g5iDeet9o=;
        b=SjGySWS5bdfEOx5dDf0psvDMgdVxM0G18+X8RqFSlu+Aj9oCLEqNsdvq9Pg9VdbJZr
         olz1FzXIms0CiWPoo28S5UeIrk/CPVMekAgM9ympNTpbwTrjlYYat66n9xJQOWfmNmRU
         SNaDXd28L8qLLufqQIlim3MvGIRBB3Rgvx9y6Jh8zadRitQvzdXT0uu/Ny0R9aHkVG5A
         x2R05EORS4uNKnJYuyCzpH60FUZ9XIqwkBKx9ijv3UDD96hQjlZ3hW7SHNh+TmmCSIGZ
         wrjPX+KqbliItTKSD5jPY+s4MdwTDlkCZ/J4VYR2oy17s4feici0ZO3ILJIY+D7Viby/
         ZoCQ==
X-Gm-Message-State: AOJu0Yzz4gnPbTFgUtO9AonZ51LUqJclObdBXYI8ddZlLBCrPxAfsPyf
	sph7fktvV4H1e2y+e7sGxKRd+nydVCnPQltvFkF5HJRT4ngPM4o/lWTo
X-Gm-Gg: Acq92OFvXEQQWtxxTQjmuify3f6Sqkxx0mR1beWc1xhpQlBxx43f4xJov8MCaffj7b9
	WhL+c8rXVc3d50mi1UHhJ6cfbRJUDF9dvJzay2Hv3AL23FRvTyhnjnk4F5UgvWgbpU8a2xg0AEj
	eEnULkGWxkXn5BVnwJFDB8eDZXMo6DVPKl4bezTg3zta9sURL7LPPJasbCZthTloqiOoyyNQLFy
	ELHAbHKqcQZq1cuOu8VlelyevEz/83yWrVxd6XQC6ZsVQdCeLhoDMMNgKiH2pRUNdEcQyptZclq
	vqwXpWAShea2tY/MJmXtNZZ5P33/K/hYsr9MJlvWLaYZ5zKFEspKY9z+PUPT8D1+PwU16Fjsu+Z
	quP6wtDc8qU95zer6MZkwhziSMirXc8DMPTRZHDgDE8VZq+XXlN0/T1qFVjtt3+3QCX87UbOsOG
	tc+9KDi8h12HgT2i3XKQiyFwsskaZwXDQ=
X-Received: by 2002:a05:600c:c4ac:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48fc9a3a9c1mr75541035e9.21.1778707198978;
        Wed, 13 May 2026 14:19:58 -0700 (PDT)
Received: from strix.localnet ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb27173bsm880045e9.6.2026.05.13.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:19:58 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: zte: Add zx297520v3 platform support
Date: Thu, 14 May 2026 00:19:49 +0300
Message-ID: <2114249.usQuhbGJ8B@strix>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3665866.QJadu78ljV";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_142001_233005_6806DC51 
X-CRM114-Status: GOOD (  13.32  )
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

--nextPart3665866.QJadu78ljV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: zte: Add zx297520v3 platform support
Date: Thu, 14 May 2026 00:19:49 +0300
Message-ID: <2114249.usQuhbGJ8B@strix>
MIME-Version: 1.0

Dear SoC maintainers,

Here is my pull request for adding initial support for ZTE's zx297520v3 SoC=
=2E=20
The code has been reviewed on the linux-arm-kernel mailing list. My ultimat=
e=20
goal is to run OpenWRT on these devices.

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform").

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-plat-for=
=2D7.2

for you to fetch changes up to 220ae5d36dba278003d265aabd080ffa78553f5a:

  ARM: zte: Add zx297520v3 platform support (2026-05-13 23:59:56 +0300)

=2D---------------------------------------------------------------
ARM: zte: Add zx297520v3 platform support

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform").

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (1):
      ARM: zte: Add zx297520v3 platform support

 Documentation/arch/arm/index.rst          |   2 ++
 Documentation/arch/arm/zte/index.rst      |  10 ++++++++++
 Documentation/arch/arm/zte/zx297520v3.rst | 167 ++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                               |   9 +++++++++
 arch/arm/Kconfig                          |   2 ++
 arch/arm/Makefile                         |   1 +
 arch/arm/mach-zte/Kconfig                 |  29 ++++++++++++++++++++++++++=
+++
 arch/arm/mach-zte/Makefile                |   2 ++
 arch/arm/mach-zte/zx297520v3.c            |  16 ++++++++++++++++
 9 files changed, 238 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/index.rst
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

--nextPart3665866.QJadu78ljV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoE6vYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoim08P/ApwP43M9rvjPpQtOX3y
hEdyhSxQh9uD+ufuHlnRAJFqDfbbWyLhpUTrcM4f0rAqG58Y9kX33rI/7RjtGdCV
6aSKGkSSVoBqzcKiaw0sSXBCM5QsI2eol594JZg3RT16Ya2JqMk+2HvZRfHlBCB4
sjEHBxgRePcE8x+qiU3fUb2RnaXvSadYgeEGkNR+sMupssDpeJg5/lBfRxC1E4dS
ya9b+rR7T9CIWyszDfdWEN2RL6bkOvp2KDeAuxGl4q590KqFDdFSo27JYFWX1rsK
WTySaMzEVKHjkfi44KJkWYde0xZ3CegrBOPiCCXhaEwtihr0JuNihDb+KJmP6dzf
NBmAjWSAqs9Dwk/5StZL+se5DWavSxeooqT4SckJEVfCCuo2D8/hYuYapXwgkg9N
NCZFUM6ax6ETX1FaFX4UsY3KeQIKQuZIo29+q9NAuV9uXJO1RkMOQRJGD18hnaPW
mrHwSkKGXTRbMiVsgRae+OeFcfosMo8xvgZNfhtZNlR1G+ReOtKV/ScihoiyD5Qq
f6AN3YZOsXFw5nqg72CRlopxCvy17zI+cCu8sDLzmgSIRNeGrKPGqRnJz7lkxjI6
s2l1kqDIoa7GxiaF9/XLWMgnuHorll288PfR3kF/n3qX+8kDrQNrwoESwCserg6Z
BWwBBeprQ9CREOxSmbKKZg8f
=lAHd
-----END PGP SIGNATURE-----

--nextPart3665866.QJadu78ljV--




