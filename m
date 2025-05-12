Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ADCC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+iXkGW4q9wgvheRHrmEPiihlkV5z7uc/pD0Crq6ttPM=; b=xtznRJkrKJoGLU6LLv+Y5hGxfE
	i2lygk08QKYMr+oloqeqA2w4RRkvnCGhSZfRwrNRk4F0GVO/ArIYeePlvze9j3GJmtLGlb15ETGWN
	ThkgiN4VReNid7HRZbF0IeTezv43mAUFJecVWxQqQFMUGwuJeH1pt/ZZrheEhA81NSrIxlaTCKCcb
	CBALCUp+nRbHhH4Cr+C0/XPa/rnXTgwiSnNz3lbNWA5oX/5C5QA7gCuh2MScVBrj6XqM9PsstFCzX
	BrEAkpQHjbW8vU6XxRMps7XsveWErEeI6daPzmKrSrgKW+mq+4kfLVhSnE8YIljodW7y2AEzAKsmA
	AYPT6ZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJWo-00000008FJM-0Usx;
	Mon, 12 May 2025 03:08:30 +0000
Received: from [2404:9400:2221:ea00::3] (helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJUl-00000008F9L-2e7e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 03:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747019175;
	bh=+iXkGW4q9wgvheRHrmEPiihlkV5z7uc/pD0Crq6ttPM=;
	h=Date:From:To:Cc:Subject:From;
	b=U0UcdQrkE+26GQb5qcpfn22gSgdVRVQqRVWXBFw9/DlEiTuuzZ3l8MJdCh71dBkF4
	 trmwASnxkowSAIgBUio6Lu4FncpmCbuFQ83YbUnU2ThEVCjODQfxvW641+YVhxus+Z
	 p2RZ3qJeOxQyFNDeFojqegVkk25nAx/7iWS/8ABK5FcznAy3EvEBsg+j1ncGQmca1G
	 AcA/kxCs+fbsQEVnl//Lsh1mcnrpe4nM33pPGC+HF49lSHmf8I2XVynfSakS+MLs/p
	 FnymiHwsa7NVhi4ReFkuoFJur1JzyHbqHTDthQCloGROnEv1rS+HrG5lqYm3og9zlb
	 Vg1G0PCleQyIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwkyZ2ND6z4wcr;
	Mon, 12 May 2025 13:06:14 +1000 (AEST)
Date: Mon, 12 May 2025 13:06:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mvebu tree
Message-ID: <20250512130613.02c970f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xwSffPRrBqCZt8kFG2ZgpXV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_200624_026101_5606E20D 
X-CRM114-Status: UNSURE (   8.80  )
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

--Sig_/xwSffPRrBqCZt8kFG2ZgpXV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  a3a0b8b23108 ("ARM: dts: marvell: use correct ohci/ehci node names")

This is commit

  49683c02d8e1 ("ARM: dts: marvell: use correct ohci/ehci node names")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xwSffPRrBqCZt8kFG2ZgpXV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghZaUACgkQAVBC80lX
0GzB9Af+MZlxb0VnnS+XkHxn6QZsxTNFjxuPhM2RRoJqAsTJsAKPQ3+H83vnYZWS
82+vgXGzDUGMf0Nkdv6o07EJU3pWJkklEHRTnyWNsVH2x9Ofo7eTajvTgWSx+MGG
12rphY9J2gspKNsueN7+4Sy7SqyjIdnM2IYoSH7sgzaA3y4JmV1t3zwjfyc2zGFT
pn8RuOreA9O87c7doGYnBJnpxBvJUjT5hqH6obIyhZ7yVgaenRaqzwb74Nc0mM3b
H/VyVt1ye/Qv5qqo3HqMb7ANCQbwDiZPsH4z9v1XGXeu3E0YgnIjOnaOBkXkBkB4
GDyHXn2ekkHhk7jas21cTltVUjieeg==
=O08t
-----END PGP SIGNATURE-----

--Sig_/xwSffPRrBqCZt8kFG2ZgpXV--

