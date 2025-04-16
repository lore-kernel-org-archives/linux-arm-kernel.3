Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0218C369B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 03:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u8Yr7W7zjn3+a4fG0VOgSW0XqeXmxgR5zUYlFB0fKwY=; b=YS230vlAUpqb3j+Y4vJo9oS1Lf
	MKOCuHqNAj+92DmHtqH8zVMQcuI7ZtcoDjrg2cgW8wR1rFOEUhUhhvJDz+fM9o4u/x0BU/H5mUoVr
	nQd4krjL30d+g3TwLkJ3nJ/wXrDjB4vRZLmmY22LPeNTxrnEg63qDzX5onnEZDFsVuQpMUBWXLU+w
	r6RKrBOuo/YSldPhdK1i3yIUY65iGfWBmAnKe6osbXf3fha7kim4k/BtdWoAT+KKiTx7rahSPn0oB
	2jIZpxtDtQdDGWC9cZEhrC5Fg0DdM59gAiYLygCQCfeCgiFpCQuhe2lRQuVMFhKUvOyMHdruWwAT4
	c2rA7i7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4tNX-000000082cv-1N8o;
	Wed, 16 Apr 2025 03:23:59 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4tLg-000000082Rl-0zlL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 03:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744773715;
	bh=u8Yr7W7zjn3+a4fG0VOgSW0XqeXmxgR5zUYlFB0fKwY=;
	h=Date:From:To:Cc:Subject:From;
	b=e3aNNhehxvBF4HmUhC49smK/29jjhkMF0YOQLhNtg+vbeASbkLBLZRRkdlUgWjfmm
	 kd0E3XEHq0uDugqYYuJfISx1Zwfxb14yY0Pv/qQFs7rYydlG4hNGo5XU8y8GukpoIh
	 1Uv5dVkwtenpLt4JyxNitoXoJziOnrzENOqYpm3uue4vg5NHyL1CwytngcMX4NGg88
	 DtdVhUDWlyVcs7RmtCnb3CcLA6xBAbb03BqeI6qjWR3pKjl8s33vD2bKm/K87aw1i9
	 JJ3ZejYW+Nm6QdAi2XVSzBWuQT5DSmRr9xwGF5fevcnxkT4QeEONj0HFXuerGjS6ot
	 MY1XMobgw8bYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcmXd4b8xz4xQ0;
	Wed, 16 Apr 2025 13:21:53 +1000 (AEST)
Date: Wed, 16 Apr 2025 13:21:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20250416132151.3b0448d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ryBkb_rNx0A+3VyA/jxugVB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_202204_536266_98D2C886 
X-CRM114-Status: UNSURE (   9.92  )
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

--Sig_/ryBkb_rNx0A+3VyA/jxugVB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mvebu tree as a different commit
(but the same patch):

  73989a38268d ("ARM: orion/gpio:: Convert generic irqchip locking to guard=
()")

This is commit

  5b49e7ff76b7 ("ARM: orion/gpio:: Convert generic irqchip locking to guard=
()")

in the mvebu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ryBkb_rNx0A+3VyA/jxugVB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf/Ik8ACgkQAVBC80lX
0Gw76Qf9Fqrygq6M3Sxri8WTn28i2TqtA2jr7dAXwdiSWXE2aGSKekya7uuQu1mo
bqARYF4aDFXGAcSuc7oEHnZ1dNWbKfXaRH3pCbk3ovZeP/bEGH/RzbeS0jo2IPLH
/F/0tyFgwgfieGmKN9fJ+0J2ayTciZnGkoyueCNjMwErXztGBQhvoAa1WqnUOHIs
+7uOmfvjXPYcqmv7nK7EG8dPausqu4VwwXVIqMDIwTso+uKBQUSH/8XuEPlx8rVc
RkK42KC9YzgX/yOCp9hWYn5+su4aXR2QN+IOeb0IdDQukOc1ECfno84nSiE33wRE
xKDoOzUmmEJ5VovykiatQQmfb2I9SA==
=mll4
-----END PGP SIGNATURE-----

--Sig_/ryBkb_rNx0A+3VyA/jxugVB--

