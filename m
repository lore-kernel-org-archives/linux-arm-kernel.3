Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B5FCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pkl3sA5TXlWsbrnsE+Im29cYh921GTSdCSC/ZclY+nU=; b=o9w/uJbmplbM/5uKMOFyiCQGCE
	DQMyWe//N7cE4HT5JUD54p+6/JrJ4sI+aTSPILbTOXSdLOv4XaMFY7lYp010s8p1MBLTiC9tvOFQg
	uUAi0lkBobYRa/9EZGB4erOdB0Cx1hzbqBAx0Z7Sxm3imlMaxnSZbQ0537TDCB8ksra9AytLZ6y5o
	Nl+3vU4pBuTeeIXk4TwF3NH+a1x7Q655b0y7D8YdhcGe9x7u8TqYH4K+T/P4xNE889qngzUIZlaZX
	Wzy8O/tVAEirxUsicTR9njCHkPbZUD8MuQbkoDllVeMqJHoJc68s7M3PVBMT0xx6eItpxXvHipmpC
	EbSynYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfVo-00000004J8D-0tDW;
	Mon, 08 Jun 2026 19:19:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfVn-00000004J86-0YGo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 19:19:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7220442DB8;
	Mon,  8 Jun 2026 19:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4131F00893;
	Mon,  8 Jun 2026 19:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780946390;
	bh=pkl3sA5TXlWsbrnsE+Im29cYh921GTSdCSC/ZclY+nU=;
	h=Date:From:To:Cc:Subject;
	b=lQs91aQv1vd4R0UV/kpr2pRa382Y82XFRQYLl1Dg4NtLwujsyBe1qM+YdkFZo27EF
	 /RO0KuDI9v4Z5BIWrKYhmsaIyv305ztpxOkg13UKCpGM21RIa2uC5xPL5mJ/hqZMN1
	 WaiRcdQj2bwRpR0Jb3hpcKgKfGh56gdb+4JdlQcgW8YbL8DQ4CTCVSqY/eXvpCUsgD
	 XpI/sRhHEf2XiHLnSi6EXuE5Qk/Sdh/HSRHkX6CBNc2R3LQutL6PlzUb76Cguf6zyC
	 C9oPEk1cAKF3serb/yExb94XFAjkeinYKQjyzcz9v5pqkcX+r6fACppQmBeer2/Niw
	 M9Rg50EDzFr/g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EA7E81AC56AC; Mon, 08 Jun 2026 20:19:37 +0100 (BST)
Date: Mon, 8 Jun 2026 20:19:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Aishwarya.TCV@arm.com, linux-arm-kernel@lists.infradead.org
Subject: -next boot failures during KVM setup
Message-ID: <aicVyebkEMs6w6UV@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xf4gFMD0UxwoEd0l"
Content-Disposition: inline
X-Cookie: Leave no stone unturned.
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


--xf4gFMD0UxwoEd0l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm seeing boot failures on a range of physical arm64 platforms in
today's -next.  Turning on earlycon it looks like we're getting bad
pointer dereferences during KVM initialisation:

[    0.728923] kvm [1]: nv: 570 coarse grained trap handlers
[    0.735138] kvm [1]: nv: 710 fine grained trap handlers
[    0.741326] kvm [1]: IPA Size Limit: 40 bits
[    0.748840] Unable to handle kernel paging request at virtual address ffff00000478e000
[    0.757027] Mem abort info:
[    0.759917]   ESR = 0x0000000096000147
[    0.763772]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.851526] pc : dcache_clean_inval_poc+0x24/0x48
[    0.856367] lr : kvm_arm_init+0xbb0/0x13f0
...

[    0.937120] Call trace:
[    0.939628]  dcache_clean_inval_poc+0x24/0x48 (P)
[    0.944457]  do_one_initcall+0x60/0x1d4
[    0.948393]  kernel_init_freeable+0x250/0x2d8

   https://lava.sirena.org.uk/scheduler/job/2849583#L848

(with other platforms I've got earlycon logs showing basically the same
thing).  I have some bisects but they seem to have been confused by
earlier driver core issues, I've tweaked to try to avoid that and am
retrying.  FVP and qemu seem unaffected:

  https://lava.sirena.org.uk/scheduler/job/2848374#L888
  https://lava.sirena.org.uk/scheduler/job/2848966#L447

The affected platforms thus far are all SMP Cortex A53/5 systems, but
that's the vast majority of my lab.  They have both GICv3 and GICv2.

--xf4gFMD0UxwoEd0l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmonFckACgkQJNaLcl1U
h9A0NAf+Kfn/fOJ7Gd99nZ+NfVI8PmxAbZaVWijcDV/a/2CUJ7kR3iQj+vo1KfSn
dEGDy4EjEA+lGEOQXAlgvL/SVmF2zCbtzBuq6+I6hThFNFLmgSZJYtKLE5ZBnZpl
kgU+NjpgeizB5l/3lxZjEmpHndiTYeedLr/G/QgPC+TkBUYx+x840bh/iBTvepEH
dnk0Awntv7bNFzX/syeoPYVnXEcmndM4helbSI0pdaqm/kDoAo+VcUNfV1nW5Iii
Xkw9UgnyvHdsXRCI3f5YDwZxpGZh0DzUI3ziFYKB15kEMQHhtwVnFJc6mXyg0Pb4
QPWSB9WTkb+LvAuD+GRPrv1QiISoWw==
=iJxn
-----END PGP SIGNATURE-----

--xf4gFMD0UxwoEd0l--

