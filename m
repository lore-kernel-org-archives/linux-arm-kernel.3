Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B578EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 02:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oh7jzSmsQDJzqrCC2soRTneSSG0lG6DGIKX1qOh1XpY=; b=0n/sV14wC/IygMfijb8m4uX6Pd
	Ers1k9i7H8QMawW5zByRvTKkqOmrpPk1SGPZH+5PiHdM88QD5fnBNEgus4SQ95f+qVAkXaoMlLlHO
	e3r2FBx6oseDKlCt/1eXAZWM4FjJ4JNVZHdj6DEywCH8cUudDUaikO6xKPj6LMNm/ApFOIqnV5mWT
	AjQRJT+1vyb/8GzJSogNgGJEW8U2AzzMZbmLeXf4q6ScXJ+hD08HJixPKQJYIBSS2g8ge8RKK9p6p
	FMSsbJYWZvm8hE+fkJ9jkcjL3e4PlqCuqV33LxYP4cNN3OPUIkj5JlD6WFOXs/IHDBcowAMggtOEA
	dPH7jGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcFKp-00000001Y46-3X2i;
	Mon, 27 Jan 2025 02:58:47 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcFJU-00000001Xyv-1zws
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 02:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737946630;
	bh=oh7jzSmsQDJzqrCC2soRTneSSG0lG6DGIKX1qOh1XpY=;
	h=Date:From:To:Cc:Subject:From;
	b=tHxDwPAk5hTLSd1tmtNgpwvhHTkqp7GbxzQ+xe6L+fLVXblYq/tOPRX7czOr5tfW+
	 9ptoMKBBmsO1dUCS2K95xTBEjVbTcGEp4QqZndl71cb25QxapYtTcc4AKqy0N6J0Jw
	 cJ1Xk/IpjfdZFGMs8Anp44WjFpXGNhnNYYSKjB7+HAEpurOZB64bV0qCImqQaQWlTS
	 RLL+2rLu+RLKtzYoSbpJpxwNE5/Q99yhTLl3dNiPe67/nXvhJElLfmPi0SLPPF3Xtp
	 h4OuQZQVT1y6FI3WrAt1Z//B/r6h3uIjSRjVSdcdCsBTWkZBN1gNgZzs/5bskhKXuI
	 elqXpsShm44pA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhCkZ0FF0z4wc4;
	Mon, 27 Jan 2025 13:57:09 +1100 (AEDT)
Date: Mon, 27 Jan 2025 13:57:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: warning after fetching the arm-soc tree
Message-ID: <20250127135717.00817b0a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MwCwuNwhD+.CQldh/v9wnWZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_185724_785247_C5A5AF0B 
X-CRM114-Status: UNSURE (   8.67  )
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

--Sig_/MwCwuNwhD+.CQldh/v9wnWZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After fetching the arm-soc tree, I get the following warning:

Commit

  1f8dba7e7b83 ("soc: document merges")

added this unexpected file:

  arch/arm/arm-soc-for-next-contents.txt.orig

Not a big issue.

--=20
Cheers,
Stephen Rothwell

--Sig_/MwCwuNwhD+.CQldh/v9wnWZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeW9g0ACgkQAVBC80lX
0GwfKQf/ah0aGwaTifNF/3NQgyATxLAzQarWXqvZA/G6vie+/FfYsdlQKaPGAsrS
d4hkMfzmI8tRgPHAGpEjPXccxZVOQRpHackBTVZBIQEIT3Oz8yoUVUs6oAVak/36
Jr9Br//9nmndpioaDLbwCiU4rxEXwJRukxW/6I2Aoy+qEML3G3iFKXZpt+YKpMY0
3ys840gBOGcP3BhbmjlklIw5FknN0Wh2WLQOQX5pcQfWGZua5LAb9Wn2N2ORm6M3
jXCI1eeLn52zjxAszO7MEhvwM+JK08i7WB0A/rjxNNO1Ci3SrZXmIeBJdWeJiP17
WBjJ2x38FJHJXkm+Q7VzG2WV3bPTaQ==
=jQEq
-----END PGP SIGNATURE-----

--Sig_/MwCwuNwhD+.CQldh/v9wnWZ--

