Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D4D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SOPKYmdMnIizXZz0zOfPGEy5Rjj28lW3e433p3NbgE=; b=dAJXjkNDEWtxg1fspv4dFsp2gQ
	TRlS33Z6/JIoVV9cB5Hg8I8tLXE2n6igEdFSwqMPVAGeKuBt/keWUFCI8SB97ImEwpECTUx0vJx7Z
	wgse6f2W9LHluK3eb+DwrfPEBZRrC/ehlVAsHte1N5kGECU07bztJ3GEbhOKcMr7qvErJwsfvCmVZ
	+rkj2t+ODlGwXWi/5CeZUJzwF4kkzidN0PfBS6kPcquQUv1mBu3BODoZj+H/rU6kGg3NdfZ1RqLFB
	Uao9nhu0PG2OjqWJ/JKukuGr4SMEOUz8NVwcAPJY09uZcSJXGwrJrmf2sxi9TKVb5xf01fMHUeYsG
	OADWd06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WGa-00000003pRo-2i33;
	Thu, 31 Oct 2024 14:35:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W9I-00000003o6i-0B7E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92722A44208;
	Thu, 31 Oct 2024 14:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A4AC4CECF;
	Thu, 31 Oct 2024 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730384862;
	bh=0VFKeI1RdtsenUvtom72hXjYrfUswcH7nHkImzR9QY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMSdNMD+U58gioJZAobamXIL4QOVQC/TammrC2vS9MsmHXrB8wAQcdF5HXTuWm0Bd
	 GsgF6jUW5jN9BdIHHrUJ2H7UbF6aFNsFf/Xxbo+ybbDumCPu55HSNJ+/v57e1lYPqw
	 RJpp2wriW7qsdZF/N35UDTI6bekcS/aS6+VsPun3peJiyM1zEKr4rwUkw6afMLSiWD
	 2KBSivQr3XWHUh4yUAUyxoMj9Lt4oyn9HaUB4yXZVzf2xwY2JBVh7zF8pia91sZU3G
	 HtX6q1zvkAw///hleArznfjVKan3w0PrwyIXMpxVS5Dzstqj4n5zCV/+6UTyuS/tXY
	 r/Um/BCGySChA==
Date: Thu, 31 Oct 2024 14:27:37 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 06/10] ASoC: sun4i-codec: Add DMA Max Burst field
Message-ID: <33f8c68a-d21a-4c04-b7be-adeab520d5c5@sirena.org.uk>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
 <20241031123538.2582675-6-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="558g04AZnavlqknE"
Content-Disposition: inline
In-Reply-To: <20241031123538.2582675-6-csokas.bence@prolan.hu>
X-Cookie: Make a wish, it might come true.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072744_171304_D5D48551 
X-CRM114-Status: GOOD (  13.88  )
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


--558g04AZnavlqknE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 01:35:32PM +0100, Cs=F3k=E1s, Bence wrote:
> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s has similar DMA engine to sun4i but it has
> smaller max burst size compared to sun4i. Add a quirk field to
> differantitate between them.

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--558g04AZnavlqknE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcjk9gACgkQJNaLcl1U
h9DFuwf/WrEXxsnAh3sDyS+Or2fX9sOWwQ1iCN/IUpg+CS4mWAHnkn8vSvAKQEvk
YIztm/llMpt5Nb4AmUz0BIMECSiIRlBcsT9FhQEdFvR8JFI98AHUfpwkZ/WWihyP
DGLqbnD3tIIU9ZO82mrVY7YS7Mz2meMjPtkhJndkMaWuyV6/65J1HTYn0cySykAZ
wyZtt8fCVufFlcSBO7cH0I5jSxr2dQscSIhjzO9ltJOuVvNgh6eEwH1jiwiRzBXW
uHtoSmqP4a8kutz5pOTatCs6mgBt/zud8Fa0Pf0RjHUk7IVqVYCNo4PDx/bDs9aC
JGaKxTuvIPu1SsxpxRpGJyQAKivOgA==
=uZWg
-----END PGP SIGNATURE-----

--558g04AZnavlqknE--

