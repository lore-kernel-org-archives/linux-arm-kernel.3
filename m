Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D074ECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1zQ/GnLIMTNMTyliK2PK2FgHD+TxRA5OeforZE4vNA=; b=Ai4F1ojycrj70BlFgrtG2a9cE1
	XmJfPYeFHF0IA06uzeQzr8mTNrS6018ZVxXTxVUmj7EIhb8+JYnjXrWE9c3Tq+Sr5heYEuspZniUw
	h3OaUWMyvTyINwAuLIdwGVab1+EDg2OYh2Bgv5ISQFeuEfpFaNQpPG1vnUPaC+VHwi8Ag1enh2TCd
	mKnGCpMihNeUw4CzV/mgMwZ5Rq0gTw6SEAIsX6iShkjM7o8HkEuSJjUB6gyRpaKnagWzNmMupbEEt
	oAUobgqHwelWG59wBrrtoO6rGXEH1nmoKO0wIl1TAfbVrR6jD5Snpe+FTjYKdbl1dEV69oaGVi+p/
	D8VG701Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRufj-00000002WAr-27qX;
	Tue, 26 May 2026 16:30:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRufi-00000002WAQ-01sF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:30:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 783F240E81;
	Tue, 26 May 2026 16:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EB41F000E9;
	Tue, 26 May 2026 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813025;
	bh=N1zQ/GnLIMTNMTyliK2PK2FgHD+TxRA5OeforZE4vNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E98wwYHqUSZ1ZFu4yZW2IYMhiymKdhxy4pI0qNyTU7tiRSe2AQfOW2dinU4YRaoiF
	 WoMmTOIQjL/C01NOEwoW7SthRE8x72M2xEnAVqm1n9BXzr+3bbYeijvvX5aMX0agBS
	 qdoGBuldJpkeetMlVqHFw4YEssWpm1WMf+A5x74inLkn737/tJSY4SWP6yhR36cSp0
	 9J/Y+i2i4Yk/i+Skgsm4pmYE9s4XS+rlNzAxbjAyu+wrWUydg5ZL2+s1r81JW0fZRB
	 PZEu09LoaVDO8EPw0qzEafgZ93w2kUpbatAI63ySd6pxsJ+AyJqfpyd56BPeSYAdVX
	 KEjva8ejbhgbw==
Date: Tue, 26 May 2026 17:30:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Gaetan Florio <gaetansjo@gmail.com>
Cc: michal.simek@amd.com, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: zynq-qspi: Remove redundant clock enables in setup
Message-ID: <8b3f5645-5589-4ad4-b4af-ff5d37b35717@sirena.org.uk>
References: <20260525174614.1052191-1-gaetansjo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W3rUfarjGCZc3sU7"
Content-Disposition: inline
In-Reply-To: <20260525174614.1052191-1-gaetansjo@gmail.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_093026_069296_A2690253 
X-CRM114-Status: GOOD (  12.89  )
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


--W3rUfarjGCZc3sU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 25, 2026 at 01:46:14PM -0400, Gaetan Florio wrote:
> The QSPI clocks are already enabled in probe() with clk_prepare_enable().
> zynq_qspi_setup_op() enables them again with clk_enable(), but the extra
> enable is never balanced. This leaves the clock enable count elevated and
> can trigger warnings when unbinding the driver.

This doesn't apply against current code, please check and resend - there
was a recent fix here so I think the issue is already fixed.

--W3rUfarjGCZc3sU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVypwACgkQJNaLcl1U
h9Cg2gf/ZuG4skohiVfl20CqyWYWH6iC2PcX0TOn8HhH4ZN6TCrrOhumy/+yjsCg
RwNIeegsZZKd8Nh4QD9/TUSeNgFW2LBfxs7orFh7f7q+R1jIJivR0qtG8L7N+nBS
rGvFAwLKo06wP99qX5yFuYS+HF2gY8fShMysJA3tkdvBL5Agmmm+I5x7r+n/4VSK
14vYazehz9CiMpN8LIXcqipJj+pC0Ygc5PxtP8Ki9S43Z6GuO5tzJG+7A+ZZMhC/
Wni2ohi+idn0EPXizVP/R2pl91mzj/LxdFR2hQ67JFjRk1LK6bDCDDCMdB6X5Zv4
rLF2365W0U2Vw5g6jdh3i+UBCIGfxQ==
=KHGn
-----END PGP SIGNATURE-----

--W3rUfarjGCZc3sU7--

