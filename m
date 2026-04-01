Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9A8D35165
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 16:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSZwO5Mif+Vhwk6ofKHhQfQlLyhs9TiQOThWjRWUT/I=; b=UF1KDRWyIsCTq7yQ6N23O6Lt/H
	Y2066xhk9l7H05kYHj2TGzrlnsjU1OWyUeTvjp+OJ/oxLMplK1UDKxJCbBFaz0nSANQoftLVbyiCm
	tHsVGNEkVgJUqh1s+pf83Ozv48UBZ+0Xqp7uhnZOjkp0PZamjjvGiwOFp5mESdCA9E0NXKka10bGA
	/a6jmCAuaPibgCAyZIgrwHVwS0al1WzlvePph5DDUq6ZbYbdSJOzYuhc650fKDat/2Ieu1YBanaWh
	zzA1oXi0hGh8L7qpyd8FxxUoihvFQ68txPjpXKuWLoHhk7wE/9Bz4tS6clTNY0R0ZS85sQTxSFFJL
	bHLP2YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ykg-0000000FlKC-2UFv;
	Wed, 01 Apr 2026 16:49:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ykf-0000000FlK2-0B83
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 16:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C1A960120;
	Wed,  1 Apr 2026 16:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF837C4CEF7;
	Wed,  1 Apr 2026 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062148;
	bh=DSZwO5Mif+Vhwk6ofKHhQfQlLyhs9TiQOThWjRWUT/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWS3l2pam6A5zd7/u5kCi+AOJ1e8nRxmkx6ILbMw2YJqwT0GyxSw8pwOpQ/UEZAYK
	 +gYucg9IxUD1Z58js0N8YqPmoHV95J5USJbr3/DDLz+ECtNsX8ANq64pzMbR9BfAbd
	 LiRgwn4CeJBbGXLkUOlnP6Jmi08FZLzzzId4AtLpafiXK4UnsuPKoUeaogyy1SVbOr
	 WroaajTS08hCSmd1HTZuQcGfveMIutSGC/SIzTY3vNFp257oepqbONx/u1xGn1bZE3
	 gT5YUTAQLKYhOSt9CY9q5CJmZ30GUWrt/HVuiraJXe17syjelL7l7509EtOAbQ8SZl
	 b3ypXgvAe2h+g==
Date: Wed, 1 Apr 2026 17:49:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Rob Herring <robh@kernel.org>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Message-ID: <510f1ba7-ce05-4e9c-9405-c49903357916@sirena.org.uk>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
 <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
 <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
 <8d8925ad-22eb-4b9b-b6eb-6ae7dc3b2073@kernel.org>
 <e060307f-5c85-468f-8f5d-6101dc0a2015@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mE/kOQCX78MoT/V7"
Content-Disposition: inline
In-Reply-To: <e060307f-5c85-468f-8f5d-6101dc0a2015@broadcom.com>
X-Cookie: "Yo baby yo baby yo."
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


--mE/kOQCX78MoT/V7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2026 at 09:41:03AM -0700, Florian Fainelli wrote:

> OK, I will get going with moving the hosting to kernel.org. What about this
> specific pull request, will it go through or is relocating the hosting
> mandatory for it to be accepted?

Whenever you get round to it please remember to let me know so I can
update where -next is fetching from (this is a common gotcha!).

--mE/kOQCX78MoT/V7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNTH4ACgkQJNaLcl1U
h9Brcgf/RNCkNU/dCgw0ggR/qjiCIvomgcPtbhBSuAnknPjymUhUE6ohNzvfwsWL
Lls/qmxzVRMnVGABFsGyHB7pTeW6SPvAM3cvYm2vzvPMuG606pMqhvl+5Hwi52ty
+3qG5xBFYJIwrHHqMFnglFmFrbJyZ5ns0iBX4PUA6Mu9MA5rGFp/Sfxy3wP/trJC
UMYhwz68AOwbtitqCnwQrQnysyWboyzn8mT0IZANtDbiuOkNujRoVpLxlsbeh8rJ
Nm0a3LM/mR6Vmr9Ie1Ndx3YSia3kK6XXLP+w3OOvYCLynNqPpwaV1mXfb8ztg+rI
j80tfY5Qcm7+JHDtXtGE4FXNvlddtA==
=Daaf
-----END PGP SIGNATURE-----

--mE/kOQCX78MoT/V7--

