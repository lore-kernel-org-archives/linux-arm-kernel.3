Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA60C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2oEQi1LZ6xfE0bhgFOyz7ltxkaGs8EDtR40dQPh+GcY=; b=c3ZIMWaAGP/kGwTngI+qwWnBqP
	tzFq6fqoe3QzOPzXoNAmPsjDP2R63A+OGgvFnLd0+CrkoNxQXpasUtZkNYz0KK/IRrZDul6xbc00j
	mZTvQZ3ou28Xr4xOcc4pUsXcSqVY6rQvrtOZpZWErhVQW3inmx48dF4IOxt9NPOFvz4p1lW8BGXJ0
	G6LYMwTztIEMmrqRImAToRIJApqDAuCbDH0HehO4EVrXNVrVSJ0TJCZp7ZNewZj5xs4tl/10jTWLu
	aUt8Try8oXI7Uz092YQVHAiHN+IXZ/aNK8wi+Z9C9J7X1qgePJmZxeN1FOeeItayJwANpqbefQ11b
	Fzeg7GXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJOE-0000000CKVJ-0dGH;
	Thu, 06 Mar 2025 22:08:26 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJMb-0000000CKIF-1Wk0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741298800;
	bh=2oEQi1LZ6xfE0bhgFOyz7ltxkaGs8EDtR40dQPh+GcY=;
	h=Date:From:To:Cc:Subject:From;
	b=mFSeYwJvFazdUS9+uw3atWdbT3EuD1iAivDF+iurlA/54ZUrzCx6dYZJOhrOfdla/
	 PoU8EsZJI+xuC9SM0I8VMKkWskgRsmiqz+AzmpOmxJQtiGldfmzknnIQnRu+P6/3KI
	 nWa/cWUmKlKZddqqQmsZrPVWgmfonNGRPGHxYIr2HEiZFgtcrkWvQpX6d0f/Zok0o7
	 nquYHb5QWpEEYSvCH+GRhnWCYzLgi498JGBDpypNv1RKO+XQ0YSo0AaVqxN53Gh46Z
	 ZDNUnklhkbxVRSDWicW8QiDv7BgtULNctD/1f7lo74jVGCLcrfTCA8dyYHiIEfbbR+
	 1cbuL66kCHaAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z83RN28zMz4wcT;
	Fri,  7 Mar 2025 09:06:39 +1100 (AEDT)
Date: Fri, 7 Mar 2025 09:06:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: linux-next: duplicate patch in the omap-fixes tree
Message-ID: <20250307090638.50776e07@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J8OBaT5jmFBD_wXUWwzJR+7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_140645_667450_5EDDBEB9 
X-CRM114-Status: UNSURE (   8.54  )
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

--Sig_/J8OBaT5jmFBD_wXUWwzJR+7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  c2a5f8c4f28f ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

This is commit

  98f3ab18a0a5 ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

in te arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/J8OBaT5jmFBD_wXUWwzJR+7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKHG4ACgkQAVBC80lX
0GwKVQgAmaElUzhxVDZCZ9+6iOJiUfdWkczTvDEGc9MM09eQVj1jOH4rqeUhQw+w
3o8gY6W0Slpk0yDbA9UOpyALs26vbEC25ivA2dz+exhxqkIYgdIJvoi1jjP+G86k
U+fbpV/2VoPQQbUiuI1tUfDQ5e5p1B3eBCtdI/ZeY71a/cVZ2m/EpimBwE/pikxa
Es6c/I2ursNu1eZJaB2QzRFjZ+TC43IJ/hm3/SJovOnmMkYWeNm10iMRajM48aEF
tEoH557wLxEzZTF6OMscOVIL8MhEiZoyzhR0uusBWSSnCqlaU99/rtMhZiaBTPWL
RyifnRRP/WjVJp78vJSK9cdvEfP1vA==
=n2Nr
-----END PGP SIGNATURE-----

--Sig_/J8OBaT5jmFBD_wXUWwzJR+7--

