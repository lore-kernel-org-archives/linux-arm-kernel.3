Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB3C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61kbslNUfc37Cgdoe1F4MHSwOraOF+pEaxJZP3gL7KA=; b=KhXwGizQlbCP3e0+xmN9rIGbDU
	a+OusAxmNPPgB5z/8cD1ljMX2/eMO6T64JL6DklNkyT1mEB095RoxDqCnp0JWnhYiSoVnnnKt51UP
	eyyFksTB/e//dKsRT8Ma16/xsPv0tNYmGbNqNN+x1y9s+jaVtHaCXjhsM5Rl10pVLNXHjBKV6E0Ju
	G7rspD1fiq00xdh9Vipz3lQIXP0H6IFnJG07LVvCewFzsn0l+MZWdgcfct5xkKTr6TSy9S/ibuRQp
	1kW0N0Jh0U1AnoGUUKSxyrRm/4aIcUmluxqTrR7DQH+FldxuK/+ut1Z9Q/p0tOyTlTtAGVVJoT8CU
	nVaAGCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZu-00000002SM6-0hWD;
	Fri, 14 Aug 2026 09:51:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoZt-00000002SLh-1LWd;
	Fri, 14 Aug 2026 09:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 8B346601E0;
	Fri, 14 Aug 2026 09:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B5D7C1F000E9;
	Fri, 14 Aug 2026 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701112;
	bh=61kbslNUfc37Cgdoe1F4MHSwOraOF+pEaxJZP3gL7KA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=HzbeYaMhXfcbxgDrC6DNBOOekW6R2XBD1evVqTjGdZ16BANlXghy523zJY3v5+cBm
	 o59CRSOXQHzYG+DbDL9xpD2HhkcYR2o1D5gUVWSi6Mlq7fKmxkwCi7t73Dwr+zSe2T
	 IRGYWdMcmEJhR+M8KXRjTKgNFwpGoo5+Zcj2Mg62T15BPGifWO5OyP14aEGNwyCJc1
	 1b8qeqI++OcdyqzDdm6r6Lc9VXy7O2dCAbyO6fAkKxcRXr0t69PekLczHlT8rlrsUk
	 Rhk4wf/pLBxjigd4NCinQHLW4DsqHqCEL0xoiwemsOu7jwqic38Oa8XG9KhOlgyeNI
	 Iky78L4uxg+lg==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:51:48 +0200
Message-Id: <DKOKOM0RYY5Z.1CLGM0HL98EQU@kernel.org>
Subject: Re: [PATCH v3 18/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-M
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>
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

--25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lNBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iQZgF/TNaGzxbJHWYd9NeWOmEEWHqltAjSi72m
Gk+Z9MG6cWe4QWSh9oycWrU7qvf/niFzAYDdM4496O1nmLD5oEQ02CEugyCdSoYr
pInj0pa9MaJ+nDG+iXfqcyFDRnppXAfDd4E=
=eg8Y
-----END PGP SIGNATURE-----

--25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b--

