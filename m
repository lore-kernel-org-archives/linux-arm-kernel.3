Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD8E9D823
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbSo1DAwAWxJg32DFbvlijyUIpAIFuCPFtMF/KOXGIU=; b=VC/6seHuwQBABp1oPggExiYUze
	wuoo2rgPzjZYUsExKTBfdB0HslCnPE+RMkwtGmqxTweGXhGfd1kQP05rBBXg5/Hvt8EkUCx1jkLss
	kFmq5WtCkBUcTkKRwB13gxaJZep+VCtBBWy6KeUI1uOKNL5yr5wrdJM1QH1LLYNkQfe0A20U43LFm
	KrobERvEfgdqZhXNmEMc7gt6+mvX7xtPg+CJxl61XtlnQA7Ly6o9BfQX+dNHCpC6KTqUduuJrisrI
	mBdJwTbMV2kW0UP8PRPK2QzE0l6fGKfnNh96fyxAYBmtjsPKHi5tLEvefTNbRb2JgMkjnsEh5JhvC
	BYb3nbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9VKM-00000004VL9-23Z1;
	Sun, 05 Apr 2026 21:48:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9VKJ-00000004VKl-2IRC;
	Sun, 05 Apr 2026 21:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 055BD42B6A;
	Sun,  5 Apr 2026 21:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35856C116C6;
	Sun,  5 Apr 2026 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775425693;
	bh=RGKOBQD3Q6ynJpf+CVXJt8bXlPhMYn8DmenV7P8v5uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2cd3RH0ZY08IBHKfzRhqB1K337C4FVOO0qZeUhgJ98d7JrCfsytmVl2STQdmGtT2
	 V+RVFGYTZ23wOpPPrLOHGoV4eHcy5cM5eDMC5lgLCR3eExlwsZDWHMq/d8gJkI6VvU
	 Zr7nuTWMp8UHOXg2PgAqXkVwTHFQfta+3FhqerqtiqYEcKur4+NSrxhJf651hyCb/v
	 7ZPdMtvFW0KK7UoiiyKpcsTOvTX4CcSoAbmsG8PKl1VCZduFJh3m5iRKZ/8ZmmQKoh
	 5BLFJWEjdcSrWIeVPfAGO9mIhfLf0lzEtHjznnaru3ByDryUnP7MesLZZmLK2NadNG
	 f67igLD70FYKQ==
Date: Sun, 5 Apr 2026 23:48:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: rp1: Add PWM node
Message-ID: <adLYU8EUzk7kIuwl@monoceros>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <ef79e974c6680202294a4cfde7cc791753bf1b3e.1775223441.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2ld2b4dw2q6x2ai"
Content-Disposition: inline
In-Reply-To: <ef79e974c6680202294a4cfde7cc791753bf1b3e.1775223441.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_144815_628862_C7852007 
X-CRM114-Status: UNSURE (   6.21  )
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


--a2ld2b4dw2q6x2ai
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: rp1: Add PWM node
MIME-Version: 1.0

Hello,

The "rp1" in the Subject is very irritating. Better make this:

	arm64: dts: broadcom: rpi-5: Add rp1 PWM node

or similar.
Best regards
Uwe

--a2ld2b4dw2q6x2ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnS2JgACgkQj4D7WH0S
/k7/BAgAraQetvLdiGHxyhhuRl+/9A1OzV4ZpgpJrRstQExDxilsE9zghRdQUCrx
NbXRR2E5MTy9JtG2qDM0oW587E2dF96ywTvExIY3LQIsz7qjHLb+fF20bbp8bKOX
A7WEwiBze2iC1QbIETJJjmgMBoSIx9fGK2kZXexhor2xucynUQunuMGPLBu1i/HU
rAyhYUblL8/RqRlpfTt8Zx1eyo3UaavEznhai+isamY6euA8e8LWK6mvj6YKUAD3
J7TGSn6vmzbR2WFeAL5XHql8OM7wfwurPoxCYVE/L8Btc53r3g4AzIaefq+HmzfW
xC7bOVcru5Oiv5/QMxSoB0vt+PExMg==
=d13v
-----END PGP SIGNATURE-----

--a2ld2b4dw2q6x2ai--

