Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A033CCC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45NPBWpuG2PMTMsqvm/ZHaqFngaU9inDYGxV4ki9ifs=; b=m1zmYkAxuN7WjoFE9WC5XCEi2P
	eZ102Rcb8pIEpZLHp9Wtl99cNXqMP5HzXoq1QPcZQ+Z/96sIfnBBRDYNITiVc8YisvzWo+18FIIak
	4DmZoqO+qSThlCs4M3+zH7wjCt346DUbMb9JZ6jiYNLv99/wRtAlc5JW+pAuW8Tu8ir8+gytzTItL
	qRQb8jEf7yHqsAOcihLuOm9hsvhwvlU68ej9HVSrSjJwTJNWilqZKz3lJ4900VBvNMQAlQbMBJ55x
	BYI16QOKS9NwQWk8sLeRWZVlNj7Dc2qmwtkR5YsMSPSiHNZzidYRqVhAYCWzB2uQMRiwkmJ/7TOi5
	thDevtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeZ4-0000000DN6P-3JAh;
	Tue, 13 Oct 2026 15:37:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeZ2-0000000DN5p-3WtH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:37:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48CDD60A56;
	Tue, 13 Oct 2026 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260111F000FF;
	Tue, 13 Oct 2026 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905836;
	bh=45NPBWpuG2PMTMsqvm/ZHaqFngaU9inDYGxV4ki9ifs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TyWpVrLqAtEiZ/xCttrXNqMMCpkOgGN02fHQnmQi3NLkg+hAsOBB0YuplOkjKJsyD
	 pXG6vdXLT0alpbPoQ641+8si2elcykM3GJmJKVn4YSMhwEqYymkTr5Wxh6Xgi45c1n
	 a/1D/exDt+kY37WH7aZrsgNUEobktJtFE8DhXvGy03Octs2Aveh8BFUCVs+JDMgfjC
	 U8wOvzui2h9QbJ9TwU9dbLesE9vEJU67mPM1L7EKhQA1oeRuAAiWWXFk8ZuCRRxdHm
	 z+lZiCFy7DFrYQllHlsZHN+whXQ6CP3uwedCuo5l33HC/TT5iPAcK8xKfnuOdVZxjM
	 CbkDB6ws47MlA==
Date: Tue, 13 Oct 2026 16:37:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	alexander.sverdlin@siemens.com, jan.kiszka@siemens.com,
	ayush@beagleboard.org, robertcnelson@gmail.com,
	upstream@lists.phytec.de, francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com, matthias.schiffer@ew.tq-group.com,
	stefano.r@variscite.com, eblanc@baylibre.com, msp@baylibre.com,
	thomas.richard@bootlin.com, miquel.raynal@bootlin.com,
	mwalle@kernel.org
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
Message-ID: <b76c9619-0485-47f2-85a5-9fc2bc7ddc6a@sirena.org.uk>
References: <20260910134409.1713610-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nT0mY8isk5i19UMu"
Content-Disposition: inline
In-Reply-To: <20260910134409.1713610-1-nm@ti.com>
X-Cookie: Some assembly required.
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


--nT0mY8isk5i19UMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2026 at 08:44:09AM -0500, Nishanth Menon wrote:
> Now that all relevant drivers have are ready, convert the
> TISCI drivers to modules. This impacts all K3 platforms for
> boot, recommendation (based on empirical evidence) is to use
> deferred_probe_timeout=60 in kernel command line to allow for driver
> probes to complete successfully based on the initrd used.

I'm seeing boot failures in -next on the k3-am625-verdin-wifi-mallow
which bisect to this commit, unfortunately the failure mode is that we
get no console output which isn't super helpful (I'll try to persuade
earlycon on but there's some issues with my CI setup).  I *should* have
modules in the initramfs, I'm suspecting some dodgy deferred probe
handling or something.

bisect log:

# bad: [4eb2586bd40db27d77cc5b724ca9386ed0c71d53] Add linux-next specific files for 20261012
# good: [1d1c098dffddd29549b00946759ae0923f66b9c4] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [c9b15cd49b3fbd54f3382655b4e898921a7adb4e] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
# good: [483872c9385c9726b056428adbaaf213623ab5a3] ARM: dts: ti: keystone: k2g: Move usb-phy nodes out of simple-bus
# good: [b1368ab37a986bd448e989998eba6ad563207e06] Merge branches 'ti-drivers-soc-next' and 'ti-keystone-dts-next' into ti-next
git bisect start '4eb2586bd40db27d77cc5b724ca9386ed0c71d53' '1d1c098dffddd29549b00946759ae0923f66b9c4' 'c9b15cd49b3fbd54f3382655b4e898921a7adb4e' '483872c9385c9726b056428adbaaf213623ab5a3' 'b1368ab37a986bd448e989998eba6ad563207e06'
# test job: [c9b15cd49b3fbd54f3382655b4e898921a7adb4e] https://lava.sirena.org.uk/scheduler/job/91694
# test job: [483872c9385c9726b056428adbaaf213623ab5a3] https://lava.sirena.org.uk/scheduler/job/92558
# test job: [b1368ab37a986bd448e989998eba6ad563207e06] https://lava.sirena.org.uk/scheduler/job/92473
# test job: [4eb2586bd40db27d77cc5b724ca9386ed0c71d53] https://lava.sirena.org.uk/scheduler/job/93242
# bad: [4eb2586bd40db27d77cc5b724ca9386ed0c71d53] Add linux-next specific files for 20261012
git bisect bad 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
# test job: [72c85b5b41c211b3c71335a7b86a2b61bded6a55] https://lava.sirena.org.uk/scheduler/job/92326
# bad: [72c85b5b41c211b3c71335a7b86a2b61bded6a55] Merge branches 'ti-k3-dts-next', 'ti-k3-config-next', 'ti-drivers-soc-next' and 'ti-keystone-dts-next' into ti-next
git bisect bad 72c85b5b41c211b3c71335a7b86a2b61bded6a55
# test job: [11a51e82e1f997975a28358a1dcffec190ea7282] https://lava.sirena.org.uk/scheduler/job/94775
# good: [11a51e82e1f997975a28358a1dcffec190ea7282] arm64: dts: ti: k3-am62-verdin: fix main_gpio0/main_gpio1 line names size
git bisect good 11a51e82e1f997975a28358a1dcffec190ea7282
# test job: [712357fa6b256b0a6bcf9a26b5c52e8bce36680a] https://lava.sirena.org.uk/scheduler/job/94813
# good: [712357fa6b256b0a6bcf9a26b5c52e8bce36680a] Merge branch 'ti-k3-dts-next' into ti-next
git bisect good 712357fa6b256b0a6bcf9a26b5c52e8bce36680a
# test job: [e557da9b756dba66f9b1ae8bb27add2b7719baf4] https://lava.sirena.org.uk/scheduler/job/94891
# bad: [e557da9b756dba66f9b1ae8bb27add2b7719baf4] arm64: configs: defconfig: Convert TISCI to modules
git bisect bad e557da9b756dba66f9b1ae8bb27add2b7719baf4
# first bad commit: [e557da9b756dba66f9b1ae8bb27add2b7719baf4] arm64: configs: defconfig: Convert TISCI to modules

--nT0mY8isk5i19UMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOUCAACgkQJNaLcl1U
h9B/CAf+OP/Zx9VGoK9IB2pwEmbfZG7zHXNyhapGB1Lj+1QCxDTin/mQB4cIAXQo
XANGZJGR7Yt9EEILy1QLa3QDkKz674oft7V9sQ/wkaIfaIifxnRomXLvXbIS1vfk
ZRMgPJ5nILrlZSoIC1RZOtYkICFuKqGgulZMxdXiBYHYYD+OfbPO7JwjdC5xsD3+
3IHxdJ3WheDfxK5yWyQv4eGkgBIYXxKBx3JKjPafCDpf0tdsGOfDBSHD7O4rb/Lz
/CiOkGRel2ctzaC95IAZT4k3PxEE2SkhC/2uv3yL+hdNZ1ruTsdWlzNi1E+4DL0X
Z9A/JOpnljFope+78OZTB8e3wN8xow==
=uwPz
-----END PGP SIGNATURE-----

--nT0mY8isk5i19UMu--

