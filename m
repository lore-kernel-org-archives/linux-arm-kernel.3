Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020B3D1F9CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGNj8IW8jHaYznwbPEx41prvRlfnp+hRzprHRRiG2CM=; b=K02ykCcPXGDUGGJ4aiyn9DNLru
	4irCrGZOy/xACk7o9xRxoWM3FYp8ramaiKZqA1DsHo9AvoBfDlSYX2Uw+N/p8JRdFTfm0qAIRQEqe
	yDnqtxXb3GJhY/qNotmg8G20vLZnlIuCPGfSX28xuR7uLserj1LwL9dDX7JEmuj3t8aBbIDGXrHu1
	vxkUmxx/kqB4cydElZvQtzvu/HUqy553aE5wfaIzVBuErgDCs+fZDa+q4NYQUIhkF+ftmY8EBRd8t
	jkx5wC/7MrM6CpGxAmd194swSqVa2EYZoLYWnLg5L7oBFIVS8OXTBNva533BkkWPhLQTKnBjuc9+y
	uib9XQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7wJ-00000007wnS-3KAw;
	Thu, 04 Dec 2025 11:56:03 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7wH-00000007wn2-1GR4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 11:56:02 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A6D641C008F; Thu,  4 Dec 2025 12:55:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764849359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wGNj8IW8jHaYznwbPEx41prvRlfnp+hRzprHRRiG2CM=;
	b=pXZMl6VjtzgJ5J6tIRPAxjCLpsNPe8yL6BbN+dB90MpxzmXX5i1HfdLrNJ7XhCO8BTjT0P
	kERKRuoNKMHGWztre45BvTQp9UIWvERZX004NIPUtsckf7MKqviNF6vSuZugvDE68uNp/1
	d1mpjlxg1g+P7lMfE1RspF8i+rkd6Vk=
Date: Thu, 4 Dec 2025 12:55:59 +0100
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
Message-ID: <aTF2z5HbvmEuu9Iy@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <aTFvBwjms8msxIae@duo.ucw.cz>
 <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>
 <aTF2H0f9TJiwCLe5@duo.ucw.cz>
 <a68ee81f-1d2c-47f4-b86f-e0e803c1cfd3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DG6lTTxv+FnXjuf5"
Content-Disposition: inline
In-Reply-To: <a68ee81f-1d2c-47f4-b86f-e0e803c1cfd3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_035601_483601_20C03C85 
X-CRM114-Status: GOOD (  14.12  )
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


--DG6lTTxv+FnXjuf5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 12:54:03, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:53, Pavel Machek wrote:
> > On Thu 2025-12-04 12:51:36, Krzysztof Kozlowski wrote:
> >> On 04/12/2025 12:22, Pavel Machek wrote:
> >>> Also please cc: phone-devel mailing list with phone related patches.
> >>
> >> You don't have to. This list is not part of any upstream Linux kernel
> >> process (see `git grep`), it's not relevant to upstream kernel develop=
ment.
> >=20
> > Yes, you should. Its a relevant mailing list.
>=20
> git grep for it. Stop inventing rules.

Who is inventing rules here? Stop sabotaging review process.

"Many kernel-related lists are hosted on vger.kernel.org; you can find a
list of them at http://vger.kernel.org/vger-lists.html.  There are
kernel-related lists hosted elsewhere as well, though."

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--DG6lTTxv+FnXjuf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTF2zwAKCRAw5/Bqldv6
8rrPAJ9lGDWRx5W9QUQFpmyAjFKSSpllkgCgphu4OOQ4tBB+SOYbzXqPhFOforQ=
=g5vE
-----END PGP SIGNATURE-----

--DG6lTTxv+FnXjuf5--

