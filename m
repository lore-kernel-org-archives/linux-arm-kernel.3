Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DBCD1F9D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WGtrfu3GuTI9Wqc1fIfjBwAoYn0B6GSnlgu0ZqZYFA=; b=MR/jfcic0x6UAPg63Mp48xSh8S
	UFqBIzGbcd6UMir5deqOigQIS5yJeGL+DOkcrekNRyo+UE9Xe3hmuuSIdij7JcbiMFuZAgJxDMfUI
	6WwkmWwjjujMmZ/cXMFiNJ2AfPu2lsTOCfwz97PniC6+M3Co46Q/iKxenlPdQSerPGkLWn+MZuuS6
	aBKInkAV9SnyMU5ZEpH8eFn3lkiW81G6xh28FyPco8CkqE0dn0lu1Zqbs5YPjNTzMVE5Njj2S27ul
	0+akmZzyxepB2eIy9XUbMRqtlMna+9JxFmgaxQkt3igRSDowlxG2eE85E1eRvdRP/kkJjKBgr8krw
	+rkGRxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8b7-00000007zub-0lId;
	Thu, 04 Dec 2025 12:38:13 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8b4-00000007zuB-2ok5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:38:12 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 2C1761C008F; Thu,  4 Dec 2025 13:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764851887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9WGtrfu3GuTI9Wqc1fIfjBwAoYn0B6GSnlgu0ZqZYFA=;
	b=Qy81Kbu3tlE7YgdGOaWZdYNsKPtKfmyIoX1OZ95HzWM5MYfloBrBmxjGPk/9tnKceBBVco
	BArlNXNMk0A/p0kiD4s6CYci1Cjtm33TJdfFTNTFwmpqA+lE0jTQkP2h55ttnxMmv3iQmV
	aKiUn5rwVV7pZT4190yRUzDoOFHgTzc=
Date: Thu, 4 Dec 2025 13:38:06 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lukas Timmermann <linux@timmermann.space>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <aTGAruX7N/7ZT0ur@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <aTFvBwjms8msxIae@duo.ucw.cz>
 <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>
 <aTF2H0f9TJiwCLe5@duo.ucw.cz>
 <a68ee81f-1d2c-47f4-b86f-e0e803c1cfd3@kernel.org>
 <aTF2z5HbvmEuu9Iy@duo.ucw.cz>
 <39ac918c-0394-495b-b717-dfa0fd35d7dc@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IZAWxPHhTjLaLg0o"
Content-Disposition: inline
In-Reply-To: <39ac918c-0394-495b-b717-dfa0fd35d7dc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_043811_003183_4F282E3F 
X-CRM114-Status: GOOD (  19.80  )
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


--IZAWxPHhTjLaLg0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 13:02:00, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:55, Pavel Machek wrote:
> > On Thu 2025-12-04 12:54:03, Krzysztof Kozlowski wrote:
> >> On 04/12/2025 12:53, Pavel Machek wrote:
> >>> On Thu 2025-12-04 12:51:36, Krzysztof Kozlowski wrote:
> >>>> On 04/12/2025 12:22, Pavel Machek wrote:
> >>>>> Also please cc: phone-devel mailing list with phone related patches.
> >>>>
> >>>> You don't have to. This list is not part of any upstream Linux kernel
> >>>> process (see `git grep`), it's not relevant to upstream kernel devel=
opment.
> >>>
> >>> Yes, you should. Its a relevant mailing list.
> >>
> >> git grep for it. Stop inventing rules.
> >=20
> > Who is inventing rules here? Stop sabotaging review process.
>=20
> You invented rule that some specific list of your interest has to be
> CCed, even though no one knows about that list and it is nowhere document=
ed.

No. I'm asking people to please cc the mailing list so that interested
people can see the patches. It is you blabbering nonsense about "git
grep" and "get_maintainer" as if those were rules.

> > "Many kernel-related lists are hosted on vger.kernel.org; you can find a
> > list of them at http://vger.kernel.org/vger-lists.html.  There are
> > kernel-related lists hosted elsewhere as well, though."
>=20
> This proves nothing. There are just some lists there. No one has to cc
> whatever list there just because Pavel Machek asks them. Kernel process
> defines it or not. Not you.

And not you.

Kernel process is to cc relevant people, and relevant mailing lists,
SubmittingPatches points you to http://vger.kernel.org/vger-lists.html
=2E If people are interested in the patch (for example because they
reacted to previous version), you should cc them. People in
phone-devel expressed interest in phone-related kernel development, so
you should cc them.

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--IZAWxPHhTjLaLg0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTGArgAKCRAw5/Bqldv6
8lfNAJ432b08VuCapDRQakftJA9JEIYhzQCfScFdiAFfVXRbIz9O1NPJ+TJ09hE=
=qAGG
-----END PGP SIGNATURE-----

--IZAWxPHhTjLaLg0o--

