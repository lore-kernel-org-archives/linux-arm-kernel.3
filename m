Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CEACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSylx1uBD6c9wfbP4UadT3OJOkHskgoiDyeZJPzdIqY=; b=l+aXcJOD+ucT/v4d4p3wDB+xGs
	SYIjVmfSos2KfXJoCfaX1lj4W2DwHjNWLuTDus65fGfMoAkEVYpOe01OtXJELHH5kqfaMkUntmmx6
	6rU/KYuXcp5xelTMuFXRn1aMZt5P1fji1GjRAHFFh/M4VXuIAB7rTW7oQLGggS7IByawDYGZpfWH6
	Qa2avS59cwK7UO8R5PJL+Hphzz0J+TpX8NHeyS8dWRnYq9+DVYg2gdAEEk0cY3COujbwNqLg09Eai
	iq4U5RRyxZnmFD9BhJEO5Q7AGw8nn0NezUwXOL6RFa/irX3iIY1UaeQ56H0z+ihy1iNM2KNxSeTfr
	Pa/ZFKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBBm-0000000GuOI-3yYV;
	Tue, 21 Oct 2025 12:10:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBBj-0000000GuMl-3zTv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10461623FA;
	Tue, 21 Oct 2025 12:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924B4C4CEF1;
	Tue, 21 Oct 2025 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761048589;
	bh=Bpx/FP+Dg7yIVtCQGjiJ0Y02ZaKl49QFfrSJ4ilTJGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRCqG5iHscRd967yrlPMGGg4ZwXwl/SA7/SpTbtFmDhkBvoD86O/WFsEOWcdsy862
	 XpE0wpf0hkYp7pK5kj2+zukkGbnEbdxwt+GqAAjmoP3eBDrG7aKodxv4c8TTVkRg9F
	 ClKIzcvYi2rBnj1cRMQf12h4IAxkNAqnXTxA6HcYXX6F0SSe3BrZ2jPy47ll+8Ywhw
	 urjfHEgFnVZZMTir3/NrhLH8tPRTzKnwU3gDlrn/9e4ob4fkwjhV2mMu2ZJ5XFG+QH
	 BZRy7jdU5Qdfmg9lJ3F1pJHXGrG1LD0l7EGeTOtGLNpVn00JwPTIin0dSjNzTmTyDe
	 7aLEFHz7h/9mQ==
Date: Tue, 21 Oct 2025 13:09:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-dev@igalia.com,
	kernel-list@raspberrypi.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
References: <20251005113816.6721-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u90cR5JgE1zuAEr+"
Content-Disposition: inline
In-Reply-To: <20251005113816.6721-1-wahrenst@gmx.net>
X-Cookie: volcano, n.:
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


--u90cR5JgE1zuAEr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 05, 2025 at 01:38:16PM +0200, Stefan Wahren wrote:
> Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
> when preparing/unpreparing") the clk-raspberrypi driver wasn't able
> to change the state of the V3D clock. Only the clk-bcm2835 was able
> to do this before. After this commit both drivers were able to work
> against each other, which could result in a system freeze. One step
> to avoid this conflict is to switch all V3D consumer to the firmware
> clock.

I'm seeing the GPU start to fail probing on the Raspberry Pi 4 in
today's pending-fixes:

# # v3d fec00000.gpu: probe with driver v3d failed with error -110
# not ok 1 +platform:fec00000.gpu=20

which bisects to this commit.  I'm not sure if that's just a preexisting
issue which is now being properly detected or if it's an actual issue,
I'm not testing the GPU at all so I couldn't tell you if it was actually
working.

Full log:

   https://lava.sirena.org.uk/scheduler/job/1981716#L9006

Bisect:

# bad: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] Merge branch 'for-linux-n=
ext-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [6548d364a3e850326831799d7e3ea2d7bb97ba08] Merge tag 'cgroup-for-6.=
18-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
# good: [8735696acea24ac1f9d4490992418c71941ca68c] spi: cadence-quadspi: Fi=
x pm_runtime unbalance on dma EPROBE_DEFER
# good: [6b6e03106163458716c47df2baa9ad08ed4ddb0e] spi: amlogic: fix spifc =
build error
# good: [0b7d9b25e4bc2e478c9d06281a65f930769fca09] spi: airoha: fix reading=
/writing of flashes with more than one plane per lun
# good: [b508de5211652c439419cda7840feb3f22f75cd6] Merge tag 'scmi-fixes-6.=
18' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux int=
o arm/fixes
# good: [03667191cbeb1a23c444c88b7c058dcbf2dd03f1] Merge tag 'ffa-fix-6.18'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into a=
rm/fixes
# good: [f43579ef3500527649b1c233be7cf633806353aa] spi: spi-nxp-fspi: limit=
 the clock rate for different sample clock source selection
# good: [ee795e82e10197c070efd380dc9615c73dffad6c] spi: rockchip-sfc: Fix D=
MA-API usage
# good: [4092fc5f35cecb01d59b2cdf7740b203eac6948a] spi: dt-bindings: cadenc=
e: add soc-specific compatible strings for zynqmp and versal-net
# good: [18a5f1af596e6ba22cd40ada449063041f3ce6d4] spi: dw-mmio: add error =
handling for reset_control_deassert()
git bisect start 'b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d' '6548d364a3e850=
326831799d7e3ea2d7bb97ba08' '8735696acea24ac1f9d4490992418c71941ca68c' '6b6=
e03106163458716c47df2baa9ad08ed4ddb0e' '0b7d9b25e4bc2e478c9d06281a65f930769=
fca09' 'b508de5211652c439419cda7840feb3f22f75cd6' '03667191cbeb1a23c444c88b=
7c058dcbf2dd03f1' 'f43579ef3500527649b1c233be7cf633806353aa' 'ee795e82e1019=
7c070efd380dc9615c73dffad6c' '4092fc5f35cecb01d59b2cdf7740b203eac6948a' '18=
a5f1af596e6ba22cd40ada449063041f3ce6d4'
# test job: [8735696acea24ac1f9d4490992418c71941ca68c] https://lava.sirena.=
org.uk/scheduler/job/1948358
# test job: [6b6e03106163458716c47df2baa9ad08ed4ddb0e] https://lava.sirena.=
org.uk/scheduler/job/1959348
# test job: [0b7d9b25e4bc2e478c9d06281a65f930769fca09] https://lava.sirena.=
org.uk/scheduler/job/1962113
# test job: [b508de5211652c439419cda7840feb3f22f75cd6] https://lava.sirena.=
org.uk/scheduler/job/1981616
# test job: [03667191cbeb1a23c444c88b7c058dcbf2dd03f1] https://lava.sirena.=
org.uk/scheduler/job/1980576
# test job: [f43579ef3500527649b1c233be7cf633806353aa] https://lava.sirena.=
org.uk/scheduler/job/1948241
# test job: [ee795e82e10197c070efd380dc9615c73dffad6c] https://lava.sirena.=
org.uk/scheduler/job/1927696
# test job: [4092fc5f35cecb01d59b2cdf7740b203eac6948a] https://lava.sirena.=
org.uk/scheduler/job/1911635
# test job: [18a5f1af596e6ba22cd40ada449063041f3ce6d4] https://lava.sirena.=
org.uk/scheduler/job/1930414
# test job: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] https://lava.sirena.=
org.uk/scheduler/job/1981716
# bad: [b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d] Merge branch 'for-linux-n=
ext-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad b1c99eb0279a6d2aa32fdf6b3f2b35ab05f41d9d
# test job: [2878351f8275c49fc809cbf6490a4a2e05cd360d] https://lava.sirena.=
org.uk/scheduler/job/1982267
# bad: [2878351f8275c49fc809cbf6490a4a2e05cd360d] Merge branch 'driver-core=
-linus' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driv=
er-core.git
git bisect bad 2878351f8275c49fc809cbf6490a4a2e05cd360d
# test job: [ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6] https://lava.sirena.=
org.uk/scheduler/job/1982733
# bad: [ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
git bisect bad ea6aa8d2fbbba24d4f0732596fc716800eb4e3f6
# test job: [40efeb7008e820c09532760b0aa07f327a5eaa4f] https://lava.sirena.=
org.uk/scheduler/job/1983168
# bad: [40efeb7008e820c09532760b0aa07f327a5eaa4f] Merge branch 'arm/fixes' =
of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
git bisect bad 40efeb7008e820c09532760b0aa07f327a5eaa4f
# test job: [70b154f7b68ac0df0abdc242462856ef58cd50a3] https://lava.sirena.=
org.uk/scheduler/job/1983459
# good: [70b154f7b68ac0df0abdc242462856ef58cd50a3] Merge branch 'mm-hotfixe=
s-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good 70b154f7b68ac0df0abdc242462856ef58cd50a3
# test job: [bc16536fee96bae9ed573dfcc6d455775682f041] https://lava.sirena.=
org.uk/scheduler/job/1983942
# good: [bc16536fee96bae9ed573dfcc6d455775682f041] Merge branch 'fixes' of =
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
git bisect good bc16536fee96bae9ed573dfcc6d455775682f041
# test job: [2f3471cc5d4179811a2c15675ea278d348d30d73] https://lava.sirena.=
org.uk/scheduler/job/1984071
# bad: [2f3471cc5d4179811a2c15675ea278d348d30d73] Merge tag 'arm-soc/for-6.=
18/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm=
/fixes
git bisect bad 2f3471cc5d4179811a2c15675ea278d348d30d73
# test job: [d2dc8a386a906bc120fda82207e291244e73d292] https://lava.sirena.=
org.uk/scheduler/job/1984278
# bad: [d2dc8a386a906bc120fda82207e291244e73d292] Merge tag 'arm-soc/for-6.=
18/devicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes
git bisect bad d2dc8a386a906bc120fda82207e291244e73d292
# test job: [4adc20ba95d472a919f54d441663924e33c92279] https://lava.sirena.=
org.uk/scheduler/job/1984408
# bad: [4adc20ba95d472a919f54d441663924e33c92279] ARM: dts: broadcom: rpi: =
Switch to V3D firmware clock
git bisect bad 4adc20ba95d472a919f54d441663924e33c92279
# first bad commit: [4adc20ba95d472a919f54d441663924e33c92279] ARM: dts: br=
oadcom: rpi: Switch to V3D firmware clock

--u90cR5JgE1zuAEr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj3eAcACgkQJNaLcl1U
h9Betwf8D9/R7xjZGPo9GTqmNekW8gQsAMzNDLVomyTx+Qc5VeuAF5RNqEOHnw38
S+MTjGogepK6NY677HdktoSeWodVtEsQ2xwjdrbaKwsBbgz7sGImUvl/Gsxx9xyo
l6FBMrueORxGQHmig8ZYPdPsFSOzzQA+PwJsP8PU7bCDjnQ0ddTRFvxB0ZRA3PQG
0G6vfM7gPEW0TWG9wlWrvoHnbXH2ZpG+BeXKAG4DxylPFS0qwfIsBJp8WzN5/Ryf
TB8aqlwHRgfB4m8Sb/GjA1Dqkh/TVJAnqDQ82mHq+VtFrYLkrtSTbloorgV6oadd
GNVNwx/71YnGvUMuskjHeRFyDDNp7A==
=6RCv
-----END PGP SIGNATURE-----

--u90cR5JgE1zuAEr+--

