Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C36C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+o9xo3ux0g9p/58C8pQqVfWYisjOvGF7KUvBPEyDqm8=; b=RMCAKLAmLqf851erRtDtDD+XWX
	65jWjYpS2UQv+vdNtEPrALOQfv9gvCCKZKTgSXJ/pRJr315NiNcXkgZZA4pwylwoVTuSjpg5zlHmC
	l1lxHTV6uG4LIQe4pPwplDGt0p1CNVAi18Eh4bfTa+cXgX0Nt3XbrAdMeWE5cHs7KHkSw+LHAY5bP
	KkRuL/hbKFCF5F8A/8wHluMWESGKnQvSyTDb5zxas8r3mzro96qYUAbTwq5YpLZSNq5MYqAT9Qbgo
	rR+BB/EOA5ndosKWXdOWKRJaQNlk2lvbdMOXnzacyERDbAWnOecq4oRs8206hkZBIX7IvUz+xehFy
	OGAgUGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmtj-000000071ep-0Df1;
	Wed, 02 Jul 2025 02:08:31 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmrK-000000071WX-3P6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 02:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751421947;
	bh=+o9xo3ux0g9p/58C8pQqVfWYisjOvGF7KUvBPEyDqm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YfTowk+DvnG5yPaTyjRTIUi75q2iuBhxAUtH0egkYGmQ/LyHVD2NL4fZ1TPplSZup
	 HT7HmowUyutxgpuJmKN1MAZZoY6mEgqJe/wN6XeiII6pmssSFUEq5zNP9gX3tupHOu
	 Nva/S4nUjQ+PhkzbjUBwCV3gIQ0cqJ7z1iK0SeqJSSc5sELJDLCGD46lHHjNpJwQ9j
	 vBA7w1M5S5CaQx8OtJika7HToUdMF5wYZdLofeU9iWc/bGzgLElnaly9NDrnNIPl7K
	 +Fmcb0dOJbQslxWRMhN11Kw+vSjOcEiS37hzUacKliCXe1I4KlEzziJgUcUgr0lvoC
	 VWUlx+r0Pr5DA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX3CH5Y1Bz4wyV;
	Wed,  2 Jul 2025 12:05:47 +1000 (AEST)
Date: Wed, 2 Jul 2025 12:06:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: Add bmc/linux for-next to linux-next
Message-ID: <20250702120600.33f3d49d@canb.auug.org.au>
In-Reply-To: <8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
References: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
	<20250702114941.5bfe1e5a@canb.auug.org.au>
	<8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v2D4X2v2d3y9CSJdoymqTvQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_190603_263121_20DBCE04 
X-CRM114-Status: GOOD (  22.65  )
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

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 02 Jul 2025 11:28:06 +0930 Andrew Jeffery <andrew@codeconstruct.com=
.au> wrote:
>
> On Wed, 2025-07-02 at 11:49 +1000, Stephen Rothwell wrote:
> >=20
> > On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct=
.com.au> wrote: =20
> > >=20
> > > Could you add the following to linux-next?
> > >=20
> > > =C2=A0=C2=A0 Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bm=
c/linux.git
> > > =C2=A0=C2=A0 Branch: for-next
> > >=20
> > > This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
> > >=20
> > > https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0a=
b@codeconstruct.com.au/ =20
> >=20
> > So, does this replace the aspeed tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
> > for-next)?=C2=A0 Or sit along side it? =20
>=20
> It can replace joel/bmc.git, however, it should be fine to sit along-
> side until Joel confirms removal of his tree with you. I've been doing
> the BMC SoC patch wrangling recently, and he hasn't been updating his
> tree with the branches I put together until I poke him about it. In
> this case I'll just hassling him to update his tree, which should
> remove any opportunity for conflicts or the like.
>=20
> > Either way, who should be the contact(s) for this tree?
>=20
> Both myself and Joel.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhklAgACgkQAVBC80lX
0GzIXggAh4jofNHSLz7BOgy43fcczmnnsLSdxlrK6LJLuJV/CzVT6zzstte7DFIN
ajfzeg2+5fQOJcY7STGmZCCUl3ylvCwlDtMAJgSpuMKoLsN50VhGmpCPqSXjPeLH
A4twqQ5MagEgSSLzMjfj+nZBDL4x1Xg68F5r35hUORxgJWXBoBdp6q+1+Thotes0
LmenhRYqwNlQR6N0V2LAbj26JJUWcQGYzglY1H6xKFNr8vaf8s5blOsfYjTCEz+5
iqSGc9EUl1k31+Nw0vVbid3A7Rux0Yxwsz1ISFmCgDy2I3+wUCt3sjI1OmvowNVk
DlRZLBTcCBXA9BryPdwHjkKEA3O0LA==
=VPNz
-----END PGP SIGNATURE-----

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ--

