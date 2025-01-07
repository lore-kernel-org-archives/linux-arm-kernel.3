Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00219E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiXxJICog3a/eIKOwNzjWVpixEqqn1fFp/qnieHT+38=; b=2Qyb8v2U3/uIx/rHAfHYKX5y31
	XycfjPSlzNLzpTTHHkorGpoylY4KQYQEcblDF/9XrJxH21cnf89zpNig8dWafuKxOxAXme3RKK+dh
	eteBaeLOQLKNt0joMRbjEDmG7P4B+Bfx/1IsYj0ZfDVjtCn/u4uk1iOoLRC6yCuj+ubx2Ubjdo5KE
	Ts19LzhRe0EZoiDqv8kkL/wxhtbNZ6Vp9czdayDtveI+lOA+SuKoSOUITGC/OIkI1q9VR34/au3Jf
	e0zJ+cQG9XIVURPG8AcdH9pbpIIWn812N38I+r8Bq79RH1yipvPdLFe9xoBqqt1Em36aSTJkcF0V6
	QHTUVxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7xs-00000004bgG-1nL6;
	Tue, 07 Jan 2025 11:41:40 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7r8-00000004ZoL-18Ss
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wiXx
	JICog3a/eIKOwNzjWVpixEqqn1fFp/qnieHT+38=; b=M93RzCx7j3YGkDIXalQl
	kmXiNFmXbHYOJ7MfYgD2ryj6GbgKxPs1/UX6A6TeHinIYXb8J39sTR9HHT5KF7bs
	OXyE4KfXx3cH+SBCv8lSN3I9TtWliiANdL1mk5o6wODn18NCPgDel6zJvtJRWCyZ
	WWTyR+KWkSK8lpJN2Y9TsYyM4z6UrTx5kGSZ+DThReMjAgJz5hjlg3aAsMC+gGyp
	6RqE2G4n7Xt+ndShWpjfiFNPIQcMmlvdgX1pqf6EFLpYZaUhDIXHq4BeKeoaVzXt
	HzqPQCMbbRecj1qgfGi4uIvKyLfutQ4f9+4avwUczUkPhjTXuHjixev9llqXgs9t
	cw==
Received: (qmail 2184330 invoked from network); 7 Jan 2025 12:34:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 12:34:38 +0100
X-UD-Smtp-Session: l3s3148p1@eBdMIRwr8sEgAwDPXw20AOMQ2KO98fSH
Date: Tue, 7 Jan 2025 12:34:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] ARM: shmobile: rcar-gen2: Remove CMA reservation code
Message-ID: <Z30RTcU-lBD2KTCq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TBHB6wWVwj21RDVa"
Content-Disposition: inline
In-Reply-To: <3d38f4fec20c4af46e4570012de7017eee9a39e9.1736249109.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033443_174732_EFBC206D 
X-CRM114-Status: GOOD (  18.82  )
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


--TBHB6wWVwj21RDVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2025 at 12:26:55PM +0100, Geert Uytterhoeven wrote:
> If CONFIG_HIGHMEM=3Dy, two reserved blocks are allocated on R-Car Gen2:
>=20
>     cma: Reserved 256 MiB at 0x70000000 on node -1
>     cma: Reserved 64 MiB at 0x6c000000 on node -1
>=20
> The first block is reserved by the family-specific rcar_gen2_reserve(),
> the second by the common arm_memblock_init() (shmobile_defconfig sets
> CONFIG_CMA_SIZE_MBYTES=3D64).  As both blocks are reserved (eventually)
> using dma_contiguous_reserve_area(), they both have the same name
> ("reserved").  Hence if CONFIG_CMA_SYSFS=3Dy:
>=20
>   sysfs: cannot create duplicate filename '/kernel/mm/cma/reserved'
>    ...
>    cma_sysfs_init from do_one_initcall+0x84/0x178
>    ...
>   kobject: kobject_add_internal failed for reserved with -EEXIST, don't t=
ry to register things with the same name in the same directory.
>=20
> This causes cma_sysfs_init() to fail completely, and not to create
> /sys/kernel/mm/cma/ at all.
>=20
> Fix this by dropping the R-Car Gen2-specific reservation.  Compared to
> when it was introduced, now there exist more flexible mechanisms to
> control the size of memory reserved for CMA.  Users can reserve more
> memory by increasing CONFIG_CMA_SIZE_MBYTES, passing the cma=3D<N> kernel
> command line parameter, or adding a reserved-memory/linux,cma node to
> DT.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Note that increasing CONFIG_CMA_SIZE_MBYTES in shmobile_defconfig is not
> a good idea, as it can also be used on other Renesas platforms that are
> more memory-constrained than R-Car Gen2.

Ack.


--TBHB6wWVwj21RDVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd9EU0ACgkQFA3kzBSg
KbbNhQ//VT8NXrOOgTF42rqx2+xsOR/Z+36cBpsE6jRplTJr6mMGCBQKB2ZPvmYQ
9JFOge48b/ev4DQi4jxm5aKf1gcofMKC1/OsMuozs0BRPY693I3NupIK6TaMo3yq
lvnT/dkKXq9dGxLlle8R6FOaH/9gB//iZfiWJ8cIOfv0Du+BJddXQCMwOK0mmG+w
P7vE6VQJqw59VSoV3Bx8bJOYnSZzJftfWGi+oL6ddA5EK3PABxg2xPqLKmHkgCNS
zXb3+ZLro5P0hmVxeKMD+fspiAGw86/CKSBroewNGl+lgWIwWo0D24DNxlsD3aH9
WcQqXiRYN9fsMeNoALcsY7wOoVewn9BLUJ5oaGRb67HSUZg59EN+XH+a/6W8YSeC
jFsigWWQaSQAUyKGp8ZwKzHZEHqBy0zQ5uubLLpreBkaaTuxlPDLBV/lRFb4PyPX
3V2RCh3PSHj4YiE9JqVmZyxFTJCX0c0+vq3+jIVdL61NBpfL9IwvapcTE8Jcg/iB
FhySbtZ1NKsN7xG7bKihAAg79VFzWLn8S+qch1eSVSzlf/+kVSu7qzB/RzNYOR0D
jDPV5iW0O1+VUPO6ftLA5UWOkCdzzPnDxSYzFtRMTamaDDBTDwatuTh38A+75x5x
lxSBnxFu5yPQmg327z7zYNzxyWo7nePE1fVbdoNW2bKUFxW5rqY=
=bKFv
-----END PGP SIGNATURE-----

--TBHB6wWVwj21RDVa--

