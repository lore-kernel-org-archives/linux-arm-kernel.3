Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580D8C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 01:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlY3JCgO4B8/Z3ixy0Htn8OSBlaA+oznvuO0ecmSx7Y=; b=MhuUKDYvlEoam/iNkSDZ3ge37g
	aI2OYO/5m+V1dk+laCRwT6MIeavWRsRuk8gu4kj99YlFrMm+FLdZB4D8StI0zQWTKr66yVq0k0JUS
	zua2G6IKadg5jEBqvYGrO6XYf4/ya2cNAxlUsyP4qnmhhrwTh8KjQQBBa6H0jQC9lMID7rVjPLGFe
	7s/XeBqqhHCL+qhAxRHzs+me2clZ7mNzApOjgKD1LwKgFz6cXPb/aGeToxmMbyQQOFuKJ/R8HNiv3
	kF2lKCMmqmy5Mc3+uQ8I2/DsJ4ukysOzw9C7Gs0cUWrbSeNg3sI/qNFRGYPk4LtIiA2L5rSTRIMQN
	W9q0Eftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuxQ-0000000HCgW-3tG3;
	Thu, 22 May 2025 01:42:52 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuuv-0000000HCSA-2Q0Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 01:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747878015;
	bh=YlY3JCgO4B8/Z3ixy0Htn8OSBlaA+oznvuO0ecmSx7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hhOU3RW4prOzFhraJ5gunOt8Njr3Y07jK+6o4VPL2Ty/2ZzlSGqUUWNNjAVF27HTe
	 BeGu55p3o9cHJhqxZZxYT4Q989bf4A98wqcYMG0I31gr/Wop9JAfW2PjGASzqjHBno
	 /Aq+sKDPpXwiRq9I0lPjxrEmuDosOI0j3AlKRHBgGWXfyfRBnzpj/wuc4a+Giq/7OP
	 92io9F9XZ6Jid7Ej5ys8viMSHA27qLetmP9P+adTVXHCOmTtzDZGlFZLJtPkitoAIL
	 IzEoRD/WiRar7EpfH3vmCt6kX+6HhhALoyiBp0WtHhABO4M7+xS4Df8MOhLD0FuFVp
	 LrZtZP+/yYsNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rZl2M0Wz4x8Z;
	Thu, 22 May 2025 11:40:15 +1000 (AEST)
Date: Thu, 22 May 2025 11:40:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: duplicate patches in the aspeed tree
Message-ID: <20250522114014.5743b499@canb.auug.org.au>
In-Reply-To: <20250522113033.066d7216@canb.auug.org.au>
References: <20250522113033.066d7216@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pFxV9.L8dGLtaX3pbE_t2ix";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_184017_765135_31DB39C4 
X-CRM114-Status: GOOD (  10.72  )
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

--Sig_/pFxV9.L8dGLtaX3pbE_t2ix
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[cc arm-soc]

On Thu, 22 May 2025 11:30:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>=20
>   28fe68179368 ("arm64: dts: nuvoton: Add pinctrl")
>   82f50ddf894e ("ARM: aspeed: Don't select SRAM")
>   856d11d63f85 ("soc: aspeed: lpc: Fix impossible judgment condition")
>   f3089a4fc247 ("soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/pFxV9.L8dGLtaX3pbE_t2ix
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgugH4ACgkQAVBC80lX
0GxlFwf/VkAZdLIiadJwYfAmM+bq8LFtzHRE59Ylz6SOv6eGe0O5hAB8GSuYWBI5
cKS4V0Dy6v+egWIV13sxIOu4pY7e7/O7bLAtU2N9vTNxZl9kroIIg8neix4whtnO
/uXwZP2mGkplO5skZAKBD/YUI/o7ITMYiqZTfHM2C5rHqo9OAj2j2AppWtTQ8UUZ
B48aJeZ6Samjp5rpFdirufcJbLAOPFeyy7iLBuSTO01yCutmgLObyMCSa7QKHhpH
uCAYKZQbPT4VW7x2UBBiputMWfR4ckDCaJqqaW54bJRE3N8cbLNwaj3U/UA0/YCV
sr0ZxSd4TI5dtPtTuRQc1uCbeoUJ9A==
=lOHx
-----END PGP SIGNATURE-----

--Sig_/pFxV9.L8dGLtaX3pbE_t2ix--

