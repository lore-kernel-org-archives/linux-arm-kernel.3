Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE9CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 05:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5qjjpGj8L93gzacq4gjUyXCTFYMtYUSw2NjsD+Uzs4=; b=Xf0cP/WdhsgwQveQVh82hoNvMn
	NHDsczJOhmterw8FhcDZGSpjicqKrBpzfrfQwwuooNoMBdkHZvMmfrGnArilWUtt9vyktnt0/DcAM
	dCOk6wYZ6G3hJucMeITsEYhh5DZXnGy0DtkPsRx11Y6ObW/2ooEHLgwb5FrL5qe7eLLWfXkFCpYpk
	nkibIY3Zh6emK/blgWlXFW03L7hVV29Z3FiEad8ADoHf/I5v1AiVk7tgqUtgshonBRbFyKRCGbEQA
	TWeBDwJTWo4KJXPgzg8RMR4puADBq+Nf1RukloaJpLfTl98kIolpN4s70d4c5Z0R+25FISMy7mhpW
	U4Aes1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELIi-00000008NXX-3cxW;
	Mon, 12 May 2025 05:02:04 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELGg-00000008NJa-1hUd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 04:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747025996;
	bh=S5qjjpGj8L93gzacq4gjUyXCTFYMtYUSw2NjsD+Uzs4=;
	h=Date:From:To:Cc:Subject:From;
	b=SdNl0N98LAQB70GWoJTSNCAar7COzr2dmFWKvfOA5a4E7jBHvgS6TNgxNbaLPdIr+
	 GU+6MR/fQFNGvFi63DCpV4xXZH42DlDIlCKtv1jL021df1UyVcPNiJQaILiWLLOMoF
	 2mR7JQnx/xmOei9+ZBJT4eGWACuICVTTAFgmlBNQWLdNHJoehIhSNWco9k29Ogi+7R
	 tlnIOaXUQ7CKtKYnl5ETCl4hQczobbbNZXBKubezzEHdMsILmNjB1aTKP80ZZVKJPn
	 +mlnu9PoEtGgm9XwFzZmkrUHItnszb2wPul8Z1XyD6HR87M8VH1WG2b6/+5rEAgX35
	 Bgrimt+ZAGAnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwnTm1PJ0z4x07;
	Mon, 12 May 2025 14:59:56 +1000 (AEST)
Date: Mon, 12 May 2025 14:59:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the dt-krzk tree
Message-ID: <20250512145955.617fd207@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CVJ1apr.sNYeeCjClOwSlRX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_215958_774068_E8D5BEDC 
X-CRM114-Status: UNSURE (   8.91  )
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

--Sig_/CVJ1apr.sNYeeCjClOwSlRX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  b112d9ffaa65 ("ARM: dts: vt8500: use correct ohci/ehci node names")

This is commit

  7dc891191e64 ("ARM: dts: vt8500: use correct ohci/ehci node names")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CVJ1apr.sNYeeCjClOwSlRX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghgEsACgkQAVBC80lX
0GxxLQf/ZUm3ITcmWskPpu42TrKRZe/HqM9gGBoY5Mpj8FrUfYROhtvOYodAXydO
Q/KJjEkqO6tKdjI5+1dHnZOLb3ezYr1UFlX9K1G/7klj0uag9kdxJcYbEsIM3W9S
5e1lLgIedtZjB1qamag2GPCv/dByw9cDa3WmxBJaYZiIzuckxJeXgkT6YcNeeKyh
2xBhkOhESKYIJHUGGvWn7C4Qkt32cr7uVCUZ9N6aXHXyCnekPbocQsZAou3QMGw+
5RTx0kcNdMEQxJhYhjRpUF5GlH95+0lXS+L4qNvcgQ1hHMgXoyU0c8kPxfPRHyNH
RHBcwsDLZ5Ch+BsOI6x9hcw96QSCNQ==
=xddM
-----END PGP SIGNATURE-----

--Sig_/CVJ1apr.sNYeeCjClOwSlRX--

