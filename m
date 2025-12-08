Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35807D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 18:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22yBtqajb8EKYr1HfLXA4Hs90TWYxmKi/30Koi0Li3k=; b=lQyLFaPXMzsS8e6Qy/EsRxIhmC
	AKO1fgnZ9cw6PGTHDyqmDArA41nhADiNsmF4Ys17Fh7L8lCCEwumpZmSMwUZltpAFAXkn6ladNFe3
	lK0usUPZATCvV+knbOy93B7fh5nUPABzeHbn8UgXb37wHN5DZlN2it6ec8yb7PeULGKmLPQyW+n1i
	dSve+cmyWJGFsj0o9s9WmLnTcAKOXXNUihYuy1xKh07F4kcTmiEfO6HpmWrwSBFvZYVB0y7kc9SVe
	VMklDRBu5jWHiq0XMxDNFNxGzJPhPbUANyI9Mgb4cMk9BHpL23cpIbGKwuBtPciIePXC/bO2t6dim
	vKvMzlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfkY-0000000DQGb-1dGT;
	Mon, 08 Dec 2025 18:14:18 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfkV-0000000DQG5-2i3i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 18:14:17 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BDB791F8005B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Dec 2025 18:13:57 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4C5EDB121C8; Mon,  8 Dec 2025 18:13:56 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 74EE8B121BB;
	Mon,  8 Dec 2025 18:13:53 +0000 (UTC)
Date: Mon, 8 Dec 2025 19:13:50 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
	linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org, asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org, x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
Message-ID: <aTcVXrUXVsyjaT22@shepard>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z9eEZ2V8rb9VqsSG"
Content-Disposition: inline
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_101415_850872_7E0F07BA 
X-CRM114-Status: GOOD (  15.49  )
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


--z9eEZ2V8rb9VqsSG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
>=20
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that we=
re noise).

[...]

> DRM_KMS_DMA_HELPER ---
> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER

For these two, the symbol was removed in commit
09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
missed by the batch rename or were introduced a bit later.

Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
drivers), it should be replaced with DRM_GEM_CMA_HELPER.

Are you expecting to craft a patch for fixing this or should I do it myself?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--z9eEZ2V8rb9VqsSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmk3FV4ACgkQhP3B6o/u
lQxHMA/9EINPzAC/mNsqKqe+ejzVAFDvbkqgtj46jdHchIRyg5QqUNEoQvUKACwR
bZftHenlJS3ho4n0eejvmJG9LkV6HYA4X0vXrPKGJTBCMgy1CUl7j7v8ZFn7qhcc
KmyK3klG9hxRNAFrMTlxaE3uzNZWaZ56eEINuq5RkJWv5ieiadTkXR03L4x2l++z
B1RqTh3yh5d57Ckfs7lLGfmiDUQAkhdAm1CASv6bO1jKRiyhuSN95aOZFZ94DV+m
oV44vbSx4aXyh1lb07PxtPMa+WITGI6/mW0+TKhRNd0eAoO19K0zkSNA18KjgiOw
3m/4Vs1pdWSKCTDIgtcymufTpdjqWt5LEpxEuzLprgUXrpoQbS7paAfhB4Ex6yIR
CcQfarVp0SM0/OI5kZc40xoz6UEHrCjw7+loxHuUV+2KHAhfRlQhLcScrQXUO/X3
L2vzAFURuGyVpPbZnq2ftkMT4h6o+W93ZtKP8vIHJjDijdwM3NAt90FT9byKXAYP
AvVBPERmf9+savPI0eDYuO825wAcF3D2rvF4ZElPj4+OD6sq93Z52bDN3CUFHsMD
tKp3GKwBxZ0ENUxQZvrIINzLx40EXOq/MDI1JZd4Nl89W5BBk6QGIRE4hj0FNctf
+4gCjq9z339Ik0u6aVtzq/jdewPuTo2wZ5DVPxsH1RyPX2cBWAg=
=azY3
-----END PGP SIGNATURE-----

--z9eEZ2V8rb9VqsSG--

