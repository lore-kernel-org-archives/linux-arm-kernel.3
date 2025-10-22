Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E56BCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCOhMXeNcRlLEJFFTCWsYH3yznwlPc3/uJAlYhMI6lo=; b=ygN+nMqFf3T/pZds7rAIaBOAvC
	Ug2fBF8GWtUk94vZohK5UPAKdsLcHLpd2CRI4vHhDnhXIPm3R6gH8gxpBzN5CSR+xNre1PquOaXok
	9CNmGnzssL/hPZK8aQwvWQD8wdZAAEdgTEGrBkfzDrHtU1C7jrN2mh4VDT0ePfDlGOFyMIEdXAXlZ
	D9HWu+j8foAEd5+we/4Mf7ICU7YQ5qIvRB6KrrbcpLc6vcLKzwbN8aR3vM74Z9W9g+/7UbETHmr6q
	yBZVZILG2aJOlxzpcisMziScD03+wWhaNwm41s9KPdW9KKQXQXvUAIYOa8z0XWO36efCCYXK51FXU
	L1H0tHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT1f-00000001pHS-0RkG;
	Wed, 22 Oct 2025 07:12:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT1d-00000001pH1-1PPT;
	Wed, 22 Oct 2025 07:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A534C6287A;
	Wed, 22 Oct 2025 07:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099D4C4CEE7;
	Wed, 22 Oct 2025 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761117168;
	bh=aCOhMXeNcRlLEJFFTCWsYH3yznwlPc3/uJAlYhMI6lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P20bzHE882yA6YpVwda4fjhuxkc1B1YP8vfan0Thd1UpfWY5E5Ai1Fa3iBvGDLdHo
	 uHXRDqdfzWzSpBVY6fobdgGoVR57prFL3IAz/xKKrnyRdCB5oDF5znTcGusdVjqKNw
	 /A2UlLm3syA+BDqsDTX8NW1Qdg18kcHNpq4o+G4HOCBsS8W92gxbsyEaT5lch7WEnC
	 NIcdRgjZANy5OVG8M2BGmsa09g8zZi6mxBRjtBxUAsBP6+utl+22nBVSdM/EuknISt
	 1p94l6tXZ1b3w9h1/xrpN2H3V81HhknAgRoxeMIX0np4FlDu718+UfWK3C2EnAxbIG
	 Kj7KUzfAzpOng==
Date: Wed, 22 Oct 2025 09:12:45 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Remove code duplication in
 airoha_regs.h
Message-ID: <aPiD7WTSGbJq_xKO@lore-desk>
References: <20251018-airoha-regs-cosmetics-v1-1-bbf6295c45fd@kernel.org>
 <20251021182800.2c736d21@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z+kCoUsYQ/MpQx5l"
Content-Disposition: inline
In-Reply-To: <20251021182800.2c736d21@kernel.org>
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


--z+kCoUsYQ/MpQx5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 21, Jakub Kicinski wrote:
> On Sat, 18 Oct 2025 11:21:47 +0200 Lorenzo Bianconi wrote:
> > This patch does not introduce any logical change, it just removes
> > duplicated code in airoha_regs.h.
> > Fix naming conventions in airoha_regs.h.
>=20
> Appears not to apply

ack, I will rebase and post v2.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--z+kCoUsYQ/MpQx5l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaPiD7QAKCRA6cBh0uS2t
rIUJAP9sOdpMJGpik1zGfDRuiTGJVOSOzifTwnhJUXdgIC5RJgD+PW8POUZxObMS
MPTuJ+Zw2b8Oy+Ww44Da7DmnCcrRDg4=
=Cu9m
-----END PGP SIGNATURE-----

--z+kCoUsYQ/MpQx5l--

