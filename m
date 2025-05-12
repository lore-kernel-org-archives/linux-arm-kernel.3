Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE26EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 03:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eWv+WWcB58IoipYSMca/vHFJARo4+XwufrJbtjLHzSs=; b=DvIq4GU8Ds1IjNWtJyzWuGFnze
	5ztUwEItCRGRofSbGOs+lPccUQsbkHeik/d0KAQb5QSmkkY/FZTDV5Quyag1SV8vIsfrnolT7qf/v
	lbA7a+qpbxEMEQmJWB/0pMifsV0aYKwk+5ZfrMJe2pi8hFm7PW4mtlW5TpgjE0bQzv4Ia9nfeEORC
	XmOLgEiPxnhr+zaXFSNgx1Crz7roSgs/H//iTKl+qk3Lt/R21bwT8Rg6pakTVxcGovj4S1huxs00W
	xfp6vKI+LCo5xII/5l5DWOjJmq2+MefNeerttfqe0KyWk1h6hp8NB3YEFb8Up1b04Acf2Y7QAHJFs
	wV1RRIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJYp-00000008FcA-3LiD;
	Mon, 12 May 2025 03:10:35 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJWm-00000008FJ1-2Wih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 03:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747019307;
	bh=eWv+WWcB58IoipYSMca/vHFJARo4+XwufrJbtjLHzSs=;
	h=Date:From:To:Cc:Subject:From;
	b=mJQukD6Bqi2zFLhdBe2P3xsqnuzufOCSL1dqBCAGcNU9Ha/gB1XuS+Dfrlamb/t98
	 mPolap73f6vh+mNguNA7X1wHDmu1X6++TjwrL34rlPpoO1lKEVB1LXyr6Hjk3Evw/2
	 a+aP5g33mXaOnNv4GVqaVyl9WctZNBKenHhGfLYmDrkbt3CS2lXZdmLm7KX6Q7MJKW
	 bTMzD9r6IPYvtSnaj6kZC9tjTw/+lM16sQBU+TcKpoo8nGHCLF/NNF0Fz9zQncuknr
	 6W7M1NpkOTUcmyzOppPL/KJrNJO7BLmiTUsj5kHMOz51ThNphYrizsaMBw4W1185NY
	 TGEiv45IPC+3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwl1715Yqz4wcr;
	Mon, 12 May 2025 13:08:27 +1000 (AEST)
Date: Mon, 12 May 2025 13:08:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20250512130826.15663130@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c.0.=sCVaXjvQ_C6aVDC0o2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_200828_786847_EDEE172F 
X-CRM114-Status: UNSURE (   9.31  )
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

--Sig_/c.0.=sCVaXjvQ_C6aVDC0o2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  5bc68bd3826e ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

This is commit

  0d4d6e699a4a ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/c.0.=sCVaXjvQ_C6aVDC0o2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghZioACgkQAVBC80lX
0Gxnkgf/aDsUyER62janqItBRyVDLsETlTNihGVzQX82H6UMpZQEHFIE4/6zuOyG
blxp4VmajHKllb8wyOpij94nnr88ag8KSO0vf6Z6uJE8OMo4cnndqkbWU6cvcciu
Wuma75rS3Vje8Q8YBSbCcjdKxqnKOrbwButMV24lRAejfoYmo0cmyN264X5hdvne
asDr9XBTwDKXkwpJ+hc8WQMF4EbqeGvm8NTtjKeMk7Xhn+PFgw6KhQDKuAfS8HB8
l/HQN2S8MIMONMjbDnw91QiVQKIfUDdXgCe8qqUNLXyZp80mqzKOj2BjfHI318w6
AsAuZysoMOx23wnFdbJI9hcPKhPBQg==
=1Hd9
-----END PGP SIGNATURE-----

--Sig_/c.0.=sCVaXjvQ_C6aVDC0o2--

