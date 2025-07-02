Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB88C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 01:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXy2MXucUAwAMgC5dNJmBFgEBpE/G+rOGr+3LXVk6aI=; b=edX1WzANSv3niXE2oqT8+hfCqT
	l9Pfj/4vz2kHntMAfLfwQ+TnMU30ZYork/riLzdiMln4kTwQP7MoHW1IC8tK3UTyxuCZI+APkzzj0
	s42bYbKqQ2KvTbPwGKrtXufMKiWpKCc858JL0p3D1uQkaB1y4kO6bLIdWp3PtpFLR5b1k7T88MOBY
	2LfYyTe4BMwRfZ0mz/Vd1dDCAjoBc47xLO1mPlmEP2Xs6jte6AMubgKvYYjcyS1I1znuS6CJlA3ZR
	9u7JSArtQgW2hDz7SuCd6gprsBoTgqVtX/It6m7uEsNOrqTzm+SG/kjpSq/Xdv9Q26bamITNy5phD
	4qTLtk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmdy-000000070fu-11LY;
	Wed, 02 Jul 2025 01:52:14 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmbc-000000070cE-0rwF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 01:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751420970;
	bh=VXy2MXucUAwAMgC5dNJmBFgEBpE/G+rOGr+3LXVk6aI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iXCwWXhAX7kvp+WmecSmDvMABSElLwxyLBGeKfv2dDg1Gcgpfj5hKrSnmws6ZLb1R
	 DABcqEU0X7HWj/7ljISDwX0L5ZCQnOGNdM3C9FjhbVREbzawRplseisvHGhBEEroBN
	 QJzxvUWj2UNlZns1FvY8CVwUs7vXTi8vvTWBAafQRd7qVQbJpILrKtllUu7jqeKJf9
	 7gNYgrYkn91JxlEENNexeNZ2ALl920WNEwNikaLvF8ZFhp57LIOzm9mxDbtptBT+N1
	 aWVBT2VI1buaPvqQXHxKdYIY/N2FR2/Yy9rcdxUbL5P3z8F8gqIQJgJMLAjVRbJBPn
	 lbHYYp+9BsI3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX2rT6Qxqz4wcZ;
	Wed,  2 Jul 2025 11:49:29 +1000 (AEST)
Date: Wed, 2 Jul 2025 11:49:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: Add bmc/linux for-next to linux-next
Message-ID: <20250702114941.5bfe1e5a@canb.auug.org.au>
In-Reply-To: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
References: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/olnj4gvN==N6hy44f10+yNA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_184948_518875_C6E79F81 
X-CRM114-Status: GOOD (  11.64  )
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

--Sig_/olnj4gvN==N6hy44f10+yNA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct.com=
.au> wrote:
>
> Could you add the following to linux-next?
>=20
>    Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
>    Branch: for-next
>=20
> This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
>=20
> https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@co=
deconstruct.com.au/

So, does this replace the aspeed tree
(git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
for-next)?  Or sit along side it?

Either way, who should be the contact(s) for this tree?

--=20
Cheers,
Stephen Rothwell

--Sig_/olnj4gvN==N6hy44f10+yNA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhkkDUACgkQAVBC80lX
0GxEeAf9GBf7tmaV5IVqLypKCi0Vd0YU0OiupwyekgLXR6FnI/jA2pB5AbHCe5mt
sKYyqctFxEMqPaS3x5GZXHMea/kJ899u+RbkhQNUwGHIf94SJfkhatNbvDveAZzD
LfQWG8VIwar6MCP/wH8LH4q10lMRaZPGHTf//iLr+rSPyhOKCTmXYEh3IhWa55ZF
pEQ7TeOyXnd0PZIKcTmpuq95fKJyV9UX5W08XXHC4crCLitT1mNA4ydgwwpS+eRk
WEr2keM3r/9RyShdN02dTkgzH2b/YJ8X1LjSMJyM/o3EjNbuv7+CcZQlgK8Flo4B
0Jf0++FNkD8ktwVo1JPp4Ir+815Cbw==
=pNgw
-----END PGP SIGNATURE-----

--Sig_/olnj4gvN==N6hy44f10+yNA--

