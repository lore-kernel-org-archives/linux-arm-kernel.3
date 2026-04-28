Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0732FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyQde8G5ReU470oRX9P93yfx4LhMvDqBhV4qlZmlKLc=; b=MNV0pJ9RlIBytwNC5T1R1ErcNc
	zUzIHd3v5tQ88BwbMTwwkhAiDGxOZ2h2z+t9SVLMzHEo8RISLWcgXAWEcLmgqE5O6N3lROdeRFSK8
	4gsyyHaPfVcIR1E1PrxtB6NeARit0vkdpLg4WODBcIOiZGK/zyCuxOYoEivP4BGe07zwYuByAsNu6
	ssTDSNB9ATHB7AtCsKKDUfwrL+6kHx6w7o1e4/XpJzMnSklFTos94z28wQgGJdYnOuDz9fNSmyebj
	a5gUH6CQqMwgjdEHYAlEC1xiFDffD89C2zqBoweWWpiSxGtRAwLJuBxaxyVQeN7+0Ot3yJVd+OPBW
	N8YPKoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHicM-00000001Ysd-3j6A;
	Tue, 28 Apr 2026 13:36:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHicL-00000001YsA-1WRP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 866B461333;
	Tue, 28 Apr 2026 13:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6256C2BCAF;
	Tue, 28 Apr 2026 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777383408;
	bh=ziXcM10zIG3jgeIzQDi/aoC4CSPrJiUQ1hz8PWZfxDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+2tE/4PY3seuiUYy2ndBlmL24FhAj0R31Bb7DgQNK/xjSU0nCfDhwCiAGZ3IUsFj
	 Id+lTqy2y2RhbpZAVIXI5KUC0eI5hALNs9pDw5O2t+Zx5VPCR7l28qDWgPwTPaMhnF
	 iLMhSDLbIPKJwG0mAPVkwSIAlQ5JAAM3SgOt795KxJUc6qMPVvp0wAGuBvMdT37a4C
	 C06v5cclpreUPEd/NmVyeksC/b8eqZkEkGDyoL74BFSmk0USGydXdO55JYbC9Smxxf
	 ZCroQkzMipfZaPxPYticHmBoAm4G9AsN+CEiNcd5LXzSY1tUAVNFVMXFecUOBcyc2L
	 UFtt8LrWkSmPw==
Date: Tue, 28 Apr 2026 15:36:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: atmel-tcb: Remove unneeded semicolon
Message-ID: <afC3PwD0LfzYSoMP@monoceros>
References: <20260428075329.1234735-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uycgzbx2kydfhzfb"
Content-Disposition: inline
In-Reply-To: <20260428075329.1234735-1-nichen@iscas.ac.cn>
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


--uycgzbx2kydfhzfb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] pwm: atmel-tcb: Remove unneeded semicolon
MIME-Version: 1.0

Hello,

On Tue, Apr 28, 2026 at 03:53:29PM +0800, Chen Ni wrote:
> -		goto err_disable_clk;;
> +		goto err_disable_clk;

Oh, that is my fault. If you're ok I'd add

	This was introduced in commit 68637b68afcc ("pwm: atmel-tcb:
	Cache clock rates and mark chip as atomic") in Uwe's adaption of
	Sangyun's original patch.

to the commit log. I'll apply it then to my fixes branch but not send it
to Linus. But if something more urgent pops up I'll send it along.

Thanks,
Uwe

--uycgzbx2kydfhzfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnwt+sACgkQj4D7WH0S
/k5DHwf+JcivqTxj4XNBlJerk5DHvcsfFFRGNSpfK9inKNRDrAKH4uFaZIiU3QDM
jMJDJrQGBclkSFKoDqLZxCaE+buIW57ityE9SykOpcxcUGWcETaTz2qUONXnhIVa
z5QPl4J/RyZcRzqjxYHqBm20qe96Mwh3VIxt0mnfpjGnJPLxuw41SneSCCMLQx+j
fny+xyC4pkXZh8Jtmu6LmXL6VbvSeBWy3oc7rQX/N1+r2B7K2P9bksIT5KgWz/Q0
/qNXyCMSzmnFEmEjQcgjKoiRhWOxw2rSwSB80YurZl2nulR0RhWVZb6q8eAvt9su
oaovWejszMh/THelUrKKPNv/C2dpiQ==
=+imA
-----END PGP SIGNATURE-----

--uycgzbx2kydfhzfb--

