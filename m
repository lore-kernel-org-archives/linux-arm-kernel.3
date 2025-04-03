Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48898C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htwI5zsh8ZDaI94Lm8c3UJRY0TNj20AHOyFODzHrsRg=; b=TsHeZxzERXV0AUXNRUTMI2d//O
	FKnD9gvehRn6SRZSpWaZeSt+MgH3tB+qY8OqbTK0mPYO7MwmRKtumel3TUpuL+P15cWvZOJOwbpAI
	wgGLKoYA/b+ibCgbQ2nEPtjCC2aTXvvxpP49j16RPjVkzLkSrxb9UHyxyDprMMXUEo3nDsnOefCYo
	ln84SuXaPO6VJV7pUfTG8h+c7fSXLx7aU0DBWcydqQXMHLpSBB2KMtyDKA5xmz+KXIjiWBOXOlF/X
	Rt9QCNaSyWpXQVwo8Of+vozu+wpxG8T6uP8cxiKsDea2vBE8OwpGFyxylnayT+6gvLxa2oM6yGHy4
	sCTpVxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ib9-00000008ghw-1ICT;
	Thu, 03 Apr 2025 11:19:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ISa-00000008f5m-146C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 11:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6CBEDA40818;
	Thu,  3 Apr 2025 11:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F2AC4CEE3;
	Thu,  3 Apr 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743678610;
	bh=htwI5zsh8ZDaI94Lm8c3UJRY0TNj20AHOyFODzHrsRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDOhLyn0xYLRzSvccPU8EviC8cR6irF7BDJvH8ACOAdUQzHQH7oP/7wYujcxO+NjF
	 GgY2xgBpssfWkG1WsjPDgdBi0nkVLNmQuj7vdHyeM2DsDwYSPD9qDsrfuYj0WWsPah
	 G7FDtZORFO+rimKjF7CbjHQbT9uuROt2jdGtPEDeuW/dt5Kx2J1GvenawEct3O0SoS
	 Uo8PX1xw/niwV9hUIuhDFfnkEKfrdyMd0X5Sf46MelotqgSxu2VVk6SA7mz/eOaFDJ
	 HoPO9zn4Vc6zD+ANTRl/YKXupC3sqi6yHP4dPfKlO5jsS9+ko5WOXpbKrRmvIzhObh
	 m92UasI15X0dw==
Date: Thu, 3 Apr 2025 12:10:05 +0100
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	zhang.enpei@zte.com.cn
Subject: Re: [PATCH] sound: soc: stm: stm32_sai: Use dev_err_probe()
Message-ID: <f78f066f-2be6-47f3-bb06-03f1c2ed3d22@sirena.org.uk>
References: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VJtFOiDls7d3k31G"
Content-Disposition: inline
In-Reply-To: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
X-Cookie: Logic is the chastity belt of the mind!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_041012_356979_247EEA8F 
X-CRM114-Status: UNSURE (   9.95  )
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


--VJtFOiDls7d3k31G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:41:42PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--VJtFOiDls7d3k31G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfubIwACgkQJNaLcl1U
h9CeLQf/R93pQE1PWEoaKn2ix4KLyiBG73yedrtnMdMp+o5mrdfBQ7mMCsCUr9D2
OYklJCVdg5UGii26J9AHrpPFJ/maeTRCZLWSYi8jSkDvVOzITy74IiQN+3fMSyvo
lG/EJg7WhDkLyGdQm3FM6/GD3QqppgcfzTFJkKTGxFwXeTCYJoanUdk2rn7iNqyO
ZIfIQYS56l4O1FR/xTJG+n5iyS2HsYUACJRFyrnHW+CjpGpEVXRWEMOmhzhVl0TQ
EjDsPh4BWWbOX2Cvca66T1c5mJ5SHEFBlcQEIJ+RaDP5koM9IiMMuRAKY98HA3rK
mYbd3uFbhvGA9EVRiMkS/8iOsQJUTA==
=LR/E
-----END PGP SIGNATURE-----

--VJtFOiDls7d3k31G--

