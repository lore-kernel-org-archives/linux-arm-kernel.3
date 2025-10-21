Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2964ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URgOCCsjPm64zg3kWEpgRQ33FAkB/Nwdd46fhQkDsaY=; b=0/C2muJNOD40BzYtS6NrV6rbtS
	sB/LWS+CHR86xLWZ0Kkc7warAQAmrlBYVv6ue4GJD7C5x9IXYEg+0Tr7+7bzkXKWwjBf9rzpLBOWQ
	WJXpIUI+fW4o/clE3KK+QQNpRTvNrJm/t9ak1IkGOWv62MXotfze/tIUaC7Yt+zVYwgGWlYZEApE1
	OKtqP8gnBqarjTBs5hzfPnrH7oX1RKSy8OMEAH4MgaK1cFAZuEU3/WfSzaCoxpDgTleH0Www0h9Up
	83RSZgoJE7UF8G2YdHdXYPLOEf3Gje2W67z+9/fo1kMnNUmZOgb2HfmGV0XKjz+as7DLnAjoQzhXe
	X7ygUh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKhh-00000000mdw-05iv;
	Tue, 21 Oct 2025 22:19:41 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKhe-00000000mc0-2dFF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 22:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761085173;
	bh=URgOCCsjPm64zg3kWEpgRQ33FAkB/Nwdd46fhQkDsaY=;
	h=Date:From:To:Cc:Subject:From;
	b=V+Oya4O7IzQd2LRDpsLVwOJj7tJ283ez4hx5FGE1pNLnNdSzv783IP14SkZNOiRcw
	 NavatuSL4GkmpfW6850Uolg0buijwrKEgvowW+GzASXXTuJVRiL9vjDdRVPqKfnvKQ
	 k2EIVYq2M8beiCvyETRJeT/wbtpjBUfw9G4X4DkZRtdoNzXV42hIVuw/hvDz+qKITJ
	 jbR9Z+aCGeLMCAMm9AR3Nn2a8QnngunjSFP+PA9i06YbWnZHeHYrr4H1jeP9fedPso
	 dnv9Ep+x8IC+7M83tO8bK7Zh4/IrOJdeZ5lNhdMEMZnzLXjM5JBJE5ewUdUOWbV9Dp
	 sn2lBL5HLpTKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4crmtY2LNQz4w9Z;
	Wed, 22 Oct 2025 09:19:32 +1100 (AEDT)
Date: Wed, 22 Oct 2025 09:19:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm-soc tree
Message-ID: <20251022091931.2127df3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+JnvjY3+y.0Kt.UwUYl5vfK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_151938_935146_5BD1074C 
X-CRM114-Status: UNSURE (   9.25  )
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

--Sig_/+JnvjY3+y.0Kt.UwUYl5vfK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  3573844359bb ("soc: officially expand maintainership team")

This is commit

  691cde81bc8f ("soc: officially expand maintainership team")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+JnvjY3+y.0Kt.UwUYl5vfK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj4BvMACgkQAVBC80lX
0GzalAf/fVLE5XTefYwONb7X+YmRChqLyh6z5nti18E6BKRkQJ3Y8hRKPn923uA9
C6cumfcu7yX26ixGbYricN4epU2UttENvWSWQnw1XFRJEkMyjGj3XTb6PyH2uxeD
/hPzDOBUUy+NacZOe9OIVnip6aJ5w7z17c3wndZ6bWM5OHu/ATWC0qM+cPPAO1Xd
xJmzBI24SndVUB+Fswr598IMzEtJPLqg2YMElyW9MBzNu/YxJ+HHc7ViCtKNp+zi
E/1p6C13hfqsuIKnPhMfPW28KFlxmoAIELn/FvNzXUlZ+bga0P/k5EDSUisMxnm5
Ja2KuyED6nNiTShFgC5LN/KMVfUabw==
=xotM
-----END PGP SIGNATURE-----

--Sig_/+JnvjY3+y.0Kt.UwUYl5vfK--

