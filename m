Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226FBD3E783
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RJ6qVI5VAcez5/6cSc942OSgXZKn3lKc46QWUKT7+0=; b=arBl7311/Od3HmV7Ct8blDa2M9
	5J8Fea8XUQLMl5CtK308AlR7VPO96anW6mmP0F9b1DuNoao+cGgXMctZlW74XX7gltdNHspWhnX8d
	oKiABH67+j64kMlOLvC9Unrm/bdJR8ajLyfx6p4u/axkdJRPVNDKySaTpStzVVuCfPcNFYOgw2fzK
	ECQqLV5XitYRNgHPOEPB7dXrISCt9Co7ikfwm9eoWzYOnHjh4X6Jn1NtvZ3igBeKh+lzxHhcijoh2
	MwsP8XgAj7EhMX4s/L2ho6tHHp+ircWe6DpN2lyvnoDpvcSKAioPWKxfveAnR+lMnKkz38XiTaBca
	LFxhkTnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUTQ-0000000G0yM-2YrE;
	Thu, 11 Dec 2025 00:24:00 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUTN-0000000G0xy-2vFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 00:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765412625;
	bh=0RJ6qVI5VAcez5/6cSc942OSgXZKn3lKc46QWUKT7+0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z5SVQYD9D15bFPjzf+60475MkQQdNXmA/h3jdzMRVBFBs4m46BHjmA8zs/kELxHo7
	 ix8xQMrdUb6Ps7rEyfz7/E8k9emIvyWXNotVdgAIlSWrpyJlb3NkmdXe2tstwkCtYv
	 BXyRNKT4525+PqsiYzG37m3x0oQoqnNABYibkrXmtSXnlgervB1pbk0ex5Wr3hS/oS
	 4gF0JK5t35NTx7v0v32iBXOAGKUF24GPoGyzJbucQcja1evj2R6XupI23x7H/ddInb
	 gTuBTMrzb1Y1jMJhn8MpsH18HKxSxvNNBF5e1jPWwOCJ/m5ByCYzvG3Fc+DL3H7+Xh
	 lQOFGUllEqvsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dRYGl4dY4z4wBJ;
	Thu, 11 Dec 2025 11:23:43 +1100 (AEDT)
Date: Thu, 11 Dec 2025 11:23:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Mailbox changes for v6.19
Message-ID: <20251211112343.51f4ff1c@canb.auug.org.au>
In-Reply-To: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
References: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qkzqvcpv1MD9zPP7zdqT+Ls";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_162358_008355_8128DB77 
X-CRM114-Status: UNSURE (   7.81  )
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

--Sig_/Qkzqvcpv1MD9zPP7zdqT+Ls
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jassi,

On Wed, 10 Dec 2025 17:31:04 -0600 Jassi Brar <jassisinghbrar@gmail.com> wr=
ote:
>
>       mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

This commit causes a build failure.

I am disappointed that none of these commits have been in linux-next
until today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Qkzqvcpv1MD9zPP7zdqT+Ls
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk6Dw8ACgkQAVBC80lX
0Gy+ugf7BRfJ3/ftQsIxFNvhjdZT7qquP8jQesvxTRjljbMRsUr8EW54db2YCQrw
+Jw0jsL8hBb07zI3ELd0dcwENJmzRKIYRuvQRCQ45ztCMXKIwczQQvEOQ9wc1+Kr
OKM2dmXX5qfrKnFK5zil4v2oj1xm3GO59/45ph0vwt/BQrpyl7FgNQoj4Toa49lD
SW2c7W9nOWnYMdhd4T7t01EKOaO6q5FJnIwbakEoanPZuVQz5YZSpMHxLLP8nPbs
wxgl1QVH6tmNYL9bUIupqm0Q1nMVEwBO5+MeQ4DIbF7h/tSrhMv4Q7jmOtZHVbq5
Wp8BfsOjkI5GaNFyLb+LsfKR1a2rYg==
=7Y2u
-----END PGP SIGNATURE-----

--Sig_/Qkzqvcpv1MD9zPP7zdqT+Ls--

